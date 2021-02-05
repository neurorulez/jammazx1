------------------------------------------------------------------------------
-- Arcade ZX-UNO Jamma port by Neuro based on the Quest 2017 code
------------------------------------------------------------------------------
-- FPGA GALAXIAN TOP
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
	--
	-- 	HARDWARE SELECTOR
	--		TRUE = galaxian hardware
	-- 	FALSE = mrdo's nightmare
	--
	constant HWSEL_GALAXIAN : 	boolean := TRUE;

	--    CPU ADDRESS BUS
	signal W_A                : std_logic_vector(15 downto 0) := (others => '0');
	--    CPU IF
	signal W_CPU_CLK          : std_logic := '0';
	signal W_CPU_MREQn        : std_logic := '0';
	signal W_CPU_NMIn         : std_logic := '0';
	signal W_CPU_RDn          : std_logic := '0';
	signal W_CPU_RESETn       : std_logic := '0';
	signal W_CPU_RFSHn        : std_logic := '0';
	signal W_CPU_WAITn        : std_logic := '0';
	signal W_CPU_WRn          : std_logic := '0';
	signal W_RESETn           : std_logic := '0';
	signal W_ROM_SWP          : std_logic := '0';
	-------- CLOCK GEN ---------------------------
	signal W_CLK_12M          : std_logic := '0';
	signal W_CLK_18M          : std_logic := '0';
	signal W_CLK_36M          : std_logic := '0';
	signal W_CLK_6M           : std_logic := '0';
	signal W_CLK_6Mn          : std_logic := '0';
	signal WB_CLK_12M         : std_logic := '0';
	signal WB_CLK_6M          : std_logic := '0';
	-------- H and V COUNTER -------------------------
	signal W_C_BLn            : std_logic := '0';
	signal W_C_BLnX           : std_logic := '0';
	signal W_C_BLX            : std_logic := '0';
	signal W_H_BL             : std_logic := '0';
	signal W_H_SYNC           : std_logic := '0';
	signal W_V_BLn            : std_logic := '0';
	signal W_V_BL2n           : std_logic := '0';
	signal W_V_SYNC           : std_logic := '0';
	signal W_H_CNT            : std_logic_vector(8 downto 0) := (others => '0');
	signal W_V_CNT            : std_logic_vector(7 downto 0) := (others => '0');
	-------- CPU RAM  ----------------------------
	signal W_CPU_RAM_DO       : std_logic_vector(7 downto 0) := (others => '0');
	-------- ADDRESS DECDER ----------------------
	signal W_BD_G             : std_logic := '0';
	signal W_CPU_RAM_CSn      : std_logic := '0';
	signal W_CPU_RAM_RDn      : std_logic := '0';
	signal W_CPU_RAM_WRn      : std_logic := '0';
	signal W_CPU_ROM_CSn      : std_logic := '0';
	signal W_DIP_OEn          : std_logic := '0';
	signal W_H_FLIP           : std_logic := '0';
	signal W_LAMP_WEn         : std_logic := '0';
	signal W_OBJ_RAM_RDn      : std_logic := '0';
	signal W_OBJ_RAM_RQn      : std_logic := '0';
	signal W_OBJ_RAM_WRn      : std_logic := '0';
	signal W_PITCHn           : std_logic := '0';
	signal W_SOUND_WEn        : std_logic := '0';
	signal W_STARS_ON         : std_logic := '0';
	signal W_STARS_OFFn       : std_logic := '0';
	signal W_SW0_OEn          : std_logic := '0';
	signal W_SW1_OEn          : std_logic := '0';
	signal W_V_FLIP           : std_logic := '0';
	signal W_VID_RAM_RDn      : std_logic := '0';
	signal W_VID_RAM_WRn      : std_logic := '0';
	signal W_WDR_OEn          : std_logic := '0';
	--------- INPORT -----------------------------
	signal W_SW_DO            : std_logic_vector( 7 downto 0) := (others => '0');
	--------- VIDEO  -----------------------------
	signal W_VID_DO           : std_logic_vector( 7 downto 0) := (others => '0');
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
	--signal W_FS3              : std_logic := '0';
	--signal W_FS2              : std_logic := '0';
	--signal W_FS1              : std_logic := '0';
	signal W_FS               : std_logic_vector( 2 downto 0) := (others => '0');
	-----  BTTONS  -------------------------------------
	--signal C1                 : std_logic := '0';
	--signal C2                 : std_logic := '0';
	--signal D1                 : std_logic := '0';
	--signal D2                 : std_logic := '0';
	--signal J1                 : std_logic := '0';
	--signal J2                 : std_logic := '0';
	--signal L1                 : std_logic := '0';
	--signal L2                 : std_logic := '0';
	--signal R1                 : std_logic := '0';
	--signal R2                 : std_logic := '0';
	--signal S1                 : std_logic := '0';
	--signal S2                 : std_logic := '0';
	--signal U1                 : std_logic := '0';
	--signal U2                 : std_logic := '0';

	signal blx_comb           : std_logic := '0';
	signal W_1VF              : std_logic := '0';
	signal W_256HnX           : std_logic := '0';
	signal W_8HF              : std_logic := '0';
	signal W_DAC              : std_logic := '0';
	signal W_MISSILEn         : std_logic := '0';
	signal W_SHELLn           : std_logic := '0';
	signal ZMWR               : std_logic := '0';

	signal new_sw             : std_logic_vector( 2 downto 0) := (others => '0');
	signal on_game            : std_logic_vector( 1 downto 0) := (others => '0');
	signal rst_count          : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_9L_Q             : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_COL              : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_B                : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_G                : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_R                : std_logic_vector( 2 downto 0) := (others => '0');
	signal O_AUDIO            : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_STARS_B          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_STARS_G          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_STARS_R          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VGA_B            : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VGA_G            : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VGA_R            : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VID              : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VIDEO_B          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_VIDEO_G          : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_VIDEO_R          : std_logic_vector( 2 downto 0) := (others => '0');
	signal O_VGA_HSYNC		  : std_logic;
	signal O_VGA_VSYNC		  : std_logic;
	signal comp_sync_l		  : std_logic;
	signal dbl_scan        	  : std_logic;

	signal PSG_EN             : std_logic;
	signal PSG_D              : std_logic_vector(7 downto 0);
	signal PSG_A,PSG_B,PSG_C  : std_logic_vector(7 downto 0);
	
