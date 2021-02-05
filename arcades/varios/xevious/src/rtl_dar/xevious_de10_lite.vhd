---------------------------------------------------------------------------------
-- DE10_lite Top level for Xevious by Dar (darfpga@aol.fr) (01/05/2017)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
--   DE10 Top version 0.2 : add digital audio out sgtl5000 support with 
--     teensy audio shield on top of arduino usb host shield
--
--   DE10 Top version 0.1 : add usb host max3421e support with arduino shield
--
--     BEWARE : arduino shield has to be modified (see instruction on my blog)
--
---------------------------------------------------------------------------------
-- To detect usb device, press first reset (key 0 on DE10) then start (key 1)
--
-- Choose USB keyboard or joystick before compilation for one entity keyboard 
-- or joystick usb decoder
--
--	  joyBCPPFRLDU  => open          (to dont use this decoder)
--   or 
--   joyBCPPFRLDU  => joyBCPPFRLDU  (to use this decoder)
--
-- Select only one decoder among PS/2 or USB keyboard or USB joystick.
--
---------------------------------------------------------------------------------
-- How to adapt joystick decoder :
--  After USB detection, 3 bytes of USB report are displayed on 7 seg.
--  Use DE10 switch to select first starting byte of report to be displayed
--
--  Example : 
--    when sw(3..0) = 0000 byte 0,1,2 are on 7seg (XXYYZZ) XX=#0, YY=#1, ZZ=#2
--    when sw(3..0) = 0010 byte 2,3,4 are on 7seg
--
--  Press your joystick buttons, observe 7 display and adapt usb_joystick_decoder
--  entity to match your need.
--
--  When adapted you can check it on red led 
--
--   led 0 : Move up 
--   led 1 : Move down
--   led 2 : Move left
--   led 3 : Move right
--   led 4 : Fire 
--   led 5 : Start 1 player
--   led 6 : Start 2 players
--   led 7 : Add coin
--   led 8 : Launch bomb 
--
---------------------------------------------------------------------------------
-- I think that usb keyboard decoder should work with any 'standard' keyboard.
-- So should be no need to adapt it except if choosen key doesn't please to you.
--
---------------------------------------------------------------------------------
--  To detect usb device, press reset (key 0 on DE10 board) then start (key 1)
--
-- Main features :
--  PS2 keyboard input @gpio pins 0/1 (beware voltage translation/protection) 
--  Audio pwm output   @gpio pins 2/3 (beware voltage translation/protection) 
--  USB host arduino shield for keyboard or joystick
--
-- Uses 1 pll for 18MHz and 11MHz generation from 50MHz
--
-- Board key :
--      0 : reset game and usb detect procedure
--      1 : start usb detect procedure (use reset before start)
--
-- Keyboard inputs :
--   F3 : Add coin
--   F2 : Start 2 players
--   F1 : Start 1 player
--   SPACE       : Fire  
--   RIGHT arrow : Move right 
--   LEFT  arrow : Move left
--   UP    arrow : Move up 
--   DOWN  arrow : Move down
--   CTRL        : Launch bomb        
--
-- Dip switch and other details : see xevious.vhd

---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.usb_report_pkg.all;

entity xevious_de10_lite is
port(
 max10_clk1_50  : in std_logic;
-- max10_clk2_50  : in std_logic;
-- adc_clk_10     : in std_logic;
 ledr           : out std_logic_vector(9 downto 0);
 key            : in std_logic_vector(1 downto 0);
 sw             : in std_logic_vector(9 downto 0);

-- dram_ba    : out std_logic_vector(1 downto 0);
-- dram_ldqm  : out std_logic;
-- dram_udqm  : out std_logic;
-- dram_ras_n : out std_logic;
-- dram_cas_n : out std_logic;
-- dram_cke   : out std_logic;
-- dram_clk   : out std_logic;
-- dram_we_n  : out std_logic;
-- dram_cs_n  : out std_logic;
-- dram_dq    : inout std_logic_vector(15 downto 0);
-- dram_addr  : out std_logic_vector(12 downto 0);

 hex0 : out std_logic_vector(7 downto 0);
 hex1 : out std_logic_vector(7 downto 0);
 hex2 : out std_logic_vector(7 downto 0);
 hex3 : out std_logic_vector(7 downto 0);
 hex4 : out std_logic_vector(7 downto 0);
 hex5 : out std_logic_vector(7 downto 0);

 vga_r     : out std_logic_vector(3 downto 0);
 vga_g     : out std_logic_vector(3 downto 0);
 vga_b     : out std_logic_vector(3 downto 0);
 vga_hs    : out std_logic;
 vga_vs    : out std_logic;
 
-- gsensor_cs_n : out   std_logic;
-- gsensor_int  : in    std_logic_vector(2 downto 0); 
-- gsensor_sdi  : inout std_logic;
-- gsensor_sdo  : inout std_logic;
-- gsensor_sclk : out   std_logic;

 arduino_io      : inout std_logic_vector(15 downto 0); 
-- arduino_reset_n : inout std_logic;
 
 gpio          : inout std_logic_vector(35 downto 0)
);
end xevious_de10_lite;

