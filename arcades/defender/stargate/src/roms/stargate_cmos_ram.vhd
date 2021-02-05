library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity stargate_cmos_ram is
port (
	clk  : in  std_logic;
	we : in std_logic;
	addr : in  std_logic_vector(9 downto 0);
	d : in  std_logic_vector(7 downto 0);
	q : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of stargate_cmos_ram is
	type rom is array(0 to  1023) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"F1",X"F0",X"F0",X"F3",X"F0",X"F7",X"F0",X"F3",X"F0",X"F1",X"F0",X"F4",X"F0",X"F1",X"F0",X"F1",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F3",X"F0",X"F5",X"F3",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F1",X"F0",X"F0",X"F4",X"F1",X"F0",X"F2",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F5",X"F7",X"F4",X"F9",X"F4",X"FC",X"F4",X"FC",X"F4",X"F9",
		X"F4",X"F1",X"F4",X"FD",X"F5",X"F3",X"F2",X"F0",X"F4",X"F5",X"F4",X"FC",X"F4",X"F5",X"F4",X"F3",
		X"F5",X"F4",X"F5",X"F2",X"F4",X"FF",X"F4",X"FE",X"F4",X"F9",X"F4",X"F3",X"F5",X"F3",X"F2",X"F0",
		X"F4",X"F9",X"F4",X"FE",X"F4",X"F3",X"F3",X"FD",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",
		X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F5",X"F0",
		X"F5",X"F2",X"F4",X"F5",X"F5",X"F3",X"F4",X"F5",X"F4",X"FE",X"F5",X"F4",X"F5",X"F3",X"F3",X"FF",
		X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F0",X"F2",X"F5",X"F2",X"F5",X"F5",X"FF",
		X"FD",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F0",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FF",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",
		X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",
		X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",
		X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",
		X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",
		X"F4",X"F0",X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",
		X"F0",X"F0",X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",
		X"F3",X"FA",X"F3",X"FA",X"F3",X"FA",X"FB",X"F0",X"F0",X"F0",X"F4",X"F0",X"F0",X"F0",X"F4",X"F4",
		X"F5",X"F2",X"F4",X"FA",X"F0",X"F0",X"F0",X"F3",X"F6",X"F4",X"F4",X"F0",X"F4",X"FC",X"F4",X"F5",
		X"F4",X"F4",X"F0",X"F0",X"F0",X"F2",X"F1",X"F8",X"F5",X"F7",X"F5",X"F3",X"F4",X"F1",X"F4",X"FD",
		X"F0",X"F0",X"F0",X"F1",X"F9",X"F5",X"F5",X"F5",X"F5",X"F3",X"F5",X"F3",X"F5",X"F2",X"F0",X"F0",
		X"F0",X"F1",X"F4",X"F5",X"F6",X"F5",X"F4",X"F5",X"F5",X"F0",X"F4",X"FA",X"F0",X"F0",X"F0",X"F1",
		X"F2",X"F7",X"F5",X"F5",X"F4",X"FA",X"F4",X"F5",X"F5",X"F2",X"F0",X"F0",X"F0",X"F1",X"F2",X"F7",
		X"F5",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
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