--	signal resetKey : std_logic;
--	signal resetClk : std_logic;
--	signal master_reset : std_logic;
--	signal scanSW   : std_logic_vector(13 downto 0);

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
		O_CLK_12M  => WB_CLK_12M,
		O_CLK_06M  => WB_CLK_6M,
		O_CLK_06Mn => W_CLK_6Mn
	);

	cpu : entity work.T80as
		port map (
			RESET_n => W_CPU_RESETn,
			CLK_n   => W_CPU_CLK,
			WAIT_n  => W_CPU_WAITn,
			INT_n   => '1',
			NMI_n   => W_CPU_NMIn,
			BUSRQ_n => '1',
			M1_n    => open,
			MREQ_n  => W_CPU_MREQn,
			IORQ_n  => open,
			RD_n    => W_CPU_RDn,
			WR_n    => W_CPU_WRn,
			RFSH_n  => W_CPU_RFSHn,
			HALT_n  => open,
			BUSAK_n => open,
			A       => W_A,
			DI      => W_BDO,
			DO      => W_BDI,
			DOE     => open
		);

	mc_cpu_ram : entity work.MC_CPU_RAM
	port map (
		I_CLK  => W_CPU_RAM_CLK,
		I_ADDR => W_A(9 downto 0),
		I_D    => W_BDI,
		I_WE   => not W_CPU_WRn,
		I_OE   => not W_CPU_RAM_RDn,
		O_D    => W_CPU_RAM_DO
	);

	mc_adec : entity work.MC_ADEC
	port map(
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_CPU_CLK     => W_H_CNT(0),
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
		O_CPU_ROM_CSn => W_CPU_ROM_CSn,
		O_CPU_RAM_RDn => W_CPU_RAM_RDn,
		O_CPU_RAM_WRn => W_CPU_RAM_WRn,
		O_CPU_RAM_CSn => W_CPU_RAM_CSn,
		O_OBJ_RAM_RDn => W_OBJ_RAM_RDn,
		O_OBJ_RAM_WRn => W_OBJ_RAM_WRn,
		O_OBJ_RAM_RQn => W_OBJ_RAM_RQn,
		O_VID_RAM_RDn => W_VID_RAM_RDn,
		O_VID_RAM_WRn => W_VID_RAM_WRn,
		O_SW0_OEn     => W_SW0_OEn,
		O_SW1_OEn     => W_SW1_OEn,
		O_DIP_OEn     => W_DIP_OEn,
		O_WDR_OEn     => W_WDR_OEn,
		O_LAMP_WEn    => W_LAMP_WEn,
		O_SOUND_WEn   => W_SOUND_WEn,
		O_PITCHn      => W_PITCHn,
		O_H_FLIP      => W_H_FLIP,
		O_V_FLIP      => W_V_FLIP,
		O_BD_G        => W_BD_G,
		O_ROM_SWP     => W_ROM_SWP,
		O_STARS_ON    => W_STARS_ON
	);

	mc_inport : entity work.MC_INPORT
	port map (
		I_COIN1    => not button_debounced(8),  --not C1,   --  ACTIVE HI
		I_COIN2    => not button_debounced(15), --not C2,   --  ACTIVE HI
		I_1P_LE    => not button_debounced(2),  --not L1,   --  ACTIVE HI
		I_1P_RI    => not button_debounced(3),  --not R1,   --  ACTIVE HI
		I_1P_SH    => not button_debounced(4),  --not J1,   --  ACTIVE HI
		I_2P_LE    => not button_debounced(0),  --not L2,   --  ACTIVE HI (11)
		I_2P_RI    => not button_debounced(1),  --not R2,   --  ACTIVE HI (12)
		I_2P_SH    => not button_debounced(4),  --not J2,   --  ACTIVE HI (13)
		I_1P_START => not button_debounced(6),  --not S1,   --  ACTIVE HI
		I_2P_START => not button_debounced(7),  --not S2,   --  ACTIVE HI
		I_SW0_OEn  => W_SW0_OEn,
		I_SW1_OEn  => W_SW1_OEn,
		I_DIP_OEn  => W_DIP_OEn,
		O_D        => W_SW_DO
	);

	u_rom : entity work.ROM_PGM_0
	port map (
		CLK  => W_CLK_12M,
		ADDR => W_A(13) & (W_A(12) xor (W_ROM_SWP and W_A(13))) & W_A(11 downto 0),
		DATA => W_CPU_ROM_DO,
		ENA  => '1'
	);

	mc_hv : entity work.MC_HV_COUNT
	port map(
		I_CLK    => WB_CLK_6M,
		I_RSTn   => W_RESETn,
		O_H_CNT  => W_H_CNT,
		O_H_SYNC => W_H_SYNC,
		O_H_BL   => W_H_BL,
		O_V_CNT  => W_V_CNT,
		O_V_SYNC => W_V_SYNC,
		O_V_BL2n => W_V_BL2n,
		O_V_BLn  => W_V_BLn,
		O_C_BLn  => W_C_BLn
	);

	mc_vid : entity work.MC_VIDEO
	port map(
		I_CLK_18M     => W_CLK_18M,
		I_CLK_12M     => W_CLK_12M,
		I_CLK_6M      => W_CLK_6M,
		I_CLK_6Mn     => W_CLK_6Mn,
		I_H_CNT       => W_H_CNT,
		I_V_CNT       => W_V_CNT,
		I_H_FLIP      => W_H_FLIP,
		I_V_FLIP      => W_V_FLIP,
		I_V_BLn       => W_V_BLn,
		I_C_BLn       => W_C_BLn,
		I_A           => W_A(9 downto 0),
		I_BD          => W_BDI,
		I_OBJ_RAM_RQn => W_OBJ_RAM_RQn,
		I_OBJ_RAM_RDn => W_OBJ_RAM_RDn,
		I_OBJ_RAM_WRn => W_OBJ_RAM_WRn,
		I_VID_RAM_RDn => W_VID_RAM_RDn,
		I_VID_RAM_WRn => W_VID_RAM_WRn,
		O_C_BLnX      => W_C_BLnX,
		O_BD          => W_VID_DO,
		O_VID         => W_VID,
		O_COL         => W_COL
	);

	mc_col_pal : entity work.MC_COL_PAL
	port map(
		I_CLK_12M    => W_CLK_12M,
		I_CLK_6M     => W_CLK_6M,
		I_VID        => W_VID,
		I_COL        => W_COL,
		I_C_BLnX     => W_C_BLnX,
		O_C_BLX      => W_C_BLX,
		O_STARS_OFFn => W_STARS_OFFn,
		O_R          => W_R,
		O_G          => W_G,
		O_B          => W_B
	);

	-- VGA scan doubler
	vga_scandbl : entity work.VGA_SCANDBL
	port map(
		-- input
		CLK     => W_CLK_6M,
		CLK_X2  => W_CLK_12M,
		I_R     => W_R,
		I_G     => W_G,
		I_B     => W_B,
		I_HSYNC => W_H_SYNC,
		I_VSYNC => W_V_SYNC,
		-- output
		O_R     => W_VGA_R,
		O_G     => W_VGA_G,
		O_B     => W_VGA_B,
		O_HSYNC => O_VGA_HSYNC,
		O_VSYNC => O_VGA_VSYNC,
      scanlines    =>  scandblctrl(1) xor scanSW(8)		
	);


	wav_dac_a : entity work.dac
	port map(
		clk_i   => W_CLK_18M,
		res_n_i => W_RESETn,
		dac_i   => O_AUDIO,
		dac_o   => W_DAC
	);

	
