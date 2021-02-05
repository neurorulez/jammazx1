--	(c) 2012 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

--------------------------------------------------------------------------------
--	This is a VHDL implementation of the arcade game "Bomb Jack" (c) 1984 Tehkan
--	Translated from schematic to VHDL Q1 2012, d18c7db
--
-- v0.1	Initial release
--
-- added testbed folder and moved all testbed related files into it
-- changed UCF to use Megawing
-- split audio file into p9/p10
-- fixed: sprites not showing, clock to sprite RAMS 4A,B,C,D had to be inverted
-- fixed: audio issue with PSG1 chan C, missing chip selects to RAM/ROM
-- fixed: Sometimes enemy robots get stuck inside a platform, clock to 6L,M had to be inverted
-- fixed: RAM4 fails self test, clock timing issue with 6L,M had to double clock frequency
-- fixed: Bomb Jack death animation sequence, wrongly inverting s_7C6 though 6M on page 4
-- fixed: 32x32 tiles not showing correclty when running from SRAM but correct when running from BRAM, SRAM state machine needed to run continuously
--
-- v0.8
--
-- fixed: color palette access contention between CPU and video, causing glitches to appear on a few scan lines between screen transitions
-- fixed: Last 8 pixels of the last video line not showing, can be observed quring squares test pattern (not visible in game)
--		this issue is due to /vblank signal rising too early (see page 8 chips 8B, 7A) clearing the video output while
--		there are still 8 pixels left to shift out. Extended the vblank signal to compensate, but this deviates from schemtatic.
--
--	Known Issues
--

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity BOMBJACK is
	port(
		-- Clocks
		I_CLK_4M			: in		std_logic := '0';
		I_CLK_6M            : in		std_logic := '0';
		I_CLK_12M			: in		std_logic := '0';
		I_CLK_48M			: in		std_logic := '0';
		-- Active high external buttons
		I_RESET				: in		std_logic;								-- push button

		-- VGA monitor output
		O_VIDEO_R			: out		std_logic_vector(3 downto 0);
		O_VIDEO_G			: out		std_logic_vector(3 downto 0);
		O_VIDEO_B			: out		std_logic_vector(3 downto 0);
		O_HSYNC				: out		std_logic;
		O_VSYNC				: out		std_logic;
		tv15Khz_mode   		: in  std_logic;

		O_AUDIO_L      		: out std_logic;
		O_AUDIO_R      		: out std_logic;
   --
		I_JOYSTICK_A      : in    std_logic_vector(5 downto 0);
		I_JOYSTICK_B      : in    std_logic_vector(5 downto 0);
		JOYSTICK_A_GND	   : out	std_logic;
		JOYSTICK_B_GND	   : out	std_logic;
		I_COIN	       	   : in    std_logic_vector(1 downto 0);
		I_PLAYER	       : in    std_logic_vector(1 downto 0);
		I_TABLE		   : in    std_logic_vector(0 downto 0);
   --
		scanSW			   : in    std_logic_vector(20 downto 0);
		resetKey          : in    std_logic;
		scandblctrl       : in    std_logic_vector(1 downto 0)
	);
end BOMBJACK;

architecture RTL of BOMBJACK is

	-- ROMS
	signal I_ROM_4P_DATA	: std_logic_vector( 7 downto 0) := (others => '0');
	signal O_ROM_4P_ADDR	: std_logic_vector(12 downto 0) := (others => '0');
	signal O_ROM_4P_ENA		: std_logic := '1';
	signal I_ROM_7JLM_DATA	: std_logic_vector(23 downto 0) := (others => '0');
	signal O_ROM_7JLM_ADDR	: std_logic_vector(12 downto 0) := (others => '0');
	signal O_ROM_7JLM_ENA	: std_logic := '1';
	signal I_ROM_8KHE_DATA	: std_logic_vector(23 downto 0) := (others => '0');
	signal O_ROM_8KHE_ADDR	: std_logic_vector(12 downto 0) := (others => '0');
	signal O_ROM_8KHE_ENA	: std_logic := '1';
	signal I_ROM_8RNL_DATA	: std_logic_vector(23 downto 0) := (others => '0');
	signal O_ROM_8RNL_ADDR	: std_logic_vector(12 downto 0) := (others => '0');
	signal O_ROM_8RNL_ENA	: std_logic := '1';

	signal audio			    : std_logic_vector( 7 downto 0);
	signal audio_pwm			: std_logic;
	
	-- video
	signal VideoR				: std_logic_vector(3 downto 0);
	signal VideoG				: std_logic_vector(3 downto 0);
	signal VideoB				: std_logic_vector(3 downto 0);
	signal HSync				: std_logic := '1';
	signal VSync				: std_logic := '1';
	signal O_CMPBLK_n			: std_logic;

