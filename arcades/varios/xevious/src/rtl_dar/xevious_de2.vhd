---------------------------------------------------------------------------------
-- DE2-35 Top level for Xevious by Dar (darfpga@aol.fr) (December 2016)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
--
-- Main features :
--  PS2 keyboard input
--  Wm8731 sound output
--  68Ko external SRAM (136Ko for 16bits width)
--
-- Uses 1 pll for 18MHz and 11MHz generation from 50MHz
--
-- Board key :
--      0 : reset
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
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

entity xevious_de2 is
port(
 clock_50  : in std_logic;
-- clock_27  : in std_logic;
-- ext_clock : in std_logic;
-- ledr      : out std_logic_vector(17 downto 0);
-- ledg      : out std_logic_vector(8 downto 0);
 key       : in std_logic_vector(3 downto 0);
-- sw        : in std_logic_vector(17 downto 0);

-- dram_ba_0  : out std_logic;
-- dram_ba_1  : out std_logic;
-- dram_ldqm  : out std_logic;
-- dram_udqm  : out std_logic;
-- dram_ras_n : out std_logic;
-- dram_cas_n : out std_logic;
-- dram_cke   : out std_logic;
-- dram_clk   : out std_logic;
-- dram_we_n  : out std_logic;
-- dram_cs_n  : out std_logic;
-- dram_dq    : inout std_logic_vector(15 downto 0);
-- dram_addr  : out std_logic_vector(11 downto 0);
--
-- fl_addr  : out std_logic_vector(21 downto 0);
-- fl_ce_n  : out std_logic;
-- fl_oe_n  : out std_logic;
-- fl_dq    : inout std_logic_vector(7 downto 0);
-- fl_rst_n : out std_logic;
-- fl_we_n  : out std_logic;
--
-- hex0 : out std_logic_vector(6 downto 0);
-- hex1 : out std_logic_vector(6 downto 0);
-- hex2 : out std_logic_vector(6 downto 0);
-- hex3 : out std_logic_vector(6 downto 0);
-- hex4 : out std_logic_vector(6 downto 0);
-- hex5 : out std_logic_vector(6 downto 0);
-- hex6 : out std_logic_vector(6 downto 0);
-- hex7 : out std_logic_vector(6 downto 0);

 ps2_clk : in std_logic;
 ps2_dat : inout std_logic;

-- uart_txd : out std_logic;
-- uart_rxd : in std_logic;
--
-- lcd_rw   : out std_logic;
-- lcd_en   : out std_logic;
-- lcd_rs   : out std_logic;
-- lcd_data : out std_logic_vector(7 downto 0);
-- lcd_on   : out std_logic;
-- lcd_blon : out std_logic;
 
 sram_addr : out std_logic_vector(17 downto 0);
 sram_dq   : inout std_logic_vector(15 downto 0);
 sram_we_n : out std_logic;
 sram_oe_n : out std_logic;
 sram_ub_n : out std_logic;
 sram_lb_n : out std_logic;
 sram_ce_n : out std_logic;
 
-- otg_addr   : out std_logic_vector(1 downto 0);
-- otg_cs_n   : out std_logic;
-- otg_rd_n   : out std_logic;
-- otg_wr_n   : out std_logic;
-- otg_rst_n  : out std_logic;
-- otg_data   : inout std_logic_vector(15 downto 0);
-- otg_int0   : in std_logic;
-- otg_int1   : in std_logic;
-- otg_dack0_n: out std_logic;
-- otg_dack1_n: out std_logic;
-- otg_dreq0  : in std_logic;
-- otg_dreq1  : in std_logic;
-- otg_fspeed : inout std_logic;
-- otg_lspeed : inout std_logic;
-- 
-- tdi : in std_logic;
-- tcs : in std_logic;
-- tck : in std_logic;
-- tdo : out std_logic;
 
 vga_r     : out std_logic_vector(9 downto 0);
 vga_g     : out std_logic_vector(9 downto 0);
 vga_b     : out std_logic_vector(9 downto 0);
 vga_clk   : out std_logic;
 vga_blank : out std_logic;
 vga_hs    : out std_logic;
 vga_vs    : out std_logic;
-- vga_sync  : out std_logic;
--
 i2c_sclk : out std_logic;
 i2c_sdat : inout std_logic;
 
-- td_clk27 : in std_logic;
-- td_reset : out std_logic;
-- td_data  : in std_logic_vector(7 downto 0);
-- td_hs    : in std_logic;
-- td_vs    : in std_logic;

 aud_adclrck : out std_logic;
 aud_adcdat  : in std_logic;
 aud_daclrck : out std_logic;
 aud_dacdat  : out std_logic;
 aud_xck     : out std_logic;
 aud_bclk    : out std_logic
 
-- enet_data  : inout std_logic_vector(15 downto 0);
-- enet_clk   : out std_logic;
-- enet_cmd   : out std_logic;
-- enet_cs_n  : out std_logic;
-- enet_int   : in std_logic;
-- enet_rd_n  : out std_logic;
-- enet_wr_n  : out std_logic;
-- enet_rst_n : out std_logic;
-- 
-- irda_txd : out std_logic;
-- irda_rxd : in std_logic;
-- 
-- sd_dat  : inout std_logic;
-- sd_dat3 : out std_logic;
-- sd_cmd  : out std_logic;
-- sd_clk  : out std_logic;
-- 
-- gpio_0  : inout std_logic_vector(35 downto 0)
-- gpio_1  : inout std_logic_vector(35 downto 0)
);
end xevious_de2;

