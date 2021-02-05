---------------------------------------------------------------------------------
-- sgtl5000 DAC by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Minimum setup for i2s in PCM -> Headphone
--
---------------------------------------------------------------------------------
-- First release V0.0 : 01/05/2017
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

------------------------------------------------------------------------------
-- SGTL500/Teensy audio shield Rev B configuration 
--
-- shield hardware info
--
--   Volage reg AP7313 
--	    SD 3 y B (18SR :1.8V SOT23SR / year 3 / week 51)
--
--   SGTL5000 32QFN
--     VDDIO 3.3V pin 20
--     VDDA  3.3V pin  5
--     VDDD  1.8V pin 30 from AP7313
--     ADDR    0V pin 31 default => I2C addr = 0x14
--     MODE    OV pin 32 interface => I2C
--     CPFILT  open pin 18 no charge pump cap
--     VAG    OV/0.15uF pin 10 DAC VAG filter
--
------------------------------------------------------------------------------

entity sgtl5000_dac is
port(
 clock_18    : in std_logic;
 reset       : in std_logic;
 i2c_clock   : in std_logic;   -- 1MHz (1us period)

 sample_data : in  std_logic_vector(31 downto 0); -- audio data : 16bits left channel + 16bits right channel
 
 i2c_sda     : inout std_logic;
 i2c_scl     : inout std_logic;

 tx_data     : out std_logic;
 mclk        : out std_logic;
 
 lrclk       : in  std_logic;
 bclk        : in  std_logic;
 
 -- debug (display register value on 7seg)
 hex0_di : out std_logic_vector(3 downto 0);
 hex1_di : out std_logic_vector(3 downto 0);
 hex2_di : out std_logic_vector(3 downto 0);
 hex3_di : out std_logic_vector(3 downto 0);
 
 sw : in std_logic_vector(7 downto 0) -- select register to be read after programmation
);
end sgtl5000_dac ;

architecture struct of sgtl5000_dac is

-- low level i2c interface sequencer
constant i2c_addr_base  :  std_logic_vector(7 downto 0) := X"14";  -- I2C Adresse 0x14 write / 0x15 read

type   i2c_seq_fsm_t is (start, set_register_num, read_device_step1, read_device_step2, read_device_step3, write_device_step1, stop, idle, select_device, read_data, write_data);
signal i2c_seq_step : i2c_seq_fsm_t := idle;
signal i2c_seq_return_step : i2c_seq_fsm_t := idle;
signal i2c_seq_sub_step : integer range 0 to 15;
signal i2c_addr  :  std_logic_vector(7 downto 0) := X"00";

signal i2c_bit_phase    : integer range 0 to  2 := 0;
signal i2c_bit_cnt      : integer range 0 to  15 := 0; 
signal i2c_data         : std_logic_vector(15 downto 0);

-- progam level sequencer
signal start_i2c_cmd    : std_logic := '0';
type   seq_mode_t is (read_register, write_register);
signal seq_mode : seq_mode_t := read_register;
signal program_seq  : integer range 0 to 3 := 0;
signal program_step : integer range 0 to 16 := 0;
signal program_wait_cnt : integer range 0 to 200000 := 200000;

signal register_num    : std_logic_vector(15 downto 0);
signal data_write : std_logic_vector(15 downto 0) := X"0000";
signal data_read :  std_logic_vector(15 downto 0) := X"0000";

-- Audio interface

signal sample_data_reg : std_logic_vector(31 downto 0);
signal audio_bit_cnt : integer range 0 to 31 := 0;
signal audio_out  : std_logic := '0';

begin

hex0_di <= data_read( 3 downto  0);
hex1_di <= data_read( 7 downto  4);
hex2_di <= data_read(11 downto  8);
hex3_di <= data_read(15 downto 12);

-- sgtl5000 program