-- Bomb Jack signals
    signal clk_4M_en			: std_logic := '0';
    signal clk_6M_en            : std_logic := '0';
    signal clk_12M              : std_logic := '0';
    signal clk_48M              : std_logic := '0';
	signal s_clk_en			: std_logic := '0';
	signal s_flip				: std_logic := '0';
	signal s_merd_n			: std_logic := '1';
	signal s_mewr_n			: std_logic := '1';
	signal s_mewr				: std_logic := '0';
	signal s_cs_9000_n		: std_logic := '1';
	signal s_cs_9800_n		: std_logic := '1';
	signal s_cs_9a00_n		: std_logic := '1';
	signal s_cs_9c00_n		: std_logic := '1';
	signal s_cs_9e00_n		: std_logic := '1';
	signal s_cs_b000_n		: std_logic := '1';
	signal s_cs_b800_n		: std_logic := '1';
	signal cs_80_n				: std_logic := '0';
	signal cs_98_n				: std_logic := '0';

	signal s_red				: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_grn				: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_blu				: std_logic_vector( 3 downto 0) := (others => '0');
	signal dummy				: std_logic_vector( 3 downto 0) := (others => '0');
	signal VGA_R				: std_logic_vector( 3 downto 0) := (others => '0');
	signal VGA_G				: std_logic_vector( 3 downto 0) := (others => '0');
	signal VGA_B				: std_logic_vector( 3 downto 0) := (others => '0');
	signal VGA_HS				: std_logic := '1';
	signal VGA_VS				: std_logic := '1';
    signal scanlines            : std_logic;
    signal csync                : std_logic;
    
	-- player controls
	signal psg_data_out		: std_logic_vector( 7 downto 0) := (others => '0');
	signal psg_data_in		: std_logic_vector( 7 downto 0) := (others => '0');

	signal cpu_addr			: std_logic_vector(15 downto 0) := (others => '0');
	signal cpu_data_in		: std_logic_vector( 7 downto 0) := (others => '0');
	signal cpu_data_out		: std_logic_vector( 7 downto 0) := (others => '0');
	signal ram0_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal ram1_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal rom_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal io_data				: std_logic_vector( 7 downto 0) := (others => '0');
	signal rom_sel				: std_logic_vector( 4 downto 0) := (others => '0');
	signal wd_ctr				: std_logic_vector( 3 downto 0) := (others => '0');
	signal cpu_rd_n			: std_logic := '0';
	signal cpu_wr_n			: std_logic := '0';
	signal cpu_rfsh_n			: std_logic := '0';
	signal cpu_mreq_n			: std_logic := '0';
	signal cpu_reset_n		: std_logic := '0';
	signal RESETn				: std_logic := '1';

	signal s_wait				: std_logic := '0';
	signal s_wait_n			: std_logic := '1';
	signal s_wram0				: std_logic := '0';
	signal s_wram0_n			: std_logic := '1';
	signal s_wram1				: std_logic := '0';
	signal s_wram1_n			: std_logic := '1';
	signal s_ram0_n			: std_logic := '1';
	signal s_ram1_n			: std_logic := '1';
	signal s_ram2_n			: std_logic := '1';
	signal s_csen_n			: std_logic := '0';
	signal s_7P5				: std_logic := '0';
	signal s_7P9				: std_logic := '0';
	signal s_nmi_n				: std_logic := '1';
	signal s_nmion				: std_logic := '0';
	signal s_wdclr				: std_logic := '0';
	signal s_mhflip			: std_logic := '0';
	signal s_psg1_n			: std_logic := '0';
	signal s_psg2_n			: std_logic := '0';
	signal s_psg3_n			: std_logic := '0';
	signal s_swr_n				: std_logic := '0';
	signal s_srd_n				: std_logic := '0';
	signal s_sa0				: std_logic := '0';

	signal palette_data		: std_logic_vector( 7 downto 0) := (others => '0');
	signal sprite_data		: std_logic_vector( 7 downto 0) := (others => '0');
	signal char_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_t_bus				: std_logic_vector( 4 downto 0) := (others => '0');
	signal s_4p_bus			: std_logic_vector( 8 downto 0) := (others => '0');
	signal s_5ef_bus			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_6lm_bus			: std_logic_vector(10 downto 0) := (others => '0');
	signal s_6p_bus			: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_oc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_ov					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_sc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_sv					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_bc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_bv					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_mc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_mv					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_dac_out			: std_logic := '1';
	signal s_hsync_n			: std_logic := '1';
	signal s_cmpblk_n_r		: std_logic := '1';
	signal s_vblank_n			: std_logic := '1';
	signal s_vblank_t0		: std_logic := '1';
	signal s_vblank_t1		: std_logic := '1';
	signal s_cmpblk_n			: std_logic := '1';
	signal s_sw_n				: std_logic := '1';
	signal s_hbl				: std_logic := '0';
	signal s_vpl_n				: std_logic := '1';
	signal s_cdl_n				: std_logic := '1';
	signal s_mdl_n				: std_logic := '1';
	signal s_sel				: std_logic := '0';
	signal s_ss					: std_logic := '0';
	signal s_sload_n			: std_logic := '1';
	signal s_sl1_n				: std_logic := '1';
	signal s_sl2_n				: std_logic := '1';

	signal s_1H					: std_logic := '0';
	signal s_2H					: std_logic := '0';
	signal s_4H					: std_logic := '0';
	signal s_8H					: std_logic := '0';
	signal s_16H				: std_logic := '0';
	signal s_32H				: std_logic := '0';
	signal s_64H				: std_logic := '0';
	signal s_128H				: std_logic := '0';
	signal s_256H_n			: std_logic := '1';

	signal s_8H_x				: std_logic := '0';
	signal s_16H_x				: std_logic := '0';
	signal s_32H_x				: std_logic := '0';
	signal s_64H_x				: std_logic := '0';
	signal s_128H_x			: std_logic := '0';

	signal s_1V_x				: std_logic := '0';
	signal s_2V_x				: std_logic := '0';
	signal s_4V_x				: std_logic := '0';
	signal s_8V_x				: std_logic := '0';
	signal s_16V_x				: std_logic := '0';
	signal s_32V_x				: std_logic := '0';
	signal s_64V_x				: std_logic := '0';
	signal s_128V_x			: std_logic := '0';
	signal s_vsync_n			: std_logic := '1';

	signal s_1V_r				: std_logic := '0';
	signal s_1V_n_r			: std_logic := '1';
	signal s_256H_r			: std_logic := '0';
	signal s_contrlda_n		: std_logic := '1';
	signal s_contrldb_n		: std_logic := '1';
	
	signal button_in        : std_logic_vector(15 downto 0);
	signal buttons	        : std_logic_vector(15 downto 0);
	signal button_debounced : std_logic_vector(15 downto 0);
	signal joystick_reg     : std_logic_vector(5 downto 0);
	signal joystick2_reg    : std_logic_vector(5 downto 0);
	signal I_P1				: std_logic_vector( 7 downto 0);		-- input switches player 1
	signal I_P2				: std_logic_vector( 7 downto 0);		-- input switches player 2
	signal I_SYS			: std_logic_vector( 7 downto 0);		-- input switches system
	signal I_SW1			: std_logic_vector( 7 downto 0);		-- input switches presets 1
	signal I_SW2			: std_logic_vector( 7 downto 0);		-- input switches presets 2

