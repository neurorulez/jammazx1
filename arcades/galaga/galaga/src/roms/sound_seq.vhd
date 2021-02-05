library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity sound_seq is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of sound_seq is
	type rom is array(0 to  255) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",
		X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",
		X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",
		X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",X"FF",X"FD",X"FF",X"FF",
		X"F7",X"FF",X"FE",X"FD",X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FE",X"FD",
		X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FF",X"FB",X"F7",X"FF",X"FE",X"FD",X"FF",X"FF",X"FE",X"FD",
		X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FF",X"FB",X"F7",X"FF",X"FE",X"FD",
		X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FE",X"FD",X"FF",X"FF",X"FF",X"FB",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