process(i2c_clock)
begin
	if rising_edge(i2c_clock) then
	
		if reset = '1' then
			program_step <= 0;
			program_seq  <= 0;
			program_wait_cnt <= 200000;
		else
			case program_seq is
			when 0 =>
				if i2c_seq_step = idle then -- wait for previous cmd to be send
					if program_wait_cnt = 0 then -- wait for previous cmd to be executed
						program_seq <= 1;  
					else
						program_wait_cnt <= program_wait_cnt -1;
					end if;
				end if;
			when 1 =>	
				program_seq <= 2;
				program_wait_cnt <= 200000; -- wait 200ms after each cmd (actually required only after chip_ana_power change) 
				case program_step is
				when 0 => seq_mode <= read_register;  register_num <= X"0000"; -- read chip_id 

				when 1 => seq_mode <= write_register; register_num <= X"0030"; -- write chip_ana_power
								data_write <= X"4060"; -- DAC stereo, ADC stereo, REF power up

				when 2 => seq_mode <= write_register; register_num <= X"0026"; -- write chip_lin_reg
								data_write <= X"0060"; -- VDDC overide to VDDIO
								
				when 3 => seq_mode <= write_register; register_num <= X"0028"; -- write chip_ref_ctrl
								data_write <= X"01FE"; -- VAG_VAL = 0.8+31x0.025 = 1.575V, Bias 50%, Ramp normal

				when 4 => seq_mode <= write_register; register_num <= X"003C"; -- write chip_short_ctrl
								data_write <= X"1106"; -- R HP 75ma, L HP 75ma, C HP 200ma, ena short det, 
								
				when 5 => seq_mode <= write_register; register_num <= X"0024"; -- write chip_ana_ctrl
								data_write <= X"0121"; -- mute ADC, unmute HP out, zero detect HP, mute line out

				when 6 => seq_mode <= write_register; register_num <= X"0030"; -- write chip_ana_power
								data_write <= X"40FC"; -- DAC stereo, ADC stereo, VGA,REF,HP,DAC,capless HP power up

				when 7 => seq_mode <= write_register; register_num <= X"0002"; -- write chip_dig_power
								data_write <= X"0021"; -- I2S in, DAC power up

				when 8 => seq_mode <= write_register; register_num <= X"0004"; -- write chip_clk_ctrl
								data_write <= X"0009"; -- MCLK = 384xFS (18.432MHz), FS =48KHz, Rate=SYS_FS
								
				when 9 => seq_mode <= write_register; register_num <= X"0006"; -- write chip_i2s_ctrl
								data_write <= X"00F8"; -- Format A, PCM format, 16bits, data on falling_edge, master, SCLK=64FS

				when 10=> seq_mode <= write_register; register_num <= X"000A"; -- write chip_sss_ctrl
								data_write <= X"0050"; -- DAC source = I2S in, DAP source = I2S in

				when 11=> seq_mode <= write_register; register_num <= X"0022"; -- write chip_ana_hp_ctrl
								data_write <= X"1818"; -- L/R vol 0dB

				when 12=> seq_mode <= write_register; register_num <= X"000E"; -- write chip_adc_dac_ctrl
								data_write <= X"0200"; -- DAC unmute, vol ramp ena, lin ramp, 
								
				when 13=> seq_mode <= write_register; register_num <= X"0010"; -- write chip_dac_vol
								data_write <= X"3C3C"; -- DAC vol 0dB
								
				when 14=> seq_mode <= write_register; register_num <= X"0014"; -- write chip_pad_strength
								data_write <= X"015F"; -- I2S LRCLK,SCLK,DOUT 4.02ma,  I2C in/out 12.05ma
				
				when others => register_num <= X"00"&sw; seq_mode <= read_register;  -- read selected register 00-FF
				end case;
			when 2 =>	
				program_seq <= 3;
				start_i2c_cmd <= '1';
			when 3 =>	
				if i2c_seq_step = start then
					start_i2c_cmd <= '0'; 
					if program_step = 15 then  -- loop on last step
						program_seq <= 0;
					else                       -- advance one step
						program_seq <= 0;
						program_step <= program_step + 1;
					end if;
				end if;
			end case;
		end if;

	end if;
end process;

-- sgtl5000 interface i2c 
			
