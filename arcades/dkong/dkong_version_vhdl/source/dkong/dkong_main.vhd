--	(c) 2012 d18c7db(a)hotmail
--
-- Originally by Katsumi Degawa in Verilog
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

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity dkong_main is
	port(
		-- FPGA_USE
		I_CLK_24576M	: in  std_logic;
		I_RESETn			: in  std_logic;

		-- ROM IF
		O_ROM_AB			: out std_logic_vector(17 downto 0);
		I_ROM_DB			: in  std_logic_vector( 7 downto 0);
		O_ROM_CSn		: out std_logic;
		O_ROM_OEn		: out std_logic;
		O_ROM_WEn		: out std_logic;

		I_JOYSTICK_A          : in    std_logic_vector(5 downto 0);
		I_JOYSTICK_B          : in    std_logic_vector(5 downto 0);
		I_PLAYER	       		 : in    std_logic_vector(1 downto 0);
		I_COIN	       	    : in    std_logic_vector(1 downto 0);
		scanSW			   	 : in    std_logic_vector(20 downto 0);
		tv15khz               : in    std_logic;
		scanlines             : in    std_logic;
		-- SOUND IF
		O_SOUND_OUT_L	: out std_logic;
		O_SOUND_OUT_R	: out std_logic;

		-- VGA (VIDEO) IF
		O_VGA_R			: out std_logic_vector( 2 downto 0);
		O_VGA_G			: out std_logic_vector( 2 downto 0);
		O_VGA_B			: out std_logic_vector( 2 downto 0);
		O_VGA_CSYNC    : out std_logic;
		O_VGA_HSYNC		: out std_logic;
		O_VGA_INT	   : out std_logic;
		O_VGA_VSYNC		: out std_logic
	);
end dkong_main;

