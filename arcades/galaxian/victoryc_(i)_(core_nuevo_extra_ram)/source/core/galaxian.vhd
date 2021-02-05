------------------------------------------------------------------------------
-- FPGA GALAXIAN
--
-- Version  downto  2.50
--
-- Copyright(c) 2004 Katsumi Degawa , All rights reserved
--
-- Important  not
--
-- This program is freeware for non-commercial use.
-- The author does not guarantee this program.
-- You can use this at your own risk.
--
-- 2004- 4-30  galaxian modify by K.DEGAWA
-- 2004- 5- 6  first release.
-- 2004- 8-23  Improvement with T80-IP.
-- 2004- 9-22  The problem which missile didn't sometimes come out from was improved.
------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

--use work.pkg_galaxian.all;

entity galaxian is
	port(
		O_VIDEO_R : out std_logic_vector(2 downto 0);
		O_VIDEO_G : out std_logic_vector(2 downto 0);
		O_VIDEO_B : out std_logic_vector(2 downto 0);
		O_HSYNC   : out std_logic;
		O_VSYNC 	 : out std_logic;
		O_BLANKING   : out   std_logic_vector(0 downto 0);

		O_AUDIO_L : out std_logic;
		O_AUDIO_R : out std_logic;

		I_JOYSTICK_A   : in    std_logic_vector(5 downto 0);
		I_JOYSTICK_B   : in    std_logic_vector(5 downto 0);
		JOYSTICK_A_GND : out	 std_logic;
		JOYSTICK_B_GND : out	 std_logic;

		CLK     : in  std_logic;
		--
		I_PLAYER    : in std_logic_vector(1 downto 0);
		I_COIN      : in std_logic_vector(1 downto 0);
		PCLK						  : out  std_logic;
		scanSW			   	  : in    std_logic_vector(20 downto 0);
		resetKey              : in    std_logic;
		scandblctrl           : in    std_logic_vector(1 downto 0)
	);
end;

architecture RTL of galaxian is
	--    CPU ADDRESS BUS
	signal W_A                : std_logic_vector(15 downto 0) := (others => '0');
	-------- CLOCK GEN ---------------------------
	signal  W_CLK_18M  : std_logic;
	signal  W_CLK_36M          : std_logic := '0';
	signal  W_CLK_12M  : std_logic;
	signal  W_CLK_6M   : std_logic;
	signal  W_CLK_6Mn         : std_logic := '0';
	--    CPU IF
	signal W_CPU_CLK          : std_logic := '0';
	signal W_CPU_MREQn        : std_logic := '0';
	signal W_CPU_NMIn         : std_logic := '0';
	signal W_CPU_RDn          : std_logic := '0';
	signal W_CPU_RFSHn        : std_logic := '0';
	signal W_CPU_WAITn        : std_logic := '0';
	signal W_CPU_WRn          : std_logic := '0';
	signal W_CPU_WR           : std_logic := '0';
	signal W_RESETn           : std_logic := '0';
	signal I_RESET    : std_logic;

	-------- H and V COUNTER -------------------------
	signal W_C_BLn            : std_logic := '0';
	signal W_C_BLnX           : std_logic := '0';
	signal W_C_BLXn           : std_logic := '0';
	signal W_H_BL             : std_logic := '0';
	signal W_H_SYNC_int       : std_logic := '0';
	signal W_V_BLn            : std_logic := '0';
	signal W_V_BL2n           : std_logic := '0';
	signal W_V_SYNC_int       : std_logic := '0';
	signal W_H_CNT            : std_logic_vector(8 downto 0) := (others => '0');
	signal W_V_CNT            : std_logic_vector(7 downto 0) := (others => '0');
	-------- CPU RAM  ----------------------------
	signal W_CPU_RAM_DO       : std_logic_vector(7 downto 0) := (others => '0');
	-------- ADDRESS DECDER ----------------------
	signal W_BD_G             : std_logic := '0';
	signal W_CPU_RAM_CS       : std_logic := '0';
	signal W_CPU_RAM_RD       : std_logic := '0';
