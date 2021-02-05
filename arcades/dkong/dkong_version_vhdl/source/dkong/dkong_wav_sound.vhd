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

entity dkong_wav_sound is
	port(
		O_ROM_AB	: out std_logic_vector(17 downto 0);
		I_ROM_DB	: in std_logic_vector( 7 downto 0);

		I_CLK		: in std_logic;
		I_RSTn	: in std_logic;
		I_SW		: in std_logic_vector( 2 downto 0)
	);
end dkong_wav_sound;

architecture RTL of dkong_wav_sound is
	constant Sample_cnt	: std_logic_vector(11 downto 0) :=       x"8b4"; -- 2228
	constant Walk_cnt		: std_logic_vector(12 downto 0) := '0' & x"7d5";
	constant Jump_cnt		: std_logic_vector(12 downto 0) := '1' & x"e29";
	constant Foot_cnt		: std_logic_vector(12 downto 0) := '1' & x"74e";

	signal sample_pls		: std_logic := '0';
	signal sample			: std_logic_vector(11 downto 0) := (others => '0');

	signal wav_ad			: std_logic_vector(15 downto 0) := (others => '0');
	signal jump_offset	: std_logic_vector( 3 downto 0) := (others => '0');
	signal foot_offset	: std_logic_vector( 3 downto 0) := (others => '0');

	signal sw0				: std_logic_vector( 1 downto 0) := (others => '0');
	signal sw1				: std_logic_vector( 1 downto 0) := (others => '0');
	signal sw2				: std_logic_vector( 1 downto 0) := (others => '0');
	signal status0			: std_logic_vector( 2 downto 0) := (others => '0');
	signal status1			: std_logic_vector( 2 downto 0) := (others => '0');
	signal status2			: std_logic_vector( 1 downto 0) := (others => '0');
	signal ad_cnt			: std_logic_vector(12 downto 0) := (others => '0');
	signal end_cnt			: std_logic_vector(12 downto 0) := (others => '0');

begin
	process(I_CLK, I_RSTn)
	begin
		if I_RSTn = '0' then
			sample		<= (others => '0');
			sample_pls	<= '0';
		elsif rising_edge(I_CLK) then
			if (sample = Sample_cnt-1) then
				sample		<= (others => '0');
				sample_pls	<= '1';
			else
				sample <= sample + 1;
				sample_pls	<= '0';
			end if;
		end if;
	end process;

	process(I_CLK, I_RSTn)
	begin
		if I_RSTn = '0' then
			sw0		<= (others => '0');
			sw1		<= (others => '0');
			sw2		<= (others => '0');
			status0	<= (others => '0');
			status1	<= (others => '0');
			status2	<= (others => '0');
			ad_cnt	<= (others => '0');
			end_cnt	<= Foot_cnt;
		elsif rising_edge(I_CLK) then
			sw0(0) <= not I_SW(2); -- Foot
			sw0(1) <= sw0(0);
			status0(0) <= (not sw0(1)) and sw0(0);
			sw1(0) <= not I_SW(0); -- Walk
			sw1(1) <= sw1(0);
			status0(1) <= (not sw1(1)) and sw1(0);
			sw2(0) <= not I_SW(1); -- Jump
			sw2(1) <= sw2(0);
			status0(2) <= (not sw2(1)) and sw2(0);
			if (status0 > status1) then
				ad_cnt <= (others => '0');
				if (status0(2) = '1') then
					status1 <= "111";
					status2 <= "11";
					end_cnt <= Jump_cnt;
				elsif(status0(1) = '1') then
					status1 <= "011";
					status2 <= "10";
					end_cnt <= Walk_cnt;
				else
					status1 <= "001";
					status2 <= "01";
					end_cnt <= Foot_cnt;
				end if;
			else
				if (sample_pls = '1') then
					if (ad_cnt >= end_cnt) then
						status1 <= "000";
						ad_cnt <= ad_cnt;
					else
						ad_cnt <= ad_cnt + 1 ;
					end if;
				end if;
			end if;
		end if;
	end process;

	jump_offset <= ("000" & ad_cnt(12)) + 1; --"0001";
	foot_offset <= ("000" & ad_cnt(12)) + 3; --"0011";

	process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			case status2 is
				when "01" => wav_ad <= foot_offset & ad_cnt(11 downto 0);
				when "10" => wav_ad <=       "000" & ad_cnt ;
				when "11" => wav_ad <= jump_offset & ad_cnt(11 downto 0);
				when others => null;
			end case;
		end if;
	end process;

	O_ROM_AB  <= "01" & wav_ad;

end RTL;
