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

entity i8035ip is
	port(
		I_CLK		: in  std_logic;
		I_RSTn	: in  std_logic;
		I_INTn	: in  std_logic;
		I_EA		: in  std_logic;
		O_PSENn	: out std_logic;
		O_RDn		: out std_logic;
		O_WRn		: out std_logic;
		O_ALE		: out std_logic;
		O_PROGn	: out std_logic;
		I_T0		: in  std_logic;
		O_T0		: out std_logic;
		I_T1		: in  std_logic;
		I_DB		: in  std_logic_vector(7 downto 0);
		O_DB		: out std_logic_vector(7 downto 0);
		I_P1		: in  std_logic_vector(7 downto 0);
		O_P1		: out std_logic_vector(7 downto 0);
		I_P2		: in  std_logic_vector(7 downto 0);
		O_P2		: out std_logic_vector(7 downto 0)
	);
end i8035ip;

architecture RTL of i8035ip is
	signal xtal3_s		: std_logic := '0';
	signal t48_ram_we	: std_logic := '0';
	signal t48_ram_a	: std_logic_vector(7 downto 0) := (others => '0');
	signal t48_ram_do	: std_logic_vector(7 downto 0) := (others => '0');
	signal t48_ram_di	: std_logic_vector(7 downto 0) := (others => '0');
begin

	-- 64 Byte RAM
	u_ram : entity work.ram_64_8
	port map (
		I_CLK		=> I_CLK,
		I_ADDR	=> t48_ram_a(5 downto 0),
		I_D		=> t48_ram_di,
		I_CE		=> '1',
		I_WE		=> t48_ram_we,
		O_D		=> t48_ram_do
	);

	u_t48 : entity work.t48_core
	port map (
		xtal_i			=> I_CLK,
		xtal_en_i		=> '1',
		reset_i			=> I_RSTn,
		t0_i				=> I_T0,
		t0_o				=> O_T0,
		t0_dir_o			=> open,
		int_n_i			=> I_INTn,
		ea_i				=> I_EA,
		rd_n_o			=> O_RDn,
		psen_n_o			=> O_PSENn,
		wr_n_o			=> O_WRn,
		ale_o				=> O_ALE,
		db_i				=> I_DB,
		db_o				=> O_DB,
		db_dir_o			=> open,
		t1_i				=> I_T1,
		p2_i				=> I_P2,
		p2_o				=> O_P2,
		p2l_low_imp_o	=> open,
		p2h_low_imp_o	=> open,
		p1_i				=> I_P1,
		p1_o				=> O_P1,
		p1_low_imp_o	=> open,
		prog_n_o			=> O_PROGn,
		clk_i				=> I_CLK,
		en_clk_i			=> xtal3_s,
		xtal3_o			=> xtal3_s,
		dmem_addr_o		=> t48_ram_a,
		dmem_we_o		=> t48_ram_we,
		dmem_data_i		=> t48_ram_do,
		dmem_data_o		=> t48_ram_di,
		pmem_addr_o		=> open,
		pmem_data_i		=> x"00"
	);
end RTL;