--	signal W_CPU_RAM_WR       : std_logic := '0';
	signal W_CPU_ROM_CS       : std_logic := '0';
	signal W_DIP_OE           : std_logic := '0';
	signal W_H_FLIP           : std_logic := '0';
	signal W_DRIVER_WE        : std_logic := '0';
	signal W_OBJ_RAM_RD       : std_logic := '0';
	signal W_OBJ_RAM_RQ       : std_logic := '0';
	signal W_OBJ_RAM_WR       : std_logic := '0';
	signal W_PITCH            : std_logic := '0';
	signal W_SOUND_WE         : std_logic := '0';
	signal W_STARS_ON         : std_logic := '0';
	signal W_STARS_OFFn       : std_logic := '0';
	signal W_SW0_OE           : std_logic := '0';
	signal W_SW1_OE           : std_logic := '0';
	signal W_V_FLIP           : std_logic := '0';
	signal W_VID_RAM_RD       : std_logic := '0';
	signal W_VID_RAM_WR       : std_logic := '0';
	signal W_WDR_OE           : std_logic := '0';
	--------- INPORT -----------------------------
	signal W_SW_DO            : std_logic_vector( 7 downto 0) := (others => '0');
	--------- VIDEO  -----------------------------
	signal W_VID_DO           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_R        : std_logic_vector(2 downto 0);
	signal W_G        : std_logic_vector(2 downto 0);
	signal W_B        : std_logic_vector(2 downto 0);
	signal HBLANK     : std_logic;
	signal VBLANK     : std_logic;
	signal W_H_SYNC   : std_logic;
	signal W_V_SYNC   : std_logic;
	signal O_CMPBL    : std_logic;
	--------- AUDIO ---------------------------
	signal W_SDAT_A   : std_logic_vector( 7 downto 0);
	signal W_SDAT_B   : std_logic_vector( 7 downto 0);

	-----  DATA I/F -------------------------------------
	signal W_CPU_ROM_DO       : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_CPU_ROM_DOB      : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_BDO              : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_BDI              : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_CPU_RAM_CLK      : std_logic := '0';
	signal W_VOL1             : std_logic := '0';
	signal W_VOL2             : std_logic := '0';
	signal W_FIRE             : std_logic := '0';
	signal W_HIT              : std_logic := '0';
	signal W_FS               : std_logic_vector( 2 downto 0) := (others => '0');

	signal blx_comb           : std_logic := '0';
	signal W_1VF              : std_logic := '0';
	signal W_256HnX           : std_logic := '0';
	signal W_8HF              : std_logic := '0';
	signal W_DAC_A            : std_logic := '0';
	signal W_DAC_B            : std_logic := '0';
	signal W_MISSILEn         : std_logic := '0';
	signal W_SHELLn           : std_logic := '0';
	signal W_MS_D             : std_logic := '0';
	signal W_MS_R             : std_logic := '0';
	signal W_MS_G             : std_logic := '0';
	signal W_MS_B             : std_logic := '0';

	signal new_sw             : std_logic_vector( 2 downto 0) := (others => '0');
	signal in_game            : std_logic_vector( 1 downto 0) := (others => '0');
	signal ROM_D              : std_logic_vector( 7 downto 0) := (others => '0');
	signal rst_count          : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_COL              : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_STARS_B          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_STARS_G          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_STARS_R          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VID              : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VIDEO_B          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VIDEO_G          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VIDEO_R          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_WAV_A0           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_A1           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_A2           : std_logic_vector(18 downto 0) := (others => '0');
	signal W_WAV_D0           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_WAV_D1           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_WAV_D2           : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_DAC              : std_logic_vector( 3 downto 0) := (others => '0');

	signal O_VGA_B            : std_logic_vector( 1 downto 0) := (others => '0');
	signal O_VGA_G            : std_logic_vector( 2 downto 0) := (others => '0');
	signal O_VGA_R            : std_logic_vector( 2 downto 0) := (others => '0');
	signal O_VGA_HSYNC		  : std_logic;
	signal O_VGA_VSYNC		  : std_logic;
	signal comp_sync_l		  : std_logic;
	signal dbl_scan        	  : std_logic;

	signal button_in        : std_logic_vector(15 downto 0);
	signal buttons          : std_logic_vector(15 downto 0);
	signal button_debounced : std_logic_vector(15 downto 0);
	signal joystick_reg     : std_logic_vector(5 downto 0);
	signal joystick2_reg    : std_logic_vector(5 downto 0);