begin

	-----------------------------------------------------------------
	-- video scan converter required to display video on VGA hardware
	-----------------------------------------------------------------
	-- game native resolution 224x256
	-- take note: the values below are relative to the CLK period not standard VGA clock period
	scan_conv : entity work.VGA_SCANCONV
	generic map (
		-- mark active area of input video
		cstart      =>  56,  -- composite sync start
		clength     => 256,  -- composite sync length

		-- output video timing
		hA				=>  41,	-- h front porch
		hB				=>  46,	-- h sync
		hC				=>  41,	-- h back porch
		hD				=> 256,	-- visible video

--		vA				=>   8,	-- v front porch (not used)
		vB				=>   2,	-- v sync
		vC				=>  22,	-- v back porch
		vD				=> 224,	-- visible video

		hpad			=>   0,	-- create H black border
		vpad			=>   0	-- create V black border
	)
	port map (
		I_VIDEO(15 downto 12)=> "0000",
		I_VIDEO(11 downto 8) => s_red,
		I_VIDEO( 7 downto 4) => s_grn,
		I_VIDEO( 3 downto 0) => s_blu,
		I_HSYNC					=> s_hsync_n,
		I_VSYNC					=> s_vsync_n,
		--
		O_VIDEO(15 downto 12)=> dummy,
		O_VIDEO(11 downto 8) => VGA_R,
		O_VIDEO( 7 downto 4) => VGA_G,
		O_VIDEO( 3 downto 0) => VGA_B,
		O_HSYNC				 => VGA_HS,
		O_VSYNC				 => VGA_VS,
		O_CMPBLK_N			 => open,
		--
		CLK					 => clk_6M_en,
		CLK_X2				 => clk_12M,
		scanlines            => scanlines
	);

    scanlines <= scandblctrl(1) xor scanSW(8);
    
	O_VIDEO_R	<= VGA_R  when tv15Khz_mode = '0' else s_red;
	O_VIDEO_G	<= VGA_G  when tv15Khz_mode = '0' else s_grn;
	O_VIDEO_B	<= VGA_B  when tv15Khz_mode = '0' else s_blu;
	O_HSYNC		<= VGA_HS when tv15Khz_mode = '0' else csync; --not (s_hsync_n xor s_hsync_n); --s_hsync_n and s_vsync_n; --not (s_hsync_n xor s_hsync_n); --not s_cmpblk_n_r;--s_hsync_n;
	O_VSYNC		<= VGA_VS when tv15Khz_mode = '0' else '1'; --s_vsync_n;

	O_CMPBLK_n	<= s_cmpblk_n_r;

