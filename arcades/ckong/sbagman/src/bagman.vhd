---------------------------------------------------------------------------------
-- Bagman (stern) - Dar - Feb 2014
--
-- Remove sram multiplexing - Dar -June 2018
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity bagman is
port(
  clock_12  : in std_logic;
  reset        : in std_logic;
  tv15Khz_mode : in std_logic;

  video_r      : out std_logic_vector(2 downto 0);
  video_g      : out std_logic_vector(2 downto 0);
  video_b      : out std_logic_vector(2 downto 0);
  video_hs     : out std_logic;
  video_vs     : out std_logic;
  audio_out_l  : out std_logic;
  audio_out_r  : out std_logic;
  --
  roms_addr    : out std_logic_vector(14 downto 0);
  roms_do   	: in std_logic_vector(7 downto 0);
  --
  I_JOYSTICK_A           : in    std_logic_vector(5 downto 0);
  I_JOYSTICK_B           : in    std_logic_vector(5 downto 0);
  JOYSTICK_A_GND			 : out	std_logic;
  JOYSTICK_B_GND			 : out	std_logic;
  I_COIN	       	   	 : in    std_logic_vector(1 downto 0);
  I_PLAYER	       		 : in    std_logic_vector(1 downto 0);
  scanSW			   	    : in    std_logic_vector(20 downto 0);
  resetKey               : in    std_logic;
  scandblctrl            : in    std_logic_vector(1 downto 0)
);
end bagman;

architecture struct of bagman is

-- clocks 
signal clock_12n : std_logic;
signal clock_1mhz: std_logic;
signal reset_n   : std_logic;
signal div_clk   : std_logic_vector(3 downto 0);

-- video syncs
signal hsync       : std_logic;
signal vsync       : std_logic;
signal csync       : std_logic;
signal blank       : std_logic;

-- audio
signal audio_out    : std_logic_vector(12 downto 0);
signal audio_pwm     : std_logic;

-- keyboard to joystick
signal button_in        : std_logic_vector(15 downto 0);
signal buttons	       : std_logic_vector(15 downto 0);
signal button_debounced : std_logic_vector(15 downto 0);
signal joystick_reg     : std_logic_vector(5 downto 0);
signal joystick2_reg     : std_logic_vector(5 downto 0);

-- global synchronisation
signal ena_pixel  : std_logic := '0';
signal is_sprite  : std_logic;
signal sprite     : std_logic_vector(2 downto 0);
signal x_tile     : std_logic_vector(4 downto 0);
signal y_tile     : std_logic_vector(4 downto 0);
signal x_pixel    : std_logic_vector(2 downto 0);
signal y_pixel    : std_logic_vector(2 downto 0);
signal y_line     : std_logic_vector(7 downto 0);

signal y_sp_bg    : std_logic_vector(7 downto 0);
signal y_line_shift : std_logic_vector(7 downto 0);
signal attr_sp : std_logic_vector(7 downto 0);
signal attr_sp_bg : std_logic_vector(7 downto 0);
signal bg_tile_code : std_logic_vector(7 downto 0);

signal tile_graph_rom_addr : std_logic_vector(12 downto 0);
signal tile_graph_rom_bit0_do : std_logic_vector(7 downto 0);
signal tile_graph_rom_bit1_do : std_logic_vector(7 downto 0);

-- background and sprite tiles and graphics
signal tile_code   : std_logic_vector(12 downto 0);
signal tile_color  : std_logic_vector(3 downto 0);
signal tile_graph1 : std_logic_vector(7 downto 0);
signal tile_graph2 : std_logic_vector(7 downto 0);
signal x_sprite    : std_logic_vector(7 downto 0);
signal y_sprite    : std_logic_vector(7 downto 0);
signal keep_sprite : std_logic;

signal tile_color_r  : std_logic_vector(3 downto 0);
signal tile_graph1_r : std_logic_vector(7 downto 0);
signal tile_graph2_r : std_logic_vector(7 downto 0);

signal pixel_color    : std_logic_vector(5 downto 0);
signal pixel_color_r  : std_logic_vector(5 downto 0);

signal sprite_pixel_color  : std_logic_vector(5 downto 0);
signal do_palette          : std_logic_vector(7 downto 0);

signal addr_ram_sprite : std_logic_vector(8 downto 0);
signal is_sprite_r     : std_logic;

type ram_256x6 is array(0 to 255) of std_logic_vector(5 downto 0);
signal ram_sprite : ram_256x6;