architecture RTL of dkong_main is
	constant conf_cnt		: std_logic_vector(12 downto 0) := "1001011111111";	-- x12FF

	signal I8035_ALE			: std_logic := '0';
	signal I8035_INTn			: std_logic := '1';
	signal I8035_PSENn		: std_logic := '1';
	signal I8035_RDn			: std_logic := '0';
	signal I8035_RSTn			: std_logic := '1';
	signal I8035_T0			: std_logic := '0';
	signal I8035_T1			: std_logic := '0';
	signal W_2PSL				: std_logic := '0';
	signal WB_CLK_03072M		: std_logic := '0';
	signal WB_CLK_06144M		: std_logic := '0';
	signal WB_CLK_12288M		: std_logic := '0';
	signal W_CLK_12288M		: std_logic := '0';
	signal W_CNF_EN			: std_logic := '0';
	signal W_CPU_BUSRQn		: std_logic := '1';
	signal W_CPU_M1n			: std_logic := '1';
	signal W_CPU_MREQn		: std_logic := '1';
	signal W_CPU_NMIn			: std_logic := '1';
	signal W_CPU_RDn			: std_logic := '1';
	signal W_CPU_RFSHn		: std_logic := '1';
	signal W_CPU_WAITn		: std_logic := '1';
	signal W_CPU_WRn			: std_logic := '1';
	signal W_C_BLANKn			: std_logic := '1';
	signal W_DIP_OEn			: std_logic := '1';
	signal W_FLIP_HV			: std_logic := '0';
	signal W_FLIP_VRAM		: std_logic := '0';
	signal W_FLIPn				: std_logic := '1';
	signal W_H_SYNCn			: std_logic := '1';
	signal W_L_CMPBLKn		: std_logic := '1';
	signal W_OBJ_RDn			: std_logic := '1';
	signal W_OBJ_RQn			: std_logic := '1';
	signal W_OBJ_WRn			: std_logic := '1';
	signal W_RAM1_CSn			: std_logic := '1';
	signal W_RAM3_CSn			: std_logic := '1';
	signal W_ROM_CSn			: std_logic := '1';
	signal W_SW1_OEn			: std_logic := '1';
	signal W_SW2_OEn			: std_logic := '1';
	signal W_SW3_OEn			: std_logic := '1';
	signal W_VRAMBUSYn		: std_logic := '1';
	signal W_VRAM_RDn			: std_logic := '1';
	signal W_VRAM_WRn			: std_logic := '1';
	signal W_V_BLANKn			: std_logic := '1';
	signal W_V_SYNCn			: std_logic := '1';
	signal W_W0_WE				: std_logic := '0';
	signal W_W1_WE				: std_logic := '0';
	signal W_W2_WE				: std_logic := '0';
	signal W_W3_WE				: std_logic := '0';
	signal W_W4_WE				: std_logic := '0';
	signal mix_sound			: std_logic := '0';

	signal I8035_DBI			: std_logic_vector( 7 downto 0) := (others => '0');
	signal I8035_DBO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal I8035_PAI			: std_logic_vector( 7 downto 0) := (others => '0');
	signal I8035_PBI			: std_logic_vector( 7 downto 0) := (others => '0');
	signal I8035_PBO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal OBJ_ROM1_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	signal OBJ_ROM2_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	signal OBJ_ROM3_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	signal OBJ_ROM4_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	signal OBJ_ROM_A			: std_logic_vector(11 downto 0) := (others => '0');
	signal R_AD					: std_logic_vector(12 downto 0) := (others => '0');
	signal VID_ROM1_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	signal VID_ROM2_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	signal VID_ROM_A			: std_logic_vector(11 downto 0) := (others => '0');
	signal WAV_ROM_A			: std_logic_vector(17 downto 0) := (others => '0');
	signal WAV_ROM_DO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal WB_ROM_DO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_3D_Q				: std_logic_vector( 3 downto 0) := (others => '0');
	signal W_5H_Q				: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6H_Q				: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_B					: std_logic_vector( 1 downto 0) := (others => '0');
	signal W_CPU_A				: std_logic_vector(15 downto 0) := (others => '0');
	signal W_DIP				: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_D_S_DAT			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_G					: std_logic_vector( 2 downto 0) := (others => '0');
	signal W_H_CNT				: std_logic_vector( 9 downto 0) := (others => '0');
	signal W_OBJ_AB			: std_logic_vector( 9 downto 0) := (others => '0');
	signal W_OBJ_DAT			: std_logic_vector( 5 downto 0) := (others => '0');
	signal W_OBJ_DI			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_R					: std_logic_vector( 2 downto 0) := (others => '0');
	signal W_RAM1_DO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_RAM2_DO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_RAM3_DO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_SW1				: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_SW2				: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_SW3				: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VC_A				: std_logic_vector(15 downto 0) := (others => '0');
	signal W_VF_CNT			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VRAM_COL			: std_logic_vector( 3 downto 0) := (others => '0');
	signal W_VRAM_DAT			: std_logic_vector( 5 downto 0) := (others => '0');
	signal W_VRAM_DB			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VRAM_VID			: std_logic_vector( 1 downto 0) := (others => '0');
	signal W_SOUND_CNT		: std_logic_vector( 3 downto 0) := (others => '0');
	signal W_CPU_DO			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_CPU_DI			: std_logic_vector( 7 downto 0) := (others => '0');
	signal clk_d				: std_logic_vector( 1 downto 0) := (others => '0');
	signal dac_di				: std_logic_vector( 8 downto 0) := (others => '0');
	signal phase				: std_logic_vector( 3 downto 0) := (others => '0');
	signal rgb_in				: std_logic_vector(15 downto 0) := (others => '0');
	signal rgb_out				: std_logic_vector(15 downto 0) := (others => '0');
	signal sound_mix			: std_logic_vector( 8 downto 0) := (others => '0');
	signal O_VGA_H_SYNCn	   : std_logic;
	signal O_VGA_V_SYNCn	   : std_logic;

		-- INPORT SW IF
	signal 	I_U1				: std_logic;
	signal 	I_D1				: std_logic;
	signal 	I_L1				: std_logic;
	signal 	I_R1				: std_logic;
	signal 	I_J1				: std_logic;
	signal 	I_U2				: std_logic;
	signal 	I_D2				: std_logic;
	signal 	I_L2				: std_logic;
	signal 	I_R2				: std_logic;
	signal 	I_J2				: std_logic;
	signal 	I_S1				: std_logic;
	signal 	I_S2				: std_logic;
	signal 	I_C1				: std_logic;
