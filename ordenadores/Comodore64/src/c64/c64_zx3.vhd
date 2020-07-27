---------------------------------------------------------------------------------
-- DE10 lite Top level for FPGA64_027 by Dar (darfpga@aol.fr) 25-May-2017
-- http://darfpga.blogspot.fr
--
-- FPGA64 is Copyrighted 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
--
-- Main features
--  15KHz(TV) / 31Khz(VGA) : board sw(0)
--  PAL(50Hz) / NTSC(60Hz) : board sw(1) and F12 key
--  PS2 keyboard input with portA / portB joystick emulation : F11 key
--  pwm sound output : board arduino(15 to 14) 
--  video output : 2 Syncs + 3x4 Colors 
--  64Ko SRAM : board gpio_0(0 to 29)
--  External IEC bus available at gpio_1 (for real drive 1541 or IEC/SD ...)
--   activated by switch(5) (activated with no hardware will stuck IEC bus)
--
--  Internal emulated 1541 on raw SD card : D64 images start at 256KB boundaries
--  Use hexidecimal disk editor such as HxD (www.mh-nexus.de) to build SD card.
--  Cut D64 file and paste at 0x00000 (first), 0x40000 (second), 0x80000 (third),
--  0xC0000(fourth), 0x100000(fith), 0x140000 (sixth) and so on.
--  BE CAREFUL NOT WRITING ON YOUR OWN HARDDRIVE
--
-- Uses only one pll for 33MHz and 18MHz generation from 50MHz
-- DE0 nano, DE1 and DE2-35 Top level also available (previous revision)
--
-- Rev 1.0 : 25 May 2017 - early release
--   added USB keyboard support with French layout
--   added write capability to c1541_sd
--  
-- TODO (2018 winter !) : 
--   Keyboard special key to be tested
--   SID to be replaced with better design (from 1541-II)
--   External RAM to be suppressed (many room available wihtin DE10 lite FPGA)
--   NTSC video to be fixed, PAL and, NTSC 31KHz mode to be fixed 
--
---------------------------------------------------------------------------------
-- Teclas
-- F11 Keyboard Joy Port Swich
-- Scroll Lock: RGB/VGA
-- F12: NTSC/PAL
-- Av Pagina Avanza 1 Disco (Con Shift 10, Con Control 100) (Max 255 de momento)
-- Re Pagina Retrocede 1 Disco (Con Shift 10, Con Control 100) (Max 255 de momento)
-- Control+Alt+Supr: Reset
-- Control+Alt+BackSpace: HardReset
-- Escape: (Break)
-- Control+Escape: (Run+Break) 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity c64_zx3 is
port(
 clock_50  : in std_logic;

 BTN     : in std_logic;
 LED     : out std_logic;
 
 ps2_clk : inout std_logic;
 ps2_dat : inout std_logic;

 --SRAM
 sram_addr : out   std_logic_vector(18 downto 0);
 sram_data : inout std_logic_vector(7 downto 0);
 sram_we_n : out   std_logic;

 -- SDRAM
 SDRAM_A    : out   std_logic_vector(12 downto 0);
 SDRAM_DQ   : inout std_logic_vector(15 downto 0);
 SDRAM_DQML : out   std_logic;
 SDRAM_DQMH : out   std_logic;
 SDRAM_nWE  : out   std_logic;
 SDRAM_nCAS : out   std_logic;
 SDRAM_nRAS : out   std_logic;
 SDRAM_nCS  : out   std_logic;
 SDRAM_BA   : out   std_logic_vector(1 downto 0);
 SDRAM_CLK  : out   std_logic;
 SDRAM_CKE  : out   std_logic;

 vga_r     : out std_logic_vector(3 downto 0);
 vga_g     : out std_logic_vector(3 downto 0);
 vga_b     : out std_logic_vector(3 downto 0);
 vga_hs    : out std_logic;
 vga_vs    : out std_logic;
 
 pwm_audio_out_l : out std_logic;
 pwm_audio_out_r : out std_logic;

 JOY_CLK  : out std_logic;
 JOY_LOAD : out std_logic;
 JOY_DATA : in std_logic;

 sd_spi_miso  : inout std_logic; -- sd_dat --Data to card (master out slave in)
 sd_spi_cs_n  : out std_logic;   -- sd_dat3 --MMC chip select
 sd_spi_mosi  : out std_logic;   -- sd_cmd --Data from card (master in slave out)
 sd_spi_sclk  : out std_logic    -- sd_clk --Card clock
);
end c64_zx3;

