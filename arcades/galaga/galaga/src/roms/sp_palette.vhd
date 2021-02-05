library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity sp_palette is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of sp_palette is
	type rom is array(0 to  255) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"FF",X"F8",X"FE",X"F2",X"FF",X"F5",X"FB",X"FC",X"FF",X"F0",X"FB",X"F1",X"FF",X"F1",X"FB",X"F2",
		X"FF",X"F8",X"FD",X"F2",X"FF",X"F6",X"F1",X"F4",X"FF",X"F9",X"F1",X"F5",X"FF",X"F7",X"FB",X"F1",
		X"FF",X"F1",X"F6",X"FB",X"FF",X"F1",X"FB",X"F0",X"FF",X"F1",X"F2",X"F0",X"FF",X"F0",X"F1",X"F6",
		X"FF",X"F0",X"F0",X"F6",X"FF",X"F3",X"FB",X"F9",X"FF",X"F6",X"F2",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
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
