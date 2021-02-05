library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity xevious_cpu3 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of xevious_cpu3 is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"31",X"00",X"A3",X"C3",X"7F",X"00",X"00",X"00",X"87",X"30",X"05",X"24",X"18",X"02",X"00",X"00",
		X"85",X"6F",X"D0",X"24",X"C9",X"00",X"00",X"00",X"77",X"23",X"10",X"FC",X"C9",X"00",X"00",X"00",
		X"3A",X"98",X"A0",X"A7",X"28",X"0B",X"3D",X"28",X"04",X"21",X"90",X"A0",X"C9",X"21",X"8B",X"A0",
		X"C9",X"21",X"86",X"A0",X"C9",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"F5",X"3A",X"80",X"A0",X"A7",X"28",X"03",X"F1",X"ED",X"45",
		X"3E",X"01",X"32",X"80",X"A0",X"32",X"22",X"68",X"AF",X"32",X"22",X"68",X"C3",X"9A",X"00",X"3E",
		X"01",X"32",X"22",X"68",X"CD",X"53",X"0A",X"21",X"00",X"A0",X"36",X"00",X"11",X"01",X"A0",X"01",
		X"FF",X"00",X"ED",X"B0",X"AF",X"32",X"22",X"68",X"18",X"FE",X"21",X"81",X"A0",X"36",X"00",X"11",
		X"82",X"A0",X"01",X"0F",X"00",X"ED",X"B0",X"3A",X"94",X"A0",X"A7",X"28",X"0B",X"21",X"00",X"A0",
		X"86",X"77",X"AF",X"32",X"94",X"A0",X"18",X"16",X"3A",X"28",X"80",X"A7",X"28",X"10",X"21",X"01",
		X"A0",X"36",X"00",X"11",X"02",X"A0",X"01",X"26",X"00",X"ED",X"B0",X"C3",X"D2",X"01",X"3A",X"02",
		X"A0",X"A7",X"28",X"0B",X"21",X"95",X"A0",X"36",X"02",X"CD",X"8B",X"02",X"C3",X"D2",X"01",X"3A",
		X"03",X"A0",X"A7",X"28",X"0B",X"21",X"95",X"A0",X"36",X"03",X"CD",X"8B",X"02",X"C3",X"D2",X"01",
		X"3A",X"04",X"A0",X"A7",X"28",X"0B",X"21",X"95",X"A0",X"36",X"04",X"CD",X"8B",X"02",X"C3",X"D2",
		X"01",X"3A",X"0E",X"A0",X"A7",X"28",X"08",X"21",X"95",X"A0",X"36",X"0E",X"CD",X"8B",X"02",X"3A",
		X"0D",X"A0",X"A7",X"28",X"08",X"21",X"95",X"A0",X"36",X"0D",X"CD",X"8B",X"02",X"21",X"95",X"A0",
		X"36",X"05",X"3A",X"05",X"A0",X"A7",X"28",X"09",X"AF",X"32",X"05",X"A0",X"CD",X"14",X"02",X"18",
		X"0A",X"3A",X"19",X"A0",X"A7",X"CA",X"3B",X"01",X"CD",X"48",X"02",X"3A",X"06",X"A0",X"A7",X"28",
		X"0A",X"21",X"95",X"A0",X"36",X"06",X"CD",X"8B",X"02",X"18",X"2E",X"3A",X"07",X"A0",X"A7",X"28",
		X"0A",X"21",X"95",X"A0",X"36",X"07",X"CD",X"8B",X"02",X"18",X"1E",X"3A",X"08",X"A0",X"A7",X"28",
		X"0A",X"21",X"95",X"A0",X"36",X"08",X"CD",X"8B",X"02",X"18",X"0E",X"3A",X"09",X"A0",X"A7",X"28",
		X"08",X"21",X"95",X"A0",X"36",X"09",X"CD",X"8B",X"02",X"21",X"95",X"A0",X"36",X"0A",X"3A",X"0A",
		X"A0",X"A7",X"28",X"09",X"AF",X"32",X"0A",X"A0",X"CD",X"14",X"02",X"18",X"28",X"3A",X"1E",X"A0",
		X"A7",X"28",X"05",X"CD",X"48",X"02",X"18",X"1D",X"21",X"95",X"A0",X"36",X"0B",X"3A",X"0B",X"A0",
		X"A7",X"28",X"09",X"AF",X"32",X"0B",X"A0",X"CD",X"14",X"02",X"18",X"26",X"3A",X"1F",X"A0",X"A7",
		X"28",X"03",X"CD",X"48",X"02",X"21",X"95",X"A0",X"36",X"0C",X"3A",X"0C",X"A0",X"A7",X"28",X"09",
		X"AF",X"32",X"0C",X"A0",X"CD",X"14",X"02",X"18",X"09",X"3A",X"20",X"A0",X"A7",X"28",X"03",X"CD",
		X"48",X"02",X"3A",X"00",X"A0",X"A7",X"28",X"0A",X"21",X"95",X"A0",X"36",X"00",X"CD",X"8B",X"02",
		X"18",X"0E",X"3A",X"01",X"A0",X"A7",X"28",X"08",X"21",X"95",X"A0",X"36",X"01",X"CD",X"8B",X"02",
		X"21",X"81",X"A0",X"11",X"10",X"68",X"01",X"10",X"00",X"ED",X"B0",X"3A",X"91",X"A0",X"32",X"05",
		X"68",X"3A",X"92",X"A0",X"32",X"0A",X"68",X"3A",X"93",X"A0",X"32",X"0F",X"68",X"AF",X"32",X"80",
		X"A0",X"F1",X"ED",X"45",X"21",X"14",X"A0",X"3A",X"95",X"A0",X"D7",X"34",X"21",X"95",X"A0",X"7E",
		X"87",X"86",X"21",X"C0",X"04",X"D7",X"11",X"96",X"A0",X"01",X"03",X"00",X"ED",X"B0",X"21",X"97",
		X"A0",X"46",X"48",X"21",X"54",X"A0",X"3A",X"96",X"A0",X"D7",X"AF",X"DF",X"41",X"21",X"28",X"A0",
		X"3A",X"96",X"A0",X"D7",X"AF",X"DF",X"18",X"12",X"21",X"95",X"A0",X"7E",X"87",X"86",X"21",X"C0",
		X"04",X"D7",X"11",X"96",X"A0",X"01",X"03",X"00",X"ED",X"B0",X"CD",X"07",X"03",X"21",X"97",X"A0",
		X"35",X"28",X"0A",X"21",X"96",X"A0",X"34",X"21",X"98",X"A0",X"34",X"18",X"ED",X"3A",X"99",X"A0",
		X"A7",X"C8",X"AF",X"32",X"99",X"A0",X"21",X"14",X"A0",X"3A",X"95",X"A0",X"D7",X"36",X"00",X"21",
		X"33",X"04",X"3A",X"95",X"A0",X"CF",X"5E",X"23",X"56",X"EB",X"E9",X"21",X"95",X"A0",X"7E",X"87",
		X"86",X"21",X"C0",X"04",X"D7",X"11",X"96",X"A0",X"01",X"03",X"00",X"ED",X"B0",X"21",X"14",X"A0",
		X"3A",X"95",X"A0",X"D7",X"7E",X"A7",X"20",X"19",X"34",X"21",X"97",X"A0",X"46",X"48",X"21",X"54",
		X"A0",X"3A",X"96",X"A0",X"D7",X"AF",X"DF",X"41",X"21",X"28",X"A0",X"3A",X"96",X"A0",X"D7",X"AF",
		X"DF",X"CD",X"07",X"03",X"21",X"97",X"A0",X"35",X"28",X"0A",X"21",X"96",X"A0",X"34",X"21",X"98",
		X"A0",X"34",X"18",X"ED",X"3A",X"99",X"A0",X"A7",X"C8",X"AF",X"32",X"99",X"A0",X"21",X"14",X"A0",
		X"3A",X"95",X"A0",X"D7",X"36",X"00",X"21",X"00",X"A0",X"3A",X"95",X"A0",X"D7",X"3A",X"95",X"A0",
		X"A7",X"28",X"12",X"FE",X"14",X"28",X"0E",X"36",X"00",X"21",X"33",X"04",X"3A",X"95",X"A0",X"CF",
		X"5E",X"23",X"56",X"EB",X"E9",X"35",X"C9",X"21",X"28",X"A0",X"3A",X"96",X"A0",X"D7",X"34",X"3A",
		X"96",X"A0",X"21",X"8A",X"04",X"CF",X"5E",X"23",X"56",X"21",X"54",X"A0",X"3A",X"96",X"A0",X"D7",
		X"7E",X"EB",X"D7",X"22",X"9A",X"A0",X"7E",X"3C",X"C2",X"34",X"03",X"E7",X"36",X"00",X"3E",X"01",
		X"32",X"99",X"A0",X"C9",X"21",X"FC",X"04",X"3A",X"96",X"A0",X"D7",X"7E",X"A7",X"28",X"05",X"11",
		X"82",X"05",X"18",X"03",X"11",X"68",X"05",X"2A",X"9A",X"A0",X"7E",X"0F",X"0F",X"0F",X"0F",X"E6",
		X"0F",X"EB",X"CF",X"4E",X"23",X"46",X"EB",X"7E",X"E6",X"0F",X"28",X"07",X"CB",X"38",X"CB",X"19",
		X"3D",X"20",X"F9",X"3A",X"98",X"A0",X"A7",X"28",X"0D",X"3D",X"28",X"05",X"21",X"8C",X"A0",X"18",
		X"08",X"21",X"87",X"A0",X"18",X"03",X"21",X"82",X"A0",X"71",X"7E",X"0F",X"0F",X"0F",X"0F",X"23",
		X"77",X"23",X"70",X"7E",X"0F",X"0F",X"0F",X"0F",X"23",X"77",X"EB",X"E7",X"EB",X"2A",X"9A",X"A0",
		X"7E",X"D6",X"C0",X"28",X"4A",X"3A",X"96",X"A0",X"21",X"32",X"05",X"D7",X"A7",X"28",X"21",X"3D",
		X"28",X"0F",X"21",X"28",X"A0",X"3A",X"96",X"A0",X"D7",X"7E",X"FE",X"06",X"30",X"12",X"2F",X"18",
		X"33",X"21",X"28",X"A0",X"3A",X"96",X"A0",X"D7",X"7E",X"FE",X"08",X"30",X"03",X"87",X"18",X"24",
		X"21",X"4D",X"05",X"3A",X"96",X"A0",X"D7",X"7E",X"A7",X"28",X"17",X"47",X"21",X"28",X"A0",X"3A",
		X"96",X"A0",X"D7",X"7E",X"90",X"38",X"0B",X"D6",X"0A",X"30",X"04",X"ED",X"44",X"18",X"05",X"AF",
		X"18",X"02",X"3E",X"0A",X"12",X"21",X"91",X"A0",X"3A",X"98",X"A0",X"D7",X"EB",X"21",X"17",X"05",
		X"3A",X"96",X"A0",X"D7",X"ED",X"A0",X"21",X"ED",X"04",X"3A",X"95",X"A0",X"D7",X"7E",X"2A",X"9A",
		X"A0",X"23",X"5E",X"16",X"00",X"21",X"00",X"00",X"06",X"08",X"CB",X"3F",X"30",X"01",X"19",X"CB",
		X"23",X"CB",X"12",X"10",X"F5",X"45",X"21",X"28",X"A0",X"3A",X"96",X"A0",X"D7",X"78",X"BE",X"C0",
		X"21",X"54",X"A0",X"3A",X"96",X"A0",X"D7",X"34",X"34",X"21",X"28",X"A0",X"3A",X"96",X"A0",X"D7",
		X"36",X"00",X"C9",X"6F",X"04",X"6F",X"04",X"51",X"04",X"51",X"04",X"6F",X"04",X"51",X"04",X"51",
		X"04",X"60",X"04",X"51",X"04",X"51",X"04",X"67",X"04",X"51",X"04",X"51",X"04",X"52",X"04",X"51",
		X"04",X"C9",X"AF",X"32",X"05",X"A0",X"32",X"19",X"A0",X"AF",X"32",X"09",X"A0",X"32",X"1D",X"A0",
		X"AF",X"32",X"0C",X"A0",X"32",X"20",X"A0",X"AF",X"32",X"0B",X"A0",X"32",X"1F",X"A0",X"C9",X"21",
		X"05",X"A0",X"11",X"06",X"A0",X"01",X"09",X"00",X"36",X"00",X"ED",X"B0",X"21",X"19",X"A0",X"11",
		X"1A",X"A0",X"01",X"09",X"00",X"36",X"00",X"ED",X"B0",X"C9",X"9C",X"05",X"DD",X"05",X"1E",X"06",
		X"65",X"06",X"AC",X"06",X"F5",X"06",X"38",X"07",X"6B",X"07",X"9E",X"07",X"DF",X"07",X"20",X"08",
		X"D9",X"09",X"DB",X"09",X"DD",X"09",X"B3",X"08",X"B9",X"08",X"BF",X"08",X"3D",X"09",X"E1",X"08",
		X"9E",X"09",X"C8",X"08",X"38",X"09",X"3A",X"09",X"47",X"08",X"58",X"08",X"EC",X"09",X"11",X"0A",
		X"00",X"02",X"00",X"02",X"03",X"00",X"05",X"03",X"00",X"08",X"03",X"00",X"0C",X"03",X"00",X"0E",
		X"03",X"00",X"11",X"01",X"01",X"12",X"01",X"01",X"13",X"01",X"02",X"14",X"01",X"02",X"15",X"02",
		X"00",X"17",X"01",X"00",X"18",X"01",X"01",X"19",X"01",X"00",X"1A",X"01",X"00",X"02",X"10",X"0A",
		X"0C",X"10",X"06",X"01",X"05",X"01",X"01",X"06",X"01",X"02",X"04",X"0C",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"03",X"00",X"01",X"00",X"00",X"00",X"00",X"02",X"02",X"05",X"04",X"03",X"07",X"05",X"05",X"05",
		X"05",X"06",X"01",X"01",X"01",X"01",X"05",X"07",X"03",X"03",X"01",X"06",X"01",X"01",X"04",X"01",
		X"00",X"00",X"02",X"02",X"02",X"00",X"00",X"02",X"00",X"00",X"02",X"02",X"00",X"02",X"02",X"02",
		X"00",X"00",X"00",X"02",X"00",X"02",X"02",X"02",X"02",X"02",X"02",X"00",X"00",X"00",X"00",X"00",
		X"00",X"02",X"04",X"04",X"04",X"04",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"04",X"04",X"00",X"00",X"00",X"00",X"D0",X"5A",X"37",X"60",X"EF",X"65",X"FF",X"6B",
		X"6B",X"72",X"39",X"79",X"6E",X"80",X"11",X"88",X"29",X"90",X"BC",X"98",X"D0",X"A1",X"70",X"AB",
		X"00",X"00",X"11",X"5C",X"8B",X"61",X"58",X"67",X"7D",X"6D",X"00",X"74",X"E6",X"7A",X"35",X"82",
		X"F2",X"89",X"27",X"92",X"D8",X"9A",X"0C",X"A4",X"CE",X"AD",X"00",X"00",X"79",X"01",X"69",X"01",
		X"59",X"01",X"49",X"01",X"39",X"01",X"29",X"01",X"19",X"01",X"09",X"01",X"78",X"01",X"68",X"01",
		X"58",X"01",X"48",X"01",X"38",X"01",X"28",X"01",X"18",X"01",X"08",X"01",X"77",X"01",X"67",X"01",
		X"57",X"01",X"47",X"01",X"37",X"01",X"52",X"01",X"17",X"01",X"07",X"01",X"76",X"01",X"66",X"01",
		X"56",X"01",X"46",X"01",X"36",X"01",X"26",X"01",X"16",X"01",X"06",X"01",X"FF",X"89",X"01",X"79",
		X"01",X"69",X"01",X"59",X"01",X"49",X"01",X"39",X"01",X"29",X"01",X"19",X"01",X"88",X"01",X"78",
		X"01",X"68",X"01",X"58",X"01",X"48",X"01",X"38",X"01",X"28",X"01",X"18",X"01",X"87",X"01",X"77",
		X"01",X"67",X"01",X"57",X"01",X"47",X"01",X"32",X"01",X"27",X"01",X"17",X"01",X"86",X"01",X"76",
		X"01",X"66",X"01",X"56",X"01",X"46",X"01",X"36",X"01",X"26",X"01",X"16",X"01",X"FF",X"56",X"04",
		X"C0",X"01",X"06",X"01",X"56",X"01",X"96",X"01",X"05",X"01",X"96",X"01",X"C0",X"01",X"56",X"01",
		X"76",X"01",X"C0",X"01",X"76",X"01",X"76",X"01",X"C0",X"01",X"26",X"02",X"C0",X"01",X"76",X"01",
		X"56",X"01",X"C0",X"01",X"46",X"01",X"56",X"04",X"C0",X"01",X"06",X"01",X"56",X"01",X"96",X"01",
		X"05",X"01",X"96",X"01",X"C0",X"01",X"56",X"01",X"66",X"01",X"C0",X"01",X"66",X"01",X"66",X"01",
		X"C0",X"01",X"56",X"07",X"FF",X"97",X"04",X"C0",X"01",X"97",X"01",X"97",X"01",X"06",X"01",X"56",
		X"01",X"06",X"01",X"C0",X"01",X"97",X"01",X"A7",X"01",X"C0",X"01",X"A7",X"01",X"A7",X"01",X"C0",
		X"01",X"A7",X"02",X"C0",X"01",X"A7",X"01",X"A7",X"01",X"C0",X"01",X"A7",X"01",X"97",X"04",X"C0",
		X"01",X"97",X"01",X"97",X"01",X"97",X"01",X"97",X"01",X"97",X"01",X"C0",X"01",X"97",X"01",X"A7",
		X"01",X"C0",X"01",X"A7",X"01",X"A7",X"01",X"C0",X"01",X"97",X"07",X"FF",X"59",X"01",X"59",X"01",
		X"59",X"01",X"59",X"01",X"C0",X"02",X"59",X"01",X"59",X"01",X"59",X"01",X"59",X"01",X"C0",X"02",
		X"59",X"01",X"59",X"01",X"59",X"01",X"59",X"01",X"C0",X"02",X"59",X"01",X"59",X"01",X"59",X"01",
		X"59",X"01",X"C0",X"02",X"59",X"01",X"59",X"01",X"59",X"01",X"59",X"01",X"C0",X"02",X"59",X"01",
		X"59",X"01",X"59",X"01",X"59",X"01",X"C0",X"02",X"59",X"01",X"59",X"01",X"59",X"01",X"59",X"01",
		X"C0",X"01",X"59",X"07",X"FF",X"07",X"01",X"07",X"01",X"07",X"02",X"07",X"02",X"07",X"02",X"07",
		X"02",X"07",X"02",X"07",X"02",X"27",X"02",X"47",X"02",X"57",X"02",X"57",X"02",X"57",X"02",X"57",
		X"02",X"57",X"02",X"97",X"02",X"77",X"02",X"57",X"02",X"77",X"02",X"77",X"02",X"77",X"02",X"77",
		X"02",X"77",X"02",X"26",X"02",X"06",X"02",X"A7",X"02",X"97",X"02",X"97",X"02",X"97",X"02",X"97",
		X"02",X"97",X"02",X"A7",X"02",X"06",X"02",X"FF",X"C0",X"02",X"A8",X"02",X"A8",X"02",X"C0",X"04",
		X"A8",X"02",X"A8",X"02",X"C0",X"04",X"98",X"02",X"98",X"02",X"C0",X"04",X"98",X"02",X"98",X"02",
		X"C0",X"04",X"A8",X"02",X"A8",X"02",X"C0",X"04",X"A8",X"02",X"A8",X"02",X"C0",X"04",X"98",X"02",
		X"98",X"02",X"C0",X"04",X"98",X"02",X"98",X"02",X"C0",X"02",X"FF",X"C0",X"02",X"08",X"02",X"08",
		X"02",X"C0",X"04",X"08",X"02",X"08",X"02",X"C0",X"04",X"58",X"02",X"58",X"02",X"C0",X"04",X"58",
		X"02",X"58",X"02",X"C0",X"04",X"08",X"02",X"08",X"02",X"C0",X"04",X"08",X"02",X"08",X"02",X"C0",
		X"04",X"58",X"02",X"58",X"02",X"C0",X"04",X"58",X"02",X"58",X"02",X"C0",X"02",X"FF",X"96",X"04",
		X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",
		X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",
		X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",
		X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"96",X"04",X"FF",X"56",
		X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",
		X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",
		X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",
		X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"56",X"04",X"FF",
		X"58",X"01",X"07",X"01",X"46",X"0D",X"26",X"01",X"16",X"03",X"46",X"01",X"26",X"0C",X"58",X"01",
		X"07",X"01",X"36",X"0D",X"26",X"01",X"36",X"03",X"56",X"01",X"76",X"03",X"56",X"01",X"36",X"03",
		X"26",X"01",X"06",X"03",X"26",X"01",X"FF",X"69",X"01",X"64",X"01",X"79",X"01",X"14",X"01",X"89",
		X"01",X"85",X"01",X"99",X"01",X"35",X"01",X"FF",X"06",X"01",X"16",X"01",X"26",X"01",X"36",X"01",
		X"46",X"01",X"36",X"01",X"26",X"01",X"16",X"01",X"06",X"01",X"B7",X"01",X"A7",X"01",X"97",X"01",
		X"87",X"01",X"77",X"01",X"67",X"01",X"57",X"01",X"47",X"01",X"37",X"01",X"27",X"01",X"17",X"01",
		X"07",X"01",X"B8",X"01",X"A8",X"01",X"98",X"01",X"88",X"01",X"78",X"01",X"68",X"01",X"58",X"01",
		X"48",X"01",X"38",X"01",X"28",X"01",X"18",X"01",X"08",X"01",X"B9",X"01",X"A9",X"01",X"99",X"01",
		X"89",X"01",X"79",X"01",X"69",X"01",X"59",X"01",X"49",X"01",X"39",X"01",X"29",X"01",X"19",X"01",
		X"09",X"01",X"FF",X"04",X"01",X"74",X"01",X"24",X"01",X"94",X"01",X"44",X"01",X"B4",X"01",X"64",
		X"01",X"14",X"01",X"84",X"01",X"34",X"01",X"FF",X"0A",X"01",X"19",X"01",X"0A",X"01",X"19",X"01",
		X"25",X"01",X"34",X"01",X"25",X"01",X"34",X"01",X"43",X"01",X"52",X"01",X"43",X"01",X"52",X"01",
		X"FF",X"09",X"01",X"19",X"01",X"09",X"01",X"29",X"01",X"09",X"01",X"39",X"01",X"09",X"01",X"49",
		X"01",X"09",X"01",X"39",X"01",X"09",X"01",X"29",X"01",X"09",X"01",X"19",X"01",X"09",X"01",X"19",
		X"01",X"09",X"01",X"29",X"01",X"09",X"01",X"39",X"01",X"09",X"01",X"49",X"01",X"09",X"01",X"39",
		X"01",X"09",X"01",X"29",X"01",X"09",X"01",X"19",X"01",X"09",X"01",X"19",X"01",X"09",X"01",X"29",
		X"01",X"09",X"01",X"39",X"01",X"09",X"01",X"49",X"01",X"09",X"01",X"39",X"01",X"09",X"01",X"29",
		X"01",X"09",X"01",X"19",X"01",X"09",X"01",X"FF",X"05",X"01",X"15",X"05",X"FF",X"04",X"01",X"29",
		X"01",X"14",X"01",X"29",X"01",X"04",X"01",X"39",X"01",X"14",X"01",X"39",X"01",X"04",X"01",X"49",
		X"01",X"14",X"01",X"49",X"01",X"04",X"01",X"59",X"01",X"14",X"01",X"59",X"01",X"04",X"01",X"29",
		X"01",X"14",X"01",X"29",X"01",X"04",X"01",X"39",X"01",X"14",X"01",X"39",X"01",X"04",X"01",X"49",
		X"01",X"14",X"01",X"49",X"01",X"04",X"01",X"59",X"01",X"14",X"01",X"59",X"01",X"04",X"01",X"29",
		X"01",X"14",X"01",X"29",X"01",X"04",X"01",X"39",X"01",X"14",X"01",X"39",X"01",X"04",X"01",X"49",
		X"01",X"14",X"01",X"49",X"01",X"04",X"01",X"59",X"01",X"14",X"01",X"59",X"01",X"FF",X"05",X"01",
		X"15",X"01",X"35",X"01",X"65",X"01",X"A5",X"01",X"65",X"01",X"35",X"01",X"25",X"02",X"15",X"02",
		X"05",X"03",X"06",X"03",X"07",X"04",X"08",X"04",X"09",X"08",X"0A",X"08",X"09",X"08",X"0A",X"08",
		X"09",X"08",X"0A",X"08",X"09",X"08",X"0A",X"08",X"09",X"08",X"0A",X"08",X"09",X"08",X"0A",X"08",
		X"09",X"08",X"0A",X"08",X"09",X"08",X"0A",X"08",X"FF",X"05",X"01",X"76",X"01",X"46",X"01",X"06",
		X"01",X"77",X"01",X"06",X"01",X"46",X"01",X"76",X"01",X"05",X"01",X"FF",X"26",X"01",X"56",X"01",
		X"76",X"01",X"96",X"01",X"05",X"01",X"25",X"01",X"26",X"01",X"56",X"01",X"76",X"01",X"96",X"01",
		X"05",X"01",X"25",X"01",X"26",X"01",X"56",X"01",X"76",X"01",X"96",X"01",X"05",X"01",X"25",X"01",
		X"FF",X"06",X"01",X"05",X"01",X"B6",X"01",X"05",X"01",X"45",X"01",X"05",X"01",X"B6",X"01",X"05",
		X"01",X"06",X"01",X"05",X"01",X"A6",X"01",X"05",X"01",X"45",X"01",X"05",X"01",X"A6",X"01",X"05",
		X"01",X"06",X"01",X"05",X"01",X"96",X"01",X"05",X"01",X"45",X"01",X"05",X"01",X"96",X"01",X"05",
		X"01",X"06",X"01",X"05",X"01",X"86",X"01",X"05",X"01",X"45",X"01",X"05",X"01",X"86",X"01",X"05",
		X"01",X"FF",X"E3",X"11",X"71",X"85",X"21",X"00",X"00",X"0E",X"10",X"06",X"00",X"3E",X"01",X"32",
		X"22",X"68",X"78",X"86",X"12",X"23",X"47",X"79",X"BC",X"20",X"F2",X"C9",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