architecture struct of c64_zx3 is

	signal c64_addr: std_logic_vector(15 downto 0);
	signal c64_data_in: std_logic_vector(7 downto 0);
	signal c64_data_out: std_logic_vector(7 downto 0);
	signal sdram_addr: std_logic_vector(24 downto 0);
	signal sdram_data_out: std_logic_vector(7 downto 0);
	signal sdram_we : std_logic;
	signal sdram_ce : std_logic;
	signal idle: std_logic;
	signal SDR_CLK : std_logic;
	
	signal  c64_addr_int      : unsigned(15 downto 0); -- is unsigned(c64_addr);
	signal  c64_data_in_int   : unsigned(7 downto 0);  -- is unsigned(c64_data_in);
	signal  c64_data_out_int  : unsigned(7 downto 0);  --is unsigned(c64_data_out);
		
	--Entradas/Salidas Externas para el SD2IEC
	signal ext_iec_atn_i  : std_logic := '0';
	signal ext_iec_clk_o  : std_logic := '0';
	signal ext_iec_data_o : std_logic := '0';
	signal ext_iec_atn_o  : std_logic := '0';
	signal ext_iec_data_i : std_logic := '0';
	signal ext_iec_clk_i  : std_logic := '0';
	
	signal c64_iec_atn_i  : std_logic;
	signal c64_iec_clk_o  : std_logic;
	signal c64_iec_data_o : std_logic;
	signal c64_iec_atn_o  : std_logic;
	signal c64_iec_data_i : std_logic;
	signal c64_iec_clk_i  : std_logic;

	signal c1541_iec_atn_i  : std_logic;
	signal c1541_iec_clk_o  : std_logic;
	signal c1541_iec_data_o : std_logic;
	signal c1541_iec_atn_o  : std_logic;
	signal c1541_iec_data_i : std_logic;
	signal c1541_iec_clk_i  : std_logic;
	
	signal clk32_div : std_logic_vector(4 downto 0) := "00000";
	signal clk_ram   : std_logic;
    signal pll_locked: std_logic;

	signal clk32 : std_logic;
   signal clk32n: std_logic;
	--signal clk16 : std_logic;
	signal clk01 : std_logic;
	signal clk_ctrl : std_logic;
	signal ram_ce : std_logic;
	signal ram_we : std_logic;
	signal r : unsigned(7 downto 0);
	signal g : unsigned(7 downto 0);
	signal b : unsigned(7 downto 0);
	signal hsync : std_logic;
	signal vsync : std_logic;
	signal csync : std_logic;
	signal blank : std_logic;

	signal audio_data : std_logic_vector(17 downto 0);
	signal pwm_accumulator : std_logic_vector(8 downto 0);
	signal audio_pwm			: std_logic;

	signal disk_num         : std_logic_vector(7 downto 0);
	
	signal reset_counter    : integer := 1000000;--std_logic_vector(7 downto 0);--integer;--
	signal reset_n          : std_logic := '0' ;	
	signal reset_key        : std_logic;
	signal hardreset_key    : std_logic;
	signal irq_n : std_logic;
	signal nmi_n : std_logic;
	signal nmi_ack   : std_logic;

    -- joystick interface
    signal joyA        : unsigned(6 downto 0) := "0000000";
    signal joyB        : unsigned(6 downto 0) := "0000000";
    signal joy_renew   : std_logic := '1';
    signal joy_count   : unsigned(7 downto 0) := X"00";
	 signal ps2_key     : std_logic_vector(7 downto 0);
	 signal ps2_ok              : std_logic;
    signal rgbKey              : std_logic;
    signal rom_c1541           : boolean;
    signal rom_reset           : std_logic;
	 signal tv15Khz_mode        : std_logic;
    signal tv15Khz_init_mode   : std_logic;
    signal tv15Khz_invert      : std_logic;
	 signal ntsc_init_mode      : std_logic;
	 signal sid_ver             : std_logic;
	 signal col_cpc             : std_logic;
   -- Control module
   signal ps2k_clk_in, ps2k_clk_out, ps2k_dat_in, ps2k_dat_out : std_logic;
   signal osd_window, osd_pixel, scanlines : std_logic;

   --Host control signals, from the Control module
   signal host_reset_n, host_divert_sdcard, host_divert_keyboard : std_logic;
   signal host_loadrom, host_video, host_video_r : std_logic;
   signal host_bootdata : std_logic_vector(31 downto 0);
   signal host_bootdata_req : std_logic;
   signal host_bootdata_ack : std_logic;
   signal dipswitches : std_logic_vector(15 downto 0);
	signal cart_size : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal sram_we : std_logic := '0';
	signal red_i : std_logic_vector(3 downto 0);
	signal green_i : std_logic_vector(3 downto 0);
	signal blue_i : std_logic_vector(3 downto 0);
	signal red_o : std_logic_vector(3 downto 0);
	signal green_o : std_logic_vector(3 downto 0);
	signal blue_o : std_logic_vector(3 downto 0);

	signal dsk_addr : std_logic_vector(18 downto 0);
	signal dsk_data_in  : std_logic_vector(7 downto 0);
	signal dsk_data_out : std_logic_vector(7 downto 0);
	signal dsk_wr   : std_logic := '0';

 type boot_states is (inactivo, ramwait);
 signal boot_state : boot_states := inactivo;
 signal cart_data_wr_8bit   : std_logic_vector(7 downto 0);
 signal cart_addr_wr_8bit : std_logic_vector(18 downto 0) := "0000000000000000000"; 
 signal cart_step : integer := 0;
 signal cart_wr  : std_logic := '0';

