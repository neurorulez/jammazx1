library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity robotron_decoder_6 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(8 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of robotron_decoder_6 is
	type rom is array(0 to  511) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"01",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",X"0C",X"0D",X"0E",
		X"0F",X"10",X"11",X"12",X"13",X"14",X"15",X"16",X"17",X"18",X"19",X"1A",X"1B",X"1C",X"1D",X"1E",
		X"1F",X"20",X"21",X"22",X"23",X"24",X"25",X"26",X"27",X"28",X"29",X"2A",X"2B",X"2C",X"2D",X"2E",
		X"2F",X"30",X"31",X"32",X"33",X"34",X"35",X"36",X"37",X"38",X"39",X"3A",X"3B",X"3C",X"3D",X"3E",
		X"3F",X"40",X"41",X"42",X"43",X"44",X"45",X"46",X"47",X"48",X"49",X"4A",X"4B",X"4C",X"4D",X"4E",
		X"4F",X"50",X"51",X"52",X"53",X"54",X"55",X"56",X"57",X"58",X"59",X"5A",X"5B",X"5C",X"5D",X"5E",
		X"5F",X"60",X"61",X"62",X"63",X"64",X"65",X"66",X"67",X"68",X"69",X"6A",X"6B",X"6C",X"6D",X"6E",
		X"6F",X"70",X"71",X"72",X"73",X"74",X"75",X"76",X"77",X"78",X"79",X"7A",X"7B",X"7C",X"7D",X"7E",
		X"7F",X"80",X"81",X"82",X"83",X"84",X"85",X"86",X"87",X"88",X"89",X"8A",X"8B",X"8C",X"8D",X"8E",
		X"8F",X"90",X"91",X"92",X"93",X"94",X"95",X"96",X"97",X"98",X"99",X"9A",X"9B",X"9C",X"9D",X"9E",
		X"9F",X"A0",X"A1",X"A2",X"A3",X"A4",X"A5",X"A6",X"A7",X"A8",X"A9",X"AA",X"AB",X"AC",X"AD",X"AE",
		X"AF",X"B0",X"B1",X"B2",X"B3",X"B4",X"B5",X"B6",X"B7",X"B8",X"B9",X"BA",X"BB",X"BC",X"BD",X"BE",
		X"BF",X"C0",X"C1",X"C2",X"C3",X"C4",X"C5",X"C6",X"C7",X"C8",X"C9",X"CA",X"CB",X"CC",X"CD",X"CE",
		X"CF",X"D0",X"D1",X"D2",X"D3",X"D4",X"D5",X"D6",X"D7",X"D8",X"D9",X"DA",X"DB",X"DC",X"DD",X"DE",
		X"DF",X"E0",X"E1",X"E2",X"E3",X"E4",X"E5",X"E6",X"E7",X"E8",X"E9",X"EA",X"EB",X"EC",X"ED",X"EE",
		X"EF",X"F0",X"F1",X"F2",X"F3",X"F4",X"F5",X"F6",X"F7",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F7",X"F6",X"F5",X"F4",X"F3",X"F2",X"F1",X"F0",X"EF",
		X"EE",X"ED",X"EC",X"EB",X"EA",X"E9",X"E8",X"E7",X"E6",X"E5",X"E4",X"E3",X"E2",X"E1",X"E0",X"DF",
		X"DE",X"DD",X"DC",X"DB",X"DA",X"D9",X"D8",X"D7",X"D6",X"D5",X"D4",X"D3",X"D2",X"D1",X"D0",X"CF",
		X"CE",X"CD",X"CC",X"CB",X"CA",X"C9",X"C8",X"C7",X"C6",X"C5",X"C4",X"C3",X"C2",X"C1",X"C0",X"BF",
		X"BE",X"BD",X"BC",X"BB",X"BA",X"B9",X"B8",X"B7",X"B6",X"B5",X"B4",X"B3",X"B2",X"B1",X"B0",X"AF",
		X"AE",X"AD",X"AC",X"AB",X"AA",X"A9",X"A8",X"A7",X"A6",X"A5",X"A4",X"A3",X"A2",X"A1",X"A0",X"9F",
		X"9E",X"9D",X"9C",X"9B",X"9A",X"99",X"98",X"97",X"96",X"95",X"94",X"93",X"92",X"91",X"90",X"8F",
		X"8E",X"8D",X"8C",X"8B",X"8A",X"89",X"88",X"87",X"86",X"85",X"84",X"83",X"82",X"81",X"80",X"7F",
		X"7E",X"7D",X"7C",X"7B",X"7A",X"79",X"78",X"77",X"76",X"75",X"74",X"73",X"72",X"71",X"70",X"6F",
		X"6E",X"6D",X"6C",X"6B",X"6A",X"69",X"68",X"67",X"66",X"65",X"64",X"63",X"62",X"61",X"60",X"5F",
		X"5E",X"5D",X"5C",X"5B",X"5A",X"59",X"58",X"57",X"56",X"55",X"54",X"53",X"52",X"51",X"50",X"4F",
		X"4E",X"4D",X"4C",X"4B",X"4A",X"49",X"48",X"47",X"46",X"45",X"44",X"43",X"42",X"41",X"40",X"3F",
		X"3E",X"3D",X"3C",X"3B",X"3A",X"39",X"38",X"37",X"36",X"35",X"34",X"33",X"32",X"31",X"30",X"2F",
		X"2E",X"2D",X"2C",X"2B",X"2A",X"29",X"28",X"27",X"26",X"25",X"24",X"23",X"22",X"21",X"20",X"1F",
		X"1E",X"1D",X"1C",X"1B",X"1A",X"19",X"18",X"17",X"16",X"15",X"14",X"13",X"12",X"11",X"10",X"0F",
		X"0E",X"0D",X"0C",X"0B",X"0A",X"09",X"08",X"07",X"06",X"05",X"04",X"03",X"02",X"01",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