begin
	mc_clocks : entity work.CLOCKGEN
	port map(
		CLKIN_IN   => CLK,
--		RST_IN     => not W_RESETn,
		RST_IN     => '0',
		O_CLK_36M  => W_CLK_36M,
		O_CLK_18M  => W_CLK_18M,
		O_CLK_12M  => W_CLK_12M, --WB_CLK_12M,
		O_CLK_06M  => W_CLK_6M,  --WB_CLK_6M,
		O_CLK_06Mn => W_CLK_6Mn
	);

	mc_vid : entity work.MC_VIDEO
	port map(
		I_CLK_18M     => W_CLK_18M,
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_H_CNT       => W_H_CNT,
		I_V_CNT       => W_V_CNT,
		I_H_FLIP      => W_H_FLIP,
		I_V_FLIP      => W_V_FLIP,
		I_V_BLn       => W_V_BLn,
		I_C_BLn       => W_C_BLn,
		I_A           => W_A(9 downto 0),
		I_OBJ_SUB_A   => "000",
		I_BD          => W_BDI,
		I_OBJ_RAM_RQ  => W_OBJ_RAM_RQ,
		I_OBJ_RAM_RD  => W_OBJ_RAM_RD,
		I_OBJ_RAM_WR  => W_OBJ_RAM_WR,
		I_VID_RAM_RD  => W_VID_RAM_RD,
		I_VID_RAM_WR  => W_VID_RAM_WR,
		I_DRIVER_WR   => W_DRIVER_WE,
		O_C_BLnX      => W_C_BLnX,
		O_8HF         => W_8HF,
		O_256HnX      => W_256HnX,
		O_1VF         => W_1VF,
		O_MISSILEn    => W_MISSILEn,
		O_SHELLn      => W_SHELLn,
		O_BD          => W_VID_DO,
		O_VID         => W_VID,
		O_COL         => W_COL
	);

	-- VGA scan doubler
	vga_scandbl : entity work.VGA_SCANDBL
	port map(
		-- input
		CLK     => W_CLK_6M,
		CLK_X2  => W_CLK_12M,
		I_R     => W_R,
		I_G     => W_G,
		I_B     => W_B(2 downto 1),
		I_HSYNC => W_H_SYNC,
		I_VSYNC => W_V_SYNC,
		-- output
		O_R     => O_VGA_R,
		O_G     => O_VGA_G,
		O_B     => O_VGA_B,
		O_HSYNC => O_VGA_HSYNC,
		O_VSYNC => O_VGA_VSYNC,
      scanlines    =>  scandblctrl(1) xor scanSW(8)		
	);

	cpu : entity work.T80as
	port map (
		RESET_n       => W_RESETn,
		CLK_n         => W_CPU_CLK,
		WAIT_n        => W_CPU_WAITn,
		INT_n         => '1',
		NMI_n         => W_CPU_NMIn,
		BUSRQ_n       => '1',
		MREQ_n        => W_CPU_MREQn,
		RD_n          => W_CPU_RDn,
		WR_n          => W_CPU_WRn,
		RFSH_n        => W_CPU_RFSHn,
		A             => W_A,
		DI            => W_BDO,
		DO            => W_BDI,
		M1_n          => open,
		IORQ_n        => open,
		HALT_n        => open,
		BUSAK_n       => open,
		DOE           => open
	);

	mc_cpu_ram : entity work.MC_CPU_RAM
	port map (
		I_CLK         => W_CPU_RAM_CLK,
		I_ADDR        => W_A(10 downto 0),
		I_D           => W_BDI,
		I_WE          => W_CPU_WR,
		I_OE          => W_CPU_RAM_RD,
		O_D           => W_CPU_RAM_DO
	);

	mc_adec : entity work.MC_ADEC
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_CPU_CLK     => W_CPU_CLK,
		I_RSTn        => W_RESETn,

		I_CPU_A       => W_A,
		I_CPU_D       => W_BDI(0),
		I_MREQn       => W_CPU_MREQn,
		I_RFSHn       => W_CPU_RFSHn,
		I_RDn         => W_CPU_RDn,
		I_WRn         => W_CPU_WRn,
		I_H_BL        => W_H_BL,
		I_V_BLn       => W_V_BLn,

		O_WAITn       => W_CPU_WAITn,
		O_NMIn        => W_CPU_NMIn,
		O_CPU_ROM_CS  => W_CPU_ROM_CS,
		O_CPU_RAM_RD  => W_CPU_RAM_RD,