begin

tv15Khz_init_mode <= '1';
scanlines <= dipswitches(0);
sid_ver <= dipswitches(1);
col_cpc <= dipswitches(2);
ntsc_init_mode <=  dipswitches(3);

tv15Khz_mode <= tv15Khz_init_mode xor tv15Khz_invert;

--led(1)<= tv15Khz_mode;

process(clk32)
begin
	if rising_edge(clk32) then
		host_video_r <= host_video;
		--if rgbKey = '1' then
		if host_video_r = '1' and host_video = '0' then
			tv15Khz_invert <= not tv15Khz_invert;
		end if;
	end if;
end process;
	
irq_n <= '1';
nmi_n <= '1';


pll : entity work.relojes
port map(
		clock_50 => clock_50,
		clk32    => clk32,
		clk32n   => clk32n,
		clk64    => clk_ram,
		clk64ps  => SDR_CLK,
		clk_ctrl => clk_ctrl,
		locked   => pll_locked
);

process(clk32)
begin
	if rising_edge(clk32) then
		if clk32_div = "11111" then
			clk32_div <= "00000";
		else
			clk32_div  <= clk32_div + '1';			
		end if;
	end if;
end process;

--clk16 <= clk32_div(0);
clk01 <= clk32_div(4);

JOY_CLK  <= clk01;
JOY_LOAD <= joy_renew;

process(clk01)
begin
    if rising_edge(clk01) then
        if (joy_count = X"00") then joy_renew <= '0';   else joy_renew <= '1'; end if;
        if (joy_count = X"19") then joy_count <= X"00"; else joy_count <= joy_count + 1; end if;
	end if;
end process;

process(clk01)
begin
    if rising_edge(clk01) then
        case joy_count is
       	--when X"04" => joyA(5) <= not JOY_DATA;
       	when X"05" => joyA(4) <= not JOY_DATA;
       	when X"06" => joyA(3) <= not JOY_DATA;
       	when X"07" => joyA(2) <= not JOY_DATA;
       	when X"08" => joyA(1) <= not JOY_DATA;
       	when X"09" => joyA(0) <= not JOY_DATA;
        --when X"0c" => joyB(5) <= not JOY_DATA;
        when X"0d" => joyB(4) <= not JOY_DATA;
        when X"0e" => joyB(3) <= not JOY_DATA;
        when X"0f" => joyB(2) <= not JOY_DATA;
        when X"10" => joyB(1) <= not JOY_DATA;
        when X"11" => joyB(0) <= not JOY_DATA;
       	when others => null;
       	end case;
 	end if;
end process;

