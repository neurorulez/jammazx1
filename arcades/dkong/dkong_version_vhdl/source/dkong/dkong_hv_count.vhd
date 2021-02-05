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

entity dkong_hv_count_n is
	port(
		I_CLK		: in  std_logic;
		RST_n		: in  std_logic;
		V_FLIP	: in  std_logic;
		-- output
		O_CLK		: out std_logic;
		H_CNT		: out std_logic_vector( 9 downto 0);
		V_CNT		: out std_logic_vector( 7 downto 0);
		VF_CNT	: out std_logic_vector( 7 downto 0);
		H_BLANKn	: out std_logic;
		V_BLANKn	: out std_logic;
		C_BLANKn	: out std_logic;
		H_SYNCn	: out std_logic;
		V_SYNCn	: out std_logic
	);
end dkong_hv_count_n;

architecture RTL of dkong_hv_count_n is
	constant H_count	: std_logic_vector(10 downto 0) := "11000000000"; -- 1536
	constant H_BL_P	: std_logic_vector( 9 downto 0) :=  "0111111111"; -- 511
	constant H_BL_W	: std_logic_vector( 9 downto 0) :=  "1011111111"; -- 767
	constant V_CL_P	: std_logic_vector( 9 downto 0) :=  "1001000000"; -- 576
	constant V_CL_W	: std_logic_vector( 9 downto 0) :=  "1010000000"; -- 640
	constant V_BL_P	: std_logic_vector( 8 downto 0) :=   "011101111"; -- 239
	constant V_BL_W	: std_logic_vector( 8 downto 0) :=   "000001111"; -- 15

	constant V_MAX		: std_logic_vector( 8 downto 0) :=   "011111111"; -- 255
	constant V_CNTR	: std_logic_vector( 8 downto 0) :=   "111111000"; -- 504

	signal H_CNT_r	: std_logic_vector(10 downto 0) := (others => '0');
	signal V_CNT_r	: std_logic_vector( 8 downto 0) := (others => '0');
	signal V_CLK	: std_logic := '0';
	signal H_BLANK	: std_logic := '0';
	signal V_BLANK	: std_logic := '0';

begin
	O_CLK		<= H_CNT_r(0);
	H_SYNCn	<= not V_CLK;
	V_SYNCn	<= not V_CNT_r(8);
	H_BLANKn	<= not H_BLANK;
	V_BLANKn	<= not V_BLANK;
	C_BLANKn	<= not (H_BLANK or V_BLANK);
	H_CNT		<= H_CNT_r(10 downto 1);
	V_CNT		<= V_CNT_r(7 downto 0);
	VF_CNT	<= V_CNT_r(7 downto 0) xor (V_FLIP & V_FLIP & V_FLIP & V_FLIP & V_FLIP & V_FLIP & V_FLIP & V_FLIP);

	process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			if H_CNT_r = H_count - 1 then
				H_CNT_r <= (others => '0');
			else
				H_CNT_r <= H_CNT_r + 1;
			end if;
		end if;
	end process;

	process(H_CNT_r(0))
	begin
		if rising_edge(H_CNT_r(0)) then
			case H_CNT_r(10 downto 1) is
				when H_BL_P => H_BLANK <= '1';
				when V_CL_P => V_CLK   <= '1';
				when H_BL_W => H_BLANK <= '0';
				when V_CL_W => V_CLK   <= '0';
				when others => null;
			end case;
		end if;
	end process;

	process(V_CLK, RST_n)
	begin
		if (RST_n = '0') then
			V_CNT_r <= (others => '0');
		elsif rising_edge(V_CLK) then
			if (V_CNT_r = V_MAX) then
				V_CNT_r <= V_CNTR;
			else
				V_CNT_r <= V_CNT_r + 1 ;
			end if;
		end if;
	end process;

	process(V_CLK, RST_n)
	begin
		if RST_n = '0' then
	      V_BLANK <= '0';
		elsif rising_edge(V_CLK) then
			case V_CNT_r is
				when V_BL_P => V_BLANK <= '1';
				when V_BL_W => V_BLANK <= '0';
				when others => null;
			end case;
		end if;
	end process;
end RTL;