--		O_CPU_RAM_WR  => W_CPU_RAM_WR,
		O_CPU_RAM_CS  => W_CPU_RAM_CS,
		O_OBJ_RAM_RD  => W_OBJ_RAM_RD,
		O_OBJ_RAM_WR  => W_OBJ_RAM_WR,
		O_OBJ_RAM_RQ  => W_OBJ_RAM_RQ,
		O_VID_RAM_RD  => W_VID_RAM_RD,
		O_VID_RAM_WR  => W_VID_RAM_WR,
		O_SW0_OE      => W_SW0_OE,
		O_SW1_OE      => W_SW1_OE,
		O_DIP_OE      => W_DIP_OE,
		O_WDR_OE      => W_WDR_OE,
		O_DRIVER_WE   => W_DRIVER_WE,
		O_SOUND_WE    => W_SOUND_WE,
		O_PITCH       => W_PITCH,
		O_H_FLIP      => W_H_FLIP,
		O_V_FLIP      => W_V_FLIP,
		O_BD_G        => W_BD_G,
		O_STARS_ON    => W_STARS_ON
	);

	-- active high buttons
	mc_inport : entity work.MC_INPORT
	port map (
		I_COIN1    => not button_debounced(8),  --not C1,   --  ACTIVE HI
		I_COIN2    => not button_debounced(15), --not C2,   --  ACTIVE HI
		I_1P_LE    => not button_debounced(2),  --not L1,   --  ACTIVE HI
		I_1P_RI    => not button_debounced(3),  --not R1,   --  ACTIVE HI
		I_1P_SH    => not button_debounced(4),  --not J1,   --  ACTIVE HI
		I_2P_LE    => not button_debounced(0),  --not L2,   --  ACTIVE HI (11)
		I_2P_RI    => not button_debounced(1),  --not R2,   --  ACTIVE HI (12)
		I_2P_SH    => not button_debounced(5),  --not J2,   --  ACTIVE HI (13)
		I_1P_START => not button_debounced(6),  --not S1,   --  ACTIVE HI
		I_2P_START => not button_debounced(7),  --not S2,   --  ACTIVE HI
		I_SW0_OE      => W_SW0_OE,
		I_SW1_OE      => W_SW1_OE,
		I_DIP_OE      => W_DIP_OE,
		O_D           => W_SW_DO
	);

	mc_hv : entity work.MC_HV_COUNT
	port map(
		I_CLK         => W_CLK_6M,
		I_RSTn        => W_RESETn,
		O_H_CNT       => W_H_CNT,
		O_H_SYNC      => W_H_SYNC_int,
		O_H_BL        => W_H_BL,
		O_V_CNT       => W_V_CNT,
		O_V_SYNC      => W_V_SYNC_int,
		O_V_BL2n      => W_V_BL2n,
		O_V_BLn       => W_V_BLn,
		O_C_BLn       => W_C_BLn
	);

	mc_col_pal : entity work.MC_COL_PAL
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_VID         => W_VID,
		I_COL         => W_COL,
		I_C_BLnX      => W_C_BLnX,
		O_C_BLXn      => W_C_BLXn,
		O_STARS_OFFn  => W_STARS_OFFn,
		O_R           => W_VIDEO_R,
		O_G           => W_VIDEO_G,
		O_B           => W_VIDEO_B
	);

	mc_stars : entity work.MC_STARS
	port map (
		I_CLK_18M     => W_CLK_18M,
		I_CLK_6M      => W_CLK_6M,
		I_H_FLIP      => W_H_FLIP,
		I_V_SYNC      => W_V_SYNC_int,
		I_8HF         => W_8HF,
		I_256HnX      => W_256HnX,
		I_1VF         => W_1VF,
		I_2V          => W_V_CNT(1),
		I_STARS_ON    => W_STARS_ON,
		I_STARS_OFFn  => W_STARS_OFFn,
		O_R           => W_STARS_R,
		O_G           => W_STARS_G,
		O_B           => W_STARS_B,
		O_NOISE       => open
	);

	mc_sound_a : entity work.MC_SOUND_A
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_H_CNT1      => W_H_CNT(1),
		I_BD          => W_BDI,
		I_PITCH       => W_PITCH,
		I_VOL1        => W_VOL1,
		I_VOL2        => W_VOL2,
		O_SDAT        => W_SDAT_A,
		O_DO          => open
	);

	vmc_sound_b : entity work.MC_SOUND_B
	port map(
		I_CLK1        => W_CLK_6M,
		I_RSTn        => rst_count(3),
		I_SW          => new_sw,
		I_DAC         => W_DAC,
		I_FS          => W_FS,
		O_SDAT        => W_SDAT_B
	);

	wav_dac_a : entity work.dac
	port map(
		clk_i   => W_CLK_18M,
		res_n_i => W_RESETn,
		dac_i   => W_SDAT_A,
		dac_o   => W_DAC_A
	);

	wav_dac_b : entity work.dac
	port map(
		clk_i   => W_CLK_18M,
		res_n_i => W_RESETn,
		dac_i   => W_SDAT_B,
		dac_o   => W_DAC_B
	);

	O_AUDIO_L <= W_DAC_A;
	O_AUDIO_R <= W_DAC_B;
	