-- Z80 interface 
signal cpu_clock  : std_logic;
signal cpu_wr_n   : std_logic;
signal cpu_addr   : std_logic_vector(15 downto 0);
signal cpu_do     : std_logic_vector(7 downto 0);
signal cpu_di     : std_logic_vector(7 downto 0);
signal cpu_mreq_n : std_logic;
signal cpu_int_n  : std_logic;
signal cpu_iorq_n : std_logic;
signal cpu_di_mem   : std_logic_vector(7 downto 0);

-- misc
signal raz_int_n  : std_logic;
signal misc_we_n   : std_logic;
signal sound_cs_n  : std_logic;
signal speech_we_n : std_logic;

signal prog_do    : std_logic_vector(7 downto 0);
signal prog2_do    : std_logic_vector(7 downto 0);
signal wram2_do   : std_logic_vector(7 downto 0);
signal wram2_we   : std_logic;

signal tile_ram_addr : std_logic_vector(9 downto 0);
signal tile_ram_do   : std_logic_vector(7 downto 0);
signal tile_ram_we   : std_logic;
signal tile_ram_cs   : std_logic;

signal color_ram_addr: std_logic_vector(9 downto 0);
signal color_ram_do  : std_logic_vector(7 downto 0);
signal color_ram_we  : std_logic;
signal color_ram_cs  : std_logic;

-- data bus from AY-3-8910
signal ym_8910_data : std_logic_vector(7 downto 0);

-- audio
signal ym_8910_audio : std_logic_vector(7 downto 0);
signal music         : unsigned(12 downto 0);
signal speech        : unsigned(12 downto 0);
signal speech_sample : integer range -512 to 511;

-- player I/O 
signal player1  : std_logic_vector(7 downto 0);
signal player2  : std_logic_vector(7 downto 0);
signal coins    : std_logic_vector(7 downto 0);

-- random generator
signal pal16r6_data : std_logic_vector(5 downto 0);

-- line doubler I/O
signal video_i : std_logic_vector (7 downto 0);
signal video_o : std_logic_vector (7 downto 0);
signal hsync_o : std_logic;
signal vsync_o : std_logic;

begin

clock_12n <= not clock_12;
reset_n   <= not reset;

--------------------
-- Make 1MHz clock
--------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		if div_clk = X"B" then
			div_clk <= (others => '0');
		else
			div_clk <= div_clk + '1';
		end if;

	end if;
end process;

clock_1mhz <= div_clk(3);

-----------------------
-- Enable pixel counter
-----------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		ena_pixel <= not ena_pixel;
	end if;
end process;
	
------------------
-- video output
------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		if ena_pixel = '1' then
			if blank = '0' then
				video_i <= do_palette;			
			else
				video_i <= (others => '0');
			end if;
		end if;
	end if;
end process;

video_r     <= video_o(2 downto 0)              when tv15Khz_mode = '0' else video_i(2 downto 0);
video_g     <= video_o(5 downto 3)              when tv15Khz_mode = '0' else video_i(5 downto 3);
video_b     <= video_o(7 downto 6) & video_o(6) when tv15Khz_mode = '0' else video_i(7 downto 6) & video_i(6);
video_hs    <= hsync_o when tv15Khz_mode = '0' else csync;
video_vs    <= vsync_o when tv15Khz_mode = '0' else '1';

------------------
-- audio output
------------------
audio_out_l <= audio_pwm; 
audio_out_r <= audio_pwm;