architecture struct of xevious_de2 is

 signal clock_18  : std_logic;
 signal clock_11  : std_logic;

 signal r         : std_logic_vector(3 downto 0);
 signal g         : std_logic_vector(3 downto 0);
 signal b         : std_logic_vector(3 downto 0);
 signal video_clk : std_logic;
 signal csync     : std_logic;
 signal blankn    : std_logic;
 
 signal audio        : std_logic_vector(10 downto 0);
 signal sound_string : std_logic_vector(31 downto 0);
 signal reset        : std_logic;
 
 alias  reset_n      : std_logic is key(0);
 
 signal kbd_intr      : std_logic;
 signal kbd_scancode  : std_logic_vector(7 downto 0);
 signal joyBCPPFRLDU   : std_logic_vector(8 downto 0);

begin

reset <= not reset_n;
-- tv15Khz_mode <= sw();

-- Clock 18MHz for xevious core and wm8731, 11MHz for keyboard
clk_11_18 : entity work.pll50_to_11_and_18
port map(
 inclk0 => clock_50,
 c0 => clock_11,
 c1 => clock_18,
 locked => open --pll_locked
);

-- SRAM is always enabled
-- SRAM has to be loaded with external mean before loading the FPGA configuration
-- SRAM should not be power off between its data load and FPGA load.
-- Modification may be done to load SRAM from external flash or from EPCS device
sram_ce_n <= '0';
sram_lb_n <= '0';
sram_oe_n <= '0';
sram_ub_n <= '0';
sram_we_n <= '1';

-- see README to use FPGA RAM instead of external SRAM
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
 
 rom_bus_addr_o => sram_addr(16 downto 0),
 rom_bus_do     => sram_dq(7 downto 0),
 
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

vga_clk   <= clock_18;
--vga_sync  <= '0';
vga_blank <= blankn;

vga_r <= r & "000000";
vga_g <= g & "000000";
vga_b <= b & "000000";

-- synchro composite/ synchro horizontale
vga_hs <= csync;
-- vga_hs <= csync when tv15Khz_mode = '1' else hsync;
-- commutation rapide / synchro verticale
vga_vs <= '1';
-- vga_vs <= '1'   when tv15Khz_mode = '1' else vsync;

sound_string <= "00" & audio & "000" & "00" & audio & "000";

wm8731_dac : entity work.wm8731_dac
port map(
 clk18MHz => clock_18,
 sampledata => sound_string,
 i2c_sclk => i2c_sclk,
 i2c_sdat => i2c_sdat,
 aud_bclk => aud_bclk,
 aud_daclrck => aud_daclrck,
 aud_dacdat => aud_dacdat,
 aud_xck => aud_xck
); 

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
  joyBCPPFRLDU  => joyBCPPFRLDU
);

--d7s0 : entity work.dec_7_seg port map(addr_cpu_out( 3 downto  0),hex0);
--d7s1 : entity work.dec_7_seg port map(addr_cpu_out( 7 downto  4),hex1);
--d7s2 : entity work.dec_7_seg port map(addr_cpu_out(11 downto  8),hex2);
--d7s3 : entity work.dec_7_seg port map(addr_cpu_out(15 downto 12),hex3);

end struct;