--------------------------------
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

	blx_comb <= W_C_BLX or (not W_V_BL2n);

  p_comp_sync : process(W_H_SYNC, W_V_SYNC)
   begin
    comp_sync_l <= (not W_V_SYNC) and (not W_H_SYNC);
   end process;

  
  p_video_ouput : process(W_CLK_36M)
  begin
    if rising_edge(W_CLK_36M) then	
     if (dbl_scan = '1') then	 
-- con scandoubler
		O_HSYNC <= O_VGA_HSYNC;
		O_VSYNC <= O_VGA_VSYNC;

		O_VIDEO_R(2 downto 0) <= W_VGA_R(0) & W_VGA_R(1) & W_VGA_R(2);
		O_VIDEO_G(2 downto 0) <= W_VGA_G(0) & W_VGA_G(1) & W_VGA_G(2);
		O_VIDEO_B(2 downto 0) <= W_VGA_B(0) & W_VGA_B(1) & '0';
	  else
-- sin scandoubler
		O_HSYNC <= comp_sync_l;
		O_VSYNC <= '1';

		O_VIDEO_R(2 downto 0) <= W_R(0) & W_R(1) & W_R(2);
		O_VIDEO_G(2 downto 0) <= W_G(0) & W_G(1) & W_G(2);
		O_VIDEO_B(2 downto 0) <= W_B(0) & W_B(1) & '0';
    end if;
	end if;
  end process;	
  
