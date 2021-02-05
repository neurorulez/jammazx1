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
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity dkong_adec is
	port (
		I_CLK12M			: in  std_logic;
		I_CLK				: in  std_logic;
		I_RESET_n		: in  std_logic;
		I_AB				: in  std_logic_vector(15 downto 0);
		I_DB				: in  std_logic_vector( 3 downto 0);
		I_MREQ_n			: in  std_logic;
		I_RFSH_n			: in  std_logic;
		I_RD_n			: in  std_logic;
		I_WR_n			: in  std_logic;
		I_VRAMBUSY_n	: in  std_logic;
		I_VBLK_n			: in  std_logic;

		O_WAIT_n			: out std_logic;
		O_NMI_n			: out std_logic;
		O_ROM_CS_n		: out std_logic;								-- 0000 H - 3FFF H  (5E,5C,5B,5A)
		O_RAM1_CS_n		: out std_logic;								-- 6000 H - 67FF H  (3B,3C,4B,4C)
		O_RAM3_CS_n		: out std_logic;								-- 6800 H - 6BFF H  (3A,4A)
		O_DMA_CS_n		: out std_logic;								-- 7800 H - 783F H  (DMA)
		O_OBJ_RQ_n		: out std_logic;								-- 7000 H - 73FF H
		O_OBJ_RD_n		: out std_logic;								-- 7000 H - 73FF H  (R mode)
		O_OBJ_WR_n		: out std_logic;								-- 7000 H - 73FF H  (W mode)
		O_VRAM_RD_n		: out std_logic;								-- 7400 H - 77FF H  (R mode)
		O_VRAM_WR_n		: out std_logic;								-- 7400 H - 77FF H  (W mode)
		O_SW1_OE_n		: out std_logic;								-- 7C00 H           (R mode)
		O_SW2_OE_n		: out std_logic;								-- 7C80 H           (R mode)
		O_SW3_OE_n		: out std_logic;								-- 7D00 H           (R mode)
		O_DIP_OE_n		: out std_logic;								-- 7D80 H           (R mode)
		O_5H_Q			: out std_logic_vector( 7 downto 0);   -- FLIP,
		O_6H_Q			: out std_logic_vector( 7 downto 0);   -- sound
		O_3D_Q			: out std_logic_vector( 3 downto 0)    -- sound
	);
end dkong_adec;

architecture RTL of dkong_adec is
	signal W_5H_Q		: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_2A2_Q1	: std_logic := '0';
	signal W_1C_Q0		: std_logic := '0';
	signal W_1C_Q2		: std_logic := '0';
	signal W_1C_Q3		: std_logic := '0';
	signal W_7F1_Qn	: std_logic := '0';
	signal W_7F2_Q		: std_logic := '0';
	signal W_VBLK		: std_logic := '0';

