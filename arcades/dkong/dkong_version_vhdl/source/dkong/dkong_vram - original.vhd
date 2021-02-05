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

-------------------------------------------------------------------------------------------
-- H_CNT[0],H_CNT[1],H_CNT[2],H_CNT[3],H_CNT[4],H_CNT[5],H_CNT[6],H_CNT[7],H_CNT[8],H_CNT[9]
--   1/2 H     1 H     2 H      4H       8H       16 H     32H      64 H     128 H   256 H
-------------------------------------------------------------------------------------------
-- V_CNT[0], V_CNT[1], V_CNT[2], V_CNT[3], V_CNT[4], V_CNT[5], V_CNT[6], V_CNT[7]
--    1 V      2 V       4 V       8 V       16 V      32 V      64 V     128 V
-------------------------------------------------------------------------------------------
-- VF_CNT[0],VF_CNT[1],VF_CNT[2],VF_CNT[3],VF_CNT[4],VF_CNT[5],VF_CNT[6],VF_CNT[7]
--    1 VF     2 VF      4 VF      8 VF      16 VF     32 VF     64 VF    128 VF

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity dkong_vram is
	port(
		CLK_12M		: in  std_logic;
		I_AB			: in  std_logic_vector( 9 downto 0);
		I_DB			: in  std_logic_vector( 7 downto 0);
		I_VRAM_WRn	: in  std_logic;
		I_VRAM_RDn	: in  std_logic;
		I_FLIP		: in  std_logic;
		I_H_CNT		: in  std_logic_vector( 9 downto 0);
		I_VF_CNT		: in  std_logic_vector( 7 downto 0);
		I_CMPBLK		: in  std_logic;
		O_VRAM_AB	: out std_logic_vector(11 downto 0);
		I_VRAM_D1	: in  std_logic_vector( 7 downto 0);
		I_VRAM_D2	: in  std_logic_vector( 7 downto 0);
		I_CNF_EN		: in  std_logic;
		I_CNF_A		: in  std_logic_vector( 7 downto 0);
		I_CNF_D		: in  std_logic_vector( 7 downto 0);
		I_WE4			: in  std_logic;
		---- Debug ----
		---------------
		O_DB			: out std_logic_vector( 7 downto 0);
		O_COL			: out std_logic_vector( 3 downto 0);
		O_VID			: out std_logic_vector( 1 downto 0);
		O_VRAMBUSYn	: out std_logic;
		O_ESBLKn		: out std_logic
	);
end dkong_vram;

architecture RTL of dkong_vram is
	signal CLK_2M		: std_logic := '0';
	signal CLK_4PN		: std_logic := '0';
	signal W_VRAMBUSY	: std_logic := '0';
	signal W_ESBLK		: std_logic := '0';
	signal W_vram_CS	: std_logic := '0';
	signal W_2S4		: std_logic := '0';
	signal W_4P_Qa		: std_logic := '0';
	signal W_4P_Qh		: std_logic := '0';
	signal W_4N_Qa		: std_logic := '0';
	signal W_4N_Qh		: std_logic := '0';

	signal WI_DB		: std_logic_vector(7 downto 0) := (others => '0');
	signal WO_DB		: std_logic_vector(7 downto 0) := (others => '0');
	signal W_HF_CNT	: std_logic_vector(4 downto 0) := (others => '0');
	signal W_cnt_AB	: std_logic_vector(9 downto 0) := (others => '0');
	signal W_vram_AB	: std_logic_vector(9 downto 0) := (others => '0');
	signal W_2N_DO		: std_logic_vector(3 downto 0) := (others => '0');
	signal W_2N_AD		: std_logic_vector(7 downto 0) := (others => '0');
	signal W_2N_DI		: std_logic_vector(3 downto 0) := (others => '0');
	signal W_3P_DO		: std_logic_vector(7 downto 0) := (others => '0');
	signal W_3N_DO		: std_logic_vector(7 downto 0) := (others => '0');
	signal W_4M_a		: std_logic_vector(3 downto 0) := (others => '0');
	signal W_4M_b		: std_logic_vector(3 downto 0) := (others => '0');
	signal W_4M_Y		: std_logic_vector(3 downto 0) := (others => '0');
	signal C_4P			: std_logic_vector(1 downto 0) := (others => '0');
	signal I_4P			: std_logic_vector(7 downto 0) := (others => '0');
	signal reg_4P		: std_logic_vector(7 downto 0) := (others => '0');
	signal C_4N			: std_logic_vector(1 downto 0) := (others => '0');
	signal I_4N			: std_logic_vector(7 downto 0) := (others => '0');
	signal reg_4N		: std_logic_vector(7 downto 0) := (others => '0');