-----  CPU I/F  -------------------------------------

	W_CPU_RESETn  <= W_RESETn;
	W_CPU_CLK     <= W_H_CNT(0);
	W_CPU_RAM_CLK <= W_CLK_12M and (not W_CPU_RAM_CSn);

	W_CPU_ROM_DOB <= x"00" when W_CPU_ROM_CSn = '1' else W_CPU_ROM_DO ;

	W_CLK_12M <= WB_CLK_12M;
	W_CLK_6M  <= WB_CLK_6M;
--	W_RESETn  <= I_SW(8) or I_SW(7) or I_SW(6)     or I_SW(5);
--	W_RESETn  <= '1';
	W_RESETn  <= not resetKey;
	W_BDO     <= W_SW_DO  or W_VID_DO or W_CPU_RAM_DO or W_CPU_ROM_DOB ;


---------- SOUND I/F -----------------------------
	O_AUDIO_L <= W_DAC;
	O_AUDIO_R <= W_DAC;

-------------------------------------------------------------------------------

	PSG_EN <= '1' when W_A(15 downto 11) = "01001" and W_A(9) = '0' and W_CPU_MREQn = '0' and W_CPU_WRn = '0' else '0';
	
	process(W_CPU_CLK)
	begin
		if rising_edge(W_CPU_CLK) then
			if PSG_EN = '1' and W_A(8) = '1' then
				PSG_D <= W_A(7 downto 0);
			end if;
		end if;
	end process;

	--O_AUDIO <= ("00" & PSG_A) + ("00" & PSG_B) + ("00" & PSG_C);
	-- O_AUDIO <= PSG_A + PSG_B + PSG_C;
	
	--psg : entity ym2149
	--port map
	--(
	--	CLK       => W_CPU_CLK,
	--	CE        => '1',
	--	RESET     => not W_RESETn,

	--	BDIR      => PSG_EN and W_A(0) and not W_A(8),
	--	BC        => W_A(1),
	--	DI        => PSG_D,

	--	CHANNEL_A => PSG_A,
	--	CHANNEL_B => PSG_B,
	--	CHANNEL_C => PSG_C
	--);

ym2149 : entity work.ym2149
port map (
-- data bus
	I_DA            => PSG_D,
	O_DA            => open,
	O_DA_OE_L       => open, 
-- control
	I_A9_L          => '0',
	I_A8            => '1',
	I_BDIR          => PSG_EN and W_A(0) and not W_A(8),
	I_BC            => W_A(1),
	I_SEL_L         => '1', 
-- audio
	O_AUDIO         => O_AUDIO,
-- port a
	I_IOA           => "11111111",
	O_IOA           => open,
	O_IOA_OE_L      => open,
-- port b
	I_IOB           => "11111111",
	O_IOB           => open,
	O_IOB_OE_L      => open,

	ENA             => '1',     
	RESET_L         => W_RESETn,--'1',
	CLK             => W_CPU_CLK
);


-------------------------------------------------------------------------------


end RTL;