architecture struct of xevious_de10_lite is

 signal clock_18  : std_logic;
 signal clock_18n : std_logic;
 signal clock_11  : std_logic;
 signal reset     : std_logic;
 
 signal max3421e_clk : std_logic;
 
 signal r         : std_logic_vector(3 downto 0);
 signal g         : std_logic_vector(3 downto 0);
 signal b         : std_logic_vector(3 downto 0);
 signal csync     : std_logic;
 signal blankn    : std_logic;
 
 signal audio           : std_logic_vector(10 downto 0);
 signal pwm_accumulator : std_logic_vector(12 downto 0);

 alias reset_n         : std_logic is key(0);
 alias ps2_clk         : std_logic is gpio(35); --gpio(0);
 alias ps2_dat         : std_logic is gpio(34); --gpio(1);
 alias pwm_audio_out_l : std_logic is gpio(1);  --gpio(2);
 alias pwm_audio_out_r : std_logic is gpio(3);  --gpio(3);
 
 signal kbd_intr      : std_logic;
 signal kbd_scancode  : std_logic_vector(7 downto 0);
 signal joyBCPPFRLDU  : std_logic_vector(8 downto 0);

 signal start : std_logic := '0';
 signal usb_report : usb_report_t;
 signal new_usb_report : std_logic := '0';
 
 signal rom_addr : std_logic_vector(16 downto 0);
 signal rom_do   : std_logic_vector( 7 downto 0);

 signal cnt_1us     : integer range 0 to 49 := 49;
 signal clk_1us     : std_logic;
 signal sample_data  : std_logic_vector(31 downto 0);

begin

reset <= not reset_n;
clock_18n <= not clock_18;

start <= not key(1);
-- tv15Khz_mode <= sw();

-- arduino_io not used pins
arduino_io(7) <= '1'; -- to usb host shield max3421e RESET
arduino_io(8) <= 'Z'; -- from usb host shield max3421e GPX
arduino_io(9) <= 'Z'; -- from usb host shield max3421e INT
arduino_io(13) <= 'Z'; -- not used
arduino_io(14) <= 'Z'; -- not used

-- Clock 18MHz for xevious core, 11MHz for keyboard
clk_11_18 : entity work.max10_pll_18M_11M
port map(
 inclk0 => max10_clk1_50,
 c0 => clock_18,
 c1 => clock_11,
 locked => open --pll_locked
);


xevious : entity work.xevious
port map(
 clock_18     => clock_18,
 reset        => reset,
-- tv15Khz_mode => tv15Khz_mode,
 video_r      => r,
 video_g      => g,
 video_b      => b,
 video_csync  => csync,
 video_blankn => blankn,
-- video_hs     => hsync,
-- video_vs     => vsync,
 audio        => audio,
 
 rom_bus_addr_o => rom_addr,
 rom_bus_do     => rom_do,
 
 b_test       => '1',
 b_svce       => '1', 
 coin         => joyBCPPFRLDU(7),
 start2       => joyBCPPFRLDU(6),
 start1       => joyBCPPFRLDU(5),
 up           => joyBCPPFRLDU(0),
 down         => joyBCPPFRLDU(1),
 left         => joyBCPPFRLDU(2),
 right        => joyBCPPFRLDU(3),
 fire         => joyBCPPFRLDU(4),
 bomb         => joyBCPPFRLDU(8)
);

vga_r <= r when blankn = '1' else "0000";
vga_g <= g when blankn = '1' else "0000";
vga_b <= b when blankn = '1' else "0000";

-- synchro composite/ synchro horizontale
vga_hs <= csync;
-- vga_hs <= csync when tv15Khz_mode = '1' else hsync;
-- commutation rapide / synchro verticale
vga_vs <= '1';
-- vga_vs <= '1'   when tv15Khz_mode = '1' else vsync;

--sound_string <= "00" & audio & "000" & "00" & audio & "000";