--------- ROM           -------------------------------------------------------
	mc_roms : entity work.ROM_PGM_0
	port map (
		CLK  => W_CLK_12M,
		ADDR => W_A(13 downto 0),
		DATA => W_CPU_ROM_DO,
		ENA  => '1'
	);

-------- VIDEO  -----------------------------
	blx_comb <= not ( W_C_BLXn and W_V_BL2n );
	W_V_SYNC <= not W_V_SYNC_int;
	W_H_SYNC <= not W_H_SYNC_int;
	O_CMPBL  <= W_C_BLnX;
	
	-- MISSILE => Yellow ;
	-- SHELL   => White  ;
	W_MS_D <= not (W_MISSILEn and W_SHELLn);
	W_MS_R <= not   blx_comb  and W_MS_D;
	W_MS_G <= not   blx_comb  and W_MS_D;
	W_MS_B <= not   blx_comb  and W_MS_D and not W_SHELLn ;

	W_R <= W_VIDEO_R or (W_STARS_R & "0") or (W_MS_R & W_MS_R & "0");
	W_G <= W_VIDEO_G or (W_STARS_G & "0") or (W_MS_G & W_MS_G & "0");
	W_B <= W_VIDEO_B or (W_STARS_B & "0") or (W_MS_B & W_MS_B & "0");

	process(W_CLK_6M)
	begin
		if rising_edge(W_CLK_6M) then
			HBLANK   <= not W_C_BLXn;
			VBLANK   <= not W_V_BL2n;
		end if;
	end process;


-----  CPU I/F  -------------------------------------

	W_CPU_CLK     <= W_H_CNT(0);
	W_CPU_RAM_CLK <= W_CLK_12M and W_CPU_RAM_CS;

	W_CPU_ROM_DOB <= W_CPU_ROM_DO when W_CPU_ROM_CS = '1' else (others=>'0');

	W_RESETn  <= not I_RESET;
	W_BDO     <= W_SW_DO  or W_VID_DO or W_CPU_RAM_DO or W_CPU_ROM_DOB ;
	W_CPU_WR  <= not W_CPU_WRn;

	new_sw <= (W_FS(2) or W_FS(1) or W_FS(0)) & W_HIT & W_FIRE;

	process(W_CPU_CLK, I_RESET)
	begin
		if (I_RESET = '1') then
			rst_count <= (others => '0');
		elsif rising_edge( W_CPU_CLK) then
			if ( rst_count /= x"f") then
				rst_count <= rst_count + 1;
			end if;
		end if;
	end process;