-------
--INPUT
-------
  joystick_reg  <=  I_JOYSTICK_A;
  joystick2_reg <=  I_JOYSTICK_B;
  JOYSTICK_A_GND <= '0';
  JOYSTICK_B_GND <= '0';

  button_in(15) <= I_COIN(1) and not scanSW(20); --ic2
  button_in(8)  <= I_COIN(0) and not scanSW(13); --ic1
  button_in(7)  <= I_PLAYER(1) and not scanSW(12); --p2
  button_in(6)  <= I_PLAYER(0) and not scanSW(11); --p1
                                                     -- Player 1
  button_in(5) <= joystick_reg(5) and not scanSW(5); -- fire2 / x / lwin
  button_in(4) <= joystick_reg(4) and not scanSW(4); -- fire1 / enter / z / space
  button_in(3) <= joystick_reg(3) and not scanSW(3); -- right
  button_in(2) <= joystick_reg(2) and not scanSW(2); -- left
  button_in(1) <= joystick_reg(1) and not scanSW(1); -- down
  button_in(0) <= joystick_reg(0) and not scanSW(0); -- up
                                                        -- Player 2
  button_in(14) <= joystick2_reg(5) and not scanSW(19); -- fire2 / x / lwin
  button_in(13) <= joystick2_reg(4) and not scanSW(18); -- fire1 / enter / z / space
  button_in(12) <= joystick2_reg(3) and not scanSW(17); -- right
  button_in(11) <= joystick2_reg(2) and not scanSW(16); -- left
  button_in(10) <= joystick2_reg(1) and not scanSW(15); -- down
  button_in(9)  <= joystick2_reg(0) and not scanSW(14); -- up
  
  --Swap directions for horizontal screen help
  buttons(0) <= button_in(0) when scanSW(9) = '0' else button_in(2);
  buttons(1) <= button_in(1) when scanSW(9) = '0' else button_in(3);
  buttons(2) <= button_in(2) when scanSW(9) = '0' else button_in(1);
  buttons(3) <= button_in(3) when scanSW(9) = '0' else button_in(0);
  buttons(8 downto 4) <= button_in(8 downto 4);
  buttons(9)  <= button_in(9)  when scanSW(9) = '0' else button_in(11);
  buttons(10) <= button_in(10) when scanSW(9) = '0' else button_in(12);
  buttons(11) <= button_in(11) when scanSW(9) = '0' else button_in(10);
  buttons(12) <= button_in(12) when scanSW(9) = '0' else button_in(9);
  buttons(15 downto 13) <= button_in(15 downto 13);

  debounce : entity work.DEBOUNCE
  generic map (
    G_WIDTH => 16
    )
  port map (
    I_BUTTON => buttons,
    O_BUTTON => button_debounced,
    CLK      => clock_12
    );

------------------
-- player controls
------------------
player1 <= (button_debounced(4) & button_debounced(1) & button_debounced(0) & button_debounced(3) & button_debounced(2) & button_debounced(6) & '1' & button_debounced(8)); --not(fire1 & down1 & up1 & right1 & left1 & start1 & '0' & coin1);
player2 <= (button_debounced(13) & button_debounced(10) & button_debounced(9) & button_debounced(12) & button_debounced(11) & button_debounced(7) & '1' & button_debounced(15));--not(fire2 & down2 & up2 & right2 & left2 & start2 & "00");

-----------------------
-- cpu write addressing
-----------------------
speech_we_n <= '0' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 11) = "10101" else '1';
misc_we_n   <= '0' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 11) = "10100" else '1';
wram2_we    <= '1' when cpu_mreq_n = '0' and cpu_wr_n = '0' and cpu_addr(15 downto 11) = "01100" else '0'; -- 6000-67ff

tile_ram_cs       <= '1' when cpu_addr(15 downto 10) = "100100"   else '0'; -- 9000-93ff
color_ram_cs      <= '1' when cpu_addr(15 downto 11) = "10011"    else '0'; -- 9800-9fff

---------------------------
-- enable/disable interrupt
---------------------------
process (cpu_clock)
begin
	if falling_edge(cpu_clock) then
		if misc_we_n = '0' then

			if cpu_addr(2 downto 0) = "000" then
				raz_int_n <= cpu_do(0);
			end if;
			
			if cpu_addr(2 downto 0) = "111" then
				sound_cs_n <= cpu_do(0);
			end if;

		end if;
						
	end if;
end process;

-------------------------------
-- latch interrupt at last line 
-------------------------------
process(clock_12, raz_int_n)
begin
	if raz_int_n = '0' then
		cpu_int_n <= '1';
	else
		if rising_edge(clock_12) then
			if y_tile = "11100" and y_pixel = "000" then
				cpu_int_n <= '0';
			end if;
		end if;
	end if;
end process;

