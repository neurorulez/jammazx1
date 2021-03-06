library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ASTEROIDS_PROG_ROM_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ASTEROIDS_PROG_ROM_1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"3B",X"02",X"8D",X"5C",X"02",X"8D",X"7D",X"02",X"8D",X"BF",X"02",X"60",X"00",X"E0",X"F0",X"E0",
		X"A5",X"22",X"F0",X"F7",X"AD",X"19",X"02",X"30",X"F2",X"D0",X"16",X"CE",X"EB",X"02",X"D0",X"EB",
		X"20",X"FE",X"68",X"D0",X"E6",X"A2",X"01",X"8E",X"19",X"02",X"86",X"8B",X"A0",X"47",X"4C",X"16",
		X"77",X"AD",X"07",X"24",X"10",X"04",X"A9",X"03",X"D0",X"07",X"AD",X"06",X"24",X"10",X"07",X"A9",
		X"FD",X"18",X"65",X"79",X"85",X"79",X"A5",X"76",X"4A",X"B0",X"C0",X"AD",X"05",X"24",X"10",X"35",
		X"A9",X"40",X"85",X"12",X"AD",X"3A",X"02",X"20",X"B6",X"68",X"65",X"7C",X"AA",X"A5",X"11",X"6D",
		X"3A",X"02",X"20",X"EA",X"68",X"8D",X"3A",X"02",X"86",X"7C",X"A9",X"00",X"85",X"12",X"AD",X"5B",
		X"02",X"20",X"B6",X"68",X"65",X"7D",X"AA",X"A5",X"11",X"6D",X"5B",X"02",X"20",X"EA",X"68",X"8D",
		X"5B",X"02",X"86",X"7D",X"60",X"A9",X"00",X"AA",X"38",X"ED",X"3A",X"02",X"0A",X"0A",X"90",X"02",
		X"CA",X"18",X"65",X"7C",X"85",X"7C",X"8A",X"6D",X"3A",X"02",X"8D",X"3A",X"02",X"A9",X"00",X"AA",
		X"38",X"ED",X"5B",X"02",X"0A",X"0A",X"90",X"02",X"CA",X"18",X"65",X"7D",X"85",X"7D",X"8A",X"6D",
		X"5B",X"02",X"8D",X"5B",X"02",X"60",X"10",X"03",X"20",X"B6",X"70",X"4A",X"4A",X"4A",X"AA",X"BD",
		X"E1",X"68",X"24",X"73",X"10",X"01",X"4A",X"85",X"11",X"A5",X"79",X"18",X"65",X"12",X"20",X"01",
		X"71",X"20",X"BB",X"49",X"A0",X"00",X"0A",X"90",X"01",X"88",X"0A",X"84",X"11",X"26",X"11",X"18",
		X"60",X"80",X"70",X"60",X"50",X"40",X"30",X"20",X"10",X"11",X"30",X"09",X"C9",X"40",X"90",X"0D",
		X"A2",X"FF",X"A9",X"3F",X"60",X"C9",X"C1",X"B0",X"04",X"A2",X"01",X"A9",X"C1",X"60",X"A5",X"76",
		X"29",X"03",X"D0",X"25",X"E6",X"DE",X"D0",X"21",X"A9",X"02",X"85",X"10",X"A2",X"18",X"BD",X"00",
		X"02",X"0A",X"30",X"0E",X"25",X"10",X"F0",X"0A",X"CE",X"E7",X"02",X"A9",X"00",X"9D",X"00",X"02",
		X"F0",X"07",X"CA",X"10",X"E9",X"06",X"10",X"10",X"E3",X"A2",X"18",X"BD",X"00",X"02",X"F0",X"1E",
		X"BD",X"63",X"02",X"38",X"ED",X"7C",X"02",X"C9",X"05",X"90",X"04",X"C9",X"FB",X"90",X"0F",X"BD",
		X"84",X"02",X"38",X"ED",X"9D",X"02",X"C9",X"05",X"90",X"09",X"C9",X"FB",X"B0",X"05",X"CA",X"10",
		X"DA",X"E8",X"60",X"EE",X"EB",X"02",X"60",X"1C",X"10",X"A2",X"18",X"AD",X"EC",X"02",X"F0",X"03",
		X"4C",X"DE",X"69",X"A5",X"22",X"F0",X"07",X"AD",X"19",X"02",X"F0",X"EA",X"30",X"E8",X"AD",X"1A",
		X"02",X"D0",X"E3",X"8D",X"FF",X"02",X"A6",X"1E",X"95",X"D1",X"A2",X"06",X"9D",X"F8",X"02",X"CA",
		X"10",X"FA",X"AD",X"01",X"28",X"29",X"02",X"09",X"04",X"18",X"6D",X"F0",X"02",X"A8",X"C9",X"0A",
		X"90",X"02",X"A9",X"0A",X"85",X"D9",X"20",X"B6",X"70",X"85",X"DB",X"18",X"69",X"EB",X"85",X"DC",
		X"20",X"B6",X"70",X"85",X"DA",X"C0",X"3F",X"90",X"07",X"A5",X"22",X"D0",X"06",X"20",X"B3",X"66",
		X"EE",X"F0",X"02",X"C0",X"09",X"90",X"02",X"A0",X"09",X"8C",X"E7",X"02",X"84",X"09",X"A2",X"18",
		X"AD",X"EE",X"02",X"C9",X"0A",X"B0",X"03",X"EE",X"EE",X"02",X"A0",X"1A",X"20",X"E7",X"69",X"CA",
		X"C6",X"09",X"D0",X"F8",X"A9",X"7F",X"8D",X"E8",X"02",X"A9",X"30",X"8D",X"ED",X"02",X"A9",X"00",
		X"9D",X"00",X"02",X"CA",X"10",X"FA",X"60",X"AD",X"0A",X"2C",X"29",X"38",X"09",X"04",X"9D",X"00",
		X"02",X"20",X"3B",X"6A",X"AD",X"0A",X"2C",X"4A",X"29",X"1F",X"90",X"13",X"C9",X"18",X"90",X"02",
		X"29",X"17",X"9D",X"84",X"02",X"A9",X"00",X"9D",X"63",X"02",X"9D",X"A5",X"02",X"F0",X"0B",X"9D",
		X"63",X"02",X"A9",X"00",X"9D",X"84",X"02",X"9D",X"C6",X"02",X"60",X"A9",X"60",X"8D",X"BE",X"02",
		X"8D",X"DF",X"02",X"A9",X"00",X"8D",X"3A",X"02",X"8D",X"5B",X"02",X"A9",X"10",X"8D",X"7C",X"02",
		X"A9",X"0C",X"8D",X"9D",X"02",X"A9",X"FF",X"8D",X"EF",X"02",X"60",X"AD",X"0A",X"2C",X"29",X"8F",
		X"10",X"02",X"09",X"F0",X"18",X"79",X"21",X"02",X"20",X"62",X"6A",X"9D",X"21",X"02",X"AD",X"0A",
		X"2C",X"29",X"8F",X"10",X"02",X"09",X"F0",X"18",X"79",X"42",X"02",X"20",X"62",X"6A",X"9D",X"42",
		X"02",X"60",X"10",X"0D",X"C5",X"DC",X"B0",X"02",X"A5",X"DC",X"C5",X"DB",X"90",X"0F",X"A5",X"DB",
		X"60",X"C5",X"D9",X"B0",X"02",X"A5",X"D9",X"C5",X"DA",X"90",X"02",X"A5",X"DA",X"60",X"A5",X"22",
		X"F0",X"0D",X"A9",X"81",X"A2",X"C3",X"20",X"D5",X"7C",X"A0",X"00",X"A5",X"1E",X"D0",X"02",X"A0",
		X"10",X"84",X"01",X"A9",X"19",X"A2",X"DB",X"20",X"1F",X"7A",X"A9",X"70",X"20",X"EA",X"7A",X"A5",
		X"22",X"C9",X"02",X"90",X"14",X"A5",X"1E",X"D0",X"10",X"AD",X"19",X"02",X"D0",X"0B",X"AD",X"EB",
		X"02",X"30",X"06",X"A5",X"76",X"29",X"10",X"F0",X"08",X"A9",X"62",X"A0",X"03",X"38",X"20",X"95",
		X"7C",X"A4",X"6F",X"A9",X"00",X"20",X"74",X"6B",X"A9",X"28",X"20",X"6F",X"7C",X"A5",X"1E",X"D0",
		X"0A",X"AD",X"19",X"02",X"30",X"05",X"F0",X"03",X"20",X"89",X"6B",X"A9",X"00",X"85",X"01",X"05",
		X"24",X"05",X"25",X"F0",X"1E",X"A9",X"74",X"A2",X"DB",X"20",X"1F",X"7A",X"A9",X"50",X"20",X"EA",
		X"7A",X"A9",X"23",X"A0",X"03",X"38",X"20",X"95",X"7C",X"A0",X"00",X"84",X"13",X"20",X"F8",X"79",
		X"20",X"42",X"6D",X"A5",X"22",X"F0",X"16",X"A5",X"F9",X"30",X"12",X"A0",X"0D",X"A9",X"00",X"20",
		X"62",X"71",X"A9",X"68",X"18",X"65",X"20",X"A0",X"03",X"38",X"20",X"95",X"7C",X"A2",X"10",X"A5",
		X"22",X"C9",X"01",X"F0",X"63",X"90",X"05",X"A5",X"1E",X"D0",X"01",X"AA",X"86",X"01",X"A9",X"C0",
		X"A2",X"DB",X"20",X"1F",X"7A",X"A9",X"50",X"20",X"EA",X"7A",X"A5",X"22",X"F0",X"14",X"A5",X"1E",
		X"F0",X"10",X"AD",X"19",X"02",X"D0",X"0B",X"AD",X"EB",X"02",X"30",X"06",X"A5",X"76",X"29",X"10",
		X"F0",X"08",X"A9",X"65",X"A0",X"03",X"38",X"20",X"95",X"7C",X"A4",X"70",X"A9",X"01",X"20",X"74",
		X"6B",X"A9",X"CF",X"20",X"6F",X"7C",X"A5",X"1E",X"F0",X"1E",X"AD",X"19",X"02",X"F0",X"19",X"30",
		X"17",X"4C",X"89",X"6B",X"45",X"1E",X"F0",X"09",X"AE",X"19",X"03",X"30",X"02",X"D0",X"01",X"C8",
		X"60",X"AE",X"19",X"02",X"F0",X"F9",X"30",X"F7",X"60",X"A5",X"8B",X"C9",X"C0",X"90",X"01",X"60",
		X"48",X"49",X"FF",X"69",X"C1",X"85",X"8B",X"A5",X"79",X"48",X"A9",X"40",X"85",X"79",X"20",X"20",
		X"6E",X"68",X"85",X"79",X"68",X"85",X"8B",X"60",X"84",X"01",X"86",X"0E",X"46",X"06",X"66",X"05",
		X"46",X"06",X"66",X"05",X"46",X"06",X"66",X"05",X"46",X"08",X"66",X"07",X"46",X"08",X"66",X"07",
		X"E6",X"08",X"46",X"08",X"66",X"07",X"20",X"27",X"6C",X"A6",X"0E",X"20",X"D1",X"6B",X"A6",X"0E",
		X"60",X"BD",X"00",X"02",X"10",X"13",X"E0",X"19",X"F0",X"0C",X"29",X"0C",X"4A",X"A8",X"B9",X"80",
		X"4D",X"BE",X"81",X"4D",X"D0",X"1F",X"4C",X"5B",X"6D",X"E0",X"19",X"F0",X"1B",X"E0",X"1A",X"F0",
		X"1D",X"B0",X"21",X"0A",X"10",X"03",X"4C",X"75",X"4A",X"4A",X"4A",X"4A",X"29",X"06",X"A8",X"B9",
		X"9D",X"77",X"BE",X"9E",X"77",X"4C",X"D5",X"7C",X"20",X"81",X"66",X"4C",X"20",X"6E",X"A9",X"34",
		X"A2",X"C7",X"D0",X"F1",X"A9",X"70",X"A2",X"F0",X"20",X"EC",X"7A",X"A6",X"0E",X"A5",X"76",X"29",
		X"03",X"D0",X"03",X"DE",X"00",X"02",X"60",X"A2",X"05",X"20",X"38",X"7A",X"A9",X"70",X"38",X"E5",
		X"01",X"C9",X"A0",X"90",X"0C",X"48",X"A9",X"90",X"20",X"EA",X"7A",X"68",X"38",X"E9",X"10",X"D0",
		X"F0",X"4C",X"EA",X"7A",X"6A",X"66",X"10",X"4A",X"66",X"10",X"4A",X"66",X"10",X"4A",X"66",X"10",
		X"85",X"11",X"F8",X"86",X"12",X"A6",X"20",X"A5",X"10",X"29",X"F0",X"18",X"75",X"62",X"95",X"62",
		X"A5",X"11",X"75",X"63",X"95",X"63",X"A9",X"00",X"75",X"64",X"95",X"64",X"D5",X"6A",X"90",X"21",
		X"D0",X"06",X"B5",X"63",X"D5",X"69",X"90",X"19",X"18",X"A5",X"F8",X"75",X"69",X"95",X"69",X"A5",
		X"F9",X"75",X"6A",X"95",X"6A",X"A6",X"1E",X"B5",X"6F",X"C9",X"0A",X"B0",X"04",X"F6",X"6F",X"E6",
		X"7E",X"D8",X"A6",X"12",X"60",X"A5",X"1E",X"4A",X"6A",X"8D",X"04",X"3C",X"60",X"A6",X"22",X"D0",
		X"1C",X"A5",X"77",X"29",X"04",X"F0",X"18",X"86",X"01",X"A9",X"70",X"A2",X"68",X"20",X"1F",X"7A",
		X"A9",X"70",X"20",X"EA",X"7A",X"20",X"48",X"71",X"A0",X"07",X"20",X"59",X"71",X"18",X"60",X"A5",
		X"23",X"05",X"24",X"05",X"25",X"F0",X"E0",X"A0",X"00",X"20",X"59",X"71",X"A2",X"00",X"86",X"10",
		X"86",X"13",X"A9",X"A7",X"85",X"12",X"A2",X"23",X"A9",X"10",X"85",X"01",X"86",X"11",X"B5",X"00",
		X"15",X"01",X"15",X"02",X"F0",X"5A",X"A9",X"5F",X"A6",X"12",X"20",X"1F",X"7A",X"A9",X"40",X"20",
		X"EA",X"7A",X"A5",X"10",X"F8",X"18",X"69",X"01",X"D8",X"85",X"10",X"A9",X"10",X"38",X"A0",X"01",
		X"20",X"95",X"7C",X"A9",X"40",X"AA",X"20",X"EC",X"7A",X"A0",X"00",X"20",X"F8",X"79",X"A5",X"11",
		X"A0",X"03",X"38",X"20",X"95",X"7C",X"A0",X"00",X"20",X"F8",X"79",X"20",X"42",X"6D",X"A5",X"10",
		X"C9",X"04",X"B0",X"0C",X"A5",X"12",X"69",X"02",X"AA",X"A9",X"B2",X"A0",X"02",X"20",X"71",X"7C",
		X"A5",X"12",X"38",X"E9",X"08",X"85",X"12",X"A6",X"11",X"E8",X"E8",X"E8",X"E0",X"41",X"90",X"98",
		X"38",X"60",X"20",X"48",X"6D",X"20",X"48",X"6D",X"A4",X"13",X"20",X"C5",X"66",X"E6",X"13",X"60",
		X"A2",X"18",X"BD",X"00",X"02",X"F0",X"03",X"CA",X"10",X"F8",X"60",X"AD",X"19",X"02",X"C9",X"A2",
		X"B0",X"3B",X"A2",X"07",X"AD",X"0A",X"2C",X"29",X"07",X"45",X"05",X"0A",X"9D",X"00",X"01",X"A5",
		X"06",X"2A",X"9D",X"10",X"01",X"AD",X"0A",X"2C",X"29",X"07",X"45",X"07",X"0A",X"9D",X"08",X"01",
		X"A5",X"08",X"2A",X"9D",X"18",X"01",X"AD",X"0A",X"2C",X"29",X"0F",X"69",X"F8",X"9D",X"20",X"01",
		X"20",X"15",X"6E",X"95",X"DF",X"20",X"15",X"6E",X"95",X"E7",X"CA",X"10",X"C7",X"A9",X"07",X"85",
		X"12",X"85",X"15",X"A6",X"15",X"AD",X"19",X"02",X"20",X"B6",X"70",X"29",X"F0",X"69",X"60",X"85",
		X"09",X"B5",X"EF",X"7D",X"20",X"01",X"95",X"EF",X"4A",X"4A",X"48",X"4A",X"4A",X"4A",X"29",X"04",
		X"85",X"0A",X"05",X"09",X"85",X"09",X"20",X"F6",X"6D",X"85",X"06",X"A5",X"07",X"85",X"05",X"8A",
		X"18",X"69",X"08",X"AA",X"20",X"F6",X"6D",X"20",X"27",X"6C",X"68",X"29",X"1E",X"AA",X"BD",X"6A",
		X"50",X"0A",X"85",X"10",X"BD",X"6B",X"50",X"2A",X"49",X"C0",X"85",X"11",X"A2",X"00",X"20",X"21",
		X"62",X"C6",X"15",X"10",X"AE",X"60",X"A0",X"00",X"B5",X"DF",X"10",X"01",X"88",X"18",X"7D",X"00",
		X"01",X"9D",X"00",X"01",X"85",X"07",X"98",X"7D",X"10",X"01",X"29",X"07",X"9D",X"10",X"01",X"4A",
		X"85",X"08",X"66",X"07",X"60",X"AD",X"0A",X"2C",X"29",X"07",X"18",X"69",X"FC",X"69",X"00",X"60",
		X"A5",X"8B",X"C9",X"C0",X"B0",X"4A",X"69",X"06",X"85",X"8B",X"AD",X"0A",X"2C",X"29",X"04",X"85",
		X"09",X"AD",X"0A",X"2C",X"29",X"04",X"85",X"0A",X"AD",X"0A",X"2C",X"29",X"80",X"85",X"12",X"A9",
		X"09",X"85",X"15",X"A9",X"4D",X"A2",X"87",X"85",X"11",X"86",X"10",X"A0",X"00",X"A2",X"00",X"20",
		X"96",X"6E",X"AD",X"0A",X"2C",X"4A",X"A9",X"00",X"90",X"02",X"A9",X"70",X"05",X"09",X"85",X"09",
		X"20",X"96",X"6E",X"A5",X"09",X"29",X"04",X"85",X"09",X"C6",X"15",X"10",X"E2",X"20",X"96",X"6E",
		X"20",X"A5",X"6E",X"20",X"21",X"62",X"A5",X"8B",X"29",X"F0",X"C9",X"60",X"B0",X"02",X"A9",X"60",
		X"05",X"09",X"85",X"09",X"A2",X"07",X"20",X"96",X"6E",X"2C",X"05",X"24",X"10",X"37",X"A5",X"76",
		X"29",X"04",X"F0",X"31",X"A2",X"01",X"98",X"38",X"65",X"10",X"85",X"10",X"A9",X"00",X"65",X"11",
		X"85",X"11",X"4C",X"21",X"62",X"A5",X"79",X"38",X"E9",X"40",X"20",X"C6",X"6E",X"98",X"4A",X"A8",
		X"A2",X"53",X"B9",X"BC",X"53",X"0A",X"90",X"02",X"E8",X"18",X"69",X"C6",X"85",X"10",X"8A",X"69",
		X"00",X"85",X"11",X"A2",X"00",X"60",X"4A",X"85",X"10",X"4A",X"4A",X"4A",X"4A",X"A8",X"B9",X"EE",
		X"6E",X"0A",X"85",X"12",X"A5",X"10",X"29",X"0E",X"90",X"04",X"49",X"0E",X"69",X"01",X"A8",X"A5",
		X"12",X"29",X"04",X"85",X"09",X"06",X"12",X"A5",X"12",X"29",X"04",X"85",X"0A",X"60",X"00",X"A3",
		X"22",X"81",X"03",X"A0",X"21",X"82",X"46",X"10",X"A6",X"22",X"F0",X"59",X"A6",X"A2",X"D0",X"18",
		X"A5",X"7E",X"F0",X"09",X"A0",X"2F",X"20",X"16",X"77",X"86",X"7E",X"F0",X"0B",X"A5",X"DD",X"F0",
		X"07",X"A0",X"5F",X"20",X"16",X"77",X"86",X"DD",X"AD",X"19",X"02",X"30",X"14",X"F0",X"12",X"0E",
		X"05",X"24",X"66",X"10",X"AD",X"E7",X"02",X"F0",X"08",X"A5",X"83",X"F0",X"0B",X"C6",X"83",X"D0",
		X"1C",X"AD",X"ED",X"02",X"85",X"84",X"10",X"15",X"C6",X"84",X"D0",X"11",X"A9",X"04",X"85",X"83",
		X"E6",X"82",X"A5",X"82",X"29",X"01",X"AA",X"BC",X"60",X"6F",X"20",X"13",X"77",X"A5",X"7F",X"AA",
		X"29",X"3F",X"F0",X"01",X"CA",X"86",X"7F",X"8E",X"00",X"36",X"A5",X"10",X"8D",X"03",X"3C",X"60",
		X"07",X"0F",X"86",X"0E",X"A9",X"50",X"8D",X"EA",X"02",X"B9",X"00",X"02",X"29",X"78",X"0A",X"10",
		X"03",X"4C",X"00",X"48",X"4A",X"85",X"0F",X"B9",X"00",X"02",X"29",X"07",X"4A",X"AA",X"F0",X"02",
		X"05",X"0F",X"99",X"00",X"02",X"A5",X"22",X"F0",X"0F",X"A5",X"0E",X"F0",X"04",X"C9",X"04",X"90",
		X"07",X"BD",X"75",X"4D",X"18",X"20",X"44",X"6C",X"BE",X"00",X"02",X"F0",X"34",X"20",X"50",X"6D",
		X"30",X"2F",X"EE",X"E7",X"02",X"20",X"EB",X"61",X"20",X"3B",X"6A",X"BD",X"21",X"02",X"29",X"1F",
		X"0A",X"5D",X"A5",X"02",X"9D",X"A5",X"02",X"20",X"52",X"6D",X"30",X"15",X"EE",X"E7",X"02",X"20",
		X"EB",X"61",X"20",X"3B",X"6A",X"BD",X"42",X"02",X"29",X"1F",X"0A",X"5D",X"C6",X"02",X"9D",X"C6",
		X"02",X"A6",X"0E",X"60",X"A5",X"22",X"10",X"4D",X"85",X"77",X"85",X"42",X"85",X"43",X"85",X"CE",
		X"20",X"44",X"78",X"A2",X"03",X"A0",X"00",X"B9",X"23",X"00",X"D5",X"62",X"B9",X"24",X"00",X"F5",
		X"63",X"B9",X"25",X"00",X"F5",X"64",X"90",X"2E",X"C8",X"C8",X"C8",X"C0",X"1E",X"90",X"E8",X"CA");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