-- PS/2 interface
ps2_in : entity work.ps2_intf
port map(
	CLK	 =>	clk32,	--:	in	std_logic;
	nRESET =>	reset_n,	--:	in	std_logic;
	
	-- PS/2 interface (could be bi-dir)
	PS2_CLK	=> ps2_clk and not host_divert_keyboard,--:	in	std_logic;
	PS2_DATA	=>	ps2_dat,--:	in	std_logic;
	
	-- Byte-wide data interface - only valid for one clock
	-- so must be latched externally if required
	DATA	=>	ps2_key,--:	out	std_logic_vector(7 downto 0);
	VALID	=>	ps2_ok --:	out	std_logic
);


ddr_clk : ODDR2
port map(
 Q  => SDRAM_CLK,    -- 1-bit DDR output data
 C0 => SDR_CLK,      -- 1-bit clock input
 C1 => not SDR_CLK,  -- 1-bit clock input
 CE => '1',          -- 1-bit clock enable input
 D0 => '1',          -- 1-bit data input (associated with C0)
 D1 => '0',          -- 1-bit data input (associated with C1)
  R => '0',          -- 1-bit reset input
  S => '0'           -- 1-bit set input
);

	process(clk32)
	begin
		if rising_edge(clk32) then
			-- Reset by:
			-- Button at device, IO controller reboot, OSD or FPGA startup
			if pll_locked = '0' then 
				reset_counter <= 10000000;
				reset_n <= '0';
			elsif reset_key = '1' or rom_reset = '1' or BTN = '0' or host_reset_n = '0' then
				reset_counter <= 255;
				reset_n <= '0';
			else
				if reset_counter = 0 then
					reset_n <= '1';
				else
					reset_counter <= reset_counter - 1;
					--if reset_counter = 100 then
					--	force_erase <='1';
					--end if;
				end if;
			end if;
		end if;
	end process;


fpga64 : entity work.fpga64_sid_iec
port map(
	clk32 => clk32,
	reset_n => reset_n,
	--kbd_clk => ps2_clk,
	--kbd_dat => ps2_dat,
	ps2_key => ps2_key,
	ps2_ok  => ps2_ok,
	
	ramAddr => c64_addr_int,
	ramDataOut =>  c64_data_out_int,
	ramDataIn => c64_data_in_int,

	ramCE => ram_ce,
	ramWe => ram_we,
	tv15Khz_mode => tv15Khz_mode,
	ntscInitMode => ntsc_init_mode,
	hsync => hsync,
	vsync => vsync,
	r => r,
	g => g,
	b => b,
	game => '1',        --game,
	exrom => '1',       --exrom,
	UMAXromH => open,   --UMAXromH,
    CPU_hasbus => open, --CPU_hasbus,	
	irq_n => irq_n,
	nmi_n => nmi_n,
	nmi_ack => nmi_ack,	
	dma_n => '1',
	romL => open, --romL,		  -- cart signals LCA
    romH => open, --romH,          -- cart signals LCA
    IOE => open, --IOE,              -- cart signals LCA                                        	
	ba => open,
	joyA => joyA, -- (others => '0'),   -- unsigned(joyA_c64),
	joyB => joyB, --(others => '0'),   -- unsigned(joyB_c64),
	serioclk => open,
	ces => open,
	SIDclk => open,
	still => open,
	idle => idle,	
	audio_data => audio_data,
	extfilter_en => '1', --not status(6), --entrada de filtro externo. No es seguro si es 1 o 0	
	iec_data_o => c64_iec_data_o,
	iec_atn_o => c64_iec_atn_o,
	iec_clk_o => c64_iec_clk_o,
	iec_data_i => not c64_iec_data_i,
	iec_clk_i => not c64_iec_clk_i,
	iec_atn_i => not c64_iec_atn_i,
	disk_num => disk_num,
	sid_ver => sid_ver,
	c64rom_addr => "00000000000000", --ioctl_addr(13 downto 0),
    c64rom_data => "00000000",       --ioctl_data,
    c64rom_wr => '0',                --c64rom_wr,
    cart_detach_key => open,         --cart_detach_key,                                    -- cartridge detach key CTRL-D - LCA
    reset_key => reset_key,
    hardreset_key => hardreset_key,
    rgbKey => rgbKey,
	 col_cpc => col_cpc,
    rom_c1541 => rom_c1541,
    rom_reset => rom_reset
);

