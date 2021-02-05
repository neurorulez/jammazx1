---------------------------------------------------------------------------------
-- Usb host for max3421e by Dar (darfpga@aol.fr) 
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Max3421e USB host for HID keyboard, mouse, joystick,... :
--
--   configure/init max3421e as host low speed
--   reset usb bus
--   wait for connexion
--   set usb address 3 
--   no read device descriptor
--   no read configuration descriptor
--   blind set configuration 1
--   blind set hid (boot) protocol
--   loop on request ep1 report 
--   no test for disconnexion
--
---------------------------------------------------------------------------------
-- Straight forward implementation : no microprocessor, not the easiest way!
--   Should be more simple and less ressource consuming with a trivial sequencer
--   and some kind of program memory.(maybe later, require some kind of assembler)
--
--	Ressource usage is around 950 logic cells.
--
-- Reminder :
--		Z80 is around 2200 logic cells (without memory)
--    mb88 (4bits microprocessor) is around 1300 logic cells (without memory)
--
---------------------------------------------------------------------------------
-- First release V0.0 : 01/05/2017
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.usb_report_pkg.all;

entity usb_host_max3421e is
port(
 clk     : in std_logic;
 reset   : in std_logic;  -- first reset USB machine
 start   : in std_logic;  -- then start enumeration (both action has to done at least once)
 
-- hex0  : out std_logic_vector(7 downto 0);
-- hex1  : out std_logic_vector(7 downto 0);
-- hex2  : out std_logic_vector(7 downto 0);
-- hex3  : out std_logic_vector(7 downto 0);
-- hex4  : out std_logic_vector(7 downto 0);
-- hex5  : out std_logic_vector(7 downto 0);
 
 usb_report : inout usb_report_t;
 new_usb_report : out std_logic;
 
 spi_cs_n : out std_logic;
 spi_clk  : out std_logic;
 spi_mosi : out std_logic;
 spi_miso : in  std_logic
 
 );
end usb_host_max3421e;

