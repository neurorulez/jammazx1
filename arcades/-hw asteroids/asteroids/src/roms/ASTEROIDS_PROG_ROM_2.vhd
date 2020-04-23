library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ASTEROIDS_PROG_ROM_2 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ASTEROIDS_PROG_ROM_2 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"BD",X"88",X"78",X"85",X"09",X"BD",X"87",X"78",X"85",X"08",X"71",X"08",X"85",X"08",X"90",
		X"02",X"E6",X"09",X"98",X"0A",X"A8",X"B9",X"71",X"78",X"BE",X"72",X"78",X"20",X"03",X"7C",X"A9",
		X"70",X"20",X"DE",X"7C",X"A0",X"00",X"A2",X"00",X"A1",X"08",X"85",X"0B",X"4A",X"4A",X"20",X"4D",
		X"78",X"A1",X"08",X"2A",X"26",X"0B",X"2A",X"A5",X"0B",X"2A",X"0A",X"20",X"53",X"78",X"A1",X"08",
		X"85",X"0B",X"20",X"4D",X"78",X"46",X"0B",X"90",X"DF",X"88",X"4C",X"39",X"7C",X"E6",X"08",X"D0",
		X"02",X"E6",X"09",X"29",X"3E",X"D0",X"04",X"68",X"68",X"D0",X"EE",X"C9",X"0A",X"90",X"02",X"69",
		X"0D",X"AA",X"BD",X"D2",X"56",X"91",X"02",X"C8",X"BD",X"D3",X"56",X"91",X"02",X"C8",X"A2",X"00",
		X"60",X"64",X"B6",X"64",X"B6",X"0C",X"AA",X"0C",X"A2",X"0C",X"9A",X"0C",X"92",X"64",X"C6",X"64",
		X"9D",X"50",X"39",X"50",X"39",X"50",X"39",X"1E",X"57",X"8F",X"78",X"46",X"79",X"F3",X"79",X"0B",
		X"15",X"1B",X"35",X"4D",X"65",X"7F",X"8D",X"93",X"9F",X"AB",X"64",X"D2",X"3B",X"2E",X"C2",X"6C",
		X"5A",X"4C",X"93",X"6F",X"BD",X"1A",X"4C",X"12",X"B0",X"40",X"6B",X"2C",X"0A",X"6C",X"5A",X"4C",
		X"93",X"6E",X"0B",X"6E",X"C0",X"52",X"6C",X"92",X"B8",X"50",X"4D",X"82",X"F2",X"58",X"90",X"4C",
		X"4D",X"F0",X"4C",X"80",X"33",X"70",X"C2",X"42",X"5A",X"4C",X"4C",X"82",X"BB",X"52",X"0B",X"58",
		X"B2",X"42",X"6C",X"9A",X"C3",X"4A",X"82",X"64",X"0A",X"5A",X"90",X"00",X"F6",X"6C",X"09",X"B2",
		X"3B",X"2E",X"C1",X"4C",X"4C",X"B6",X"2B",X"20",X"0D",X"A6",X"C1",X"70",X"48",X"50",X"B6",X"52",
		X"3B",X"D2",X"90",X"00",X"DA",X"64",X"90",X"4C",X"C9",X"D8",X"BE",X"0A",X"32",X"42",X"9B",X"C2",
		X"67",X"68",X"4D",X"AE",X"A1",X"4E",X"48",X"50",X"B6",X"52",X"3B",X"D2",X"90",X"00",X"BE",X"0A",
		X"B6",X"1E",X"94",X"D2",X"A2",X"92",X"0A",X"2C",X"CA",X"4E",X"7A",X"65",X"BD",X"1A",X"4C",X"12",
		X"92",X"13",X"18",X"62",X"CA",X"64",X"F2",X"42",X"20",X"6E",X"A3",X"52",X"82",X"40",X"18",X"62",
		X"CA",X"64",X"F2",X"42",X"18",X"6E",X"A3",X"52",X"80",X"00",X"20",X"62",X"CA",X"64",X"F2",X"64",
		X"08",X"C2",X"BD",X"1A",X"4C",X"00",X"0B",X"15",X"19",X"31",X"41",X"57",X"73",X"7F",X"89",X"95",
		X"A1",X"8A",X"5A",X"84",X"12",X"CD",X"82",X"B9",X"E6",X"B2",X"40",X"74",X"F2",X"4D",X"83",X"D4",
		X"F0",X"B2",X"42",X"B9",X"E6",X"B2",X"42",X"4D",X"F0",X"0E",X"64",X"0A",X"12",X"B8",X"46",X"10",
		X"62",X"4B",X"60",X"82",X"72",X"B5",X"C0",X"BE",X"A8",X"0A",X"64",X"C5",X"92",X"F0",X"74",X"9D",
		X"C2",X"6C",X"9A",X"C3",X"4A",X"82",X"6F",X"A4",X"F2",X"BD",X"D2",X"F0",X"6C",X"9E",X"0A",X"C2",
		X"42",X"A4",X"F2",X"B0",X"74",X"9D",X"C2",X"6C",X"9A",X"C3",X"4A",X"82",X"6F",X"A4",X"F2",X"BD",
		X"D2",X"F0",X"58",X"ED",X"12",X"B5",X"E8",X"29",X"D2",X"0D",X"72",X"2C",X"90",X"0C",X"12",X"C6",
		X"2C",X"48",X"4E",X"9D",X"AC",X"49",X"F0",X"48",X"00",X"2D",X"28",X"CF",X"52",X"B0",X"6E",X"CD",
		X"82",X"BE",X"0A",X"B6",X"00",X"53",X"64",X"0A",X"12",X"0D",X"0A",X"B6",X"1A",X"48",X"00",X"18",
		X"68",X"6A",X"4E",X"48",X"48",X"0B",X"A6",X"CA",X"72",X"B5",X"C0",X"18",X"68",X"6A",X"4E",X"48",
		X"46",X"0B",X"A6",X"CA",X"72",X"B0",X"00",X"20",X"68",X"6A",X"4E",X"4D",X"C2",X"18",X"5C",X"9E",
		X"52",X"CD",X"80",X"0B",X"11",X"17",X"31",X"45",X"5F",X"6B",X"73",X"7D",X"89",X"93",X"B2",X"4E",
		X"9D",X"90",X"B8",X"00",X"76",X"56",X"2A",X"26",X"B0",X"40",X"BE",X"42",X"A6",X"64",X"C1",X"5C",
		X"48",X"52",X"BE",X"0A",X"0A",X"64",X"C5",X"92",X"0C",X"26",X"B8",X"50",X"6A",X"7C",X"0C",X"52",
		X"74",X"EC",X"4D",X"C0",X"A4",X"EC",X"0A",X"8A",X"D4",X"EC",X"0A",X"64",X"C5",X"92",X"0D",X"F2",
		X"B8",X"5A",X"93",X"4E",X"69",X"60",X"4D",X"C0",X"9D",X"2C",X"6C",X"4A",X"0D",X"A6",X"C1",X"70",
		X"48",X"68",X"2D",X"8A",X"0D",X"D2",X"82",X"4E",X"3B",X"66",X"91",X"6C",X"0C",X"0A",X"0C",X"12",
		X"C5",X"8B",X"9D",X"2C",X"6C",X"4A",X"0B",X"3A",X"A2",X"6C",X"BD",X"0A",X"3A",X"40",X"A6",X"60",
		X"B9",X"6C",X"0D",X"F0",X"2D",X"B1",X"76",X"52",X"5C",X"C2",X"C2",X"6C",X"8B",X"64",X"2A",X"27",
		X"18",X"54",X"69",X"D8",X"28",X"48",X"0B",X"B2",X"4A",X"E6",X"B8",X"00",X"18",X"54",X"69",X"D8",
		X"28",X"46",X"0B",X"B2",X"4A",X"E7",X"20",X"54",X"69",X"D8",X"2D",X"C2",X"18",X"5C",X"CA",X"56",
		X"98",X"00",X"52",X"A2",X"02",X"BD",X"00",X"24",X"0A",X"B5",X"7A",X"29",X"1F",X"90",X"37",X"F0",
		X"10",X"C9",X"1B",X"B0",X"0A",X"A8",X"A5",X"5E",X"29",X"07",X"C9",X"07",X"98",X"90",X"02",X"E9",
		X"01",X"95",X"7A",X"AD",X"06",X"20",X"29",X"80",X"F0",X"04",X"A9",X"F0",X"85",X"72",X"A5",X"72",
		X"F0",X"08",X"C6",X"72",X"A9",X"00",X"95",X"7A",X"95",X"77",X"18",X"B5",X"77",X"F0",X"23",X"D6",
		X"77",X"D0",X"1F",X"38",X"B0",X"1C",X"C9",X"1B",X"B0",X"09",X"B5",X"7A",X"69",X"20",X"90",X"D1",
		X"F0",X"01",X"18",X"A9",X"1F",X"B0",X"CA",X"95",X"7A",X"B5",X"77",X"F0",X"01",X"38",X"A9",X"78",
		X"95",X"77",X"90",X"23",X"A9",X"00",X"E0",X"01",X"90",X"16",X"F0",X"0C",X"A5",X"71",X"29",X"0C",
		X"4A",X"4A",X"F0",X"0C",X"69",X"02",X"D0",X"08",X"A5",X"71",X"29",X"10",X"F0",X"02",X"A9",X"01",
		X"38",X"65",X"73",X"85",X"73",X"F6",X"74",X"CA",X"30",X"03",X"4C",X"95",X"7A",X"A5",X"71",X"29",
		X"03",X"A8",X"F0",X"12",X"4A",X"69",X"00",X"49",X"FF",X"38",X"65",X"73",X"90",X"0A",X"C0",X"02",
		X"B0",X"02",X"E6",X"70",X"E6",X"70",X"85",X"73",X"A5",X"5E",X"4A",X"B0",X"27",X"A0",X"00",X"A2",
		X"02",X"B5",X"74",X"F0",X"09",X"C9",X"10",X"90",X"05",X"69",X"EF",X"C8",X"95",X"74",X"CA",X"10",
		X"F0",X"98",X"D0",X"10",X"A2",X"02",X"B5",X"74",X"F0",X"07",X"18",X"69",X"EF",X"95",X"74",X"30",
		X"03",X"CA",X"10",X"F2",X"60",X"48",X"98",X"48",X"8A",X"48",X"D8",X"AD",X"FF",X"01",X"0D",X"D0",
		X"01",X"D0",X"FE",X"E6",X"5E",X"A5",X"5E",X"29",X"03",X"D0",X"08",X"E6",X"5B",X"A5",X"5B",X"C9",
		X"04",X"B0",X"FE",X"20",X"93",X"7A",X"A5",X"6F",X"29",X"C7",X"24",X"74",X"10",X"02",X"09",X"08",
		X"24",X"75",X"10",X"02",X"09",X"10",X"24",X"76",X"10",X"02",X"09",X"20",X"85",X"6F",X"8D",X"00",
		X"32",X"A5",X"72",X"F0",X"04",X"A9",X"80",X"D0",X"0E",X"A5",X"68",X"F0",X"0A",X"A5",X"5C",X"6A",
		X"90",X"02",X"C6",X"68",X"6A",X"6A",X"6A",X"8D",X"05",X"3C",X"68",X"AA",X"68",X"A8",X"68",X"40",
		X"A9",X"B0",X"A0",X"00",X"91",X"02",X"C8",X"91",X"02",X"D0",X"6E",X"90",X"04",X"29",X"0F",X"F0",
		X"05",X"29",X"0F",X"18",X"69",X"01",X"08",X"0A",X"A0",X"00",X"AA",X"BD",X"D4",X"56",X"91",X"02",
		X"BD",X"D5",X"56",X"C8",X"91",X"02",X"20",X"39",X"7C",X"28",X"60",X"4A",X"29",X"0F",X"09",X"E0",
		X"A0",X"01",X"91",X"02",X"88",X"8A",X"6A",X"91",X"02",X"C8",X"D0",X"3D",X"4A",X"29",X"0F",X"09",
		X"C0",X"D0",X"ED",X"A0",X"00",X"84",X"05",X"84",X"07",X"0A",X"26",X"05",X"0A",X"26",X"05",X"85",
		X"04",X"8A",X"0A",X"26",X"07",X"0A",X"26",X"07",X"85",X"06",X"A2",X"04",X"B5",X"02",X"A0",X"00",
		X"91",X"02",X"B5",X"03",X"29",X"0F",X"09",X"A0",X"C8",X"91",X"02",X"B5",X"00",X"C8",X"91",X"02",
		X"B5",X"01",X"29",X"0F",X"05",X"00",X"C8",X"91",X"02",X"98",X"38",X"65",X"02",X"85",X"02",X"90",
		X"02",X"E6",X"03",X"60",X"A9",X"D0",X"4C",X"C2",X"7B",X"A5",X"05",X"C9",X"80",X"90",X"11",X"49",
		X"FF",X"85",X"05",X"A5",X"04",X"49",X"FF",X"69",X"00",X"85",X"04",X"90",X"02",X"E6",X"05",X"38",
		X"26",X"08",X"A5",X"07",X"C9",X"80",X"90",X"11",X"49",X"FF",X"85",X"07",X"A5",X"06",X"49",X"FF",
		X"69",X"00",X"85",X"06",X"90",X"02",X"E6",X"07",X"38",X"26",X"08",X"A5",X"05",X"05",X"07",X"F0",
		X"0A",X"A2",X"00",X"C9",X"02",X"B0",X"24",X"A0",X"01",X"D0",X"10",X"A0",X"02",X"A2",X"09",X"A5",
		X"04",X"05",X"06",X"F0",X"16",X"30",X"04",X"C8",X"0A",X"10",X"FC",X"98",X"AA",X"A5",X"05",X"06",
		X"04",X"2A",X"06",X"06",X"26",X"07",X"88",X"D0",X"F6",X"85",X"05",X"8A",X"38",X"E9",X"0A",X"49",
		X"FF",X"0A",X"66",X"08",X"2A",X"66",X"08",X"2A",X"0A",X"85",X"08",X"A0",X"00",X"A5",X"06",X"91",
		X"02",X"A5",X"08",X"29",X"F4",X"05",X"07",X"C8",X"91",X"02",X"A5",X"04",X"C8",X"91",X"02",X"A5",
		X"08",X"29",X"02",X"0A",X"05",X"01",X"05",X"05",X"C8",X"91",X"02",X"4C",X"39",X"7C",X"A2",X"00",
		X"A0",X"01",X"91",X"02",X"88",X"98",X"91",X"02",X"C8",X"C8",X"91",X"02",X"C8",X"8A",X"91",X"02",
		X"4C",X"39",X"7C",X"A2",X"FE",X"9A",X"D8",X"A9",X"00",X"AA",X"CA",X"9D",X"00",X"03",X"9D",X"00",
		X"02",X"9D",X"00",X"01",X"95",X"00",X"D0",X"F2",X"AC",X"07",X"20",X"30",X"43",X"E8",X"8E",X"00",
		X"40",X"A9",X"E2",X"8D",X"01",X"40",X"A9",X"B0",X"8D",X"03",X"40",X"85",X"32",X"85",X"33",X"A9",
		X"03",X"85",X"6F",X"8D",X"00",X"32",X"2D",X"00",X"28",X"85",X"71",X"AD",X"01",X"28",X"29",X"03",
		X"0A",X"0A",X"05",X"71",X"85",X"71",X"AD",X"02",X"28",X"29",X"02",X"0A",X"0A",X"0A",X"05",X"71",
		X"85",X"71",X"4C",X"03",X"68",X"A0",X"00",X"91",X"02",X"C8",X"8A",X"91",X"02",X"4C",X"39",X"7C",
		X"9D",X"00",X"40",X"9D",X"00",X"41",X"9D",X"00",X"42",X"9D",X"00",X"43",X"9D",X"00",X"44",X"9D",
		X"00",X"45",X"9D",X"00",X"46",X"9D",X"00",X"47",X"E8",X"D0",X"E5",X"8D",X"00",X"34",X"A2",X"00",
		X"B5",X"00",X"D0",X"47",X"A9",X"11",X"95",X"00",X"A8",X"55",X"00",X"D0",X"3E",X"98",X"0A",X"90",
		X"F5",X"E8",X"D0",X"EC",X"8D",X"00",X"34",X"8A",X"85",X"00",X"2A",X"85",X"01",X"A0",X"00",X"A2",
		X"11",X"B1",X"00",X"D0",X"2A",X"8A",X"91",X"00",X"51",X"00",X"D0",X"23",X"8A",X"0A",X"AA",X"90",
		X"F4",X"C8",X"D0",X"EB",X"8D",X"00",X"34",X"E6",X"01",X"A6",X"01",X"E0",X"04",X"90",X"E0",X"A9",
		X"40",X"E0",X"40",X"90",X"D6",X"E0",X"48",X"90",X"D6",X"B0",X"69",X"A0",X"00",X"F0",X"0E",X"A0",
		X"00",X"A6",X"01",X"E0",X"04",X"90",X"06",X"C8",X"E0",X"44",X"90",X"01",X"C8",X"C9",X"10",X"2A",
		X"29",X"1F",X"C9",X"02",X"2A",X"29",X"03",X"88",X"30",X"04",X"0A",X"0A",X"90",X"F9",X"4A",X"A2",
		X"14",X"90",X"02",X"A2",X"1D",X"8E",X"00",X"3A",X"A2",X"00",X"A0",X"08",X"2C",X"01",X"20",X"10",
		X"FB",X"2C",X"01",X"20",X"30",X"FB",X"CA",X"8D",X"00",X"34",X"D0",X"F0",X"88",X"D0",X"ED",X"8E",
		X"00",X"3A",X"A0",X"08",X"2C",X"01",X"20",X"10",X"FB",X"2C",X"01",X"20",X"30",X"FB",X"CA",X"8D",
		X"00",X"34",X"D0",X"F0",X"88",X"D0",X"ED",X"AA",X"D0",X"C4",X"8D",X"00",X"34",X"AD",X"07",X"20",
		X"30",X"F8",X"10",X"FE",X"A9",X"00",X"A8",X"AA",X"85",X"08",X"A9",X"50",X"85",X"09",X"A9",X"04",
		X"85",X"0B",X"A9",X"FF",X"51",X"08",X"C8",X"D0",X"FB",X"E6",X"09",X"C6",X"0B",X"D0",X"F5",X"95",
		X"0D",X"E8",X"8D",X"00",X"34",X"A5",X"09",X"C9",X"58",X"90",X"E1",X"D0",X"02",X"A9",X"68",X"C9",
		X"80",X"90",X"D9",X"8D",X"00",X"03",X"A2",X"04",X"8E",X"00",X"32",X"86",X"15",X"A2",X"00",X"CD",
		X"00",X"02",X"F0",X"01",X"E8",X"AD",X"00",X"03",X"C9",X"88",X"F0",X"01",X"E8",X"86",X"16",X"A9",
		X"10",X"85",X"00",X"A2",X"24",X"AD",X"01",X"20",X"10",X"FB",X"AD",X"01",X"20",X"30",X"FB",X"CA",
		X"10",X"F3",X"2C",X"02",X"20",X"30",X"FB",X"8D",X"00",X"34",X"A9",X"00",X"85",X"02",X"A9",X"40",
		X"85",X"03",X"AD",X"05",X"20",X"10",X"5B",X"A6",X"15",X"AD",X"03",X"20",X"10",X"0A",X"4D",X"09",
		X"00",X"10",X"05",X"CA",X"F0",X"02",X"86",X"15",X"BC",X"BB",X"7E",X"A9",X"B0",X"91",X"02",X"88",
		X"88",X"B9",X"C0",X"7E",X"91",X"02",X"88",X"10",X"F8",X"4C",X"9D",X"7F",X"33",X"1D",X"17",X"0D",
		X"80",X"A0",X"00",X"00",X"00",X"70",X"00",X"00",X"FF",X"92",X"FF",X"73",X"D0",X"A1",X"30",X"02",
		X"00",X"70",X"00",X"00",X"7F",X"FB",X"0D",X"E0",X"00",X"B0",X"7E",X"FA",X"11",X"C0",X"78",X"FE",
		X"00",X"B0",X"13",X"C0",X"00",X"D0",X"15",X"C0",X"00",X"D0",X"17",X"C0",X"00",X"D0",X"7A",X"F8",
		X"00",X"D0",X"A9",X"50",X"A2",X"00",X"20",X"FC",X"7B",X"A9",X"69",X"A2",X"93",X"20",X"03",X"7C",
		X"A9",X"30",X"20",X"DE",X"7C",X"A2",X"03",X"BD",X"00",X"28",X"29",X"01",X"86",X"0B",X"20",X"D1",
		X"7B",X"A6",X"0B",X"BD",X"00",X"28",X"29",X"02",X"4A",X"20",X"D1",X"7B",X"A6",X"0B",X"CA",X"10",
		X"E6",X"A9",X"7A",X"A2",X"9D",X"20",X"03",X"7C",X"A9",X"10",X"20",X"DE",X"7C",X"AD",X"02",X"28",
		X"29",X"02",X"4A",X"69",X"01",X"20",X"D1",X"7B",X"AD",X"01",X"28",X"29",X"03",X"AA",X"BD",X"F5",
		X"7F",X"20",X"D1",X"7B",X"A5",X"16",X"F0",X"07",X"A2",X"88",X"A9",X"50",X"20",X"FC",X"7B",X"A2",
		X"96",X"8E",X"0C",X"00",X"A2",X"07",X"B5",X"0D",X"F0",X"37",X"48",X"8E",X"0B",X"00",X"AE",X"0C",
		X"00",X"8A",X"38",X"E9",X"08",X"8D",X"0C",X"00",X"A9",X"20",X"20",X"03",X"7C",X"A9",X"70",X"20",
		X"DE",X"7C",X"AD",X"0B",X"00",X"20",X"D1",X"7B",X"AD",X"D4",X"56",X"AE",X"D5",X"56",X"20",X"45",
		X"7D",X"68",X"48",X"4A",X"4A",X"4A",X"4A",X"20",X"D1",X"7B",X"68",X"20",X"D1",X"7B",X"AE",X"0B",
		X"00",X"CA",X"10",X"C2",X"A9",X"7F",X"AA",X"20",X"03",X"7C",X"20",X"C0",X"7B",X"A9",X"00",X"A2",
		X"04",X"3E",X"03",X"20",X"6A",X"CA",X"10",X"F9",X"A8",X"A2",X"07",X"3E",X"00",X"24",X"2A",X"CA",
		X"10",X"F9",X"AA",X"45",X"08",X"86",X"08",X"08",X"A9",X"04",X"8D",X"00",X"32",X"2E",X"03",X"20",
		X"2A",X"2E",X"04",X"20",X"2A",X"2E",X"07",X"24",X"2A",X"2E",X"06",X"24",X"2A",X"2E",X"05",X"24",
		X"2A",X"AA",X"28",X"D0",X"09",X"45",X"0A",X"D0",X"05",X"98",X"45",X"09",X"F0",X"02",X"A9",X"80",
		X"8D",X"05",X"3C",X"8D",X"00",X"32",X"8D",X"00",X"30",X"86",X"0A",X"84",X"09",X"AD",X"07",X"20",
		X"10",X"FE",X"4C",X"73",X"7E",X"01",X"04",X"05",X"06",X"4E",X"65",X"7B",X"F3",X"7C",X"F3",X"7C");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;