-- iec wiring
c64_iec_atn_i  <= not ((not c64_iec_atn_o)  and (not c1541_iec_atn_o) ) or (ext_iec_atn_i  );
c64_iec_data_i <= not ((not c64_iec_data_o) and (not c1541_iec_data_o)) or (ext_iec_data_i );
c64_iec_clk_i  <= not ((not c64_iec_clk_o)  and (not c1541_iec_clk_o) ) or (ext_iec_clk_i  );
	
c1541_iec_atn_i  <= c64_iec_atn_i;
c1541_iec_data_i <= c64_iec_data_i;
c1541_iec_clk_i  <= c64_iec_clk_i;

ext_iec_atn_o  <= c64_iec_atn_o   or c1541_iec_atn_o;
ext_iec_data_o <= c64_iec_data_o  or c1541_iec_data_o;
ext_iec_clk_o  <= c64_iec_clk_o   or c1541_iec_clk_o;

-- sram para el fd
sram_we_n <= not sram_we;
	
-- 1541 sd emulator
c1541_sd : entity work.c1541_sd
port map
(
	clk32 => clk32,
  clk32n => clk32n,
	--clk_spi_ctrlr => clk16,
	reset => not reset_n,
	
	disk_num => ("00" & disk_num),
	iec_atn_i  => c1541_iec_atn_i,
	iec_data_i => c1541_iec_data_i,
	iec_clk_i  => c1541_iec_clk_i,
	
	iec_atn_o  => c1541_iec_atn_o,
	iec_data_o => c1541_iec_data_o,
	iec_clk_o  => c1541_iec_clk_o,
	
--	sd_miso  => 'Z',--sd_spi_miso, 
--	sd_cs_n  => open,--sd_spi_cs_n, 
--	sd_mosi  => open,--sd_spi_mosi,
--	sd_sclk  => open,--sd_spi_sclk,
	
	dsk_addr => dsk_addr,
	dsk_data_in => dsk_data_in,
	dsk_data_out => dsk_data_out,
	dsk_wr   => dsk_wr,
	
	rom_c1541 => rom_c1541,
	bus_available => '1',
	
	host_loadrom => host_loadrom
);

sdram : entity work.sdram 
port map
(
		sd_addr => SDRAM_A,
		sd_ba => SDRAM_BA,
		sd_cs => SDRAM_nCS,
		sd_we => SDRAM_nWE,
		sd_ras => SDRAM_nRAS,
		sd_cas => SDRAM_nCAS,

		clk => clk_ram,
		addr => sdram_addr,
		init => not pll_locked,
		we => sdram_we,
		refresh => idle,       -- refresh ram in idle state
		ce => sdram_ce
);

	SDRAM_DQ(15 downto 8) <= (others => 'Z') when sdram_we='0' else (others => '0');
	SDRAM_DQ(7 downto 0) <= (others => 'Z') when sdram_we='0' else sdram_data_out;

	-- read from sdram
	c64_data_in <= SDRAM_DQ(7 downto 0);
	-- clock is always enabled and memory is never masked as we only
	-- use one byte
	SDRAM_CKE <= '1';
	SDRAM_DQML <= '0';
	SDRAM_DQMH <= '0';

--	sdram_addr <= c64_addr_temp when iec_cycle='0' else ioctl_ram_addr; -- old line lca
	sdram_addr <= "000000000" & c64_addr;
	sdram_data_out <= c64_data_out;
	
	-- ram_we and ce are active low
	sdram_ce <= not ram_ce;
	sdram_we <= not ram_we;

	c64_addr <= std_logic_vector(c64_addr_int);
	c64_data_out <= std_logic_vector(c64_data_out_int);
	c64_data_in_int <= unsigned(c64_data_in);

red_i   <= std_logic_vector(r(7 downto 4));-- when blank = '0' else (others => '0');
green_i <= std_logic_vector(g(7 downto 4));-- when blank = '0' else (others => '0');
blue_i  <= std_logic_vector(b(7 downto 4));-- when blank = '0' else (others => '0');

vga_r <= red_o;
vga_g <= green_o;
vga_b <= blue_o;

comp_sync : entity work.composite_sync
port map(
	clk32 => clk32,
	hsync => hsync,
	vsync => vsync,
	csync => csync,
	blank => blank
);

