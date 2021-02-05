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

--------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity ram_2048_8_8 is
	port(
		I_CLKA  	: in  std_logic := '0';
		I_CEA   	: in  std_logic := '0';
		I_WEA   	: in  std_logic := '0';
		I_ADDRA 	: in  std_logic_vector(10 downto 0) := (others => '0');
		I_DA    	: in  std_logic_vector( 7 downto 0) := (others => '0');
		O_DA    	: out std_logic_vector( 7 downto 0) := (others => '0');

		I_CLKB  	: in  std_logic := '0';
		I_CEB   	: in  std_logic := '0';
		I_WEB   	: in  std_logic := '0';
		I_ADDRB 	: in  std_logic_vector(10 downto 0) := (others => '0');
		I_DB    	: in  std_logic_vector( 7 downto 0) := (others => '0');
		O_DB    	: out std_logic_vector( 7 downto 0) := (others => '0')
	);
end ram_2048_8_8;

architecture RTL of ram_2048_8_8 is
begin
	U_RAM_2K_8_8 : RAMB16_S9_S9
		generic map (SIM_COLLISION_CHECK => "NONE")  -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL"
		port map (
			-- input
			doa		=> O_DA,
			dia		=> I_DA,
			dopa		=> open,
			dipa		=> "0",
			addra		=> I_ADDRA,
			wea		=> I_WEA,
			ena		=> I_CEA,
			ssra		=> '0',
			clka		=> I_CLKA,

			-- output
			dob		=> O_DB,
			dib		=> I_DB,
			dopb		=> open,
			dipb		=> "0",
			addrb		=> I_ADDRB,
			web		=> I_WEB,
			enb		=> I_CEB,
			ssrb		=> '0',
			clkb		=> I_CLKB
		);
end RTL;

----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity ram_2EH7M is
	port(
		I_CLKA  	: in  std_logic := '0';
		I_CEA   	: in  std_logic := '0';
		I_WEA   	: in  std_logic := '0';
		I_ADDRA 	: in  std_logic_vector(7 downto 0) := (others => '0');
		I_DA    	: in  std_logic_vector(5 downto 0) := (others => '0');
		O_DA    	: out std_logic_vector(5 downto 0) := (others => '0');

		I_CLKB  	: in  std_logic := '0';
		I_CEB   	: in  std_logic := '0';
		I_WEB   	: in  std_logic := '0';
		I_ADDRB 	: in  std_logic_vector(5 downto 0) := (others => '0');
		I_DB    	: in  std_logic_vector(8 downto 0) := (others => '0');
		O_DB    	: out std_logic_vector(8 downto 0) := (others => '0')
	);
end ram_2EH7M;

architecture RTL of ram_2EH7M is
	signal s_DOA : std_logic_vector( 7 downto 0) := (others => '0');
	signal s_DOB : std_logic_vector(15 downto 0) := (others => '0');

begin
	U_RAM_2EH7M : RAMB16_S9_S18
		generic map (SIM_COLLISION_CHECK => "NONE")  -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL"
		port map (
			-- input
			doa					=> s_DOA,
			dia( 7 downto 6)	=> "00",
			dia( 5 downto 0)	=> I_DA,
			dopa					=> open,
			dipa					=> "0",
			addra(10 downto 8)=> "000",
			addra( 7 downto 0)=> I_ADDRA,
			wea					=> I_WEA,
			ena					=> I_CEA,
			ssra					=> '0',
			clka					=> I_CLKA,

			-- output
			dob					=> s_DOB,
			dib(15 downto 9)	=> "0000000",
			dib( 8 downto 0)	=> I_DB,
			dopb					=> open,
			dipb					=> "00",
			addrb( 9 downto 6)=> "0011",
			addrb( 5 downto 0)=> I_ADDRB,
			web					=> I_WEB,
			enb					=> I_CEB,
			ssrb					=> '0',
			clkb					=> I_CLKB
		);

	O_DA <= s_DOA( 5 downto 0);
	O_DB <= s_DOB( 8 downto 0);
end RTL;

----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity ram_2048_8 is
	port(
		I_CLK  	: in  std_logic := '0';
		I_CE   	: in  std_logic := '0';
		I_WE   	: in  std_logic := '0';
		I_ADDR 	: in  std_logic_vector(10 downto 0) := (others => '0');
		I_D    	: in  std_logic_vector( 7 downto 0) := (others => '0');
		O_D    	: out std_logic_vector( 7 downto 0) := (others => '0')
	);
end ram_2048_8;

architecture RTL of ram_2048_8 is
begin
	U_RAM_2K_8 : RAMB16_S9
	port map (
		do						=> O_D,
		dop					=> open,
		addr(10 downto 0)	=> I_ADDR,
		clk					=> I_CLK,
		di						=> I_D,
		dip					=> "0",
		en						=> I_CE,
		ssr					=> '0',
		we						=> I_WE
	);
end RTL;

------------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity ram_64_8 is
	port(
		I_CLK  	: in  std_logic := '0';
		I_CE   	: in  std_logic := '0';
		I_WE   	: in  std_logic := '0';
		I_ADDR 	: in  std_logic_vector(5 downto 0) := (others => '0');
		I_D    	: in  std_logic_vector(7 downto 0) := (others => '0');
		O_D    	: out std_logic_vector(7 downto 0) := (others => '0')
	);
end ram_64_8;

architecture RTL of ram_64_8 is
	type array_64x8  is array (0 to 63) of std_logic_vector( 7 downto 0);
	signal RAM64x8	: array_64x8  := (others => (others => '0') );
begin
	u_RAM64x8 : process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			if (I_CE = '1') then
				if (I_WE = '1') then
					RAM64x8(conv_integer(I_ADDR)) <= I_D;
				end if;
				O_D <= RAM64x8(conv_integer(I_ADDR));
			end if;
		end if;
	end process;
end RTL;

----------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity ram_256_4 is
	port(
		I_CLK  	: in  std_logic := '0';
		I_CE   	: in  std_logic := '0';
		I_WE   	: in  std_logic := '0';
		I_ADDR 	: in  std_logic_vector(7 downto 0) := (others => '0');
		I_D    	: in  std_logic_vector(3 downto 0) := (others => '0');
		O_D    	: out std_logic_vector(3 downto 0) := (others => '0')
	);
end ram_256_4;

architecture RTL of ram_256_4 is
	type array_256x4  is array (0 to 256) of std_logic_vector( 3 downto 0);
	signal RAM256x4	: array_256x4  := (others => (others => '0') );
begin
	process(I_CLK)
	begin
		if rising_edge(I_CLK) then
			if (I_CE = '1') then
				O_D <= RAM256x4(conv_integer(I_ADDR));
				if (I_WE = '1') then
					RAM256x4(conv_integer(I_ADDR)) <= I_D;
				end if;
			end if;
		end if;
	end process;
end RTL;