process(i2c_clock)
begin
	if rising_edge(i2c_clock) then
  	
		if start_i2c_cmd = '1' then
			i2c_seq_step <= start;
			i2c_seq_sub_step <= 0;
			i2c_sda <= 'Z';
			i2c_scl <= 'Z';
		else
			case i2c_seq_step is
			when start =>
				if i2c_seq_sub_step < 4 then
					i2c_seq_sub_step <= i2c_seq_sub_step + 1;
				else
					i2c_addr <= i2c_addr_base;
					i2c_seq_step <= select_device;
					i2c_seq_sub_step <= 0;
					i2c_seq_return_step <= set_register_num;
				end if;
				
			when set_register_num =>
					i2c_data <= register_num;
					i2c_seq_step <= write_data;
					i2c_seq_sub_step <= 0;
					if seq_mode = read_register then
						i2c_seq_return_step <= read_device_step1;
					else
						i2c_seq_return_step <= write_device_step1;
					end if;
					
			when read_device_step1 =>
				case i2c_seq_sub_step is
				when 0 =>
					i2c_sda <= '1';
					i2c_scl <= '1';
					i2c_seq_sub_step <= 1;
				when 1 =>
					i2c_sda <= '0';  -- restart condition
					i2c_scl <= '1';
					i2c_seq_sub_step <= 2;
				when 2 =>
					i2c_sda <= '0';
					i2c_scl <= '0';
					i2c_seq_step <= read_device_step2;
					i2c_seq_sub_step <= 0;				
				when others =>
					null;
				end case;

			when read_device_step2 =>
					i2c_addr <= i2c_addr_base or X"01";
					i2c_seq_step <= select_device;
					i2c_seq_sub_step <= 0;
					i2c_seq_return_step <= read_device_step3;
			
			when read_device_step3 =>
					i2c_seq_step <= read_data;
					i2c_seq_sub_step <= 0;
					i2c_seq_return_step <= stop;

			when write_device_step1 =>
					i2c_data <= data_write;
					i2c_seq_step <= write_data;
					i2c_seq_sub_step <= 0;
					i2c_seq_return_step <= stop;

			when stop =>
				case i2c_seq_sub_step is
				when 0 =>
					i2c_sda <= '0';
					i2c_scl <= '0';
					i2c_seq_sub_step <= 1;
				when 1 =>
					i2c_sda <= '0';
					i2c_scl <= '1';
					i2c_seq_sub_step <= 2;
				when 2 =>
					i2c_sda <= '1';  -- stop condition
					i2c_scl <= '1';
					i2c_seq_sub_step <= 3;				
				when 3 =>
					i2c_sda <= 'Z';
					i2c_scl <= 'Z';
					i2c_seq_step <= idle;				
				when others =>
					null;
				end case;
				
			when idle => null;
				
	-- sub functions
	
			-- select device : 	write i2c_addr (8bits) on bus 
			--							then release sda for ack/nack from device
			when select_device =>
				case i2c_seq_sub_step is
				when 0 =>
					i2c_sda <= '0';
					i2c_seq_sub_step <= 1;
				when 1 =>
					i2c_scl <= '0';
					i2c_bit_cnt <= 7;
				   i2c_sda <= i2c_addr(7);
					i2c_bit_phase <= 0;
					i2c_seq_sub_step <= 2;
				when 2 =>	
					if i2c_bit_phase = 2 then
						i2c_bit_phase <= 0;
						if i2c_bit_cnt = 0 then
							i2c_seq_sub_step <= 3;
							i2c_sda <= 'Z';
						else	
							i2c_bit_cnt <= i2c_bit_cnt - 1;
							i2c_sda <= i2c_addr(i2c_bit_cnt - 1);
						end if;
					else
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when 3 =>
					if i2c_bit_phase = 2 then
						i2c_seq_step <= i2c_seq_return_step;
						i2c_seq_sub_step <= 0;
					else	
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when others => null ;					
				end case;
				
			-- read data : release sda for device data
			--             generate scl for 8bits and catch data on bus 
			--					then send ack
			--					then generate scl for 8bits and catch data on bus
			--					then send nack
			when read_data =>
				
				case i2c_seq_sub_step is
				when 0 =>
					i2c_sda <= 'Z';
					i2c_scl <= '0';
					i2c_bit_cnt <= 15;
					i2c_bit_phase <= 0;
					i2c_seq_sub_step <= 1;
				when 1 =>	
					if i2c_bit_phase = 2 then
						i2c_bit_phase <= 0;
						if i2c_bit_cnt = 8 then
							i2c_seq_sub_step <= 2;
							i2c_sda <= '0';  -- send ack after read
						elsif i2c_bit_cnt = 0 then
							i2c_seq_sub_step <= 3;
							i2c_sda <= '1';  -- send nack on last byte (cf specif)
						else
							i2c_bit_cnt <= i2c_bit_cnt - 1;
						end if;
					else
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 1 then 
						data_read(i2c_bit_cnt) <= i2c_sda;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when 2	=>
					if i2c_bit_phase = 2 then
						i2c_bit_phase <= 0;
						i2c_sda <= 'Z';
						i2c_bit_cnt <= i2c_bit_cnt - 1;
						i2c_seq_sub_step <= 1;
					else	
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when 3 =>
					if i2c_bit_phase = 2 then
						i2c_sda <= 'Z';
						i2c_seq_step <= i2c_seq_return_step;
						i2c_seq_sub_step <= 0;
					else	
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when others => null ;					
				end case;
				
			-- write data : 	write i2c_data MSByte (8bits) on bus
			-- 					then release sda for ack/nack from device
			--						then write i2c_data LSByte (8bits) on bus
			--						then release sda for ack/nack from device
			when write_data =>
				case i2c_seq_sub_step is
				when 0 =>
					i2c_sda <= '0';
					i2c_seq_sub_step <= 1;
				when 1 =>
					i2c_scl <= '0';
					i2c_bit_cnt <= 15;
				   i2c_sda <= i2c_data(15);
					i2c_bit_phase <= 0;
					i2c_seq_sub_step <= 2;
				when 2 =>	
					if i2c_bit_phase = 2 then
						i2c_bit_phase <= 0;
						if i2c_bit_cnt = 8 then
							i2c_seq_sub_step <= 3;
							i2c_sda <= 'Z';
						elsif i2c_bit_cnt = 0 then
							i2c_seq_sub_step <= 4;
							i2c_sda <= 'Z';
						else
							i2c_bit_cnt <= i2c_bit_cnt - 1;
							i2c_sda <= i2c_data(i2c_bit_cnt - 1);
						end if;
					else
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when 3 =>
					if i2c_bit_phase = 2 then
						i2c_bit_phase <= 0;
						i2c_bit_cnt <= i2c_bit_cnt - 1;
						i2c_sda <= i2c_data(i2c_bit_cnt - 1);
						i2c_seq_sub_step <= 2;
					else	
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when 4 =>
					if i2c_bit_phase = 2 then
						i2c_seq_step <= i2c_seq_return_step;
						i2c_seq_sub_step <= 0;
					else	
						i2c_bit_phase <= i2c_bit_phase + 1;
					end if;
					if i2c_bit_phase = 0 then i2c_scl <= '1';
					else i2c_scl <= '0';
					end if;
				when others => null ;
				
				end case;				
			when others => null ;
			end case;
		end if;	
		
  end if;
end process;

-- sgtl5000 interface audio

mclk    <= clock_18;
tx_data <= sample_data_reg(audio_bit_cnt) when audio_out = '1' else '0';
 
process(bclk)
begin
	if rising_edge(bclk) then
		if lrclk  = '1' then			
			audio_bit_cnt <= 31;
			sample_data_reg <= sample_data;
			audio_out <= '1';
		else
			if audio_bit_cnt = 0 then
				audio_out <= '0';				
			else
				audio_bit_cnt <= audio_bit_cnt -1;
			end if;
		end if;
  end if;
end process;

end architecture;