-- synchro composite/ synchro horizontale
vga_hs <= csync when tv15Khz_mode = '1' else hsync;
-- commutation rapide / synchro verticale
vga_vs <= '1'   when tv15Khz_mode = '1' else vsync;

   dac : entity work.sigma_delta_dac
    port map (
      clk => clk32,
      ldatasum => audio_data(17 downto 3),
		rdatasum => audio_data(17 downto 3),
		aleft => pwm_audio_out_l,
		aright => pwm_audio_out_r
 	);

ps2k_dat_in <= ps2_dat;
ps2_dat  <= '0' when ps2k_dat_out = '0' else 'Z';
ps2k_clk_in <= ps2_clk;
ps2_clk  <= '0' when ps2k_clk_out = '0' else 'Z';

ps2k_clk_out <= '1';
ps2k_dat_out <= '1';

MyCtrlModule : entity work.CtrlModule
port map
(
		clk => clk_ctrl,--clk_ctrl,
		reset_n => '1',
		-- Video signals for OSD
		vga_hsync => hsync,
		vga_vsync => vsync,
		osd_window => osd_window,
		osd_pixel => osd_pixel,
		-- PS2 keyboard
		ps2k_clk_in => ps2k_clk_in,
		ps2k_dat_in => ps2k_dat_in,
		-- SD card signals
		spi_clk => sd_spi_sclk,
		spi_mosi => sd_spi_mosi,
		spi_miso => sd_spi_miso,
		spi_cs => sd_spi_cs_n,
		-- DIP switches
		dipswitches => dipswitches,
		--ROM size
		size => cart_size,
		-- Control signals
		host_divert_keyboard => host_divert_keyboard,
		host_divert_sdcard => host_divert_sdcard,
		host_reset_n => host_reset_n,
		host_video   => host_video,
		host_loadrom => host_loadrom,
		-- Boot data upload signals
		host_bootdata => host_bootdata,
		host_bootdata_req => host_bootdata_req,
		host_bootdata_ack => host_bootdata_ack
	);

overlay : entity work.OSD_Overlay
port map
(
		clk => clk_ctrl,--clk_ctrl,
		red_in => red_i,
		green_in => green_i,
		blue_in => blue_i,
		window_in => '1',
		osd_window_in => osd_window,
		osd_pixel_in => osd_pixel,
		hsync_in => hsync,
		red_out => red_o,
		green_out => green_o,
		blue_out => blue_o,
		window_out => open,
		scanline_ena => scanlines
	);

dsk_data_in <= sram_data         when host_loadrom = '0' else "00000000"; 
sram_addr   <= cart_addr_wr_8bit when host_loadrom = '1' else dsk_addr;
sram_data   <= cart_data_wr_8bit when host_loadrom = '1' else dsk_data_out when dsk_wr = '1' else (others => 'Z'); --when dsk_wr = '1' dsk_data else (others => 'Z'); --para la grabacion en disco en sram
sram_we     <= cart_wr           when host_loadrom = '1' else dsk_wr; -- dsk_wr; --(Para la grabacion del disco en sram

LED <= host_loadrom;

-- State machine to receive and stash boot data in SRAM
process(clk32, host_bootdata_req)
begin
	if rising_edge(clk32) then
		if host_loadrom='0' then --Mientras no haya señal de carga se resetean las variables a 0;
			cart_addr_wr_8bit<= "0000000000000000000"; -- "0000000000";
			cart_wr<='0';
			host_bootdata_ack<='0';
			boot_state<=inactivo;
			cart_step <= 0;
		else
			host_bootdata_ack<='0';
			case boot_state is
				when inactivo =>
					if host_bootdata_req='1' then
						if    cart_step = 0 then cart_data_wr_8bit<=host_bootdata(31 downto 24); cart_step <= cart_step + 1; 
						elsif cart_step = 1 then cart_data_wr_8bit<=host_bootdata(23 downto 16); cart_step <= cart_step + 1; 
						elsif cart_step = 2 then cart_data_wr_8bit<=host_bootdata(15 downto  8); cart_step <= cart_step + 1; 
						elsif cart_step = 3 then cart_data_wr_8bit<=host_bootdata(7  downto  0); cart_step <= 0; host_bootdata_ack<='1'; end if;
						cart_wr<='1';
						boot_state<=ramwait;
					end if;
				when ramwait =>
						cart_addr_wr_8bit<=std_logic_vector((unsigned(cart_addr_wr_8bit)+1));
						cart_wr<='0';
						boot_state<=inactivo;
			end case;
		end if;
	end if;
end process;

end struct;