------------------------------------
-- mux cpu data mem read and io read
------------------------------------
with cpu_addr(15 downto 11) select 
	cpu_di_mem <=
		prog_do           when "00000", -- 0000-07ff
		prog_do           when "00001", -- 0800-0fff
		prog_do           when "00010", -- 1000-17ff
		prog_do           when "00011", -- 1800-1fff
		prog_do           when "00100", -- 2000-27ff
		prog_do           when "00101", -- 2800-2fff
		prog_do           when "00110", -- 3000-37ff
		prog_do           when "00111", -- 3800-3fff
		prog_do           when "01000", -- 4000-47ff
		prog_do           when "01001", -- 4800-4fff
		prog_do           when "01010", -- 5000-57ff
		prog_do           when "01011", -- 5800-5fff
		wram2_do          when "01100", -- 6000-67ff
 		tile_ram_do       when "10010", -- 9000-97ff (ram only at 9000-93ff)
		color_ram_do      when "10011", -- 9800-9fff (ram only at 9800-9bff)		
		"00" & pal16r6_data when "10100", -- a000 -- rd4, random generator
		not("00010001")   when "10110",   -- b000 	DIP SWITCH
		prog2_do           when "11000", -- c000-c7ff
		prog2_do           when "11001", -- c800-cfff
		prog2_do           when "11010", -- d000-d7ff
		prog2_do           when "11011", -- d800-dfff
		prog2_do           when "11100", -- e000-e7ff
		prog2_do           when "11101", -- e800-efff
		prog2_do           when "11110", -- f000-f7ff
		prog2_do           when "11111", -- f800-ffff
		"00000000"        when others;

-- dip switchs
--
--  |cabinet|bonus|langage|difficulty|coin|lives|
--  |   7   |  6  |   5   |  4-3     |  2 | 0-1 |  
--
--   lives       00 = 2, 01 = 3, 10 = 4, 11 = 5   
--   coin         0 = 1coin/1play, 1 = 2coins/1play
--   difficulty  00 = 1, 01 = 2, 10 = 3, 11 = 4
--   langage      0 = english, 1 = french
--   bonus        0 = 30000,   1 = 40000 
--   cabinet      0 = upright, 1 = cocktail (NA)
  
		
cpu_di <= ym_8910_data when cpu_iorq_n = '0' else cpu_di_mem;

-----------------------
-- mux sound and music
-----------------------
speech    <= "0" & to_unsigned((speech_sample+512),10) & "00";
music     <= "0000" & unsigned(ym_8910_audio) & '0';
audio_out <= std_logic_vector(music + speech);

-------------------------------------
-- color ram addressing scheme 
-------------------------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		color_ram_we <= '0';
		case x_pixel is
				
			when "000" =>	
				if is_sprite = '1' then 			
					color_ram_addr <= "00000" & sprite & "10"; -- y sprite 
					if ena_pixel = '1' then y_sp_bg <= color_ram_do; end if;
				else
					color_ram_addr <= (others => '0');
					if ena_pixel = '1' then y_sp_bg <= X"00"; end if;
				end if;

			when "010" =>	
				if is_sprite = '1' then 
					color_ram_addr <= "00000" & sprite & "01"; -- color sprite 
				else
					color_ram_addr <= y_line_shift(7 downto 3) & x_tile; -- color background 
				end if;
				if ena_pixel = '1' then attr_sp_bg <= color_ram_do; end if;

			when "100" =>	
				if is_sprite = '1' then 
					color_ram_addr <= "00000" & sprite & "00"; -- tile sprite 
				else
					color_ram_addr <= (others => '0');
				end if;
				if ena_pixel = '1' then attr_sp <= color_ram_do; end if;
						
			when "110" =>
				if is_sprite = '1' then 
					color_ram_addr <= "00000" & sprite & "11"; -- x sprite 
				else
					color_ram_addr <= (others => '0');
				end if;
				if ena_pixel = '1' then x_sprite <= color_ram_do; end if;
				
			when others =>
				color_ram_addr <= cpu_addr(9 downto 0);
				color_ram_we <= not(cpu_wr_n) and not(cpu_mreq_n) and color_ram_cs;				
				
		end case;	
	end if;
end process;

-------------------------------------
-- tile ram addressing scheme 
-------------------------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		tile_ram_we <= '0';
		case x_pixel is
		
			when "100" =>
				tile_ram_addr <= y_line_shift(7 downto 3) & x_tile;-- bg tile code
					
			when others =>
				tile_ram_addr <= cpu_addr(9 downto 0);
				tile_ram_we <= not(cpu_wr_n) and not(cpu_mreq_n) and tile_ram_cs;				
				
		end case;	
	end if;
end process;

