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

 ps2_clk : in std_logic;
 ps2_dat : in std_logic;

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
	signal clk16 : std_logic;
	signal clk01 : std_logic;
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
	
	signal reset_counter    : integer;--std_logic_vector(7 downto 0);
	signal reset_n          : std_logic := '0';	
	signal reset : std_logic := '0';
	signal reset_key : std_logic;
	signal hardreset_key   : std_logic;
		
	signal irq_n : std_logic;
	signal nmi_n : std_logic;
	signal nmi_ack   : std_logic;

    -- joystick interface
    signal joyA        : unsigned(6 downto 0) := "0000000";
    signal joyB        : unsigned(6 downto 0) := "0000000";
    signal joy_renew   : std_logic := '1';
    signal joy_count   : unsigned(7 downto 0) := X"00";

    signal rgbKey              : std_logic;
    signal rom_c1541           : boolean;
    signal rom_reset           : std_logic;
	signal tv15Khz_mode        : std_logic;
    signal tv15Khz_init_mode   : std_logic;
    signal tv15Khz_invert      : std_logic;
	signal ntsc_init_mode      : std_logic;
	
begin

tv15Khz_init_mode <= '0';
ntsc_init_mode <= '0';
tv15Khz_mode <= tv15Khz_init_mode xor tv15Khz_invert;

process(clk32)
begin
	if rising_edge(clk32) then
		if rgbKey = '1' then
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

clk16 <= clk32_div(0);
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
			if BTN='0' or pll_locked = '0' then
				reset_counter <= 100000;
				reset_n <= '0';
			elsif reset_key = '1' or rom_reset = '1' then
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

--process(clk32, BTN)
--begin
--	if rising_edge(clk32) then
--		reset_n <= '0';
--		if BTN='0' and reset_key = '0' then
--			reset_counter <= (others => '0');
--		else
--			if reset_counter > X"F0" and reset_counter < X"FF" then
--			end if;
--			
--			if reset_counter > X"E0" then
--				reset_n <= '1';
--			end if;
--				
--			if reset_counter < X"FF" then
--				reset_counter <= reset_counter + '1';
--			end if;
--		end if;
--	end if;
--end process;

reset <= not reset_n;
	
fpga64 : entity work.fpga64_sid_iec
port map(
	clk32 => clk32,
	reset_n => reset_n,
	kbd_clk => ps2_clk,
	kbd_dat => ps2_dat,
		
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
	c64rom_addr => "00000000000000", --ioctl_addr(13 downto 0),
    c64rom_data => "00000000",       --ioctl_data,
    c64rom_wr => '0',                --c64rom_wr,
    cart_detach_key => open,         --cart_detach_key,                                    -- cartridge detach key CTRL-D - LCA
    reset_key => reset_key,
    hardreset_key => hardreset_key,
    rgbKey => rgbKey,
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
	
-- 1541 sd emulator
c1541_sd : entity work.c1541_sd
port map
(
	clk32 => clk32,
  clk32n => clk32n,
	clk_spi_ctrlr => clk16,
	reset => not reset_n,
	
	disk_num => ("00" & disk_num),
	iec_atn_i  => c1541_iec_atn_i,
	iec_data_i => c1541_iec_data_i,
	iec_clk_i  => c1541_iec_clk_i,
	
	iec_atn_o  => c1541_iec_atn_o,
	iec_data_o => c1541_iec_data_o,
	iec_clk_o  => c1541_iec_clk_o,
	
	sd_miso  => sd_spi_miso, 
	sd_cs_n  => sd_spi_cs_n, 
	sd_mosi  => sd_spi_mosi,
	sd_sclk  => sd_spi_sclk,
	
	rom_c1541 => rom_c1541,
	bus_available => '1'
);

--bram: entity work.gen_ram
--    generic map (
--        dWidth => 8,
--        aWidth => 16
--    )
--    port map (
--        clk => clk32,
--        we => not ram_we,
--        addr => c64_addr(15 downto 0),
--        d => c64_data_out,
--        q => c64_data_in
--    );

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

vga_r <= std_logic_vector(r(7 downto 4));-- when blank = '0' else (others => '0');
vga_g <= std_logic_vector(g(7 downto 4));-- when blank = '0' else (others => '0');
vga_b <= std_logic_vector(b(7 downto 4));-- when blank = '0' else (others => '0');

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

dac : entity work.sigma_delta_dac  --Dac de la MIST
generic map(
  MSBI => 14
)
port  map(
  CLK     => clk32,  
  RESET   => reset,
  DACin   => not audio_data(17) & audio_data(16 downto 3),-- audio_data(17 downto 7),
  DACout  => audio_pwm
);

pwm_audio_out_l <= audio_pwm;
pwm_audio_out_r <= audio_pwm;

end struct;