-- get scancode from keyboard
keyboard : entity work.io_ps2_keyboard
port map (
  clk       => clock_11,
  kbd_clk   => ps2_clk,
  kbd_dat   => ps2_dat,
  interrupt => kbd_intr,
  scancode  => kbd_scancode
);

-- translate scancode to joystick
joystick : entity work.kbd_joystick
port map (
  clk         => clock_11,
  kbdint      => kbd_intr,
  kbdscancode => std_logic_vector(kbd_scancode), 
  joyBCPPFRLDU  => open --joyBCPPFRLDU
);

-- usb host for max3421e arduino shield (modified)

max3421e_clk <= clock_11;
usb_host : entity work.usb_host_max3421e
port map(
 clk     => max3421e_clk,
 reset   => reset,
 start   => start,
 
 usb_report => usb_report,
 new_usb_report => new_usb_report,
 
 spi_cs_n  => arduino_io(10), 
 spi_clk   => arduino_io(13),
 spi_mosi  => arduino_io(11),
 spi_miso  => arduino_io(12)
);

-- usb keyboard report decoder

keyboard_decoder : entity work.usb_keyboard_decoder
port map(
 clk     => max3421e_clk,
 
 usb_report => usb_report,
 new_usb_report => new_usb_report,
 
 joyBCPPFRLDU  => joyBCPPFRLDU
);

-- usb joystick decoder (konix drakkar wireless)

joystick_decoder : entity work.usb_joystick_decoder
port map(
 clk     => max3421e_clk,
 
 usb_report => usb_report,
 new_usb_report => new_usb_report,
 
 joyBCPPFRLDU  => open --joyBCPPFRLDU
);

-- debug display

ledr(8 downto 0) <= joyBCPPFRLDU;

h0 : entity work.decodeur_7_seg port map(usb_report(to_integer(unsigned(sw))+2)(3 downto 0),hex0);
h1 : entity work.decodeur_7_seg port map(usb_report(to_integer(unsigned(sw))+2)(7 downto 4),hex1);
h2 : entity work.decodeur_7_seg port map(usb_report(to_integer(unsigned(sw))+1)(3 downto 0),hex2);
h3 : entity work.decodeur_7_seg port map(usb_report(to_integer(unsigned(sw))+1)(7 downto 4),hex3);
h4 : entity work.decodeur_7_seg port map(usb_report(to_integer(unsigned(sw))+0)(3 downto 0),hex4);
h5 : entity work.decodeur_7_seg port map(usb_report(to_integer(unsigned(sw))+0)(7 downto 4),hex5);

-- program and graphics ROM
rom : entity work.xevious_cpu_gfx_8bits
port map(
 clk  => clock_18n,
 addr => rom_addr,
 data => rom_do
);

-- audio for sgtl5000 

sample_data <= "00" & audio & "000" & "00" & audio & "000";				

-- Clock 1us for ym_8910
p_clk_1us_p : process(max10_clk1_50)
begin
	if rising_edge(max10_clk1_50) then
		if cnt_1us = 0 then
			cnt_1us  <= 49;
			clk_1us  <= '1'; 
		else
			cnt_1us  <= cnt_1us - 1;
			clk_1us <= '0'; 
		end if;
	end if;	
end process;	 

-- sgtl5000 (teensy audio shield on top of usb host shield)

e_sgtl5000 : entity work.sgtl5000_dac
port map(
 clock_18   => clock_18,
 reset      => reset,
 i2c_clock  => clk_1us,  

 sample_data  => sample_data,
 
 i2c_sda   => arduino_io(0), -- i2c_sda, 
 i2c_scl   => arduino_io(1), -- i2c_scl, 

 tx_data   => arduino_io(2), -- sgtl5000 tx
 mclk      => arduino_io(4), -- sgtl5000 mclk 
 
 lrclk     => arduino_io(3), -- sgtl5000 lrclk
 bclk      => arduino_io(6), -- sgtl5000 bclk   
 
 -- debug
 hex0_di   => open, -- hex0_di,
 hex1_di   => open, -- hex1_di,
 hex2_di   => open, -- hex2_di,
 hex3_di   => open, -- hex3_di,
 
 sw => sw(7 downto 0)
);

-- pwm sound output

process(clock_18)
begin
  if rising_edge(clock_18) then
    pwm_accumulator  <=  std_logic_vector(unsigned('0' & pwm_accumulator(11 downto 0)) + unsigned('0' & audio));
  end if;
end process;

pwm_audio_out_l <= pwm_accumulator(12);
pwm_audio_out_r <= pwm_accumulator(12); 


end struct;