begin
	---- Debug ----
	---------------
	WI_DB	<= x"00" when I_VRAM_WRn = '1' else I_DB;
	O_DB	<= WO_DB;

	W_HF_CNT  <= I_H_CNT(8 downto 4) xor (I_FLIP & I_FLIP & I_FLIP & I_FLIP & I_FLIP );
	W_cnt_AB  <= I_VF_CNT(7 downto 3) & W_HF_CNT(4 downto 0);
	W_vram_AB <= W_cnt_AB when I_CMPBLK = '1' else I_AB ;
	W_vram_CS <= '0'      when I_CMPBLK = '1' else I_VRAM_WRn and I_VRAM_RDn;
	W_2S4     <= not I_CMPBLK;

	process(CLK_12M)
	begin
		if falling_edge(CLK_12M) then
			CLK_2M <= not ( I_H_CNT(1) and I_H_CNT(2) and I_H_CNT(3) );
		end if;
	end process;

	U_2PR : entity work.ram_2048_8
	port map (

		I_CLK						=> not CLK_12M,
		I_ADDR(10)				=> '1',
		I_ADDR(9 downto 0)	=> W_vram_AB,
		I_D						=> WI_DB,
		I_CE						=> not W_vram_CS,
		I_WE						=> not I_VRAM_WRn,
		O_D						=> WO_DB
	);

	-----  ROM 2N  -----
	W_2N_AD <= I_CNF_A             when I_CNF_EN = '1' else W_vram_AB(9 downto 7) & W_vram_AB(4 downto 0);
	W_2N_DI <= I_CNF_D(3 downto 0) when I_CNF_EN = '1' else (others => '0');

	U_2N : entity work.ram_256_4
	port map (

		I_CLK		=> CLK_12M,
		I_ADDR	=> W_2N_AD,
		I_D		=> W_2N_DI,
		I_CE		=> '1',
		I_WE		=> I_WE4,
		O_D		=> W_2N_DO
	);

	--    Parts  2M
	process(CLK_2M)
	begin
		if falling_edge(CLK_2M) then
			O_COL(3 downto 0) <= W_2N_DO(3 downto 0);
		end if;
	end process;

	O_VRAM_AB	<= '0' & WO_DB(7 downto 0) & I_VF_CNT(2 downto 0);
	W_3P_DO		<= I_VRAM_D1;
	W_3N_DO		<= I_VRAM_D2;
	CLK_4PN		<= I_H_CNT(0);

	------  PARTS 4P  ----------------------------------------------
	C_4P			<= W_4M_Y(1 downto 0);
	I_4P			<= W_3P_DO;

	W_4P_Qa		<= reg_4P(7);
	W_4P_Qh		<= reg_4P(0);

	process(CLK_4PN)
	begin
		if rising_edge(CLK_4PN) then
			case C_4P is
				when "00" => reg_4P <= reg_4P;
				when "10" => reg_4P <= reg_4P(6 downto 0) & '0';
				when "01" => reg_4P <= '0' & reg_4P(7 downto 1);
				when "11" => reg_4P <= I_4P;
				when others => null;
			end case;
		end if;
	end process;

	------  PARTS 4N  ----------------------------------------------
	C_4N		<= W_4M_Y(1 downto 0);
	I_4N		<= W_3N_DO;
	W_4N_Qa	<= reg_4N(7);
	W_4N_Qh	<= reg_4N(0);

	process(CLK_4PN)
	begin
		if rising_edge(CLK_4PN) then
			case C_4N is
				when "00" => reg_4N <= reg_4N;
				when "10" => reg_4N <= reg_4N(6 downto 0) & '0';
				when "01" => reg_4N <= '0' & reg_4N(7 downto 1);
				when "11" => reg_4N <= I_4N;
				when others => null;
			end case;
		end if;
	end process;

	W_4M_a	<= W_4P_Qa & W_4N_Qa & '1' & (not (CLK_2M or W_2S4));
	W_4M_b	<= W_4P_Qh & W_4N_Qh & (not (CLK_2M or W_2S4)) & '1';
	W_4M_Y	<= W_4M_b when I_FLIP = '1' else W_4M_a;
	O_VID(0)	<= W_4M_Y(2);
	O_VID(1)	<= W_4M_Y(3);

	------  PARTS 2K1 ----------------------------------------------
	O_VRAMBUSYn <= not W_VRAMBUSY;
	process(I_H_CNT(2), I_H_CNT(9))
	begin
		if (I_H_CNT(9) = '0') then
			W_VRAMBUSY <= '1';
		elsif rising_edge(I_H_CNT(2)) then
			W_VRAMBUSY <= I_H_CNT(4) and I_H_CNT(5) and I_H_CNT(6) and I_H_CNT(7);
		end if;
	end process;

	------  PARTS 2K2 ----------------------------------------------
	O_ESBLKn <= not W_ESBLK;
	process(I_H_CNT(6), I_H_CNT(9))
	begin
		if (I_H_CNT(9) = '0') then
			W_ESBLK <= '0';
		elsif rising_edge(I_H_CNT(6)) then
			W_ESBLK <= not I_H_CNT(7);
		end if;
	end process;

end RTL;