composite_sync : entity work.composite_sync
port map(
 clk   => clk_6M_en,
 hsync => not s_hsync_n, --La maquina original las da negadas
 vsync => not s_vsync_n, --La maquina original las da negadas
 csync => csync,
 blank => open
);

	clk_4M_en			<= I_CLK_4M;
    clk_6M_en           <= I_CLK_6M;
    clk_12M             <= I_CLK_12M;
    clk_48M             <= I_CLK_48M;

	RESETn				<= not I_RESET;		-- active low reset

	joystick_reg  <=  I_JOYSTICK_A;
	joystick2_reg <=  I_JOYSTICK_B;
	JOYSTICK_A_GND <= '0';
	JOYSTICK_B_GND <= '0';

	----------------------------------------------------------------------------
	-- concatenate some signals so we can pass them to modules as a logic vector
	----------------------------------------------------------------------------
	s_6p_bus		<= s_4V_x & s_2V_x & s_1V_x;
	s_t_bus		<= s_4V_x & s_2V_x & s_1V_x & s_8V_x & s_8H_x;
	s_4p_bus		<= s_4H & s_128V_x & s_64V_x & s_32V_x & s_16V_x & s_128H_x & s_64H_x & s_32H_x & s_16H_x;
	s_5ef_bus	<= s_128V_x & s_64V_x & s_32V_x & s_16V_x & s_8V_x & s_4V_x & s_2V_x & s_1V_x;
	s_6lm_bus	<= s_2H & s_128V_x & s_64V_x & s_32V_x & s_16V_x & s_8V_x & s_128H_x & s_64H_x & s_32H_x & s_16H_x & s_8H_x;

	-------------------------------------------------------------------------------------------------------------
	-- CPU data bus mux: depending on address decoding logic connects a specific source to the cpu data bus input
	-------------------------------------------------------------------------------------------------------------
	cpu_data_in <=
		ram0_data		when							  (s_ram0_n = '0')		else -- chips 2H, 6N8 page 1
		ram1_data		when							  (s_ram1_n = '0')		else -- chips 2H, 6N8 page 1
		rom_data			when (s_merd_n = '0') and (rom_sel /= "11111")	else -- chips 2H, 6N8 page 1
		char_data		when (s_merd_n = '0') and (s_cs_9000_n = '0')	else -- chips 3L, 2R6, 8C6, 6N11 page 6
		sprite_data		when (s_merd_n = '0') and (s_cs_9800_n = '0')	else -- chips 2F, 7C8, 3H6 page 4
		palette_data	when (s_merd_n = '0') and (s_cs_9c00_n = '0')	else -- chips 7B, 7C, 8C11, 8C8 page 8
		io_data			when (s_merd_n = '0') and (s_cs_b000_n = '0')	else -- chips 3N3, 3N11, 3P page 2
		(others => '0');

	-- chip 4L6 page 1
	cpu_reset_n <= RESETn and (not wd_ctr(3));

	-- chip 5N page 1
	watchdog : process(clk_12M, s_wdclr)
	begin
		if (s_wdclr = '1') then
			wd_ctr <= "0000";
		elsif falling_edge(clk_12M) then
			s_vblank_t1 <= s_vblank_t0;
			-- falling edge of s_vblank_n
			if (s_vblank_t0 = '0' and s_vblank_t1 = '1') then
				wd_ctr <= wd_ctr  + 1;
			end if;
		end if;
	end process;

	-- chip 3H3 page 1
	s_merd_n <= cpu_mreq_n or cpu_rd_n;

	-- chip 3H11 page 1
	s_mewr_n <= cpu_mreq_n or cpu_wr_n;

	-- chip 1C12 page 1
	process
	begin
		wait until rising_edge(clk_12M);
		-- only let this change when CPU not enabled
		if (clk_4M_en = '0') then
			s_wait <= not (s_ram2_n or s_sw_n or s_hbl);
		end if;
	end process;

	-- chip 4L3 page 1
	s_csen_n <= s_wait and s_7P5;

	-- chip 6P10 page 1 (deviation from schematic to cleanup the wait pulse by taking s_7P5 into account as well)
	s_wait_n <= not (s_wait or s_7P9 or s_7P5);

	-- clock enable for sound sections P9, P10
	s_clk_en <= s_1H and not clk_6M_en; -- create a 3M clock enable for the 12M clock

	-- chip 5P5 page 1
	U5P5 : process(clk_12M, s_nmion)
	begin
		if s_nmion = '0' then
			s_nmi_n <= '1';
		elsif falling_edge(clk_12M) then
			-- rising edge of s_vblank_n
			if (s_vblank_t0 = '1' and s_vblank_t1 = '0') then
				s_nmi_n <= '0';
			end if;
		end if;
	end process;

	-- chip 7P page 1
	U7P5 : process(clk_12M, s_vblank_t0)
	begin
		if s_vblank_t0 = '1' then
			s_7P5 <= '0';
		elsif rising_edge(clk_12M) then
			if (clk_4M_en = '1') then
				s_7P5 <= s_wait;
			end if;
		end if;
	end process;

	U7P9 : process
	begin
		wait until rising_edge(clk_12M);
		if (clk_4M_en = '1') then
			s_7P9 <= s_7P5;
		end if;
	end process;

	-- chips 1J, 1L, 1M, 1N, 1R page 1
	prog_roms : entity work.PROG_ROMS
	port map (
		I_CLK			=> clk_12M,
		I_ROM_SEL	=> rom_sel,
		I_ADDR		=> cpu_addr(12 downto 0),
		O_DATA		=> rom_data
	);

	-----------
	-- CPU RAMs
	-----------
	-- our BRAM signals are opposite polarity from real SRAMs
	s_wram0  <= not s_wram0_n;
	s_wram1  <= not s_wram1_n;
	s_mewr <= not s_mewr_n;

	-- CPU RAM 0x8000 - 0x87ff
	-- chip 1E page 1
	ram_1E : RAMB16_S9
	port map (
		do				=> ram0_data,
		dop			=> open,
		addr			=> cpu_addr(10 downto 0),
		clk			=> clk_12M,
		di				=> cpu_data_out,
		dip			=> "0",
		en				=> s_wram0,
		ssr			=> '0',
		we				=> s_mewr
	);

	-- CPU RAM 0x8800 - 0x8fff
	-- chip 1H page 1
	ram_1H : RAMB16_S9
	port map (
		do				=> ram1_data,
		dop			=> open,
		addr			=> cpu_addr(10 downto 0),
		clk			=> clk_12M,
		di				=> cpu_data_out,
		dip			=> "0",
		en				=> s_wram1,
		ssr			=> '0',
		we				=> s_mewr
	);

	--------------------------------------------------------------------------------
	-- memory decoder generates active low select signals for various memory regions
	--------------------------------------------------------------------------------
	-- chip 3M page 1
	rom_sel(0)	<= '0' when (                      cpu_addr(15 downto 13) = "000"   ) else '1'; -- 0x0000 - 0x1fff
	rom_sel(1)	<= '0' when (                      cpu_addr(15 downto 13) = "001"   ) else '1'; -- 0x2000 - 0x3fff
	rom_sel(2)	<= '0' when (                      cpu_addr(15 downto 13) = "010"   ) else '1'; -- 0x4000 - 0x5fff
	rom_sel(3)	<= '0' when (                      cpu_addr(15 downto 13) = "011"   ) else '1'; -- 0x6000 - 0x7fff
	rom_sel(4)	<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 13) = "110"   ) else '1'; -- 0xc000 - 0xdfff

	-- chip 5M page 1
	s_ram0_n		<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 11) = "10000" ) else '1'; -- 0x8000 - 0x87ff
	s_ram1_n		<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 11) = "10001" ) else '1'; -- 0x8800 - 0x8fff
	s_ram2_n		<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 11) = "10010" ) else '1'; -- 0x9000 - 0x97ff

	-- chip 4M page 1
	s_wram0_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10000"  ) else '1'; -- 0x8000 - 0x87ff
	s_wram1_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10001"  ) else '1'; -- 0x8800 - 0x8fff
	s_cs_9000_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10010"  ) else '1'; -- 0x9000 - 0x97ff
	s_cs_b000_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10110"  ) else '1'; -- 0xb000 - 0xb7ff
	s_cs_b800_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10111"  ) else '1'; -- 0xb800 - 0xbfff

	-- chip 2S page 1
	s_cs_9800_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001100" ) else '1'; -- 0x9800 - 0x99ff
	s_cs_9a00_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001101" ) else '1'; -- 0x9a00 - 0x9bff
	s_cs_9c00_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001110" ) else '1'; -- 0x9c00 - 0x9dff
	s_cs_9e00_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001111" ) else '1'; -- 0x9e00 - 0x9fff

	------------------------
	-- Z80 CPU on main board
	------------------------
	-- chip 3K page 1
	cpu_3K : entity work.T80sed
	port map (
		-- inputs
		WAIT_n		=> s_wait_n,
		NMI_n			=> s_nmi_n,
		DI				=> cpu_data_in,
		RESET_n		=> cpu_reset_n,
		CLK_n			=> clk_12M,
		CLKEN			=> clk_4M_en,
		INT_n			=> '1',  -- unused
		BUSRQ_n		=> '1',  -- unused
		-- outputs
		RFSH_n		=> cpu_rfsh_n,
		MREQ_n		=> cpu_mreq_n,
		RD_n			=> cpu_rd_n,
		WR_n			=> cpu_wr_n,
		A				=> cpu_addr,
		DO				=> cpu_data_out,
		M1_n			=> open, -- unused
		IORQ_n		=> open, -- unused
		HALT_n		=> open, -- unused
		BUSAK_n		=> open  -- unused
	);

	-------------------------------------------------------------------------
	-- page 2 schematic - input switches, watchdog and non-maskable interrupt
	-------------------------------------------------------------------------
	p2 : entity work.switches
	port map (
		I_CLK_12M			=> clk_12M,
		I_CLK_6M_EN			=> clk_6M_en,
		I_AB					=> cpu_addr(2 downto 0),
		I_DB0					=> cpu_data_out(0),
		I_CS_B000_n			    => s_cs_b000_n, 	-- mem select region 0xb000 - 0xb7ff
		I_MERD_n				=> s_merd_n,		-- mem rd signal
		I_MEWR_n				=> s_mewr_n,		-- mem wr signal
		--
		I_P1					=> I_P1,			-- Player 1 active low switches
		I_P2					=> I_P2,			-- Player 2 active low switches
		I_SYS					=> I_SYS,			-- System active low switches
		I_SW1					=> I_SW1,			-- SW1 presets
		I_SW2					=> I_SW2,			-- SW2 presets
		--
		O_DB					=> io_data,
		O_WDCLR				    => s_wdclr,
		O_NMION				    => s_nmion,
		O_FLIP				    => s_flip
	);

	-------------------------------------------------------
	-- page 3 schematic - video and timing signal generator
	-------------------------------------------------------
	p3 : entity work.timing
	port map (
		I_CLK_12M			=> clk_12M,
		I_CLK_6M_EN			=> clk_6M_en,
		I_FLIP				=> s_flip,
		I_CS_9A00_n			=> s_cs_9a00_n,
		I_MEWR_n				=> s_mewr_n,
		I_AB					=> cpu_addr(0),
		I_DB					=> cpu_data_out( 3 downto 0),
		--
		O_SLOAD_n			=> s_sload_n,
		O_SL1_n				=> s_sl1_n,
		O_SL2_n				=> s_sl2_n,
		O_SW_n				=> s_sw_n,
		O_SS					=> s_ss,
		O_HBL					=> s_hbl,
		O_CONTROLDB_n		=> s_contrldb_n,
		O_CONTROLDA_n		=> s_contrlda_n,
		O_VPL_n				=> s_vpl_n,
		O_CDL_n				=> s_cdl_n,
		O_MDL_n				=> s_mdl_n,
		O_SEL					=> s_sel,
		O_1V_r				=> s_1V_r,
		O_1V_n_r				=> s_1V_n_r,
		O_256H_r				=> s_256H_r,
		O_CMPBLK_n_r		=> s_cmpblk_n_r,
		O_CMPBLK_n			=> s_cmpblk_n,
--		O_CMPBLK				=> open,
		O_VBLANK_n			=> s_vblank_n,
		O_VBLANK				=> s_vblank_t0,
		O_TVSYNC_n			=> open,
		O_HSYNC_n 			=> s_hsync_n,

		O_1H					=> s_1H,
		O_2H					=> s_2H,
		O_4H					=> s_4H,
		O_8H					=> s_8H,
		O_16H					=> s_16H,
		O_32H					=> s_32H,
		O_64H					=> s_64H,
		O_128H				=> s_128H,
		O_256H_n 			=> s_256H_n,

		O_8H_X				=> s_8H_x,
		O_16H_X				=> s_16H_x,
		O_32H_X				=> s_32H_x,
		O_64H_X				=> s_64H_x,
		O_128H_X 			=> s_128H_x,

		O_1V_X				=> s_1V_x,
		O_2V_X				=> s_2V_x,
		O_4V_X				=> s_4V_x,
		O_8V_X				=> s_8V_x,
		O_16V_X				=> s_16V_x,
		O_32V_X				=> s_32V_x,
		O_64V_X				=> s_64V_x,
		O_128V_X				=> s_128V_x,
		O_VSYNC_n			=> s_vsync_n
	);

	--------------------------------------
	-- page 4 schematic - sprite generator
	--------------------------------------
	p4 : entity work.sprite_gen
	port map (
		I_CLK_6M_EN			=> clk_6M_en,
		I_CLK_12M			=> clk_12M,
		I_CS_9800_n			=> s_cs_9800_n,
		I_MEWR_n				=> s_mewr_n,
		I_MDL_n				=> s_mdl_n,
		I_CDL_n				=> s_cdl_n,
		I_VPL_n				=> s_vpl_n,
		I_SLOAD_n			=> s_sload_n,
		I_SEL					=> s_sel,

		I_2H					=> s_2H,
		I_4H					=> s_4H,
		I_8H					=> s_8H,
		I_16H					=> s_16H,
		I_32H					=> s_32H,
		I_64H					=> s_64H,
		I_128H				=> s_128H,
		I_256H_n				=> s_256H_n,

		I_5EF_BUS			=> s_5ef_bus,
		I_AB					=> cpu_addr( 6 downto 0),
		I_DB					=> cpu_data_out,
		I_ROM_7JLM_DATA	=> I_ROM_7JLM_DATA,
		--
		O_ROM_7JLM_ENA		=> O_ROM_7JLM_ENA,
		O_ROM_7JLM_ADDR	=> O_ROM_7JLM_ADDR,
		O_MHFLIP				=> s_mhflip,
		O_MC					=> s_mc,
		O_MV					=> s_mv,
		O_DB					=> sprite_data
	);
	-- chip 7J page 4
	ROM_7J : entity work.ROM_7J
	port map (
		CLK	=> clk_12M,
		ENA	=> O_ROM_7JLM_ENA,
		ADDR	=> O_ROM_7JLM_ADDR,
		DATA	=> I_ROM_7JLM_DATA(23 downto 16)
	);

	-- chip 7L page 4
	ROM_7L : entity work.ROM_7L
	port map (
		CLK	=> clk_12M,
		ENA	=> O_ROM_7JLM_ENA,
		ADDR	=> O_ROM_7JLM_ADDR,
		DATA	=> I_ROM_7JLM_DATA(15 downto  8)
	);

	-- chip 7M page 4
	ROM_7M : entity work.ROM_7M
	port map (
		CLK	=> clk_12M,
		ENA	=> O_ROM_7JLM_ENA,
		ADDR	=> O_ROM_7JLM_ADDR,
		DATA	=> I_ROM_7JLM_DATA( 7 downto  0)
	);

	----------------------------------------
	-- page 5 schematic - sprite positioning
	----------------------------------------
	p5 : entity work.sprite_position
	port map (
		I_CLK_12M		=> clk_12M,
		I_CLK_6M_EN		=> clk_6M_en,
		I_FLIP			=> s_flip,
		I_CONTRLDA_n	=> s_contrlda_n,
		I_CONTRLDB_n	=> s_contrldb_n,
		I_MHFLIP			=> s_mhflip,
		I_1V_r			=> s_1V_r,
		I_1V_n_r			=> s_1V_n_r,
		I_256H_r			=> s_256H_r,
		I_CTR				=> sprite_data,
		I_MC				=> s_mc,
		I_MV				=> s_mv,
		--
		O_OC				=> s_oc,
		O_OV				=> s_ov
	);

	-----------------------------------------
	-- page 6 schematic - character generator
	-----------------------------------------
	p6 : entity work.char_gen
	port map (
		I_CLK_12M			=> clk_12M,
		I_CLK_6M_EN			=> clk_6M_en,
		I_CS_9000_n			=> s_cs_9000_n,
		I_MEWR_n				=> s_mewr_n,
		I_CMPBLK_n			=> s_cmpblk_n,
		I_FLIP				=> s_flip,
		I_SS					=> s_ss,
		I_SL1_n				=> s_sl1_n,
		I_SL2_n				=> s_sl2_n,
		I_SLOAD_n			=> s_sload_n,
		I_6LM_BUS			=> s_6lm_bus,
		I_DB					=> cpu_data_out,
		I_AB					=> cpu_addr(10 downto 0),
		I_ROM_8KHE_DATA	=> I_ROM_8KHE_DATA,
		I_6P_BUS				=> s_6p_bus,
		--
		O_SV					=> s_sv,
		O_SC					=> s_sc,
		O_DB					=> char_data,
		O_ROM_8KHE_ENA		=> O_ROM_8KHE_ENA,
		O_ROM_8KHE_ADDR	=> O_ROM_8KHE_ADDR
	);
	-- chip 8K page 6
	ROM_8K : entity work.ROM_8K
	port map (
		CLK	=> clk_12M,
		ENA	=> O_ROM_8KHE_ENA,
		ADDR	=> O_ROM_8KHE_ADDR(11 downto 0),
		DATA	=> I_ROM_8KHE_DATA(23 downto 16)
	);

	-- chip 8H page 6
	ROM_8H : entity work.ROM_8H
	port map (
		CLK	=> clk_12M,
		ENA	=> O_ROM_8KHE_ENA,
		ADDR	=> O_ROM_8KHE_ADDR(11 downto 0),
		DATA	=> I_ROM_8KHE_DATA(15 downto  8)
	);

	-- chip 8E page 6
	ROM_8E : entity work.ROM_8E
	port map (
		CLK	=> clk_12M,
		ENA	=> O_ROM_8KHE_ENA,
		ADDR	=> O_ROM_8KHE_ADDR(11 downto 0),
		DATA	=> I_ROM_8KHE_DATA( 7 downto  0)
	);

	------------------------------------------------
	-- page 7 schematic - background image generator
	------------------------------------------------
	p7 : entity work.bgnd_tiles
	port map (
		I_CLK_12M			=> clk_12M,
		I_CLK_6M_EN			=> clk_6M_en,
		I_CS_9E00_n			=> s_cs_9e00_n,
		I_MEWR_n				=> s_mewr_n,
		I_CMPBLK_n			=> s_cmpblk_n,
		I_SLOAD_n			=> s_sload_n,
		I_SL2_n				=> s_sl2_n,
		I_FLIP				=> s_flip,
		I_4P_BUS				=> s_4p_bus,
		I_T_BUS				=> s_t_bus,
		I_DB					=> cpu_data_out(4 downto 0),
		I_ROM_4P_DATA		=> I_ROM_4P_DATA,
		I_ROM_8RNL_DATA	=> I_ROM_8RNL_DATA,
		--
		O_ROM_4P_ENA		=> O_ROM_4P_ENA,
		O_ROM_4P_ADDR		=> O_ROM_4P_ADDR,
		O_ROM_8RNL_ENA		=> O_ROM_8RNL_ENA,
		O_ROM_8RNL_ADDR	=> O_ROM_8RNL_ADDR,
		O_BC					=> s_bc,
		O_BV					=> s_bv
	);
	-- chip 4P page 7
	ROM_4P : entity work.ROM_4P
	port map (
		CLK	=> clk_12M,
		ENA	=> o_rom_4P_ena,
		ADDR	=> o_rom_4P_addr(11 downto 0),
		DATA	=> i_rom_4P_data
	);

	-- chip 8R page 7
	ROM_8R : entity work.ROM_8R
	port map (
		CLK	=> clk_12M,
		ENA   => O_ROM_8RNL_ENA,
		ADDR	=> O_ROM_8RNL_ADDR,
		DATA  => I_ROM_8RNL_DATA(23 downto 16)
	);

	-- chip 8N page 7
	ROM_8N : entity work.ROM_8N
	port map (
		CLK	=> clk_12M,
		ENA   => O_ROM_8RNL_ENA,
		ADDR	=> O_ROM_8RNL_ADDR,
		DATA  => I_ROM_8RNL_DATA(15 downto  8)
	);

	-- chip 8L page 7
	ROM_8L : entity work.ROM_8L
	port map (
		CLK	=> clk_12M,
		ENA   => O_ROM_8RNL_ENA,
		ADDR	=> O_ROM_8RNL_ADDR,
		DATA  => I_ROM_8RNL_DATA( 7 downto  0)
	);

	----------------------------------------------------
	-- page 8 schematic - color palette and video output
	----------------------------------------------------
	p8 : entity work.palette
	port map (
		I_CLK_12M			=> clk_12M,
		I_CLK_6M_EN			=> clk_6M_en,
		I_CS_9C00_n			=> s_cs_9c00_n,
		I_MEWR_n				=> s_mewr_n,
		I_MERD_n				=> s_merd_n,
		I_CMPBLK_n_r		=> s_cmpblk_n_r,
		I_VBLANK_n			=> s_vblank_n,
		I_OC					=> s_oc,
		I_OV					=> s_ov,
		I_SC					=> s_sc,
		I_SV					=> s_sv,
		I_BC					=> s_bc,
		I_BV					=> s_bv,
		I_AB					=> cpu_addr(8 downto 0),
		I_DB					=> cpu_data_out,
		--
		O_DB					=> palette_data,
		O_R					=> s_red,
		O_G					=> s_grn,
		O_B					=> s_blu
	);

	-----------------------------------------
	-- page 9 schematic - audio CPU, ROM, RAM
	-----------------------------------------
	p9 : entity work.audio
	port map (
		I_CLK_12M			=> clk_12M,
		I_CLK_EN				=> s_clk_en,
		I_RESET_n			=> RESETn,
		I_VSYNC_n			=> s_vsync_n,
		I_CS_B800_n			=> s_cs_b800_n,
		I_MERW_n				=> s_mewr_n,
		I_DB_CPU				=> cpu_data_out,
		I_SD					=> psg_data_out,
		O_SD					=> psg_data_in,
		O_SA0					=> s_sa0,
		O_PSG1_n				=> s_psg1_n,
		O_PSG2_n				=> s_psg2_n,
		O_PSG3_n				=> s_psg3_n,
		O_SWR_n				=> s_swr_n,
		O_SRD_n				=> s_srd_n
	);

	----------------------------------------------------
	-- page 10 schematic - programmable sound generators
	----------------------------------------------------
	p10 : entity work.psgs
	port map (
		I_CLK_12M			=> clk_12M,
		I_CLK_EN				=> s_clk_en,
		I_RST_n				=> RESETn,
		I_SWR_n				=> s_swr_n,
		I_SRD_n				=> s_srd_n,
		I_SA0					=> s_sa0,
		I_PSG1_n				=> s_psg1_n,
		I_PSG2_n				=> s_psg2_n,
		I_PSG3_n				=> s_psg3_n,
		I_CHEN				=> "111111111",
		I_SD					=> psg_data_in,
		O_SD					=> psg_data_out,
		O_AUDIO				=> audio
	);

    dac : entity work.dac  --Cambio por mi dac
    generic map(
      msbi_g => 7
    )
    port  map(
      clk_i   => clk_48M,  -- the higher the clock the better estaba a 48MHZ
      res_i => I_RESET,
      dac_i   => audio,
      dac_o   => audio_pwm
    );

  O_AUDIO_L <= audio_pwm;
  O_AUDIO_R <= audio_pwm;

  -- JOYS
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
    CLK      => clk_12M
    );
 
 input_registers : process
  begin
   wait until rising_edge(clk_12M);
   if (clk_6M_en = '1') then
		I_P1(7 downto 5)	<= "000";					    -- P1 unused
		I_P1(4)				<= not button_debounced(4);		-- P1 jump
		I_P1(3)				<= not button_debounced(1);		-- P1 down
		I_P1(2)				<= not button_debounced(0);		-- P1 up
		I_P1(1)				<= not button_debounced(2);		-- P1 left
		I_P1(0)				<= not button_debounced(3);		-- P1 right

		-- player 2 controls
		I_P2(7 downto 5)	<= "000";						-- P2 unused
		I_P2(4)				<= not button_debounced(13);	-- P2 jump
		I_P2(3)				<= not button_debounced(10);	-- P2 down
		I_P2(2)				<= not button_debounced(9);		-- P2 up
		I_P2(1)				<= not button_debounced(11);	-- P2 left
		I_P2(0)				<= not button_debounced(12);	-- P2 right

		-- system inputs
		I_SYS(7 downto 4)	<= "0000";--"1111";				-- unused
		I_SYS(3)			<= not button_debounced(7);		-- P2 start
		I_SYS(2)			<= not button_debounced(6);		-- P1 start
		I_SYS(1)			<= not button_debounced(15);	-- P2 coin
		I_SYS(0)			<= not button_debounced(8);		-- P1 coin

		-- SW1 presets
		I_SW1(7)			<= '1';					-- demo sounds 1=on, 0=off
		I_SW1(6)			<= '1';					-- orientation 1=upright, 0=cocktail
		I_SW1(5 downto 4)	<= "00";				-- lives 00=3, 01=4, 10=5, 11=2
		I_SW1(3 downto 2)	<= "00";				-- coin b 00=1Coin/1Credit, 01=2Coins/1Credit, 10=1Coin/2Credits, 11=1Coin/3Credits
		I_SW1(1 downto 0)	<= "00";				-- coin a 00=1Coin/1Credit, 01=1Coin/2Credits, 10=1Coin/3Credits, 11=1Coin/6Credits
                           
		-- SW2 presets       
		I_SW2(7)			<= '0';					-- special coin 0=easy, 1=hard
		I_SW2(6 downto 5)	<= "00";				-- enemies number and speed 00=easy, 01=medium, 10=hard, 11=insane
		I_SW2(4 downto 3)	<= "00";				-- bird speed 00=easy, 01=medium, 10=hard, 11=insane
		I_SW2(2 downto 0)	<= "001";				-- bonus life 000=none, 001=every 100k, 010=every 30k, 011=50k only, 100=100k only, 101=50k and 100k, 110=100k and 300k, 111=50k and 100k and 300k

   end if;
  end process;

end RTL;