-- keyboard to joystick
signal button_in        : std_logic_vector(15 downto 0);
signal buttons	       : std_logic_vector(15 downto 0);
signal button_debounced : std_logic_vector(15 downto 0);
signal joystick_reg     : std_logic_vector(5 downto 0);
signal joystick2_reg     : std_logic_vector(5 downto 0);

begin
	------- SW Interface --|---------------------------------------------------------
	--                     |  B7     B6     B5     B4     B3     B2     B1     B0
	-----------------------|---------------------------------------------------------
	-- 7C00(R)   sw1(MAIN) |                       JUMP   DOWN   UP     LEFT   RIGHT
	W_SW1						<=   "1" &  "1" &  "1" & I_J1 & I_D1 & I_U1 & I_L1 & I_R1;
	-----------------------|---------------------------------------------------------
	-- 7C80(R)   sw2(SUB ) |                       JUMP   DOWN   UP     LEFT   RIGHT
	W_SW2						<=   "1" &  "1" &  "1" & I_J2 & I_D2 & I_U2 & I_L2 & I_R2;
	-----------------------|---------------------------------------------------------
	-- 7D00(R)   sw3(    ) |  COIN                        2P     1P
	W_SW3						<=  I_C1 &  "1" &  "1" &  "1" & I_S2 & I_S1 &  "1" &  "1";
	-----------------------|---------------------------------------------------------
	-- 7D80(R)   DIP       |
	W_DIP						<=   "1" &  "0" &  "0" &  "0" &  "0" &  "0" &  "0" &  "0";
	--     DIP_LIVES    3  |                                             0      0
	--                  4  |                                             0      1
	--                  5  |                                             1      0
	--                  6  |                                             1      1
	--     DIP_BONUS  7000 |                               0      0
	--               10000 |                               0      1
	--               15000 |                               1      0
	--               20000 |                               1      1
	--     DIP_COIN    1/1 |          0      0      0
	--                 1/2 |          0      1      0
	--                 1/3 |          1      0      0
	--                 1/4 |          1      1      0
	--                 2/1 |          0      0      1
	--                 3/1 |          0      1      1
	--                 4/1 |          1      0      1
	--                 5/1 |          1      1      1
	--             Table   |   0
	--             Upright |   1

	CLK3M  : BUFG port map (I => W_H_CNT(1),   O => WB_CLK_03072M); --  3.072MHz
	CLK6M  : BUFG port map (I => W_H_CNT(0),   O => WB_CLK_06144M); --  6.144MHz
	CLK12M : BUFG port map (I => W_CLK_12288M, O => WB_CLK_12288M); -- 12.288MHz

	-- CPU data mux
	W_CPU_DI <= 
		not W_SW1 when W_SW1_OEn  = '0' else
		not W_SW2 when W_SW2_OEn  = '0' else
		not W_SW3 when W_SW3_OEn  = '0' else
		    W_DIP when W_DIP_OEn  = '0' else
		W_RAM1_DO when W_RAM1_CSn = '0' else
		W_RAM3_DO when W_RAM3_CSn = '0' else
		W_VRAM_DB when W_VRAM_RDn = '0' else
		WB_ROM_DO when (W_ROM_CSn = '0') and (W_CPU_RDn = '0') else
		(others => '0');

	O_VGA_R			<= rgb_in(7 downto 5)              when tv15khz = '1' else rgb_out(7 downto 5);
	O_VGA_G			<= rgb_in(4 downto 2)              when tv15khz = '1'  else rgb_out(4 downto 2);
	O_VGA_B			<= rgb_in(1 downto 0) & rgb_in (0) when tv15khz = '1'  else rgb_out(1 downto 0) & rgb_out(0);
   O_VGA_HSYNC    <= not W_H_SYNCn                       when tv15khz = '1'  else not O_VGA_H_SYNCn;
	O_VGA_VSYNC    <= not W_V_SYNCn                       when tv15khz = '1'  else not O_VGA_V_SYNCn;
	O_VGA_INT      <= not W_V_SYNCn;--not O_VGA_V_SYNCn;
	O_VGA_CSYNC    <= not(not W_H_SYNCn xor not W_V_SYNCn); --(W_H_SYNCn and W_V_SYNCn)
	O_SOUND_OUT_L	<= mix_sound;
	O_SOUND_OUT_R	<= mix_sound;

	O_ROM_CSn		<= '0';	-- SRAM always selected
	O_ROM_OEn		<= '0';	-- SRAM output enabled
	O_ROM_WEn		<= '1';	-- SRAM write enable inactive (we use it as ROM)

	W_CNF_EN			<= '0' when (R_AD = conf_cnt + 1) else '1';
	W_FLIPn			<= W_5H_Q(2);
	W_2PSL			<= W_5H_Q(3);
	rgb_in			<= x"00" & W_R & W_G & W_B;
	W_VC_A			<= "111" & R_AD when W_CNF_EN = '1' else "0111" & VID_ROM_A;
	W_OBJ_AB			<= W_H_CNT(8) & (not W_H_CNT(8)) & W_H_CNT(7 downto 0);
	W_VRAM_DAT		<= W_VRAM_COL & W_VRAM_VID;
	sound_mix		<= '0' & WAV_ROM_DO + W_D_S_DAT;

	-- address decoder
	W_W0_WE			<= '1' when W_CNF_EN = '1' and (R_AD(12 downto 11) = "00"   ) else '0'; --  sound 0
	W_W1_WE			<= '1' when W_CNF_EN = '1' and (R_AD(12 downto 11) = "01"   ) else '0'; --  sound 1
	W_W2_WE			<= '1' when W_CNF_EN = '1' and (R_AD(12 downto  8) = "10000") else '0'; --  col 0
	W_W3_WE			<= '1' when W_CNF_EN = '1' and (R_AD(12 downto  8) = "10001") else '0'; --  col 1
	W_W4_WE			<= '1' when W_CNF_EN = '1' and (R_AD(12 downto  8) = "10010") else '0'; --  vram 0

	W_SOUND_CNT		<= W_6H_Q(5 downto 3) & W_5H_Q(0);

	-- SOUND MIXER (WAV + DIG )
	sound_mixer : process(W_CLK_12288M)
	begin
		if rising_edge(W_CLK_12288M) then
			if (sound_mix >= "101111111") then		-- POS Limiter
				dac_di <= "011111111";
			elsif (sound_mix <= "010000000") then	-- NEG Limiter
				dac_di <= (others => '0');
			else
				dac_di <= sound_mix - "010000000";
			end if;
		end if;
	end process;

	ext_rom_mux : process(W_CLK_12288M, I_RESETn)
	begin
		if (I_RESETn = '0') then
			R_AD			<= (others => '0');
			clk_d			<= (others => '0');
			phase			<= (others => '0');
			O_ROM_AB		<= (others => '0');
			VID_ROM1_DO	<= (others => '0');
			VID_ROM2_DO	<= (others => '0');
			OBJ_ROM1_DO	<= (others => '0');
			OBJ_ROM2_DO <= (others => '0');
			OBJ_ROM3_DO	<= (others => '0');
			OBJ_ROM4_DO	<= (others => '0');
			WB_ROM_DO	<= (others => '0');
			WAV_ROM_DO	<= (others => '0');
		elsif rising_edge(W_CLK_12288M) then
			clk_d(0) <= W_H_CNT(1) and W_H_CNT(2) and W_H_CNT(3);
			clk_d(1) <= clk_d(0);

			if clk_d(1 downto 0) = "01" then
				phase <= (others => '0');
			else
				phase <= phase + 1;
			end if;

			case phase is
				when "0000" =>	WB_ROM_DO	<= I_ROM_DB;						-- read PROG ROM
									O_ROM_AB		<= WAV_ROM_A;						--  set WAVE SOUND ADDR
				when "0001" =>	WAV_ROM_DO	<= I_ROM_DB;						-- read WAVE SOUND ADDR
				when "0010" =>	O_ROM_AB		<= "00"		& W_CPU_A;			--  set PROG ROM
				when "0011" =>	WB_ROM_DO	<= I_ROM_DB;			 			-- read PROG ROM
									O_ROM_AB		<= "000110"	& VID_ROM_A;		--  set VID_ROM1  3P ADDR = 6xxxH
				when "0100" =>	VID_ROM1_DO	<= I_ROM_DB;						-- read VID_ROM1  3P ADDR = 6xxxH
									O_ROM_AB		<= "00"		& W_VC_A;			--  set VID_ROM2  3N ADDR = 7xxxH
				when "0101" =>	VID_ROM2_DO	<= I_ROM_DB;						-- read VID_ROM2  3N ADDR = 7xxxH
									O_ROM_AB		<= "00"		& W_CPU_A;			--  set PROG ROM
				when "0110" =>	WB_ROM_DO	<= I_ROM_DB;			 			-- read PROG ROM
				when "1000" =>	O_ROM_AB		<= "00"		& W_CPU_A;			--  set PROG ROM
				when "1001" =>	WB_ROM_DO	<= I_ROM_DB;						-- read PROG ROM
									O_ROM_AB		<= "001010"	& OBJ_ROM_A;		--  set OBJ_ROM1  7C ADDR = AxxxH
				when "1010" =>	OBJ_ROM1_DO	<= I_ROM_DB;						-- read OBJ_ROM1  7C ADDR = AxxxH
									O_ROM_AB		<= "001011"	& OBJ_ROM_A;		--  set OBJ_ROM2  7D ADDR = BxxxH
				when "1011" =>	OBJ_ROM2_DO	<= I_ROM_DB;						-- read OBJ_ROM2  7D ADDR = BxxxH
									O_ROM_AB		<= "00"		& W_CPU_A;			--  set PROG ROM
				when "1100" =>	WB_ROM_DO	<= I_ROM_DB;						-- read PROG ROM
									O_ROM_AB		<= "001100"	& OBJ_ROM_A;		--  set OBJ_ROM3  7E ADDR = CxxxH
				when "1101" =>	OBJ_ROM3_DO	<= I_ROM_DB;						-- read OBJ_ROM3  7E ADDR = CxxxH
									O_ROM_AB		<= "001101"	& OBJ_ROM_A;		--  set OBJ_ROM4  7F ADDR = DxxxH
				when "1110" =>	OBJ_ROM4_DO <= I_ROM_DB;						-- read OBJ_ROM4  7F ADDR = DxxxH
				when "1111" =>	O_ROM_AB		<= "00"		& W_CPU_A;			--  set PROG ROM
					if W_CNF_EN = '1' then
						R_AD <=  R_AD + 1;
					end if;
				when others => null;
			end case;
		end if;
	end process;

	-- Z80IP interface
	cpu : entity work.T80as
	port map (
		RESET_n		=> I_RESETn,
		CLK_n			=> WB_CLK_03072M,
		WAIT_n		=> W_CPU_WAITn,
		INT_n			=> '1',
		NMI_n			=> W_CPU_NMIn,
		BUSRQ_n		=> '1',
		M1_n			=> W_CPU_M1n,
		MREQ_n		=> W_CPU_MREQn,
		IORQ_n		=> open,
		RD_n			=> W_CPU_RDn ,
		WR_n			=> W_CPU_WRn ,
		RFSH_n		=> W_CPU_RFSHn,
		HALT_n		=> open,
		BUSAK_n		=> open,
		A				=> W_CPU_A,
		DI				=> W_CPU_DI,
		DO				=> W_CPU_DO,
		DOE			=> open
	);

	-- INT RAM Interface
	U_3C4C3B4B : entity work.ram_2048_8
	port map (
		I_CLK			=> not W_CLK_12288M,
		I_ADDR		=> W_CPU_A(10 downto 0),
		I_D			=> W_CPU_DO,
		I_CE			=> not W_RAM1_CSn,
		I_WE			=> not W_CPU_WRn,
		O_D			=> W_RAM1_DO
	);

	-- dual port implements DMA through W_OBJ_AB
	U_3A4A : entity work.ram_2048_8_8
	port map (
		--   A Port
		I_CLKA					=> not W_CLK_12288M,
		I_ADDRA(10)				=> '0',
		I_ADDRA(9 downto 0)	=> W_CPU_A(9 downto 0),
		I_DA						=> W_CPU_DO,
		I_CEA						=> not W_RAM3_CSn,
		I_WEA						=> not W_CPU_WRn,
		O_DA						=> W_RAM3_DO,
		--   B Port
		I_CLKB					=> W_CLK_12288M,
		I_ADDRB(10)				=> '0',
		I_ADDRB(9 downto 0)	=> W_OBJ_AB(9 downto 0),
		I_DB						=> x"00",
		I_CEB						=> '1',
		I_WEB						=> '0',
		O_DB						=> W_OBJ_DI
	);

	-- Address Decoder
	adec : entity work.dkong_adec
	port map (
		I_CLK12M			=> W_CLK_12288M,
		I_CLK				=> WB_CLK_03072M,
		I_RESET_n		=> I_RESETn,
		I_AB				=> W_CPU_A,
		I_DB				=> W_CPU_DO(3 downto 0),
		I_MREQ_n			=> W_CPU_MREQn,
		I_RFSH_n			=> W_CPU_RFSHn,
		I_RD_n			=> W_CPU_RDn,
		I_WR_n			=> W_CPU_WRn,
		I_VRAMBUSY_n	=> W_VRAMBUSYn,
		I_VBLK_n			=> W_V_BLANKn,
		O_WAIT_n			=> W_CPU_WAITn,
		O_NMI_n			=> W_CPU_NMIn,
		O_ROM_CS_n		=> W_ROM_CSn,
		O_RAM1_CS_n		=> W_RAM1_CSn,
		O_RAM3_CS_n		=> W_RAM3_CSn,
		O_OBJ_RQ_n		=> W_OBJ_RQn,
		O_OBJ_RD_n		=> W_OBJ_RDn,
		O_OBJ_WR_n		=> W_OBJ_WRn,
		O_VRAM_RD_n		=> W_VRAM_RDn,
		O_VRAM_WR_n		=> W_VRAM_WRn,
		O_SW1_OE_n		=> W_SW1_OEn,
		O_SW2_OE_n		=> W_SW2_OEn,
		O_SW3_OE_n		=> W_SW3_OEn,
		O_DIP_OE_n		=> W_DIP_OEn,
		O_5H_Q			=> W_5H_Q,
		O_6H_Q			=> W_6H_Q,
		O_3D_Q			=> W_3D_Q
	);

	-- H & V Counter
	hv : entity work.dkong_hv_count_n
	port map (
		-- input
		I_CLK				=> I_CLK_24576M,
		RST_n				=> I_RESETn,
		V_FLIP			=> W_FLIP_HV,
		-- output
		O_CLK				=> W_CLK_12288M,
		H_CNT				=> W_H_CNT,
		V_CNT				=> open,				-- W_V_CNT
		VF_CNT			=> W_VF_CNT,
		H_BLANKn			=> open,				-- W_H_BLANKn
		V_BLANKn			=> W_V_BLANKn,
		C_BLANKn			=> W_C_BLANKn,
		H_SYNCn			=> W_H_SYNCn,
		V_SYNCn			=> W_V_SYNCn
	);

	-- OBJ (VIDEO)
	obj : entity work.dkong_obj
	port map (
		-- input
		CLK_24M			=> I_CLK_24576M,
		CLK_12M			=> WB_CLK_12288M,
		I_OBJ_D			=> W_OBJ_DI,
		I_2PSL			=> W_2PSL,
		I_FLIPn			=> W_FLIPn,
		I_H_CNT			=> W_H_CNT,
		I_VF_CNT			=> W_VF_CNT,
		I_CMPBLKn		=> W_C_BLANKn,
		I_OBJ_D1			=> OBJ_ROM1_DO,
		I_OBJ_D2			=> OBJ_ROM2_DO,
		I_OBJ_D3			=> OBJ_ROM3_DO,
		I_OBJ_D4			=> OBJ_ROM4_DO,
		O_OBJ_AB			=> OBJ_ROM_A,
		O_OBJ_DO			=> W_OBJ_DAT,
		O_FLIP_VRAM		=> W_FLIP_VRAM,
		O_FLIP_HV		=> W_FLIP_HV,
		O_L_CMPBLKn		=> W_L_CMPBLKn
	);

	-- V-RAM (VIDEO)
	vram : entity work.dkong_vram
	port map (
		-- input
		CLK_12M			=> not W_CLK_12288M,
		I_AB				=> W_CPU_A(9 downto 0),
		I_DB				=> W_CPU_DO,
		I_VRAM_WRn		=> W_VRAM_WRn,
		I_VRAM_RDn		=> W_VRAM_RDn,
		I_FLIP			=> W_FLIP_VRAM,
		I_H_CNT			=> W_H_CNT,
		I_VF_CNT			=> W_VF_CNT,
		I_CMPBLK			=> W_C_BLANKn,
		O_VRAM_AB		=> VID_ROM_A,
		I_VRAM_D1		=> VID_ROM1_DO,
		I_VRAM_D2		=> VID_ROM2_DO,
		I_CNF_EN			=> W_CNF_EN,
		I_CNF_A			=> R_AD(7 downto 0),
		I_CNF_D			=> VID_ROM2_DO,
		I_WE4				=> W_W4_WE,
		--  Debug output
		O_DB				=> W_VRAM_DB,
		O_COL				=> W_VRAM_COL,
		O_VID				=> W_VRAM_VID,
		O_VRAMBUSYn		=> W_VRAMBUSYn,
		O_ESBLKn			=> open
	);

	-- COLOR PALETE
	cpal : entity work.dkong_col_pal
	port map (
		-- input
		CLK_6M			=> W_H_CNT(0),
		CLK_12M			=> W_CLK_12288M,
		I_VRAM_D			=> W_VRAM_DAT,
		I_OBJ_D			=> W_OBJ_DAT,
		I_CMPBLKn		=> W_L_CMPBLKn,
		I_5H_Q6			=> W_5H_Q(6),
		I_5H_Q7			=> W_5H_Q(7),
		I_CNF_A			=> R_AD(7 downto 0),
		I_CNF_D			=> VID_ROM2_DO,
		I_CNF_EN			=> W_CNF_EN,
		I_WE2				=> W_W2_WE,
		I_WE3				=> W_W3_WE,
		-- output
		O_R				=> W_R,
		O_G				=> W_G,
		O_B				=> W_B
	);



	vga_scandbl : entity work.vga_scandbl
	port map (
		CLK				=> WB_CLK_06144M,
		CLK_X2			=> WB_CLK_12288M,
		I_HSYNC			=> W_H_SYNCn,
		I_VSYNC			=> W_V_SYNCn,
		O_HSYNC			=> O_VGA_H_SYNCn,
		O_VSYNC			=> O_VGA_V_SYNCn,
		I_VIDEO			=> rgb_in,
		O_VIDEO			=> rgb_out,
		scanlines      => scanlines
	);



	sound_cpu : entity work.i8035ip
	port map (
		I_CLK				=> WB_CLK_06144M,
		I_RSTn			=> I8035_RSTn,
		I_INTn			=> I8035_INTn,
		I_EA				=> '1',
		O_PSENn			=> I8035_PSENn,
		O_RDn				=> I8035_RDn,
		O_WRn				=> open,
		O_ALE				=> I8035_ALE,
		O_PROGn			=> open,
		I_T0				=> I8035_T0,
		O_T0				=> open,
		I_T1				=> I8035_T1,
		I_DB				=> I8035_DBO,
		O_DB				=> I8035_DBI,
		I_P1				=> x"00",
		O_P1				=> I8035_PAI,
		I_P2				=> I8035_PBO,
		O_P2				=> I8035_PBI
	);

	digital_sound : entity work.dkong_sound
	port map (
		I_CLK1			=> W_CLK_12288M,
		I_CLK2			=> I_CLK_24576M,
		I_RST				=> I_RESETn,
		I8035_DBI		=> I8035_DBI,
		I8035_DBO		=> I8035_DBO,
		I8035_PAI		=> I8035_PAI,
		I8035_PBI		=> I8035_PBI,
		I8035_PBO		=> I8035_PBO,
		I8035_ALE		=> I8035_ALE,
		I8035_RDn		=> I8035_RDn,
		I8035_PSENn		=> I8035_PSENn,
		I8035_RSTn		=> I8035_RSTn,
		I8035_INTn		=> I8035_INTn,
		I8035_T0			=> I8035_T0,
		I8035_T1			=> I8035_T1,

		I_CNF_A			=> R_AD(10 downto 0),
		I_CNF_D			=> VID_ROM2_DO,
		I_WE0				=> W_W0_WE,
		I_WE1				=> W_W1_WE,
		I_CNF_EN			=> W_CNF_EN,

		I_SOUND_DAT		=> W_3D_Q,
		I_SOUND_CNT		=> W_SOUND_CNT,
		O_SOUND_DAT		=> W_D_S_DAT
	);

	analog_sound : entity work.dkong_wav_sound
	port map (
		O_ROM_AB			=> WAV_ROM_A,
		I_ROM_DB			=> WAV_ROM_DO,

		I_CLK				=> I_CLK_24576M,
		I_RSTn			=> I_RESETn,
		I_SW				=> W_6H_Q(2 downto 0)
	);

	-- D-A convertor
	wav_dac : entity work.dac
	port map (
		clk_i				=> I_CLK_24576M,
		res_n_i			=> I_RESETn,
		dac_i				=> dac_di(7 downto 0),
		dac_o				=> mix_sound
	);

-------
--INPUT
-------
  joystick_reg  <=  I_JOYSTICK_A;
  joystick2_reg <=  I_JOYSTICK_B;

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
    CLK      => WB_CLK_12288M
    );

------------------
-- player controls
------------------
	I_U1 <= button_debounced(0);
	I_D1 <= button_debounced(1);
	I_L1 <= button_debounced(2);
	I_R1 <= button_debounced(3);
	I_J1 <= button_debounced(4);
	I_U2 <= button_debounced(9);
	I_D2 <= button_debounced(10);
	I_L2 <= button_debounced(11);
	I_R2 <= button_debounced(12);
	I_J2 <= button_debounced(13);
	I_S1 <= button_debounced(6);
	I_S2 <= button_debounced(7);
	I_C1 <= button_debounced(8) and button_debounced(15);

end RTL;