-------------------------------------
-- tile graph rom addressing scheme 
-------------------------------------
process(clock_12)
begin
	if rising_edge(clock_12) then
		case x_pixel is
		
			when "100" =>
				if ena_pixel = '1' then
					bg_tile_code <= tile_ram_do;
				end if;
		
			when "110" =>
				if is_sprite = '1' then
						case attr_sp(7 downto 6) is
						when "00" => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & (y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "00000"; --TBA
						when "01" => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & (y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "01000"; --TBA
						when "10" => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & (y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "10111"; --TBA
						when "11" => tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & attr_sp(5 downto 0) & (y_line_shift(3) & x_tile(0) & y_line_shift(2 downto 0)) xor "11111"; --TBA
						when others => NULL;
						end case;
				else
					tile_graph_rom_addr <= attr_sp_bg(4) & attr_sp_bg(5) & bg_tile_code & y_line_shift(2 downto 0);
				end if;

			when "111" =>
				if ena_pixel = '1' then
					tile_graph1_r <= tile_graph_rom_bit0_do;
					tile_graph2_r <= tile_graph_rom_bit1_do;
					tile_color_r  <= attr_sp_bg(3 downto 0);
					
					if is_sprite = '1' and attr_sp(6) = '1' then 
						for i in 0 to 7 loop
							tile_graph1_r(i) <= tile_graph_rom_bit0_do(7-i);
							tile_graph2_r(i) <= tile_graph_rom_bit1_do(7-i);
						end loop;
					end if;

					is_sprite_r <= is_sprite;
					
					keep_sprite <= '0';
					if (y_line_shift(7 downto 4) = "1111") and (x_sprite /= X"00") and (y_sp_bg /= X"00") then
						keep_sprite <= '1';
					end if;
				
				end if;
				
			when others => null;		
				
		end case;	
	end if;
end process;

--------------------------------
-- sprite/ big sprite y position
--------------------------------
y_line         <= y_tile & y_pixel;
y_line_shift   <= std_logic_vector(unsigned(y_line) + unsigned(y_sp_bg) + 1);

------------------------------------------
-- read/write sprite line-memory addresing
------------------------------------------
process (clock_12)
begin 
	if rising_edge(clock_12) then

		if ena_pixel = '1' then
			addr_ram_sprite <= addr_ram_sprite + '1';
		end if;

		if is_sprite = '1' and x_pixel = "111" and ena_pixel = '1' and x_tile(0) = '0' then
			addr_ram_sprite <= '0' & x_sprite;
		end if;

		if is_sprite = '0' and x_pixel = "111" and ena_pixel = '1' and x_tile = "00000" then
			addr_ram_sprite <= "000000001";
		end if;

	end if;
end process;

-------------------------------------
-- read/write sprite line-memory data
-------------------------------------
process (clock_12)
begin
	if rising_edge(clock_12) then
		if ena_pixel = '0' then
			sprite_pixel_color <= ram_sprite(to_integer(unsigned(addr_ram_sprite)));
		else
			if sprite_pixel_color(1 downto 0) = "00" then
				pixel_color_r <= pixel_color;
			else
				pixel_color_r <= sprite_pixel_color;
			end if;
		
			if is_sprite_r = '1' then
				if (keep_sprite = '1') and (addr_ram_sprite(8) = '0') then
					if sprite_pixel_color(1 downto 0) = "00" then
						ram_sprite(to_integer(unsigned(addr_ram_sprite))) <= pixel_color;
					else
						ram_sprite(to_integer(unsigned(addr_ram_sprite))) <= sprite_pixel_color;
					end if;
						
				end if;
			else
				ram_sprite(to_integer(unsigned(addr_ram_sprite))) <= (others => '0');
			end if;
		end if;
	end if;
end process;

-----------------------------------------------------------------
-- serialize background/sprite graph to pixel + concatenate color
-----------------------------------------------------------------
pixel_color <=	tile_color_r & 
	tile_graph1_r(to_integer(unsigned(not x_pixel))) &
	tile_graph2_r(to_integer(unsigned(not x_pixel)));


-- Sync and video counters
video : entity work.video_gen
port map (
  clock_12  => clock_12,
  ena_pixel => ena_pixel,
  hsync     => hsync,
  vsync     => vsync,
  csync     => csync,
  blank     => blank,

  is_sprite  => is_sprite,
  sprite     => sprite,
  x_tile     => x_tile,
  y_tile     => y_tile,
  x_pixel    => x_pixel,
  y_pixel    => y_pixel,
	
  cpu_clock  => cpu_clock
);

-- line doubler 
line_doubler : entity work.line_doubler
port map(
	clock_12mhz => clock_12,
	video_i     => video_i,
	hsync_i     => hsync,
	vsync_i     => vsync,
	video_o     => video_o,
	hsync_o     => hsync_o,
	vsync_o     => vsync_o,
	scanlines	=> scandblctrl(1) xor scanSW(8)
);

-- sprite palette rom
palette : entity work.sbagman_palette
port map (
	addr => pixel_color_r,
	clk  => clock_12,
	data => do_palette 
);

-- Z80
Z80 : entity work.T80s
generic map(Mode => 0, T2Write => 1, IOWait => 1)
port map(
  RESET_n => reset_n,
  CLK_n   => cpu_clock,
  WAIT_n  => '1',
  INT_n   => cpu_int_n,
  NMI_n   => '1',
  BUSRQ_n => '1',
  M1_n    => open,
  MREQ_n  => cpu_mreq_n,
  IORQ_n  => cpu_iorq_n,
  RD_n    => open,
  WR_n    => cpu_wr_n,
  RFSH_n  => open,
  HALT_n  => open,
  BUSAK_n => open,
  A       => cpu_addr,
  DI      => cpu_di,
  DO      => cpu_do
);

ym2149 : entity work.ym2149
port map (
-- data bus
	I_DA        => cpu_do,
	O_DA        => ym_8910_data,
	O_DA_OE_L   => open,
-- control
	I_A9_L      => sound_cs_n,
	I_A8        =>     cpu_iorq_n or cpu_addr(3),
	I_BDIR      => not(cpu_iorq_n or cpu_addr(2)),
	I_BC2       => not(cpu_iorq_n or cpu_addr(1)),
	I_BC1       => not(cpu_iorq_n or cpu_addr(0)),
	I_SEL_L     => '1',
	O_AUDIO     => ym_8910_audio,
-- port a
	I_IOA       => player1,
	O_IOA       => open,
	O_IOA_OE_L  => open,
-- port b
	I_IOB       => player2,
	O_IOB       => open,
	O_IOB_OE_L  => open,

	ENA         => '1',
	RESET_L     => '1',
	CLK         => x_pixel(1) -- note 6 Mhz!
);

-- bagman_speech
bagman_speech : entity work.bagman_speech
port map(
	Clk1MHz      => clock_1mhz,
	hclkn        => cpu_clock,
	adrCpu       => cpu_addr(2 downto 0),
	doCpu        => cpu_do(0),
	weSelSpeech  => speech_we_n,
	SpeechSample => speech_sample
); 

-- random generator
pal16r6 : entity work.bagman_pal16r6
port map(
	clk  => vsync,
	addr => cpu_addr(6 downto 0),
	data => pal16r6_data
);

-- program rom 
--program : entity work.bagman_program
--port map (
--	addr  => cpu_addr(14 downto 0),
--	clk   => clock_12n,
--	data  => prog_do
--);
roms_addr <= cpu_addr(14 downto 0);
prog_do <= roms_do;

program2 : entity work.sbagman_program2
port map (
	addr  => cpu_addr(13 downto 0),
	clk   => clock_12n,
	data  => prog2_do
);

-- working ram2 - 6000-67ff
wram2 : entity work.gen_ram
generic map( dWidth => 8, aWidth => 11)
port map(
 clk  => clock_12n,
 we   => wram2_we,
 addr => cpu_addr( 10 downto 0),
 d    => cpu_do,
 q    => wram2_do
);

-- tile_ram - 9000-93ff 
tile_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12n,
 we   => tile_ram_we,
 addr => tile_ram_addr,
 d    => cpu_do,
 q    => tile_ram_do
);

-- color_ram - 9800-9bff
color_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 10)
port map(
 clk  => clock_12n,
 we   => color_ram_we,
 addr => color_ram_addr,
 d    => cpu_do,
 q    => color_ram_do
);

-- sprite and background graphics rom 
tile_bit0 : entity work.sbagman_tile_bit0
port map (
	addr  => tile_graph_rom_addr,
	clk   => clock_12n,
	data  => tile_graph_rom_bit0_do
);

-- sprite and background graphics rom 
tile_bit1 : entity work.sbagman_tile_bit1
port map (
	addr  => tile_graph_rom_addr,
	clk   => clock_12n,
	data  => tile_graph_rom_bit1_do
);

  -- Audio DAC
  --
u_dac : entity work.dac
  generic map(
    msbi_g => 12
  )
port  map(
    clk_i   => clock_12,
    res_n_i => reset_n,
    dac_i   => audio_out,
    dac_o   => audio_pwm
);

------------------------------------------
end architecture;