begin
	O_WAIT_n		<= W_7F1_Qn;
	W_VBLK		<= not I_VBLK_n;

	O_ROM_CS_n	<= '0' when I_RFSH_n = '1' and I_AB(15 downto 14) = "00" else '1'; -- 0000H - 3FFFH

	O_RAM1_CS_n <= '0' when (I_WR_n = '0' or I_RD_n = '0') and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 11) = "01100"  else '1'; -- 6000H - 67FFh (RW)
	O_RAM3_CS_n <= '0' when (I_WR_n = '0' or I_RD_n = '0') and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 10) = "011010" else '1'; -- 6800H - 6BFFh (RW)

	O_OBJ_RQ_n	<= '0' when I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 10) = "011100" else '1'; -- 7000H - 73FFh
	W_2A2_Q1		<= '0' when I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 10) = "011101" else '1'; -- 7400H - 77FFh

	O_OBJ_RD_n	<= '0' when I_RD_n = '0'  and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 10) = "011100" else '1'; -- 7000H - 73FFh (R)
	O_OBJ_WR_n	<= '0' when W_7F2_Q = '1' and I_WR_n = '0'   and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 10) = "011100" else '1'; -- 7000H - 73FFh (W)

	O_VRAM_RD_n	<= '0' when I_RD_n = '0'  and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 10) = "011101" else '1'; -- 7400H - 77FFh (R)
	O_VRAM_WR_n	<= '0' when W_7F2_Q = '1' and I_WR_n = '0'   and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 10) = "011101" else '1'; -- 7400H - 77FFh (W)

	O_SW1_OE_n	<= '0' when I_RD_n = '0' and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 7) = "011111000" else '1'; -- 7C00H - 7C7Fh (R)
	O_SW2_OE_n	<= '0' when I_RD_n = '0' and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 7) = "011111001" else '1'; -- 7C80H - 7CFFh (R)
	O_SW3_OE_n	<= '0' when I_RD_n = '0' and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 7) = "011111010" else '1'; -- 7D00H - 7D7Fh (R)
	O_DIP_OE_n	<= '0' when I_RD_n = '0' and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 7) = "011111011" else '1'; -- 7D80H - 7DFFh (R)

	O_5H_Q		<= W_5H_Q;

	W_1C_Q0		<= '0' when I_WR_n = '0' and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 7) = "011111000" else '1'; -- 7C00H - 7C7Fh (W)
	W_1C_Q2		<= '0' when I_WR_n = '0' and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 7) = "011111010" else '1'; -- 7D00H - 7D7Fh (W)
	W_1C_Q3		<= '0' when I_WR_n = '0' and I_MREQ_n = '0' and I_RFSH_n = '1' and I_AB(15 downto 7) = "011111011" else '1'; -- 7D80H - 7DFFh (W)

	U_7F6 : process(I_CLK, I_VBLK_n)
	begin
		if I_VBLK_n = '0' then
			W_7F1_Qn <= '1';
		elsif rising_edge(I_CLK) then
			W_7F1_Qn <= I_VRAMBUSY_n or W_2A2_Q1;
		end if;
	end process;

	U_7F9 : process(I_CLK)
	begin
		if falling_edge(I_CLK) then
			W_7F2_Q <= W_7F1_Qn;
		end if;
	end process;

	-- CPU NMI
	U_8F5 : process(W_VBLK, W_5H_Q(4))
	begin
		if W_5H_Q(4) = '0' then
			O_NMI_n <= '1';
		elsif rising_edge(W_VBLK) then
			O_NMI_n <= '0';
		end if;
	end process;

	U_3D : process(W_1C_Q0, I_RESET_n)
	begin
		if I_RESET_n = '0' then
			O_3D_Q <= (others => '0');
		elsif rising_edge(W_1C_Q0) then
			O_3D_Q <= I_DB;
		end if;
	end process;

	U_5H : process(I_CLK12M, I_RESET_n)
	begin
		if I_RESET_n = '0' then
			W_5H_Q <= (others => '0');
		elsif rising_edge(I_CLK12M) then
			if W_1C_Q3 = '0' then
				case I_AB(2 downto 0) is
					when "000" => W_5H_Q(0) <= I_DB(0);
					when "001" => W_5H_Q(1) <= I_DB(0);
					when "010" => W_5H_Q(2) <= I_DB(0);
					when "011" => W_5H_Q(3) <= I_DB(0);
					when "100" => W_5H_Q(4) <= I_DB(0);
					when "101" => W_5H_Q(5) <= I_DB(0);
					when "110" => W_5H_Q(6) <= I_DB(0);
					when "111" => W_5H_Q(7) <= I_DB(0);
					when others => null;
				end case;
			end if;
		end if;
	end process;

	U_6H : process(I_CLK12M, I_RESET_n)
	begin
		if I_RESET_n = '0' then
			O_6H_Q <= (others => '0');
		elsif rising_edge(I_CLK12M) then
			if W_1C_Q2 = '0' then
				case I_AB(2 downto 0) is
					when "000" => O_6H_Q(0) <= I_DB(0);
					when "001" => O_6H_Q(1) <= I_DB(0);
					when "010" => O_6H_Q(2) <= I_DB(0);
					when "011" => O_6H_Q(3) <= I_DB(0);
					when "100" => O_6H_Q(4) <= I_DB(0);
					when "101" => O_6H_Q(5) <= I_DB(0);
					when "110" => O_6H_Q(6) <= I_DB(0);
					when "111" => O_6H_Q(7) <= I_DB(0);
					when others => null;
				end case;
			end if;
		end if;
	end process;
end architecture RTL;
