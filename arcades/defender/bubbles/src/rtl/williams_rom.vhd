-- Williams rom for later boards (DW oldgit)
-- Dec 2018
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity ROMS is
port (
	CLK  : in  std_logic;
	ADDR 	: in  std_logic_vector(15 downto 0);
	DO   	: out std_logic_vector( 7 downto 0)
	);
end;

architecture RTL of ROMS is

	signal roms_addr : std_logic_vector(15 downto 0);
	signal rom_cs    : std_logic;


begin

	roms_addr <= 
	"0000" & ADDR(11 downto 0) when ADDR(15 downto 12) = X"D"  else 
	"0001" & ADDR(11 downto 0) when ADDR(15 downto 12) = X"E"  else 
	"0010" & ADDR(11 downto 0) when ADDR(15 downto 12) = X"F"  else 
	ADDR(15 downto 12) + 3 & ADDR(11 downto 0);
	
cpu_prog_rom : entity work.bubbles_prog
port map(
 clk  => CLK,
 addr => roms_addr(15 downto 0),
 data => DO
);

end RTL;