library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity splat_cmos_ram is
port (
	clk  : in  std_logic;
	we : in std_logic;
	addr : in  std_logic_vector(9 downto 0);
	d : in  std_logic_vector(7 downto 0);
	q : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of splat_cmos_ram is
	type rom is array(0 to  1023) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"F3",X"F0",X"F0",X"F3",X"F2",X"F5",X"F0",X"F3",X"F0",X"F1",X"F0",X"F4",X"F0",X"F1",X"F0",X"F1",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F5",X"F0",X"F3",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F1",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",
		X"F0",X"FA",X"F1",X"FA",X"F1",X"FC",X"F0",X"FF",X"F1",X"FD",X"F0",X"FF",X"F1",X"F8",X"F1",X"FE",
		X"F0",X"FF",X"F0",X"FE",X"F0",X"FA",X"F0",X"FC",X"F2",X"F3",X"F2",X"FC",X"F0",X"FA",X"F0",X"FA",
		X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F2",X"F1",X"F1",X"F3",X"F1",X"F6",X"F1",X"F6",X"F1",X"F3",
		X"F0",X"FB",X"F1",X"F7",X"F1",X"FD",X"F0",X"FA",X"F0",X"FF",X"F1",X"F6",X"F0",X"FF",X"F0",X"FD",
		X"F1",X"FE",X"F1",X"FC",X"F1",X"F9",X"F1",X"F8",X"F1",X"F3",X"F0",X"FD",X"F1",X"FD",X"F0",X"FA",
		X"F1",X"F3",X"F1",X"F8",X"F0",X"FD",X"F2",X"FD",X"F2",X"F5",X"F2",X"F9",X"F5",X"F7",X"F5",X"FA",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F0",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F1",X"F2",
		X"F1",X"F7",X"F0",X"FC",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",
		X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",
		X"F0",X"FA",X"F0",X"FA",X"F0",X"FA",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FC",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",
		X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",
		X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",
		X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",
		X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",
		X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",
		X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",
		X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",
		X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",
		X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",
		X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F1",X"F2",X"F1",X"F7",X"F0",X"FC",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F1",X"F4",X"F1",X"FC",X"F1",X"F8",X"F0",X"F0",X"F0",X"F1",X"F0",X"F0",
		X"F0",X"F0",X"F1",X"F2",X"F0",X"FF",X"F0",X"FD",X"F0",X"F0",X"F0",X"F1",X"F0",X"F0",X"F0",X"F0",
		X"F1",X"F7",X"F0",X"FC",X"F1",X"FD",X"F0",X"F0",X"F0",X"F1",X"F0",X"F0",X"F0",X"F0",X"F1",X"FA",
		X"F1",X"F0",X"F2",X"F4",X"F0",X"F0",X"F0",X"F1",X"F0",X"F0",X"F0",X"F0",X"F1",X"F4",X"F1",X"F3",
		X"F1",X"F6",X"F0",X"F0",X"F0",X"F1",X"F0",X"F0",X"F0",X"F0",X"F0",X"FD",X"F2",X"F1",X"F1",X"F5",
		X"F0",X"F0",X"F0",X"F1",X"F0",X"F0",X"F0",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
			if we = '1' then
				rom_data(to_integer(unsigned(addr))) <= d;
			end if;
	end if;
end process;
process(clk)
	begin
		if rising_edge(clk) then
			q <= rom_data(to_integer(unsigned(addr)));
		end if;
	end process;	
end architecture;