-----  Parts 9L ---------
	process(W_CLK_12M, I_RESET)
	begin
		if (I_RESET = '1') then
			W_FS   <= (others=>'0');
			W_HIT  <= '0';
			W_FIRE <= '0';
			W_VOL1 <= '0';
			W_VOL2 <= '0';
		elsif rising_edge(W_CLK_12M) then
			if (W_SOUND_WE = '1') then
				case(W_A(2 downto 0)) is
					when "000" => W_FS(0) <= W_BDI(0);
					when "001" => W_FS(1) <= W_BDI(0);
					when "010" => W_FS(2) <= W_BDI(0);
					when "011" => W_HIT   <= W_BDI(0);
--					when "100" => UNUSED  <= W_BDI(0);
					when "101" => W_FIRE  <= W_BDI(0);
					when "110" => W_VOL1  <= W_BDI(0);
					when "111" => W_VOL2  <= W_BDI(0);
					when others => null;
				end case;
			end if;
		end if;
	end process;

-----  Parts 9M ---------
	process(W_CLK_12M, I_RESET)
	begin
		if (I_RESET = '1') then
			W_DAC   <= (others=>'0');
		elsif rising_edge(W_CLK_12M) then
			if (W_DRIVER_WE = '1') then
				case(W_A(2 downto 0)) is
					-- next 4 outputs go off board via ULN2075 buffer
--					when "000" => 1P START  <= W_BDI(0);
--					when "001" => 2P START  <= W_BDI(0);
--					when "010" => COIN LOCK <= W_BDI(0);
--					when "011" => COIN CTR  <= W_BDI(0);
					when "100" => W_DAC(0)  <= W_BDI(0); --   1M
					when "101" => W_DAC(1)  <= W_BDI(0); -- 470K
					when "110" => W_DAC(2)  <= W_BDI(0); -- 220K
					when "111" => W_DAC(3)  <= W_BDI(0); -- 100K
					when others => null;
				end case;
			end if;
		end if;
	end process;

-------------------------------------------------------------------------------
  I_RESET <= resetKey;
  PCLK <= W_CLK_18M;
  joystick_reg  <= I_JOYSTICK_A;
  joystick2_reg <= I_JOYSTICK_B;
  JOYSTICK_A_GND <= '0';
  JOYSTICK_B_GND <= '0';
  
  button_in(15) <= I_COIN(1) and not scanSW(20);   --ic2
  button_in(8)  <= I_COIN(0) and not scanSW(13);   --ic1
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

  mc_debounce : entity work.GALAXIAN_DEBOUNCE
  generic map (
    G_WIDTH => 16
    )
  port map (
    I_BUTTON => buttons, --button_in,
    O_BUTTON => button_debounced,
    CLK      => W_CLK_18M
    );

-------- VIDEO  -----------------------------
  dbl_scan <=  scandblctrl(0) xor scanSW(6); -- 1 = VGAS  0 = RGB

  p_comp_sync : process(W_H_SYNC, W_V_SYNC)
   begin
    comp_sync_l <= W_V_SYNC and  W_H_SYNC; --W_V_SYNC and  W_H_SYNC; (not W_V_SYNC) and (not W_H_SYNC);
   end process;

  
  p_video_ouput : process(W_CLK_36M)
  begin
    if rising_edge(W_CLK_36M) then	
     if (dbl_scan = '1') then	 
-- con scandoubler
		O_HSYNC <= O_VGA_HSYNC;
		O_VSYNC <= O_VGA_VSYNC;

		O_VIDEO_R(2 downto 0) <= O_VGA_R(2) & O_VGA_R(1) & O_VGA_R(0);
		O_VIDEO_G(2 downto 0) <= O_VGA_G(2) & O_VGA_G(1) & O_VGA_G(0);
		O_VIDEO_B(2 downto 0) <= O_VGA_B(1) & O_VGA_B(0) & '0';
	  else
-- sin scandoubler
		O_HSYNC <= comp_sync_l;
		O_VSYNC <= '1';

		O_VIDEO_R(2 downto 0) <= W_R(2) & W_R(1) & W_R(0);
		O_VIDEO_G(2 downto 0) <= W_G(2) & W_G(1) & W_G(0);
		O_VIDEO_B(2 downto 0) <= W_B(2) & W_B(1) & W_B(0);
    end if;
	end if;
  end process;	



end RTL;
