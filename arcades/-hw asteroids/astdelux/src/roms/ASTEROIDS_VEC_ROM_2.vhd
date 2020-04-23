library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ASTEROIDS_VEC_ROM_2 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ASTEROIDS_VEC_ROM_2 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"80",X"76",X"84",X"4E",X"9E",X"4E",X"D2",X"4E",X"06",X"4F",X"3A",X"4F",X"6A",X"4F",X"9E",X"4F",
		X"CE",X"4F",X"80",X"51",X"80",X"03",X"0E",X"FA",X"0F",X"F8",X"0E",X"FE",X"08",X"FF",X"0A",X"FE",
		X"0B",X"F8",X"0A",X"FA",X"08",X"FB",X"80",X"55",X"80",X"07",X"45",X"C8",X"4E",X"C8",X"57",X"C8",
		X"60",X"C8",X"69",X"C8",X"72",X"C8",X"7B",X"C8",X"84",X"C8",X"8D",X"C8",X"96",X"C8",X"9F",X"C8",
		X"A8",X"C8",X"B1",X"C8",X"BA",X"C8",X"C3",X"C8",X"CC",X"C8",X"D5",X"C8",X"DE",X"C8",X"E7",X"C8",
		X"F0",X"C8",X"F9",X"C8",X"02",X"C9",X"0B",X"C9",X"14",X"C9",X"1D",X"C9",X"26",X"C9",X"2F",X"C9",
		X"38",X"C9",X"41",X"C9",X"4A",X"C9",X"53",X"C9",X"5C",X"C9",X"65",X"C9",X"69",X"C9",X"6F",X"C9",
		X"75",X"C9",X"7B",X"C9",X"81",X"C9",X"87",X"C9",X"8D",X"C9",X"93",X"C9",X"97",X"C9",X"9D",X"C9",
		X"A3",X"C9",X"A9",X"C9",X"AF",X"C9",X"B5",X"C9",X"BB",X"C9",X"80",X"43",X"00",X"76",X"C0",X"55",
		X"00",X"73",X"C0",X"55",X"00",X"77",X"80",X"43",X"00",X"72",X"00",X"D0",X"00",X"43",X"A0",X"76",
		X"20",X"55",X"40",X"73",X"50",X"56",X"90",X"76",X"E0",X"43",X"40",X"71",X"00",X"D0",X"80",X"42",
		X"20",X"77",X"80",X"54",X"70",X"73",X"C0",X"56",X"20",X"76",X"00",X"52",X"40",X"70",X"00",X"D0",
		X"C0",X"41",X"A0",X"77",X"40",X"50",X"80",X"73",X"20",X"57",X"90",X"75",X"00",X"52",X"20",X"74",
		X"00",X"D0",X"00",X"41",X"E0",X"77",X"F0",X"50",X"60",X"73",X"60",X"57",X"F0",X"74",X"E0",X"43",
		X"00",X"75",X"00",X"D0",X"20",X"50",X"00",X"76",X"90",X"51",X"20",X"73",X"80",X"57",X"40",X"74",
		X"A0",X"43",X"C0",X"75",X"00",X"D0",X"40",X"54",X"00",X"76",X"20",X"52",X"C0",X"72",X"70",X"57",
		X"80",X"70",X"20",X"43",X"80",X"76",X"00",X"D0",X"40",X"45",X"E0",X"77",X"90",X"52",X"50",X"72",
		X"40",X"57",X"20",X"71",X"A0",X"42",X"00",X"77",X"00",X"D0",X"00",X"46",X"80",X"77",X"00",X"53",
		X"C0",X"71",X"00",X"57",X"C0",X"71",X"00",X"42",X"80",X"77",X"00",X"D0",X"A0",X"46",X"00",X"77",
		X"40",X"53",X"20",X"71",X"90",X"56",X"50",X"72",X"40",X"41",X"E0",X"77",X"00",X"D0",X"20",X"47",
		X"80",X"76",X"70",X"53",X"80",X"70",X"20",X"56",X"C0",X"72",X"40",X"50",X"00",X"76",X"00",X"D0",
		X"A0",X"47",X"C0",X"75",X"80",X"53",X"40",X"74",X"90",X"55",X"20",X"73",X"20",X"54",X"00",X"76",
		X"00",X"D0",X"E0",X"47",X"00",X"75",X"60",X"53",X"F0",X"74",X"F0",X"54",X"60",X"73",X"00",X"45",
		X"E0",X"77",X"00",X"D0",X"00",X"56",X"20",X"74",X"20",X"53",X"90",X"75",X"40",X"54",X"80",X"73",
		X"C0",X"45",X"A0",X"77",X"00",X"D0",X"00",X"56",X"40",X"70",X"C0",X"52",X"20",X"76",X"80",X"50",
		X"70",X"73",X"80",X"46",X"20",X"77",X"00",X"D0",X"E0",X"47",X"40",X"71",X"50",X"52",X"90",X"76",
		X"20",X"51",X"40",X"73",X"00",X"47",X"A0",X"76",X"00",X"D0",X"80",X"47",X"00",X"72",X"C0",X"51",
		X"00",X"77",X"C0",X"51",X"00",X"73",X"80",X"47",X"00",X"76",X"00",X"D0",X"00",X"47",X"A0",X"72",
		X"20",X"51",X"40",X"77",X"50",X"52",X"90",X"72",X"E0",X"47",X"40",X"75",X"00",X"D0",X"80",X"46",
		X"20",X"73",X"80",X"50",X"70",X"77",X"C0",X"52",X"20",X"72",X"00",X"56",X"40",X"74",X"00",X"D0",
		X"C0",X"45",X"A0",X"73",X"40",X"54",X"80",X"77",X"20",X"53",X"90",X"71",X"00",X"56",X"20",X"70",
		X"00",X"D0",X"00",X"45",X"E0",X"73",X"F0",X"54",X"60",X"77",X"60",X"53",X"F0",X"70",X"E0",X"47",
		X"00",X"71",X"00",X"D0",X"20",X"54",X"00",X"72",X"90",X"55",X"20",X"77",X"80",X"53",X"40",X"70",
		X"A0",X"47",X"C0",X"71",X"00",X"D0",X"40",X"50",X"00",X"72",X"20",X"56",X"C0",X"76",X"70",X"53",
		X"80",X"74",X"20",X"47",X"80",X"72",X"00",X"D0",X"40",X"41",X"E0",X"73",X"90",X"56",X"50",X"76",
		X"40",X"53",X"20",X"75",X"A0",X"46",X"00",X"73",X"00",X"D0",X"00",X"42",X"80",X"73",X"00",X"57",
		X"C0",X"75",X"00",X"53",X"C0",X"75",X"00",X"46",X"80",X"73",X"00",X"D0",X"A0",X"42",X"00",X"73",
		X"40",X"57",X"20",X"75",X"90",X"52",X"50",X"76",X"40",X"45",X"E0",X"73",X"00",X"D0",X"20",X"43",
		X"80",X"72",X"70",X"57",X"80",X"74",X"20",X"52",X"C0",X"76",X"40",X"54",X"00",X"72",X"00",X"D0",
		X"A0",X"43",X"C0",X"71",X"80",X"57",X"40",X"70",X"90",X"51",X"20",X"77",X"20",X"50",X"00",X"72",
		X"00",X"D0",X"E0",X"43",X"00",X"71",X"60",X"57",X"F0",X"70",X"F0",X"50",X"60",X"77",X"00",X"41",
		X"E0",X"73",X"00",X"D0",X"00",X"52",X"20",X"70",X"20",X"57",X"90",X"71",X"40",X"50",X"80",X"77",
		X"C0",X"41",X"A0",X"73",X"00",X"D0",X"00",X"52",X"40",X"74",X"C0",X"56",X"20",X"72",X"80",X"54",
		X"70",X"77",X"80",X"42",X"20",X"73",X"00",X"D0",X"E0",X"43",X"40",X"75",X"50",X"56",X"90",X"72",
		X"20",X"55",X"40",X"77",X"00",X"43",X"A0",X"72",X"00",X"D0",X"09",X"F8",X"45",X"C8",X"0E",X"F8",
		X"D5",X"E8",X"60",X"40",X"00",X"02",X"4E",X"C8",X"60",X"54",X"00",X"06",X"DE",X"E8",X"80",X"31",
		X"C0",X"03",X"57",X"C8",X"80",X"45",X"C0",X"07",X"E7",X"E8",X"40",X"32",X"40",X"03",X"60",X"C8",
		X"40",X"46",X"40",X"07",X"F0",X"E8",X"C0",X"32",X"C0",X"02",X"69",X"C8",X"C0",X"46",X"C0",X"06",
		X"F9",X"E8",X"40",X"33",X"40",X"02",X"72",X"C8",X"40",X"47",X"40",X"06",X"02",X"E9",X"C0",X"33",
		X"80",X"01",X"7B",X"C8",X"C0",X"47",X"80",X"05",X"0B",X"E9",X"00",X"42",X"60",X"00",X"84",X"C8",
		X"00",X"56",X"60",X"04",X"14",X"E9",X"08",X"F9",X"8D",X"C8",X"08",X"FE",X"1D",X"E9",X"00",X"42",
		X"60",X"04",X"96",X"C8",X"00",X"56",X"60",X"00",X"26",X"E9",X"C0",X"33",X"80",X"05",X"9F",X"C8",
		X"C0",X"47",X"80",X"01",X"2F",X"E9",X"40",X"33",X"40",X"06",X"A8",X"C8",X"40",X"47",X"40",X"02",
		X"38",X"E9",X"C0",X"32",X"C0",X"06",X"B1",X"C8",X"C0",X"46",X"C0",X"02",X"41",X"E9",X"40",X"32",
		X"40",X"07",X"BA",X"C8",X"40",X"46",X"40",X"03",X"4A",X"E9",X"80",X"31",X"C0",X"07",X"C3",X"C8",
		X"80",X"45",X"C0",X"03",X"53",X"E9",X"60",X"40",X"00",X"06",X"CC",X"C8",X"60",X"54",X"00",X"02",
		X"5C",X"E9",X"80",X"A0",X"A0",X"01",X"00",X"70",X"00",X"00",X"D7",X"C9",X"80",X"31",X"00",X"02",
		X"75",X"F8",X"70",X"FD",X"71",X"F8",X"80",X"34",X"00",X"02",X"D7",X"C9",X"01",X"F9",X"71",X"F8",
		X"00",X"13",X"00",X"70",X"75",X"F8",X"70",X"F7",X"C0",X"34",X"00",X"03",X"00",X"D0",X"73",X"F5",
		X"73",X"F1",X"78",X"F1",X"77",X"F1",X"77",X"F5",X"78",X"F5",X"00",X"D0",X"00",X"12",X"28",X"3E",
		X"54",X"69",X"7F",X"95",X"AB",X"B4",X"00",X"56",X"80",X"05",X"80",X"50",X"80",X"03",X"09",X"F9",
		X"80",X"51",X"00",X"07",X"80",X"55",X"00",X"07",X"09",X"FD",X"80",X"54",X"80",X"03",X"00",X"63",
		X"C0",X"04",X"00",X"67",X"C0",X"04",X"0B",X"F6",X"0B",X"F2",X"20",X"56",X"50",X"05",X"D0",X"50",
		X"70",X"03",X"40",X"42",X"E0",X"01",X"30",X"51",X"30",X"07",X"D0",X"55",X"D0",X"06",X"C0",X"45",
		X"40",X"02",X"20",X"54",X"80",X"03",X"E8",X"62",X"08",X"05",X"10",X"67",X"78",X"04",X"C0",X"45",
		X"40",X"03",X"60",X"42",X"C0",X"02",X"40",X"56",X"10",X"05",X"30",X"51",X"50",X"03",X"60",X"42",
		X"A0",X"01",X"E0",X"50",X"40",X"07",X"10",X"56",X"B0",X"06",X"A0",X"45",X"60",X"02",X"30",X"50",
		X"90",X"03",X"D0",X"62",X"50",X"05",X"18",X"67",X"28",X"04",X"60",X"45",X"40",X"03",X"80",X"42",
		X"A0",X"02",X"60",X"56",X"E0",X"04",X"80",X"51",X"40",X"03",X"80",X"42",X"40",X"01",X"90",X"50",
		X"50",X"07",X"50",X"56",X"70",X"06",X"40",X"45",X"80",X"02",X"80",X"50",X"80",X"03",X"A8",X"62",
		X"98",X"05",X"18",X"67",X"28",X"00",X"00",X"45",X"80",X"03",X"C0",X"42",X"40",X"02",X"70",X"56",
		X"A0",X"04",X"D0",X"51",X"10",X"03",X"A0",X"42",X"00",X"01",X"40",X"50",X"50",X"07",X"90",X"56",
		X"30",X"06",X"00",X"45",X"A0",X"02",X"E0",X"50",X"60",X"03",X"78",X"62",X"D0",X"05",X"10",X"67",
		X"70",X"00",X"A0",X"44",X"80",X"03",X"0A",X"F3",X"80",X"56",X"60",X"04",X"20",X"52",X"E0",X"02",
		X"C0",X"42",X"C0",X"00",X"20",X"54",X"60",X"07",X"C0",X"56",X"F0",X"05",X"C0",X"44",X"C0",X"02",
		X"30",X"51",X"50",X"03",X"48",X"62",X"10",X"06",X"00",X"67",X"C0",X"00",X"40",X"44",X"A0",X"03",
		X"20",X"43",X"A0",X"01",X"80",X"56",X"20",X"04",X"60",X"52",X"A0",X"02",X"C0",X"42",X"80",X"00",
		X"70",X"54",X"50",X"07",X"E0",X"56",X"A0",X"05",X"A0",X"44",X"C0",X"02",X"90",X"51",X"30",X"03",
		X"10",X"62",X"50",X"06",X"E8",X"66",X"10",X"01",X"00",X"40",X"A0",X"03",X"60",X"43",X"60",X"01",
		X"80",X"56",X"20",X"00",X"A0",X"52",X"60",X"02",X"C0",X"42",X"40",X"00",X"C0",X"54",X"40",X"07",
		X"10",X"57",X"60",X"05",X"40",X"44",X"C0",X"02",X"D0",X"51",X"10",X"03",X"D8",X"61",X"80",X"06",
		X"C8",X"66",X"58",X"01",X"60",X"40",X"80",X"03",X"60",X"43",X"20",X"01",X"80",X"56",X"60",X"00",
		X"E0",X"52",X"20",X"02",X"C0",X"42",X"00",X"00",X"10",X"55",X"30",X"07",X"30",X"57",X"10",X"05",
		X"00",X"40",X"C0",X"02",X"20",X"52",X"E0",X"02",X"98",X"61",X"A8",X"06",X"A8",X"66",X"98",X"01",
		X"C0",X"40",X"80",X"03",X"80",X"43",X"C0",X"00",X"00",X"56",X"80",X"05",X"80",X"50",X"80",X"73",
		X"79",X"F9",X"80",X"51",X"00",X"77",X"80",X"55",X"00",X"77",X"79",X"FD",X"80",X"54",X"80",X"73",
		X"00",X"63",X"C0",X"74",X"00",X"67",X"C0",X"74",X"80",X"70",X"20",X"02",X"00",X"D0",X"70",X"FA",
		X"72",X"F2",X"72",X"F6",X"70",X"FE",X"06",X"F9",X"72",X"F8",X"02",X"F6",X"00",X"D0",X"70",X"FB",
		X"73",X"F0",X"71",X"F5",X"70",X"F5",X"75",X"F5",X"77",X"F0",X"03",X"F0",X"71",X"F5",X"70",X"F5",
		X"75",X"F5",X"77",X"F0",X"0A",X"EB",X"70",X"FB",X"72",X"F8",X"06",X"FF",X"58",X"EB",X"70",X"FB",
		X"72",X"F0",X"72",X"F6",X"70",X"F6",X"76",X"F6",X"76",X"F0",X"0A",X"EB",X"72",X"F8",X"06",X"F8",
		X"70",X"FB",X"72",X"F8",X"05",X"F7",X"77",X"F0",X"00",X"F7",X"03",X"F8",X"00",X"D0",X"70",X"FB",
		X"72",X"F8",X"70",X"F6",X"06",X"F6",X"72",X"F0",X"70",X"F6",X"09",X"EB",X"70",X"FB",X"00",X"F7",
		X"72",X"F8",X"00",X"F3",X"71",X"EB",X"72",X"F8",X"06",X"FB",X"72",X"F8",X"06",X"F0",X"70",X"FF",
		X"02",X"F8",X"00",X"D0",X"00",X"F2",X"72",X"F6",X"72",X"F0",X"36",X"EB",X"70",X"FB",X"03",X"F0",
		X"77",X"F7",X"73",X"F7",X"03",X"F0",X"00",X"D0",X"00",X"FB",X"70",X"FF",X"58",X"EB",X"70",X"FB",
		X"72",X"F6",X"72",X"F2",X"71",X"EB",X"70",X"FB",X"72",X"FF",X"36",X"EB",X"70",X"FB",X"72",X"F8",
		X"70",X"FF",X"76",X"F8",X"03",X"F8",X"00",X"D0",X"70",X"FB",X"72",X"F8",X"70",X"F7",X"76",X"F8",
		X"DC",X"EA",X"70",X"FB",X"72",X"F8",X"70",X"FE",X"76",X"F6",X"76",X"F0",X"02",X"F2",X"72",X"F6",
		X"59",X"EB",X"70",X"FB",X"72",X"F8",X"70",X"F7",X"76",X"F8",X"01",X"F0",X"73",X"F7",X"59",X"EB",
		X"00",X"F2",X"73",X"FA",X"06",X"F9",X"70",X"FE",X"01",X"F6",X"72",X"F0",X"70",X"F6",X"76",X"F0",
		X"70",X"F6",X"72",X"F0",X"00",X"D0",X"72",X"F8",X"70",X"F3",X"76",X"F8",X"70",X"F3",X"72",X"F8",
		X"37",X"EB",X"00",X"FB",X"ED",X"EA",X"00",X"FB",X"70",X"FF",X"72",X"F8",X"70",X"FB",X"01",X"FF",
		X"00",X"D0",X"00",X"FB",X"71",X"FF",X"71",X"FB",X"37",X"EB",X"00",X"FB",X"70",X"FF",X"72",X"F2",
		X"72",X"F6",X"36",X"EB",X"72",X"FB",X"06",X"F8",X"72",X"FF",X"72",X"EB",X"02",X"F0",X"70",X"FA",
		X"76",X"F2",X"02",X"F8",X"76",X"F6",X"02",X"FE",X"00",X"D0",X"00",X"FB",X"72",X"F8",X"76",X"FF",
		X"58",X"EB",X"01",X"FB",X"EF",X"EA",X"00",X"FB",X"72",X"F8",X"70",X"F7",X"76",X"F8",X"70",X"F7",
		X"72",X"F8",X"02",X"F0",X"00",X"D0",X"00",X"FB",X"72",X"F8",X"70",X"FF",X"76",X"F8",X"00",X"F3",
		X"72",X"F8",X"02",X"F7",X"00",X"D0",X"00",X"FB",X"70",X"F7",X"72",X"F8",X"00",X"F3",X"71",X"EB",
		X"00",X"F3",X"72",X"F8",X"70",X"F7",X"76",X"F8",X"70",X"FB",X"03",X"FF",X"00",X"D0",X"00",X"FB",
		X"72",X"F8",X"70",X"FF",X"02",X"F0",X"00",X"D0",X"77",X"CB",X"70",X"FB",X"5C",X"EB",X"02",X"F8",
		X"00",X"F3",X"76",X"F8",X"70",X"F3",X"70",X"EB",X"0A",X"CB",X"06",X"CB",X"51",X"CB",X"53",X"CB",
		X"5B",X"CB",X"63",X"CB",X"2B",X"CB",X"68",X"CB",X"6F",X"CB",X"75",X"CB",X"77",X"CB",X"B7",X"CA",
		X"BF",X"CA",X"CB",X"CA",X"CF",X"CA",X"D6",X"CA",X"D8",X"CA",X"DF",X"CA",X"E6",X"CA",X"EB",X"CA",
		X"F2",X"CA",X"F6",X"CA",X"FC",X"CA",X"FF",X"CA",X"03",X"CB",X"06",X"CB",X"0C",X"CB",X"11",X"CB",
		X"19",X"CB",X"2B",X"CB",X"31",X"CB",X"33",X"CB",X"39",X"CB",X"3D",X"CB",X"42",X"CB",X"46",X"CB",
		X"4D",X"CB",X"74",X"CB",X"80",X"A0",X"00",X"00",X"00",X"70",X"00",X"00",X"00",X"90",X"FF",X"73",
		X"FF",X"92",X"00",X"70",X"00",X"90",X"FF",X"77",X"FF",X"96",X"00",X"70",X"FF",X"92",X"FF",X"72",
		X"00",X"86",X"00",X"72",X"FE",X"87",X"FE",X"77",X"00",X"92",X"00",X"76",X"FE",X"81",X"00",X"72",
		X"FF",X"96",X"FF",X"72",X"7F",X"A3",X"FF",X"03",X"00",X"70",X"00",X"00",X"FF",X"96",X"FF",X"76",
		X"FE",X"81",X"00",X"76",X"00",X"92",X"00",X"72",X"FE",X"87",X"FE",X"73",X"00",X"86",X"00",X"76",
		X"FF",X"92",X"FF",X"76",X"FC",X"A1",X"F4",X"01",X"00",X"70",X"00",X"00",X"DB",X"F0",X"00",X"F9",
		X"CF",X"F0",X"00",X"F9",X"BB",X"F0",X"00",X"F9",X"AF",X"F0",X"00",X"F9",X"9B",X"F0",X"00",X"F9",
		X"8F",X"F0",X"00",X"F9",X"7B",X"F0",X"00",X"F9",X"6F",X"F0",X"00",X"F9",X"5B",X"F0",X"00",X"F9",
		X"4F",X"F0",X"00",X"F9",X"3B",X"F0",X"00",X"F9",X"2F",X"F0",X"00",X"D0",X"E4",X"A0",X"5E",X"11",
		X"00",X"70",X"00",X"00",X"BF",X"CA",X"B7",X"CA",X"03",X"CB",X"F6",X"CA",X"0A",X"CB",X"D6",X"CA",
		X"19",X"CB",X"19",X"CB",X"06",X"CB",X"19",X"EB",X"C0",X"A0",X"9A",X"11",X"00",X"70",X"00",X"00",
		X"EF",X"EB",X"D6",X"CA",X"19",X"CB",X"B7",X"CA",X"2B",X"CB",X"EB",X"CA",X"03",X"CB",X"DF",X"EA");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;