architecture struct of usb_host_max3421e is
 
 function int_to_uslv (val, len : integer) return std_logic_vector is
 begin
	return std_logic_vector(to_unsigned(val,len));
 end function;

 function uslv_to_int (uslv : std_logic_vector) return integer is
 begin
	return to_integer(unsigned(uslv));
 end function;

 type   st_byte_fsm_t is (wait_for_start,send_bits);
 signal st_byte_fsm : st_byte_fsm_t;
 signal send_bits_cnt   : std_logic_vector(3 downto 0) := X"0"; 
 signal byte_to_send    : std_logic_vector(7 downto 0) := X"00";
 signal byte_received   : std_logic_vector(7 downto 0) := X"00";
 signal start_send_byte : std_logic := '0';
 signal catch_report    : std_logic := '0';

 type   st_frame_fsm_t is (wait_for_start,send_byte);
 signal st_frame_fsm : st_frame_fsm_t;
 signal start_send_frame : std_logic := '0';

 type   frame_t is array (0 to 8) of std_logic_vector(7 downto 0);
 signal frame_to_send : frame_t := (others => X"00");
 signal frame_received : frame_t := (others => X"00");
 signal frame_byte_cnt : integer range 0 to 31;
 signal nb_bytes_to_send : integer range 0 to frame_t'right +1 := 0;
 signal nb_bytes_to_receive : integer range 0 to 31 := 0;
 
 subtype usb_stage_t is std_logic_vector(3 downto 0);
 signal usb_stage                : usb_stage_t := int_to_uslv(0,usb_stage_t'left+1);
 -- main functions stages
 constant usb_idle               : usb_stage_t := int_to_uslv(0,usb_stage_t'left+1);
 constant usb_init               : usb_stage_t := int_to_uslv(1,usb_stage_t'left+1);
 constant usb_read_version       : usb_stage_t := int_to_uslv(2,usb_stage_t'left+1);
 constant usb_chip_reset         : usb_stage_t := int_to_uslv(3,usb_stage_t'left+1);
 constant usb_wait_conn          : usb_stage_t := int_to_uslv(4,usb_stage_t'left+1);
 constant usb_set_speed          : usb_stage_t := int_to_uslv(5,usb_stage_t'left+1);
 constant usb_set_addr           : usb_stage_t := int_to_uslv(6,usb_stage_t'left+1);
 constant usb_set_config         : usb_stage_t := int_to_uslv(7,usb_stage_t'left+1);
 constant usb_set_protocol       : usb_stage_t := int_to_uslv(8,usb_stage_t'left+1);
 constant usb_get_report         : usb_stage_t := int_to_uslv(9,usb_stage_t'left+1);
 -- sub functions stages
 constant usb_send_setup_ep0     : usb_stage_t := int_to_uslv(12,usb_stage_t'left+1);
 constant usb_wait_sof           : usb_stage_t := int_to_uslv(13,usb_stage_t'left+1);
 constant usb_bus_reset          : usb_stage_t := int_to_uslv(14,usb_stage_t'left+1);
 constant usb_send_receive_frame : usb_stage_t := int_to_uslv(15,usb_stage_t'left+1);
 
 subtype usb_stage_step_t is std_logic_vector(3 downto 0);
 signal usb_stage_step : usb_stage_step_t;

 subtype stack_elt_t is std_logic_vector((usb_stage_t'left + usb_stage_step_t'left +1) downto 0);
	
 type   call_stack_t is array (0 to 7) of stack_elt_t;
 signal call_stack : call_stack_t; 
 signal stack_ptr : integer range call_stack_t'range;
 
 signal return_stack_elt : stack_elt_t;

 function step (step : integer) return std_logic_vector is
 begin 
	return int_to_uslv(step,usb_stage_step_t'left+1);
 end function;	

 function next_step (step : std_logic_vector) return std_logic_vector is
 begin 
	return step + '1';
 end function;	
 
 signal sof_cnt : natural range 0 to 255 := 0;
 signal nb_sof_to_wait : natural range 0 to 254 := 200;

 signal speed : std_logic := '0';  -- device speed detected at connexion;

begin

--h0 : entity work.decodeur_7_seg port map(usb_stage_step,hex0);
--h1 : entity work.decodeur_7_seg port map(usb_stage,hex1);
--h2 : entity work.decodeur_7_seg port map(call_stack(0)(3 downto 0),hex2);
--h3 : entity work.decodeur_7_seg port map(call_stack(0)(7 downto 4),hex3);
--h4 : entity work.decodeur_7_seg port map(frame_received(0)(3 downto 0),hex4);
--h5 : entity work.decodeur_7_seg port map(frame_received(0)(7 downto 4),hex5);

--- SENDING SERIALISER ---

byte_to_send <= frame_to_send(frame_byte_cnt) when frame_byte_cnt < nb_bytes_to_send else X"00";

spi_clk  <= send_bits_cnt(0);
spi_mosi <= byte_to_send(to_integer(unsigned(not send_bits_cnt(3 downto 1)))) when st_byte_fsm = send_bits else '0';

--- RECEIVE DEMUX ---

send_byte_fsm : process (clk)
begin 
	if rising_edge(clk) then
		if send_bits_cnt(0) = '0' then
			byte_received(to_integer(unsigned(not send_bits_cnt(3 downto 1)))) <= spi_miso;
		end if;
		if send_bits_cnt = X"F" then
			if frame_byte_cnt <= frame_t'high then
				frame_received(frame_byte_cnt) <= byte_received;
			end if;
			if (catch_report = '1') and (frame_byte_cnt <= usb_report'high) then
				usb_report(frame_byte_cnt) <= byte_received;
			end if;
		end if;
		
	end if;
end process;

--- BYTE MACHINE ---

sending_byte_fsm : process (clk)
begin 
	if rising_edge(clk) then
		if reset = '1' then
			st_byte_fsm <= wait_for_start;
			send_bits_cnt <= X"0";
		else
			case st_byte_fsm is
				when wait_for_start =>
					if start_send_byte = '1' then
						st_byte_fsm <= send_bits;
					end if;
				when send_bits =>
					send_bits_cnt <= send_bits_cnt + '1';
					if send_bits_cnt = X"F" then
						st_byte_fsm <= wait_for_start;
					end if;
				when others =>
					st_byte_fsm <= wait_for_start;
					send_bits_cnt <= X"0";
				end case;	
		end if;
	end if;
end process;


--- FRAME MACHINE ---

sending_frame_fsm : process (clk)
begin 
	if rising_edge(clk) then
	 if reset = '1' then
		st_frame_fsm <= wait_for_start;
		frame_byte_cnt <= 0;
	 else
		case st_frame_fsm is
		
			when wait_for_start =>
				if start_send_frame = '1' then
					st_frame_fsm <= send_byte;
					frame_byte_cnt <= 0;
					start_send_byte <= '1';					
				end if;
				
			when send_byte =>
				if start_send_byte = '1' then
					start_send_byte <= '0';
				else
					if st_byte_fsm = wait_for_start then
						if (frame_byte_cnt+1) = nb_bytes_to_receive then	
							st_frame_fsm <= wait_for_start;
						else
							frame_byte_cnt <= frame_byte_cnt + 1;
							start_send_byte <= '1';						
						end if;
					end if;
				end if;
			when others =>
				st_frame_fsm <= wait_for_start;
				frame_byte_cnt <= 0;
			end case;	
	 end if;
	end if;
end process;

--- USB MACHINE ---

usb_machine : process (clk)
begin 
	if rising_edge(clk) then
		if reset = '1' then
			usb_stage <= usb_idle;
			usb_stage_step <= step(0);
			start_send_frame <='0';
			spi_cs_n <= '1';			
		else
			case usb_stage is
			when usb_idle =>
				spi_cs_n <='1';
				if start = '1' then
					usb_stage <= usb_init;
					usb_stage_step <= step(0);
				end if;
			
			when usb_init =>  --(R17) set full duplex, positive int
				frame_to_send(0 to 1) <= (("10001"&"010"),X"14");
				nb_bytes_to_send <= 2; 
				nb_bytes_to_receive <= 2;
				
				call_stack(stack_ptr) <= (usb_stage + '1') & step(0);
				stack_ptr <= stack_ptr +1;							
				usb_stage <= usb_send_receive_frame;
				usb_stage_step <= step(0);					
				
			when usb_read_version => -- (R18) read chip revision
				frame_to_send(0) <= ("10010"&"000");
				nb_bytes_to_send <= 1;
				nb_bytes_to_receive <= 2;

				call_stack(stack_ptr) <= (usb_stage + '1') & step(0);
				stack_ptr <= stack_ptr +1;							
				usb_stage <= usb_send_receive_frame;
				usb_stage_step <= step(0);					

			when usb_chip_reset =>
				case usb_stage_step is
	
				when step(0) => -- (R15) set chip reset
					frame_to_send(0 to 1) <= (("01111"&"010"),X"20");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);					

				when step(1) => -- (R15) clr chip reset
					frame_to_send(0 to 1) <= (("01111"&"010"),X"00");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);
					
				when step(2) =>  -- (R13) read oscillator irq
					frame_to_send(0) <= ("01101"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);
					
				when step(3) =>  -- loop until oscillator ready
					if (frame_received(1)(0) = '0') then
						usb_stage_step <= step(2);
					else
						usb_stage <= usb_stage + '1';
						usb_stage_step <= step(0);
					end if;
					
				when others => spi_cs_n <='1';
				end case;

			when usb_wait_conn =>
				case usb_stage_step is
	
				when step(0) =>  -- (R27) set pull down, host mode
					frame_to_send(0 to 1) <= (("11011"&"010"),X"C1");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
					
				when step(1) =>  -- (R25) clear condet irq 
					frame_to_send(0 to 1) <= (("11001"&"010"),X"20");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);
					
				when step(2) => -- (R29) request bus sample
					frame_to_send(0 to 1) <= (("11101"&"010"),X"04");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(3) => -- (R31) read JK bus status
					frame_to_send(0) <= ("11111"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(4) => -- loop until J or K status
					if (frame_received(1)(7 downto 6) = "00") then
						usb_stage_step <= step(2);
					else
					   if (frame_received(1)(6) = '1') then
							speed <= '0';  -- low speed device (K)
						else
							speed <= '1';  -- full speed device (J)
						end if;
						usb_stage <= usb_stage + '1';
						usb_stage_step <= step(0);
					end if;
					
				when others => spi_cs_n <='1';
				end case;

			when usb_set_speed =>
				case usb_stage_step is
	
				when step(0) =>  -- (R27) set pull down, sofkaen, speed, host mode
					if (speed = '0') then 
						frame_to_send(0 to 1) <= (("11011"&"010"),(X"CB")); -- low speed
					else
						frame_to_send(0 to 1) <= (("11011"&"010"),(X"C9")); -- full speed
					end if;
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(1) =>  -- wait frames
					nb_sof_to_wait <= 50;
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_wait_sof;
					usb_stage_step <= step(0);				
										
				when step(2) =>  -- usb bus reset
					call_stack(stack_ptr) <= (usb_stage+'1') & step(0);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_bus_reset;
					usb_stage_step <= step(0);				

				when others => spi_cs_n <='1';
				end case;
									
			when usb_set_addr =>
				case usb_stage_step is
	
				when step(0) => -- (R28) set max3421 periph addr to 0
					frame_to_send(0 to 1) <= (("11100"&"010"),X"00");  
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(1) =>  -- usb bus reset
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_bus_reset;
					usb_stage_step <= step(0);				
					
				when step(2) =>  -- (R4) set setup fifo with set address command and send to ep 0
					frame_to_send(0 to 8) <= (("00100"&"010"),X"00",X"05",X"03",X"00",X"00",X"00",X"00",X"00");
					nb_bytes_to_send <= 9; 
					nb_bytes_to_receive <= 9;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_setup_ep0;
					usb_stage_step <= step(0);				
					
				when step(3) =>  -- (R28) set max3421 periph addr to 3
					frame_to_send(0 to 1) <= (("11100"&"010"),X"03");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= (usb_stage + '1') & step(0);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
				
				when others => spi_cs_n <='1';
				end case;

			when usb_set_config =>
				case usb_stage_step is
	
				when step(0) =>  -- (R4) set setup fifo with set config 
					frame_to_send(0 to 8) <= (("00100"&"010"),X"00",X"09",X"01",X"00",X"00",X"00",X"00",X"00");
					nb_bytes_to_send <= 9; 
					nb_bytes_to_receive <= 9;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_setup_ep0;
					usb_stage_step <= step(0);				
					
				when step(1) =>  -- wait frames
					nb_sof_to_wait <= 50;
					call_stack(stack_ptr) <= (usb_stage + '1') & step(0);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_wait_sof;
					usb_stage_step <= step(0);				
			
				when others => spi_cs_n <='1';
				end case;

			when usb_set_protocol =>
				case usb_stage_step is
	
				when step(0) =>  -- (R4) set setup fifo with set protocol (boot protocol)
					frame_to_send(0 to 8) <= (("00100"&"010"),X"21",X"0B",X"00",X"00",X"00",X"00",X"00",X"00");
					nb_bytes_to_send <= 9; 
					nb_bytes_to_receive <= 9;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_setup_ep0;
					usb_stage_step <= step(0);				
					
				when step(1) =>  -- wait frames
					nb_sof_to_wait <= 50;
					call_stack(stack_ptr) <= (usb_stage + '1') & step(0);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_wait_sof;
					usb_stage_step <= step(0);				
			
				when others => spi_cs_n <='1';
				end case;

			when usb_get_report =>
				case usb_stage_step is
	
				when step(0) =>  -- wait frames
					nb_sof_to_wait <= 10;
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_wait_sof;
					usb_stage_step <= step(0);				

				when step(1) =>  -- (R30) send request IN from ep1
					frame_to_send(0 to 1) <= (("11110"&"010"),X"01");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(2) => -- (R25) read host irg register
					frame_to_send(0) <= ("11001"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
			
				when step(3) =>  -- loop until host xfer done
					if (frame_received(1)(7) = '0') then
						usb_stage_step <= step(2);
					else
						usb_stage_step <= next_step(usb_stage_step);
					end if;

				when step(4) =>  -- (R25) clear host xfer irq
					frame_to_send(0 to 1) <= (("11001"&"010"),X"80");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(5) => -- (R25) read host irg register
					frame_to_send(0) <= ("11001"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
					
				when step(6) =>  -- if received data available go read else go begining
					if (frame_received(1)(2) = '1') then
						usb_stage_step <= next_step(usb_stage_step);
					else
						usb_stage_step <= step(0); 
					end if;
					
				when step(7) =>  -- (R6) get nb bytes received
					frame_to_send(0) <= ("00110"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
				
				when step(8) => -- nb bytes = 0 don't read them
					if (frame_received(1) = X"00") then
						usb_stage_step <= step(11);
					else
						usb_stage_step <= next_step(usb_stage_step);
					end if;

				when step(9) =>  -- (R1) get received bytes from rcv fifo
					frame_to_send(0) <= ("00001"&"000");
					nb_bytes_to_send <= 1;
					catch_report <= '1';
					nb_bytes_to_receive <= to_integer(unsigned(frame_received(1) + '1'));
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);							

				when step(10) => -- keep data and warn new data available
					catch_report <= '0';
					new_usb_report <= '1';
--					for byte in 0 to usb_report_t'high loop
--						usb_report(byte)  <= frame_received(byte+1);
--				   end loop;
					usb_stage_step <= next_step(usb_stage_step);

				when step(11) => -- (R25) clear rcv dav irq 
					new_usb_report <= '0';
					frame_to_send(0 to 1) <= (("11001"&"010"), X"04");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
					
				when step(12) => -- infinite loop from begining
						usb_stage_step <= step(0);
				
				when others => spi_cs_n <='1';
				end case;

--  Sub functions (end with return)

			when usb_send_setup_ep0 =>

				case usb_stage_step is
				
				when step(0) => -- load setup (control) fifo
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);
	
				when step(1) => -- (R30) start sending setup data to ep0
					frame_to_send(0 to 1) <= (("11110"&"010"),X"10");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(2) =>  -- (R25) read host irg register
					frame_to_send(0) <= ("11001"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
			
				when step(3) => -- loop until host xfer done
					if (frame_received(1)(7) = '0') then
						usb_stage_step <= step(2);
					else
						usb_stage_step <= next_step(usb_stage_step);
					end if;

				when step(4) =>  -- (R25) clear host xfer irq
					frame_to_send(0 to 1) <= (("11001"&"010"),X"80");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(5) =>  -- don't go too fast !
					nb_sof_to_wait <= 50;			
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_wait_sof;
					usb_stage_step <= step(0);				
					
				when step(6) =>  -- read xfer result register
					frame_to_send(0) <= ("11111"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

--	don't check result atm		
--				when step(6) => -- resend while not sucess
--					--if (frame_received(1)(3 downto 0) = X"0") then
--						usb_stage_step <= next_step(usb_stage_step);
--					--else
--					--	usb_stage_step <= step(1);
--					--end if;					
				
				when step(7) => -- (R30) start sending handshake IN 
					frame_to_send(0 to 1) <= (("11110"&"010"),X"80");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(8) => -- (R25) read host irg register
					frame_to_send(0) <= ("11001"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
			
				when step(9) =>  -- loop until host xfer done
					if (frame_received(1)(7) = '0') then
						usb_stage_step <= step(8);
					else
						usb_stage_step <= next_step(usb_stage_step);
					end if;

				when step(10) =>  -- (R25) clear host xfer irq
					frame_to_send(0 to 1) <= (("11001"&"010"),X"80");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(11) =>
					nb_sof_to_wait <= 50;			
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_wait_sof;
					usb_stage_step <= step(0);				

				when step(12) =>  -- (R31) read xfer result register
					frame_to_send(0) <= ("11111"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(13) => -- result have to be 0
					if (frame_received(1)(3 downto 0) = X"0") then
						usb_stage_step <= next_step(usb_stage_step);
					else
						null; -- error : stop 
					end if;
					
				when step(14) =>  -- retrieve return address
					return_stack_elt <= call_stack(stack_ptr-1);
					stack_ptr <= stack_ptr -1;							
					usb_stage_step <= next_step(usb_stage_step);
					
				when step(15) => -- return
					usb_stage <= return_stack_elt(stack_elt_t'left downto (usb_stage_step_t'left+1));
					usb_stage_step <= return_stack_elt(usb_stage_step_t'left downto 0);
			
				when others => spi_cs_n <='1';
				end case;

			when usb_wait_sof =>
					
				case usb_stage_step is
				
				when step(0) =>  -- reset sof counter 
					sof_cnt <= 0;
					usb_stage_step <= next_step(usb_stage_step);
					
				when step(1) =>  -- (R25) clear frame irq
					frame_to_send(0 to 1) <= (("11001"&"010"),X"40");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(2) => -- (R25) read frame irq
					frame_to_send(0) <= ("11001"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(3) =>  -- loop on read until irq and on clear nb_sof_to_wait times
					if (frame_received(1)(6) = '0') then
						usb_stage_step <= step(2);
					else
						if (sof_cnt < nb_sof_to_wait) then
							sof_cnt <= sof_cnt + 1;
							usb_stage_step <= step(1);
						else
							-- retreive return address
							return_stack_elt <= call_stack(stack_ptr-1);
							stack_ptr <= stack_ptr -1;							
							usb_stage_step <= next_step(usb_stage_step);
						end if;
					end if;

				when step(4) => -- return
					usb_stage <= return_stack_elt(stack_elt_t'left downto (usb_stage_step_t'left+1));
					usb_stage_step <= return_stack_elt(usb_stage_step_t'left downto 0);
					
				when others => spi_cs_n <='1';
				end case;

			when usb_bus_reset =>
				case usb_stage_step is
	
				when step(0) =>  -- (R29) start bus reset
					frame_to_send(0 to 1) <= (("11101"&"010"),X"01");
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
					sof_cnt <= 0;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);	
					
				when step(1) =>  -- (R29) read bus reset register
					frame_to_send(0) <= ("11101"&"000");
					nb_bytes_to_send <= 1; 
					nb_bytes_to_receive <= 2;
				
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				

				when step(2) => -- loop until bus reset end	
					if (frame_received(1)(0) = '1') then
						usb_stage_step <= step(1);
					else
						usb_stage_step <= next_step(usb_stage_step);
					end if;

				when step(3) => -- (R27) set pull up/down, sofkaen, speed, host mode
					if (speed = '0') then 
						frame_to_send(0 to 1) <= (("11011"&"010"),(X"CB")); -- low speed
					else
						frame_to_send(0 to 1) <= (("11011"&"010"),(X"C9")); -- full speed
					end if;
					nb_bytes_to_send <= 2; 
					nb_bytes_to_receive <= 2;
					
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_send_receive_frame;
					usb_stage_step <= step(0);				
					
				when step(4) => -- wait frames
					nb_sof_to_wait <= 50;
					call_stack(stack_ptr) <= usb_stage & next_step(usb_stage_step);
					stack_ptr <= stack_ptr +1;							
					usb_stage <= usb_wait_sof;
					usb_stage_step <= step(0);				
					
				when step(5) =>  -- retreive return address	
					return_stack_elt <= call_stack(stack_ptr-1);
					stack_ptr <= stack_ptr -1;							
					usb_stage_step <= next_step(usb_stage_step);
					
				when step(6) =>  -- return
					usb_stage <= return_stack_elt(stack_elt_t'left downto (usb_stage_step_t'left+1));
					usb_stage_step <= return_stack_elt(usb_stage_step_t'left downto 0);
					
				when others => spi_cs_n <='1';
				end case;
				
			when usb_send_receive_frame =>

				case usb_stage_step is
	
				when step(0) =>  -- set start frame flag and cs max3421e
					start_send_frame <= '1';
					spi_cs_n <='0';
					usb_stage_step <= next_step(usb_stage_step);
				
				when step(1) => -- clr start frame flag
					if start_send_frame = '1' then
						start_send_frame <='0';					
					else  -- clr cs max3421e when frame sent
						if st_frame_fsm = wait_for_start then
							spi_cs_n <='1';
							-- retreive return address						
							return_stack_elt <= call_stack(stack_ptr-1);
							stack_ptr <= stack_ptr -1;							
							usb_stage_step <= next_step(usb_stage_step);
						end if;	
					end if;

				when step(2) =>  -- return
					usb_stage <= return_stack_elt(stack_elt_t'left downto (usb_stage_step_t'left+1));
					usb_stage_step <= return_stack_elt(usb_stage_step_t'left downto 0);

				when others =>	spi_cs_n <='1';						
				end case;
			
			when others =>	spi_cs_n <='1';						
			end case;
	
		end if; -- not reset
	
	end if; -- clk rising edge
end process;

end struct;