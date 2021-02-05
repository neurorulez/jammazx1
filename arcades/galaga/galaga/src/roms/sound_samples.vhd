library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity sound_samples is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of sound_samples is
	type rom is array(0 to  255) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"F7",X"F9",X"FA",X"FB",X"FC",X"FD",X"FD",X"FE",X"FE",X"FE",X"FD",X"FD",X"FC",X"FB",X"FA",X"F9",
		X"F7",X"F5",X"F4",X"F3",X"F2",X"F1",X"F1",X"F0",X"F0",X"F0",X"F1",X"F1",X"F2",X"F3",X"F4",X"F5",
		X"F7",X"F9",X"FA",X"FB",X"F7",X"FD",X"FD",X"F7",X"FE",X"F7",X"FD",X"FD",X"F7",X"FB",X"FA",X"F9",
		X"F7",X"F5",X"F7",X"F3",X"F7",X"F1",X"F7",X"F0",X"F7",X"F0",X"F7",X"F1",X"F7",X"F3",X"F7",X"F5",
		X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",X"FE",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"FB",X"FD",X"FE",X"FD",X"FC",X"FA",X"F8",X"F8",X"F8",X"FA",X"FC",X"FD",X"FE",X"FD",X"FB",X"F8",
		X"F4",X"F2",X"F1",X"F2",X"F3",X"F5",X"F7",X"F7",X"F7",X"F5",X"F3",X"F2",X"F1",X"F2",X"F4",X"F7",
		X"F7",X"FA",X"FC",X"FD",X"FE",X"FD",X"FC",X"FA",X"F7",X"F4",X"F2",X"F1",X"F0",X"F1",X"F2",X"F4",
		X"F7",X"FB",X"FD",X"FE",X"FD",X"FB",X"F7",X"F3",X"F1",X"F0",X"F1",X"F3",X"F7",X"FE",X"F7",X"F0",
		X"F7",X"FE",X"FC",X"F9",X"FC",X"FE",X"FA",X"F7",X"FC",X"FF",X"FD",X"F8",X"FA",X"FB",X"F7",X"F2",
		X"F8",X"FD",X"F9",X"F4",X"F5",X"F7",X"F2",X"F0",X"F3",X"F8",X"F5",X"F1",X"F3",X"F6",X"F3",X"F1",
		X"F7",X"F8",X"FA",X"FC",X"FE",X"FD",X"FC",X"FC",X"FB",X"FA",X"F8",X"F7",X"F5",X"F6",X"F7",X"F8",
		X"F8",X"F9",X"FA",X"FB",X"F9",X"F8",X"F6",X"F5",X"F4",X"F4",X"F3",X"F2",X"F4",X"F6",X"F8",X"F9",
		X"FA",X"FC",X"FC",X"FA",X"F7",X"F7",X"F8",X"FB",X"FD",X"FE",X"FD",X"FA",X"F6",X"F5",X"F5",X"F7",
		X"F9",X"F9",X"F8",X"F4",X"F1",X"F0",X"F1",X"F3",X"F6",X"F7",X"F7",X"F4",X"F2",X"F2",X"F4",X"F7");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
