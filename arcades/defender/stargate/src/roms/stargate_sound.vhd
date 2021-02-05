library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity stargate_sound is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of stargate_sound is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"DF",X"0F",X"8E",X"00",X"7F",X"CE",X"04",X"00",X"6F",X"01",X"6F",X"03",X"86",X"FF",X"A7",X"00",
		X"6F",X"02",X"86",X"37",X"A7",X"03",X"86",X"3C",X"A7",X"01",X"97",X"09",X"4F",X"97",X"07",X"97",
		X"04",X"97",X"05",X"97",X"06",X"97",X"08",X"0E",X"20",X"FE",X"16",X"48",X"48",X"48",X"1B",X"CE",
		X"00",X"13",X"DF",X"0F",X"CE",X"FD",X"3C",X"BD",X"FC",X"E7",X"C6",X"09",X"7E",X"FA",X"E0",X"96",
		X"1B",X"B7",X"04",X"00",X"96",X"13",X"97",X"1C",X"96",X"14",X"97",X"1D",X"DE",X"18",X"96",X"1C",
		X"73",X"04",X"00",X"09",X"27",X"10",X"4A",X"26",X"FA",X"73",X"04",X"00",X"96",X"1D",X"09",X"27",
		X"05",X"4A",X"26",X"FA",X"20",X"E8",X"B6",X"04",X"00",X"2B",X"01",X"43",X"8B",X"00",X"B7",X"04",
		X"00",X"96",X"1C",X"9B",X"15",X"97",X"1C",X"96",X"1D",X"9B",X"16",X"97",X"1D",X"91",X"17",X"26",
		X"CB",X"96",X"1A",X"27",X"06",X"9B",X"13",X"97",X"13",X"26",X"B9",X"39",X"86",X"01",X"97",X"1A",
		X"C6",X"03",X"20",X"0A",X"86",X"FE",X"97",X"1A",X"86",X"C0",X"C6",X"10",X"20",X"00",X"97",X"19",
		X"86",X"FF",X"B7",X"04",X"00",X"D7",X"15",X"D6",X"15",X"96",X"0A",X"44",X"44",X"44",X"98",X"0A",
		X"44",X"76",X"00",X"09",X"76",X"00",X"0A",X"24",X"03",X"73",X"04",X"00",X"96",X"19",X"4A",X"26",
		X"FD",X"5A",X"26",X"E5",X"96",X"19",X"9B",X"1A",X"97",X"19",X"26",X"DB",X"39",X"86",X"20",X"97",
		X"15",X"97",X"18",X"86",X"01",X"CE",X"00",X"01",X"C6",X"FF",X"20",X"00",X"97",X"13",X"DF",X"16",
		X"D7",X"14",X"D6",X"15",X"96",X"0A",X"44",X"44",X"44",X"98",X"0A",X"44",X"76",X"00",X"09",X"76",
		X"00",X"0A",X"86",X"00",X"24",X"02",X"96",X"14",X"B7",X"04",X"00",X"DE",X"16",X"09",X"26",X"FD",
		X"5A",X"26",X"E1",X"D6",X"14",X"D0",X"13",X"27",X"09",X"DE",X"16",X"08",X"96",X"18",X"27",X"D0",
		X"20",X"CC",X"39",X"C6",X"01",X"D7",X"04",X"4F",X"97",X"19",X"20",X"14",X"4F",X"97",X"19",X"C6",
		X"03",X"20",X"0D",X"86",X"01",X"97",X"19",X"CE",X"03",X"E8",X"86",X"01",X"C6",X"FF",X"20",X"00",
		X"97",X"18",X"D7",X"13",X"DF",X"16",X"7F",X"00",X"15",X"DE",X"16",X"B6",X"04",X"00",X"16",X"54",
		X"54",X"54",X"D8",X"0A",X"54",X"76",X"00",X"09",X"76",X"00",X"0A",X"D6",X"13",X"7D",X"00",X"19",
		X"27",X"02",X"D4",X"09",X"D7",X"14",X"D6",X"15",X"91",X"0A",X"22",X"12",X"09",X"27",X"26",X"B7",
		X"04",X"00",X"DB",X"15",X"99",X"14",X"25",X"16",X"91",X"0A",X"23",X"F0",X"20",X"10",X"09",X"27",
		X"14",X"B7",X"04",X"00",X"D0",X"15",X"92",X"14",X"25",X"04",X"91",X"0A",X"22",X"F0",X"96",X"0A",
		X"B7",X"04",X"00",X"20",X"B9",X"D6",X"18",X"27",X"B5",X"96",X"13",X"D6",X"15",X"44",X"56",X"44",
		X"56",X"44",X"56",X"43",X"50",X"82",X"FF",X"DB",X"15",X"99",X"13",X"D7",X"15",X"97",X"13",X"26",
		X"98",X"C1",X"07",X"26",X"94",X"39",X"86",X"FD",X"97",X"0F",X"CE",X"00",X"64",X"DF",X"0B",X"DB",
		X"0C",X"96",X"11",X"99",X"0B",X"97",X"11",X"DE",X"0B",X"25",X"04",X"20",X"00",X"20",X"03",X"08",
		X"27",X"11",X"DF",X"0B",X"84",X"0F",X"8B",X"60",X"97",X"10",X"DE",X"0F",X"A6",X"00",X"B7",X"04",
		X"00",X"20",X"DC",X"39",X"4F",X"B7",X"04",X"00",X"97",X"11",X"4F",X"91",X"11",X"26",X"03",X"73",
		X"04",X"00",X"C6",X"12",X"5A",X"26",X"FD",X"4C",X"2A",X"F1",X"73",X"04",X"00",X"7C",X"00",X"11",
		X"2A",X"E8",X"39",X"CE",X"00",X"13",X"6F",X"00",X"08",X"8C",X"00",X"1B",X"26",X"F8",X"86",X"40",
		X"97",X"13",X"CE",X"00",X"13",X"86",X"80",X"97",X"11",X"5F",X"A6",X"01",X"AB",X"00",X"A7",X"01",
		X"2A",X"02",X"DB",X"11",X"74",X"00",X"11",X"08",X"08",X"8C",X"00",X"1B",X"26",X"EC",X"F7",X"04",
		X"00",X"7C",X"00",X"12",X"26",X"DC",X"CE",X"00",X"13",X"5F",X"A6",X"00",X"27",X"0B",X"81",X"37",
		X"26",X"04",X"C6",X"41",X"E7",X"02",X"6A",X"00",X"5C",X"08",X"08",X"8C",X"00",X"1B",X"26",X"EA",
		X"5D",X"26",X"BF",X"39",X"7A",X"00",X"08",X"39",X"8D",X"03",X"7E",X"FC",X"D4",X"7F",X"00",X"08",
		X"97",X"11",X"CE",X"FD",X"70",X"A6",X"00",X"27",X"2D",X"7A",X"00",X"11",X"27",X"06",X"4C",X"BD",
		X"FC",X"E7",X"20",X"F1",X"08",X"DF",X"0F",X"BD",X"FC",X"E7",X"DF",X"0D",X"DE",X"0F",X"A6",X"00",
		X"97",X"15",X"A6",X"01",X"EE",X"02",X"DF",X"13",X"8D",X"0E",X"DE",X"0F",X"08",X"08",X"08",X"08",
		X"DF",X"0F",X"9C",X"0D",X"26",X"E8",X"39",X"39",X"CE",X"00",X"16",X"80",X"02",X"23",X"15",X"81",
		X"03",X"27",X"09",X"C6",X"01",X"E7",X"00",X"08",X"80",X"02",X"20",X"F1",X"C6",X"91",X"E7",X"00",
		X"6F",X"01",X"08",X"08",X"C6",X"7E",X"E7",X"00",X"C6",X"FA",X"E7",X"01",X"C6",X"B2",X"E7",X"02",
		X"DE",X"13",X"4F",X"F6",X"00",X"12",X"5C",X"D7",X"12",X"D4",X"15",X"54",X"89",X"00",X"54",X"89",
		X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",
		X"1B",X"48",X"48",X"48",X"48",X"48",X"B7",X"04",X"00",X"09",X"27",X"03",X"7E",X"00",X"16",X"39",
		X"36",X"A6",X"00",X"DF",X"0D",X"DE",X"0F",X"A7",X"00",X"08",X"DF",X"0F",X"DE",X"0D",X"08",X"5A",
		X"26",X"EF",X"32",X"39",X"4F",X"97",X"04",X"97",X"05",X"39",X"7F",X"00",X"04",X"96",X"05",X"84",
		X"7F",X"81",X"1D",X"26",X"01",X"4F",X"4C",X"97",X"05",X"39",X"86",X"0E",X"BD",X"FB",X"57",X"96",
		X"05",X"48",X"48",X"43",X"BD",X"FC",X"0F",X"7C",X"00",X"17",X"BD",X"FC",X"11",X"20",X"F8",X"86",
		X"03",X"BD",X"F8",X"2A",X"D6",X"06",X"C1",X"1F",X"26",X"01",X"5F",X"5C",X"D7",X"06",X"86",X"20",
		X"10",X"5F",X"81",X"14",X"23",X"05",X"CB",X"0E",X"4A",X"20",X"F7",X"CB",X"05",X"4A",X"26",X"FB",
		X"D7",X"13",X"BD",X"F8",X"3F",X"20",X"FB",X"96",X"07",X"26",X"09",X"7C",X"00",X"07",X"86",X"0D",
		X"8D",X"05",X"20",X"69",X"7E",X"FC",X"04",X"16",X"58",X"1B",X"1B",X"1B",X"CE",X"FE",X"EA",X"BD",
		X"FC",X"E7",X"A6",X"00",X"16",X"84",X"0F",X"97",X"14",X"54",X"54",X"54",X"54",X"D7",X"13",X"A6",
		X"01",X"16",X"54",X"54",X"54",X"54",X"D7",X"15",X"84",X"0F",X"97",X"11",X"DF",X"0B",X"CE",X"FE",
		X"4B",X"7A",X"00",X"11",X"2B",X"08",X"A6",X"00",X"4C",X"BD",X"FC",X"E7",X"20",X"F3",X"DF",X"18",
		X"BD",X"FC",X"4B",X"DE",X"0B",X"A6",X"02",X"97",X"1A",X"BD",X"FC",X"5D",X"DE",X"0B",X"A6",X"03",
		X"97",X"16",X"A6",X"04",X"97",X"17",X"A6",X"05",X"16",X"A6",X"06",X"CE",X"FF",X"53",X"BD",X"FC",
		X"E7",X"17",X"DF",X"1B",X"7F",X"00",X"23",X"BD",X"FC",X"E7",X"DF",X"1D",X"39",X"96",X"13",X"97",
		X"22",X"DE",X"1B",X"DF",X"0D",X"DE",X"0D",X"A6",X"00",X"9B",X"23",X"97",X"21",X"9C",X"1D",X"27",
		X"26",X"D6",X"14",X"08",X"DF",X"0D",X"CE",X"00",X"24",X"96",X"21",X"4A",X"26",X"FD",X"A6",X"00",
		X"B7",X"04",X"00",X"08",X"9C",X"1F",X"26",X"F1",X"5A",X"27",X"DA",X"08",X"09",X"08",X"09",X"08",
		X"09",X"08",X"09",X"01",X"01",X"20",X"DF",X"96",X"15",X"8D",X"62",X"7A",X"00",X"22",X"26",X"C1",
		X"96",X"07",X"26",X"46",X"96",X"16",X"27",X"42",X"7A",X"00",X"17",X"27",X"3D",X"9B",X"23",X"97",
		X"23",X"DE",X"1B",X"5F",X"96",X"23",X"7D",X"00",X"16",X"2B",X"06",X"AB",X"00",X"25",X"08",X"20",
		X"0B",X"AB",X"00",X"27",X"02",X"25",X"05",X"5D",X"27",X"08",X"20",X"0F",X"5D",X"26",X"03",X"DF",
		X"1B",X"5C",X"08",X"9C",X"1D",X"26",X"DD",X"5D",X"26",X"01",X"39",X"DF",X"1D",X"96",X"15",X"27",
		X"06",X"8D",X"08",X"96",X"1A",X"8D",X"16",X"7E",X"FB",X"BD",X"39",X"CE",X"00",X"24",X"DF",X"0F",
		X"DE",X"18",X"E6",X"00",X"08",X"BD",X"FA",X"E0",X"DE",X"0F",X"DF",X"1F",X"39",X"4D",X"27",X"2B",
		X"DE",X"18",X"DF",X"0D",X"CE",X"00",X"24",X"97",X"12",X"DF",X"0F",X"DE",X"0D",X"D6",X"12",X"D7",
		X"11",X"E6",X"01",X"54",X"54",X"54",X"54",X"08",X"DF",X"0D",X"DE",X"0F",X"A6",X"00",X"10",X"7A",
		X"00",X"11",X"26",X"FA",X"A7",X"00",X"08",X"9C",X"1F",X"26",X"DE",X"39",X"8E",X"00",X"7F",X"B6",
		X"04",X"02",X"0E",X"43",X"84",X"1F",X"D6",X"08",X"27",X"03",X"BD",X"FA",X"48",X"5F",X"81",X"0E",
		X"27",X"02",X"D7",X"06",X"81",X"12",X"27",X"02",X"D7",X"07",X"4D",X"27",X"27",X"4A",X"81",X"0C",
		X"22",X"08",X"BD",X"FB",X"57",X"BD",X"FB",X"BD",X"20",X"1A",X"81",X"1B",X"22",X"0E",X"80",X"0D",
		X"48",X"CE",X"FD",X"1E",X"8D",X"21",X"EE",X"00",X"AD",X"00",X"20",X"08",X"80",X"1C",X"BD",X"F8",
		X"2A",X"BD",X"F8",X"3F",X"96",X"04",X"9A",X"05",X"27",X"FE",X"4F",X"97",X"07",X"96",X"04",X"27",
		X"03",X"7E",X"F9",X"13",X"7E",X"FB",X"0A",X"DF",X"0D",X"9B",X"0E",X"97",X"0E",X"24",X"03",X"7C",
		X"00",X"0D",X"DE",X"0D",X"39",X"0F",X"8E",X"00",X"7F",X"CE",X"FF",X"FF",X"5F",X"E9",X"00",X"09",
		X"8C",X"F8",X"00",X"26",X"F8",X"E1",X"00",X"27",X"01",X"3E",X"86",X"01",X"BD",X"F8",X"2A",X"BD",
		X"F8",X"3F",X"86",X"02",X"BD",X"FA",X"4D",X"86",X"01",X"BD",X"FA",X"4D",X"20",X"D7",X"FB",X"1F",
		X"F9",X"13",X"FA",X"FA",X"F8",X"8C",X"FB",X"47",X"FA",X"F4",X"F8",X"CD",X"F8",X"94",X"F9",X"1C",
		X"F9",X"23",X"F9",X"A6",X"F9",X"D4",X"F9",X"F3",X"FA",X"44",X"FA",X"87",X"40",X"01",X"00",X"10",
		X"E1",X"00",X"80",X"FF",X"FF",X"28",X"01",X"00",X"08",X"81",X"02",X"00",X"FF",X"FF",X"28",X"81",
		X"00",X"FC",X"01",X"02",X"00",X"FC",X"FF",X"FF",X"01",X"00",X"18",X"41",X"04",X"80",X"00",X"FF",
		X"8C",X"5B",X"B6",X"40",X"BF",X"49",X"A4",X"73",X"73",X"A4",X"49",X"BF",X"40",X"B6",X"5B",X"8C",
		X"1C",X"F8",X"04",X"05",X"55",X"00",X"04",X"05",X"55",X"F8",X"04",X"05",X"55",X"00",X"04",X"05",
		X"55",X"F8",X"04",X"05",X"55",X"00",X"04",X"05",X"55",X"F8",X"17",X"3B",X"41",X"B0",X"1F",X"1D",
		X"04",X"CB",X"00",X"04",X"06",X"66",X"3E",X"1D",X"04",X"CB",X"00",X"04",X"1F",X"FE",X"3E",X"3F",
		X"03",X"97",X"00",X"04",X"06",X"66",X"7C",X"3F",X"03",X"97",X"00",X"04",X"1F",X"FE",X"7C",X"1D",
		X"04",X"CB",X"00",X"04",X"06",X"66",X"F8",X"1D",X"04",X"CB",X"00",X"04",X"06",X"66",X"7C",X"3F",
		X"03",X"97",X"00",X"04",X"06",X"66",X"F8",X"3F",X"03",X"97",X"00",X"04",X"2C",X"CA",X"7C",X"3F",
		X"03",X"97",X"7C",X"1D",X"04",X"CB",X"7C",X"12",X"05",X"61",X"7C",X"0D",X"05",X"B3",X"7C",X"12",
		X"05",X"61",X"7C",X"0D",X"05",X"B3",X"7C",X"04",X"06",X"66",X"7C",X"0D",X"05",X"B3",X"7C",X"12",
		X"05",X"61",X"7C",X"1D",X"04",X"CB",X"3E",X"37",X"03",X"CE",X"3E",X"3F",X"03",X"97",X"7C",X"04",
		X"06",X"66",X"7C",X"0D",X"05",X"B3",X"7C",X"12",X"05",X"61",X"7C",X"1D",X"04",X"CB",X"7C",X"23",
		X"04",X"86",X"7C",X"1D",X"04",X"CB",X"7C",X"12",X"05",X"61",X"3E",X"1D",X"04",X"CB",X"00",X"04",
		X"06",X"66",X"7C",X"1D",X"04",X"CB",X"00",X"04",X"06",X"66",X"3E",X"3F",X"03",X"97",X"00",X"04",
		X"06",X"66",X"7C",X"3F",X"03",X"97",X"00",X"04",X"1F",X"FE",X"F8",X"1D",X"2F",X"EE",X"00",X"47",
		X"3F",X"37",X"30",X"29",X"23",X"1D",X"17",X"12",X"0D",X"08",X"04",X"08",X"7F",X"D9",X"FF",X"D9",
		X"7F",X"24",X"00",X"24",X"08",X"00",X"40",X"80",X"00",X"FF",X"00",X"80",X"40",X"10",X"7F",X"B0",
		X"D9",X"F5",X"FF",X"F5",X"D9",X"B0",X"7F",X"4E",X"24",X"09",X"00",X"09",X"24",X"4E",X"10",X"7F",
		X"C5",X"EC",X"E7",X"BF",X"8D",X"6D",X"6A",X"7F",X"94",X"92",X"71",X"40",X"17",X"12",X"39",X"10",
		X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",
		X"48",X"8A",X"95",X"A0",X"AB",X"B5",X"BF",X"C8",X"D1",X"DA",X"E1",X"E8",X"EE",X"F3",X"F7",X"FB",
		X"FD",X"FE",X"FF",X"FE",X"FD",X"FB",X"F7",X"F3",X"EE",X"E8",X"E1",X"DA",X"D1",X"C8",X"BF",X"B5",
		X"AB",X"A0",X"95",X"8A",X"7F",X"75",X"6A",X"5F",X"54",X"4A",X"40",X"37",X"2E",X"25",X"1E",X"17",
		X"11",X"0C",X"08",X"04",X"02",X"01",X"00",X"01",X"02",X"04",X"08",X"0C",X"11",X"17",X"1E",X"25",
		X"2E",X"37",X"40",X"4A",X"54",X"5F",X"6A",X"75",X"7F",X"10",X"59",X"7B",X"98",X"AC",X"B3",X"AC",
		X"98",X"7B",X"59",X"37",X"19",X"06",X"00",X"06",X"19",X"37",X"81",X"24",X"00",X"00",X"00",X"16",
		X"31",X"12",X"05",X"1A",X"FF",X"00",X"27",X"6D",X"11",X"05",X"11",X"01",X"0F",X"01",X"47",X"11",
		X"31",X"00",X"01",X"00",X"0D",X"1B",X"F4",X"12",X"00",X"00",X"00",X"14",X"47",X"41",X"45",X"00",
		X"00",X"00",X"0F",X"5B",X"21",X"35",X"11",X"FF",X"00",X"0D",X"1B",X"15",X"00",X"00",X"FD",X"00",
		X"01",X"69",X"31",X"11",X"00",X"01",X"00",X"03",X"6A",X"01",X"15",X"01",X"01",X"01",X"01",X"47",
		X"F6",X"53",X"03",X"00",X"02",X"06",X"94",X"6A",X"10",X"02",X"00",X"02",X"06",X"9A",X"1F",X"12",
		X"00",X"FF",X"10",X"04",X"69",X"31",X"11",X"00",X"FF",X"00",X"0D",X"00",X"12",X"06",X"00",X"FF",
		X"01",X"09",X"28",X"A0",X"98",X"90",X"88",X"80",X"78",X"70",X"68",X"60",X"58",X"50",X"44",X"40",
		X"01",X"01",X"02",X"02",X"04",X"04",X"08",X"08",X"10",X"10",X"30",X"60",X"C0",X"E0",X"01",X"01",
		X"02",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0C",X"80",X"7C",X"78",X"74",X"70",
		X"74",X"78",X"7C",X"80",X"01",X"01",X"02",X"02",X"04",X"04",X"08",X"08",X"10",X"20",X"28",X"30",
		X"38",X"40",X"48",X"50",X"60",X"70",X"80",X"A0",X"B0",X"C0",X"08",X"40",X"08",X"40",X"08",X"40",
		X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"01",X"02",
		X"04",X"08",X"09",X"0A",X"0B",X"0C",X"0E",X"0F",X"10",X"12",X"14",X"16",X"40",X"10",X"08",X"01",
		X"01",X"01",X"01",X"01",X"02",X"02",X"03",X"03",X"04",X"04",X"05",X"06",X"08",X"0A",X"0C",X"10",
		X"14",X"18",X"20",X"30",X"40",X"50",X"40",X"30",X"20",X"10",X"0C",X"0A",X"08",X"07",X"06",X"05",
		X"04",X"03",X"02",X"02",X"01",X"01",X"01",X"07",X"08",X"09",X"0A",X"0C",X"08",X"17",X"18",X"19",
		X"1A",X"1B",X"1C",X"00",X"00",X"00",X"00",X"00",X"FC",X"8C",X"F8",X"01",X"FC",X"F5",X"F8",X"01",
		X"DF",X"0F",X"8E",X"00",X"7F",X"CE",X"04",X"00",X"6F",X"01",X"6F",X"03",X"86",X"FF",X"A7",X"00",
		X"6F",X"02",X"86",X"37",X"A7",X"03",X"86",X"3C",X"A7",X"01",X"97",X"09",X"4F",X"97",X"07",X"97",
		X"04",X"97",X"05",X"97",X"06",X"97",X"08",X"0E",X"20",X"FE",X"16",X"48",X"48",X"48",X"1B",X"CE",
		X"00",X"13",X"DF",X"0F",X"CE",X"FD",X"3C",X"BD",X"FC",X"E7",X"C6",X"09",X"7E",X"FA",X"E0",X"96",
		X"1B",X"B7",X"04",X"00",X"96",X"13",X"97",X"1C",X"96",X"14",X"97",X"1D",X"DE",X"18",X"96",X"1C",
		X"73",X"04",X"00",X"09",X"27",X"10",X"4A",X"26",X"FA",X"73",X"04",X"00",X"96",X"1D",X"09",X"27",
		X"05",X"4A",X"26",X"FA",X"20",X"E8",X"B6",X"04",X"00",X"2B",X"01",X"43",X"8B",X"00",X"B7",X"04",
		X"00",X"96",X"1C",X"9B",X"15",X"97",X"1C",X"96",X"1D",X"9B",X"16",X"97",X"1D",X"91",X"17",X"26",
		X"CB",X"96",X"1A",X"27",X"06",X"9B",X"13",X"97",X"13",X"26",X"B9",X"39",X"86",X"01",X"97",X"1A",
		X"C6",X"03",X"20",X"0A",X"86",X"FE",X"97",X"1A",X"86",X"C0",X"C6",X"10",X"20",X"00",X"97",X"19",
		X"86",X"FF",X"B7",X"04",X"00",X"D7",X"15",X"D6",X"15",X"96",X"0A",X"44",X"44",X"44",X"98",X"0A",
		X"44",X"76",X"00",X"09",X"76",X"00",X"0A",X"24",X"03",X"73",X"04",X"00",X"96",X"19",X"4A",X"26",
		X"FD",X"5A",X"26",X"E5",X"96",X"19",X"9B",X"1A",X"97",X"19",X"26",X"DB",X"39",X"86",X"20",X"97",
		X"15",X"97",X"18",X"86",X"01",X"CE",X"00",X"01",X"C6",X"FF",X"20",X"00",X"97",X"13",X"DF",X"16",
		X"D7",X"14",X"D6",X"15",X"96",X"0A",X"44",X"44",X"44",X"98",X"0A",X"44",X"76",X"00",X"09",X"76",
		X"00",X"0A",X"86",X"00",X"24",X"02",X"96",X"14",X"B7",X"04",X"00",X"DE",X"16",X"09",X"26",X"FD",
		X"5A",X"26",X"E1",X"D6",X"14",X"D0",X"13",X"27",X"09",X"DE",X"16",X"08",X"96",X"18",X"27",X"D0",
		X"20",X"CC",X"39",X"C6",X"01",X"D7",X"04",X"4F",X"97",X"19",X"20",X"14",X"4F",X"97",X"19",X"C6",
		X"03",X"20",X"0D",X"86",X"01",X"97",X"19",X"CE",X"03",X"E8",X"86",X"01",X"C6",X"FF",X"20",X"00",
		X"97",X"18",X"D7",X"13",X"DF",X"16",X"7F",X"00",X"15",X"DE",X"16",X"B6",X"04",X"00",X"16",X"54",
		X"54",X"54",X"D8",X"0A",X"54",X"76",X"00",X"09",X"76",X"00",X"0A",X"D6",X"13",X"7D",X"00",X"19",
		X"27",X"02",X"D4",X"09",X"D7",X"14",X"D6",X"15",X"91",X"0A",X"22",X"12",X"09",X"27",X"26",X"B7",
		X"04",X"00",X"DB",X"15",X"99",X"14",X"25",X"16",X"91",X"0A",X"23",X"F0",X"20",X"10",X"09",X"27",
		X"14",X"B7",X"04",X"00",X"D0",X"15",X"92",X"14",X"25",X"04",X"91",X"0A",X"22",X"F0",X"96",X"0A",
		X"B7",X"04",X"00",X"20",X"B9",X"D6",X"18",X"27",X"B5",X"96",X"13",X"D6",X"15",X"44",X"56",X"44",
		X"56",X"44",X"56",X"43",X"50",X"82",X"FF",X"DB",X"15",X"99",X"13",X"D7",X"15",X"97",X"13",X"26",
		X"98",X"C1",X"07",X"26",X"94",X"39",X"86",X"FD",X"97",X"0F",X"CE",X"00",X"64",X"DF",X"0B",X"DB",
		X"0C",X"96",X"11",X"99",X"0B",X"97",X"11",X"DE",X"0B",X"25",X"04",X"20",X"00",X"20",X"03",X"08",
		X"27",X"11",X"DF",X"0B",X"84",X"0F",X"8B",X"60",X"97",X"10",X"DE",X"0F",X"A6",X"00",X"B7",X"04",
		X"00",X"20",X"DC",X"39",X"4F",X"B7",X"04",X"00",X"97",X"11",X"4F",X"91",X"11",X"26",X"03",X"73",
		X"04",X"00",X"C6",X"12",X"5A",X"26",X"FD",X"4C",X"2A",X"F1",X"73",X"04",X"00",X"7C",X"00",X"11",
		X"2A",X"E8",X"39",X"CE",X"00",X"13",X"6F",X"00",X"08",X"8C",X"00",X"1B",X"26",X"F8",X"86",X"40",
		X"97",X"13",X"CE",X"00",X"13",X"86",X"80",X"97",X"11",X"5F",X"A6",X"01",X"AB",X"00",X"A7",X"01",
		X"2A",X"02",X"DB",X"11",X"74",X"00",X"11",X"08",X"08",X"8C",X"00",X"1B",X"26",X"EC",X"F7",X"04",
		X"00",X"7C",X"00",X"12",X"26",X"DC",X"CE",X"00",X"13",X"5F",X"A6",X"00",X"27",X"0B",X"81",X"37",
		X"26",X"04",X"C6",X"41",X"E7",X"02",X"6A",X"00",X"5C",X"08",X"08",X"8C",X"00",X"1B",X"26",X"EA",
		X"5D",X"26",X"BF",X"39",X"7A",X"00",X"08",X"39",X"8D",X"03",X"7E",X"FC",X"D4",X"7F",X"00",X"08",
		X"97",X"11",X"CE",X"FD",X"70",X"A6",X"00",X"27",X"2D",X"7A",X"00",X"11",X"27",X"06",X"4C",X"BD",
		X"FC",X"E7",X"20",X"F1",X"08",X"DF",X"0F",X"BD",X"FC",X"E7",X"DF",X"0D",X"DE",X"0F",X"A6",X"00",
		X"97",X"15",X"A6",X"01",X"EE",X"02",X"DF",X"13",X"8D",X"0E",X"DE",X"0F",X"08",X"08",X"08",X"08",
		X"DF",X"0F",X"9C",X"0D",X"26",X"E8",X"39",X"39",X"CE",X"00",X"16",X"80",X"02",X"23",X"15",X"81",
		X"03",X"27",X"09",X"C6",X"01",X"E7",X"00",X"08",X"80",X"02",X"20",X"F1",X"C6",X"91",X"E7",X"00",
		X"6F",X"01",X"08",X"08",X"C6",X"7E",X"E7",X"00",X"C6",X"FA",X"E7",X"01",X"C6",X"B2",X"E7",X"02",
		X"DE",X"13",X"4F",X"F6",X"00",X"12",X"5C",X"D7",X"12",X"D4",X"15",X"54",X"89",X"00",X"54",X"89",
		X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",
		X"1B",X"48",X"48",X"48",X"48",X"48",X"B7",X"04",X"00",X"09",X"27",X"03",X"7E",X"00",X"16",X"39",
		X"36",X"A6",X"00",X"DF",X"0D",X"DE",X"0F",X"A7",X"00",X"08",X"DF",X"0F",X"DE",X"0D",X"08",X"5A",
		X"26",X"EF",X"32",X"39",X"4F",X"97",X"04",X"97",X"05",X"39",X"7F",X"00",X"04",X"96",X"05",X"84",
		X"7F",X"81",X"1D",X"26",X"01",X"4F",X"4C",X"97",X"05",X"39",X"86",X"0E",X"BD",X"FB",X"57",X"96",
		X"05",X"48",X"48",X"43",X"BD",X"FC",X"0F",X"7C",X"00",X"17",X"BD",X"FC",X"11",X"20",X"F8",X"86",
		X"03",X"BD",X"F8",X"2A",X"D6",X"06",X"C1",X"1F",X"26",X"01",X"5F",X"5C",X"D7",X"06",X"86",X"20",
		X"10",X"5F",X"81",X"14",X"23",X"05",X"CB",X"0E",X"4A",X"20",X"F7",X"CB",X"05",X"4A",X"26",X"FB",
		X"D7",X"13",X"BD",X"F8",X"3F",X"20",X"FB",X"96",X"07",X"26",X"09",X"7C",X"00",X"07",X"86",X"0D",
		X"8D",X"05",X"20",X"69",X"7E",X"FC",X"04",X"16",X"58",X"1B",X"1B",X"1B",X"CE",X"FE",X"EA",X"BD",
		X"FC",X"E7",X"A6",X"00",X"16",X"84",X"0F",X"97",X"14",X"54",X"54",X"54",X"54",X"D7",X"13",X"A6",
		X"01",X"16",X"54",X"54",X"54",X"54",X"D7",X"15",X"84",X"0F",X"97",X"11",X"DF",X"0B",X"CE",X"FE",
		X"4B",X"7A",X"00",X"11",X"2B",X"08",X"A6",X"00",X"4C",X"BD",X"FC",X"E7",X"20",X"F3",X"DF",X"18",
		X"BD",X"FC",X"4B",X"DE",X"0B",X"A6",X"02",X"97",X"1A",X"BD",X"FC",X"5D",X"DE",X"0B",X"A6",X"03",
		X"97",X"16",X"A6",X"04",X"97",X"17",X"A6",X"05",X"16",X"A6",X"06",X"CE",X"FF",X"53",X"BD",X"FC",
		X"E7",X"17",X"DF",X"1B",X"7F",X"00",X"23",X"BD",X"FC",X"E7",X"DF",X"1D",X"39",X"96",X"13",X"97",
		X"22",X"DE",X"1B",X"DF",X"0D",X"DE",X"0D",X"A6",X"00",X"9B",X"23",X"97",X"21",X"9C",X"1D",X"27",
		X"26",X"D6",X"14",X"08",X"DF",X"0D",X"CE",X"00",X"24",X"96",X"21",X"4A",X"26",X"FD",X"A6",X"00",
		X"B7",X"04",X"00",X"08",X"9C",X"1F",X"26",X"F1",X"5A",X"27",X"DA",X"08",X"09",X"08",X"09",X"08",
		X"09",X"08",X"09",X"01",X"01",X"20",X"DF",X"96",X"15",X"8D",X"62",X"7A",X"00",X"22",X"26",X"C1",
		X"96",X"07",X"26",X"46",X"96",X"16",X"27",X"42",X"7A",X"00",X"17",X"27",X"3D",X"9B",X"23",X"97",
		X"23",X"DE",X"1B",X"5F",X"96",X"23",X"7D",X"00",X"16",X"2B",X"06",X"AB",X"00",X"25",X"08",X"20",
		X"0B",X"AB",X"00",X"27",X"02",X"25",X"05",X"5D",X"27",X"08",X"20",X"0F",X"5D",X"26",X"03",X"DF",
		X"1B",X"5C",X"08",X"9C",X"1D",X"26",X"DD",X"5D",X"26",X"01",X"39",X"DF",X"1D",X"96",X"15",X"27",
		X"06",X"8D",X"08",X"96",X"1A",X"8D",X"16",X"7E",X"FB",X"BD",X"39",X"CE",X"00",X"24",X"DF",X"0F",
		X"DE",X"18",X"E6",X"00",X"08",X"BD",X"FA",X"E0",X"DE",X"0F",X"DF",X"1F",X"39",X"4D",X"27",X"2B",
		X"DE",X"18",X"DF",X"0D",X"CE",X"00",X"24",X"97",X"12",X"DF",X"0F",X"DE",X"0D",X"D6",X"12",X"D7",
		X"11",X"E6",X"01",X"54",X"54",X"54",X"54",X"08",X"DF",X"0D",X"DE",X"0F",X"A6",X"00",X"10",X"7A",
		X"00",X"11",X"26",X"FA",X"A7",X"00",X"08",X"9C",X"1F",X"26",X"DE",X"39",X"8E",X"00",X"7F",X"B6",
		X"04",X"02",X"0E",X"43",X"84",X"1F",X"D6",X"08",X"27",X"03",X"BD",X"FA",X"48",X"5F",X"81",X"0E",
		X"27",X"02",X"D7",X"06",X"81",X"12",X"27",X"02",X"D7",X"07",X"4D",X"27",X"27",X"4A",X"81",X"0C",
		X"22",X"08",X"BD",X"FB",X"57",X"BD",X"FB",X"BD",X"20",X"1A",X"81",X"1B",X"22",X"0E",X"80",X"0D",
		X"48",X"CE",X"FD",X"1E",X"8D",X"21",X"EE",X"00",X"AD",X"00",X"20",X"08",X"80",X"1C",X"BD",X"F8",
		X"2A",X"BD",X"F8",X"3F",X"96",X"04",X"9A",X"05",X"27",X"FE",X"4F",X"97",X"07",X"96",X"04",X"27",
		X"03",X"7E",X"F9",X"13",X"7E",X"FB",X"0A",X"DF",X"0D",X"9B",X"0E",X"97",X"0E",X"24",X"03",X"7C",
		X"00",X"0D",X"DE",X"0D",X"39",X"0F",X"8E",X"00",X"7F",X"CE",X"FF",X"FF",X"5F",X"E9",X"00",X"09",
		X"8C",X"F8",X"00",X"26",X"F8",X"E1",X"00",X"27",X"01",X"3E",X"86",X"01",X"BD",X"F8",X"2A",X"BD",
		X"F8",X"3F",X"86",X"02",X"BD",X"FA",X"4D",X"86",X"01",X"BD",X"FA",X"4D",X"20",X"D7",X"FB",X"1F",
		X"F9",X"13",X"FA",X"FA",X"F8",X"8C",X"FB",X"47",X"FA",X"F4",X"F8",X"CD",X"F8",X"94",X"F9",X"1C",
		X"F9",X"23",X"F9",X"A6",X"F9",X"D4",X"F9",X"F3",X"FA",X"44",X"FA",X"87",X"40",X"01",X"00",X"10",
		X"E1",X"00",X"80",X"FF",X"FF",X"28",X"01",X"00",X"08",X"81",X"02",X"00",X"FF",X"FF",X"28",X"81",
		X"00",X"FC",X"01",X"02",X"00",X"FC",X"FF",X"FF",X"01",X"00",X"18",X"41",X"04",X"80",X"00",X"FF",
		X"8C",X"5B",X"B6",X"40",X"BF",X"49",X"A4",X"73",X"73",X"A4",X"49",X"BF",X"40",X"B6",X"5B",X"8C",
		X"1C",X"F8",X"04",X"05",X"55",X"00",X"04",X"05",X"55",X"F8",X"04",X"05",X"55",X"00",X"04",X"05",
		X"55",X"F8",X"04",X"05",X"55",X"00",X"04",X"05",X"55",X"F8",X"17",X"3B",X"41",X"B0",X"1F",X"1D",
		X"04",X"CB",X"00",X"04",X"06",X"66",X"3E",X"1D",X"04",X"CB",X"00",X"04",X"1F",X"FE",X"3E",X"3F",
		X"03",X"97",X"00",X"04",X"06",X"66",X"7C",X"3F",X"03",X"97",X"00",X"04",X"1F",X"FE",X"7C",X"1D",
		X"04",X"CB",X"00",X"04",X"06",X"66",X"F8",X"1D",X"04",X"CB",X"00",X"04",X"06",X"66",X"7C",X"3F",
		X"03",X"97",X"00",X"04",X"06",X"66",X"F8",X"3F",X"03",X"97",X"00",X"04",X"2C",X"CA",X"7C",X"3F",
		X"03",X"97",X"7C",X"1D",X"04",X"CB",X"7C",X"12",X"05",X"61",X"7C",X"0D",X"05",X"B3",X"7C",X"12",
		X"05",X"61",X"7C",X"0D",X"05",X"B3",X"7C",X"04",X"06",X"66",X"7C",X"0D",X"05",X"B3",X"7C",X"12",
		X"05",X"61",X"7C",X"1D",X"04",X"CB",X"3E",X"37",X"03",X"CE",X"3E",X"3F",X"03",X"97",X"7C",X"04",
		X"06",X"66",X"7C",X"0D",X"05",X"B3",X"7C",X"12",X"05",X"61",X"7C",X"1D",X"04",X"CB",X"7C",X"23",
		X"04",X"86",X"7C",X"1D",X"04",X"CB",X"7C",X"12",X"05",X"61",X"3E",X"1D",X"04",X"CB",X"00",X"04",
		X"06",X"66",X"7C",X"1D",X"04",X"CB",X"00",X"04",X"06",X"66",X"3E",X"3F",X"03",X"97",X"00",X"04",
		X"06",X"66",X"7C",X"3F",X"03",X"97",X"00",X"04",X"1F",X"FE",X"F8",X"1D",X"2F",X"EE",X"00",X"47",
		X"3F",X"37",X"30",X"29",X"23",X"1D",X"17",X"12",X"0D",X"08",X"04",X"08",X"7F",X"D9",X"FF",X"D9",
		X"7F",X"24",X"00",X"24",X"08",X"00",X"40",X"80",X"00",X"FF",X"00",X"80",X"40",X"10",X"7F",X"B0",
		X"D9",X"F5",X"FF",X"F5",X"D9",X"B0",X"7F",X"4E",X"24",X"09",X"00",X"09",X"24",X"4E",X"10",X"7F",
		X"C5",X"EC",X"E7",X"BF",X"8D",X"6D",X"6A",X"7F",X"94",X"92",X"71",X"40",X"17",X"12",X"39",X"10",
		X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",
		X"48",X"8A",X"95",X"A0",X"AB",X"B5",X"BF",X"C8",X"D1",X"DA",X"E1",X"E8",X"EE",X"F3",X"F7",X"FB",
		X"FD",X"FE",X"FF",X"FE",X"FD",X"FB",X"F7",X"F3",X"EE",X"E8",X"E1",X"DA",X"D1",X"C8",X"BF",X"B5",
		X"AB",X"A0",X"95",X"8A",X"7F",X"75",X"6A",X"5F",X"54",X"4A",X"40",X"37",X"2E",X"25",X"1E",X"17",
		X"11",X"0C",X"08",X"04",X"02",X"01",X"00",X"01",X"02",X"04",X"08",X"0C",X"11",X"17",X"1E",X"25",
		X"2E",X"37",X"40",X"4A",X"54",X"5F",X"6A",X"75",X"7F",X"10",X"59",X"7B",X"98",X"AC",X"B3",X"AC",
		X"98",X"7B",X"59",X"37",X"19",X"06",X"00",X"06",X"19",X"37",X"81",X"24",X"00",X"00",X"00",X"16",
		X"31",X"12",X"05",X"1A",X"FF",X"00",X"27",X"6D",X"11",X"05",X"11",X"01",X"0F",X"01",X"47",X"11",
		X"31",X"00",X"01",X"00",X"0D",X"1B",X"F4",X"12",X"00",X"00",X"00",X"14",X"47",X"41",X"45",X"00",
		X"00",X"00",X"0F",X"5B",X"21",X"35",X"11",X"FF",X"00",X"0D",X"1B",X"15",X"00",X"00",X"FD",X"00",
		X"01",X"69",X"31",X"11",X"00",X"01",X"00",X"03",X"6A",X"01",X"15",X"01",X"01",X"01",X"01",X"47",
		X"F6",X"53",X"03",X"00",X"02",X"06",X"94",X"6A",X"10",X"02",X"00",X"02",X"06",X"9A",X"1F",X"12",
		X"00",X"FF",X"10",X"04",X"69",X"31",X"11",X"00",X"FF",X"00",X"0D",X"00",X"12",X"06",X"00",X"FF",
		X"01",X"09",X"28",X"A0",X"98",X"90",X"88",X"80",X"78",X"70",X"68",X"60",X"58",X"50",X"44",X"40",
		X"01",X"01",X"02",X"02",X"04",X"04",X"08",X"08",X"10",X"10",X"30",X"60",X"C0",X"E0",X"01",X"01",
		X"02",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0C",X"80",X"7C",X"78",X"74",X"70",
		X"74",X"78",X"7C",X"80",X"01",X"01",X"02",X"02",X"04",X"04",X"08",X"08",X"10",X"20",X"28",X"30",
		X"38",X"40",X"48",X"50",X"60",X"70",X"80",X"A0",X"B0",X"C0",X"08",X"40",X"08",X"40",X"08",X"40",
		X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"08",X"40",X"01",X"02",
		X"04",X"08",X"09",X"0A",X"0B",X"0C",X"0E",X"0F",X"10",X"12",X"14",X"16",X"40",X"10",X"08",X"01",
		X"01",X"01",X"01",X"01",X"02",X"02",X"03",X"03",X"04",X"04",X"05",X"06",X"08",X"0A",X"0C",X"10",
		X"14",X"18",X"20",X"30",X"40",X"50",X"40",X"30",X"20",X"10",X"0C",X"0A",X"08",X"07",X"06",X"05",
		X"04",X"03",X"02",X"02",X"01",X"01",X"01",X"07",X"08",X"09",X"0A",X"0C",X"08",X"17",X"18",X"19",
		X"1A",X"1B",X"1C",X"00",X"00",X"00",X"00",X"00",X"FC",X"8C",X"F8",X"01",X"FC",X"F5",X"F8",X"01");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;