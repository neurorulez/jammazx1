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

entity dkong_sound is
	port(
		I_CLK1		: in  std_logic;
		I_CLK2		: in  std_logic;
		I_RST			: in  std_logic;
		I8035_DBI	: in  std_logic_vector( 7 downto 0);
		I8035_DBO	: out std_logic_vector( 7 downto 0);
		I8035_PAI	: in  std_logic_vector( 7 downto 0);
		I8035_PBI	: in  std_logic_vector( 7 downto 0);
		I8035_PBO	: out std_logic_vector( 7 downto 0);
		I8035_ALE	: in  std_logic;
		I8035_RDn	: in  std_logic;
		I8035_PSENn	: in  std_logic;
		I8035_RSTn	: out std_logic;
		I8035_INTn	: out std_logic;
		I8035_T0		: out std_logic;
		I8035_T1		: out std_logic;

		I_CNF_A		: in  std_logic_vector(10 downto 0);
		I_CNF_D		: in  std_logic_vector( 7 downto 0);
		I_WE0			: in  std_logic;
		I_WE1			: in  std_logic;
		I_CNF_EN		: in  std_logic;

		I_SOUND_DAT	: in  std_logic_vector( 3 downto 0);
		I_SOUND_CNT	: in  std_logic_vector( 3 downto 0);
		O_SOUND_DAT	: out std_logic_vector( 7 downto 0)
	);
end dkong_sound;

architecture RTL of dkong_sound is
	signal S_D1_CS		: std_logic := '0';
	signal S_D2_CS		: std_logic := '0';
	signal S_ROM_A		: std_logic_vector(10 downto 0) := (others => '0');
	signal L_ROM_A		: std_logic_vector( 7 downto 0) := (others => '0');

	signal ROM_A		: std_logic_vector(10 downto 0) := (others => '0');
	signal ROM_D		: std_logic_vector( 7 downto 0) := (others => '0');
	signal S_PROG_DB	: std_logic_vector( 7 downto 0) := (others => '0');
	signal S_PROG_D	: std_logic_vector( 7 downto 0) := (others => '0');

	signal S_DB2		: std_logic_vector( 7 downto 0) := (others => '0');
	signal S_D1			: std_logic_vector( 7 downto 0) := (others => '0');
	signal S_D2			: std_logic_vector( 7 downto 0) := (others => '0');
	signal I8035_DO	: std_logic_vector( 7 downto 0) := (others => '0');
	signal DO			: std_logic_vector( 7 downto 0) := (others => '0');


begin
	I8035_T0			<= not I_SOUND_CNT(3);
	I8035_T1			<= not I_SOUND_CNT(2);
	I8035_PBO(5)	<= not I_SOUND_CNT(1);
	I8035_INTn		<= not I_SOUND_CNT(0);
	I8035_RSTn		<= I_RST and (not I_CNF_EN);

	I8035_PBO(4 downto 0)	<= "00000";
	I8035_PBO(7 downto 6)	<= "00";

	S_ROM_A <= I8035_PBI(2 downto 0) & L_ROM_A(7 downto 0);
	S_D1 <= "0000" & (not I_SOUND_DAT(3 downto 0)) when S_D1_CS = '1' else (others => '0');

	----  Parts 4FH -----------------------------
	process(I8035_ALE)
	begin
		if falling_edge(I8035_ALE) then
			L_ROM_A <= I8035_DBI;
		end if;
	end process;

	----  Parts 4C ------------------------------
	process(I_CLK1)
	begin
		if rising_edge(I_CLK1) then
			S_D1_CS <= I8035_PBI(6) and (not I8035_RDn);
		end if;
	end process;

	----  PROG ROM 3H ---------------------------
	ROM_A		<= I_CNF_A when I_CNF_EN = '1' else S_ROM_A;
	ROM_D		<= I_CNF_D when I_CNF_EN = '1' else (others => '0');
	S_PROG_D	<= x"00" when I8035_PSENn = '1' else S_PROG_DB;

	sound_prog : entity work.ram_2048_8
	port map (

		I_CLK		=> I_CLK1,
		I_ADDR	=> ROM_A,
		I_D		=> ROM_D,
		I_CE		=> '1',
		I_WE		=> I_WE0,
		O_D		=> S_PROG_DB
	);

	----  DATA ROM 3H ---------------------------
	S_D2_CS	<= (not I8035_PBI(6)) and (not I8035_RDn);
	S_D2		<= S_DB2  when S_D2_CS = '1' else (others => '0');

	sound_data : entity work.ram_2048_8
	port map (

		I_CLK		=> I_CLK1,
		I_ADDR	=> ROM_A,
		I_D		=> ROM_D,
		I_CE		=> '1',
		I_WE		=> I_WE1,
		O_D		=> S_DB2
	);

	----  I8035_DB IO I/F -----------------------
	I8035_DO <= S_PROG_D or S_D1 or S_D2 ;

	process(I_CLK1)
	begin
		if rising_edge(I_CLK1) then
			DO <= I8035_DO;
		end if;
	end process;

	I8035_DBO <= DO;

	----    DAC  I/F     ------------------------
	O_SOUND_DAT <= I8035_PAI;
end RTL;
