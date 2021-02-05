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

entity dkong_col_pal is
	port(
		CLK_6M		: in  std_logic;
		CLK_12M		: in  std_logic;
		I_VRAM_D		: in  std_logic_vector( 5 downto 0);
		I_OBJ_D		: in  std_logic_vector( 5 downto 0);
		I_CMPBLKn	: in  std_logic;
		I_5H_Q6		: in  std_logic;
		I_5H_Q7		: in  std_logic;
		I_CNF_A		: in  std_logic_vector( 7 downto 0);
		I_CNF_D		: in  std_logic_vector( 7 downto 0);
		I_CNF_EN		: in  std_logic;
		I_WE2			: in  std_logic;
		I_WE3			: in  std_logic;
		O_R			: out std_logic_vector( 2 downto 0);
		O_G			: out std_logic_vector( 2 downto 0);
		O_B			: out std_logic_vector( 1 downto 0)
	);
end dkong_col_pal;

architecture RTL of dkong_col_pal is
	signal W_3ML_Y		: std_logic_vector( 5 downto 0) := (others => '0');
	
	-------  PARTS 1EF ------------------------------------
	signal W_1EF_RST	: std_logic := '0';
	signal W_1EF_D		: std_logic_vector( 9 downto 0) := (others => '0');
	signal W_1EF_Q		: std_logic_vector( 9 downto 0) := (others => '0');
	-------  PARTS 2EF ------------------------------------
	signal W_PAL_AB	: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_2E_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_2F_DO		: std_logic_vector( 7 downto 0) := (others => '0');
	
	signal PAL_AD		: std_logic_vector( 7 downto 0) := (others => '0');
	signal PAL_DI		: std_logic_vector( 7 downto 0) := (others => '0');

begin

-------  PARTS 3ML ------------------------------------
	W_3ML_Y <= I_VRAM_D when (not (I_OBJ_D(0) or I_OBJ_D(1))) = '1' else I_OBJ_D;

-------  PARTS 1EF ------------------------------------
	W_1EF_D		<= I_5H_Q7 & I_5H_Q6 & W_3ML_Y(5 downto 0) & (W_3ML_Y(0) or W_3ML_Y(1)) & I_CMPBLKn;
	W_1EF_RST	<= I_CMPBLKn or W_1EF_Q(0);

	process(CLK_6M, W_1EF_RST)
	begin
		if (W_1EF_RST = '0') then
			W_1EF_Q <= (others => '0');
		elsif rising_edge(CLK_6M) then
			W_1EF_Q <= W_1EF_D;
		end if;
	end process;

-------  PARTS 2EF ------------------------------------
	W_PAL_AB <= W_1EF_Q(9 downto 2);

	PAL_AD <= I_CNF_A when I_CNF_EN = '1' else W_PAL_AB;
	PAL_DI <= I_CNF_D when I_CNF_EN = '1' else (others => '0');
	
	U2EF : entity work.ram_2048_8_8
	port map (
		--   A Port
		I_CLKA					=> not CLK_12M,
		I_ADDRA(10 downto 8)	=> "000",
		I_ADDRA( 7 downto 0)	=> PAL_AD,
		I_DA						=> PAL_DI,
		I_CEA						=> '1',
		I_WEA						=> I_WE2,
		O_DA						=> W_2E_DO,
		--   B Port    
		I_CLKB					=> not CLK_12M,
		I_ADDRB(10 downto 8)	=> "001",
		I_ADDRB( 7 downto 0)	=> PAL_AD,
		I_DB						=> PAL_DI,
		I_CEB						=> '1',
		I_WEB						=> I_WE3,
		O_DB						=> W_2F_DO
	);

	O_R(0) <= not W_2F_DO(3) when I_CMPBLKn = '1' else '0';
	O_R(1) <= not W_2F_DO(2) when I_CMPBLKn = '1' else '0';
	O_R(2) <= not W_2F_DO(1) when I_CMPBLKn = '1' else '0';
	
	O_G(0) <= not W_2F_DO(0) when I_CMPBLKn = '1' else '0';
	O_G(1) <= not W_2E_DO(3) when I_CMPBLKn = '1' else '0';
	O_G(2) <= not W_2E_DO(2) when I_CMPBLKn = '1' else '0';
	
	O_B(0) <= not W_2E_DO(1) when I_CMPBLKn = '1' else '0';
	O_B(1) <= not W_2E_DO(0) when I_CMPBLKn = '1' else '0';

end RTL;
