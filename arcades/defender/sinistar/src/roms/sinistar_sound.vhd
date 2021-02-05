library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity sinistar_sound is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of sinistar_sound is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"AA",X"0F",X"8E",X"00",X"7F",X"CE",X"04",X"00",X"6F",X"01",X"6F",X"03",X"86",X"FF",X"A7",X"00",
		X"C6",X"80",X"E7",X"02",X"86",X"37",X"A7",X"03",X"86",X"3C",X"A7",X"01",X"E7",X"02",X"CE",X"00",
		X"7F",X"6F",X"00",X"09",X"26",X"FB",X"86",X"3C",X"97",X"01",X"0E",X"20",X"FE",X"7F",X"00",X"0E",
		X"97",X"0C",X"36",X"CE",X"F1",X"D0",X"A6",X"00",X"27",X"2D",X"7A",X"00",X"0C",X"27",X"06",X"4C",
		X"BD",X"F1",X"A7",X"20",X"F1",X"08",X"DF",X"0A",X"BD",X"F1",X"A7",X"DF",X"08",X"DE",X"0A",X"A6",
		X"00",X"97",X"11",X"A6",X"01",X"EE",X"02",X"DF",X"0F",X"8D",X"0F",X"DE",X"0A",X"08",X"08",X"08",
		X"08",X"DF",X"0A",X"9C",X"08",X"26",X"E8",X"32",X"20",X"63",X"CE",X"00",X"12",X"81",X"00",X"27",
		X"15",X"81",X"03",X"27",X"09",X"C6",X"01",X"E7",X"00",X"08",X"80",X"02",X"20",X"EF",X"C6",X"91",
		X"E7",X"00",X"6F",X"01",X"08",X"08",X"C6",X"7E",X"E7",X"00",X"C6",X"F0",X"E7",X"01",X"C6",X"94",
		X"E7",X"02",X"DE",X"0F",X"4F",X"F6",X"00",X"0D",X"5C",X"D7",X"0D",X"D4",X"11",X"54",X"89",X"00",
		X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",X"89",X"00",X"54",
		X"89",X"00",X"48",X"48",X"48",X"48",X"48",X"B7",X"04",X"00",X"09",X"27",X"03",X"7E",X"00",X"12",
		X"39",X"8E",X"00",X"7F",X"B6",X"04",X"02",X"0E",X"43",X"84",X"1F",X"8D",X"08",X"7D",X"00",X"04",
		X"27",X"FB",X"7E",X"F7",X"8B",X"81",X"01",X"2E",X"03",X"7E",X"F0",X"2D",X"81",X"02",X"2E",X"0C",
		X"F6",X"EF",X"FD",X"C1",X"7E",X"26",X"09",X"86",X"09",X"7E",X"EF",X"FD",X"81",X"03",X"2E",X"05",
		X"80",X"02",X"7E",X"F6",X"60",X"81",X"04",X"2E",X"04",X"7F",X"00",X"04",X"39",X"81",X"05",X"2E",
		X"03",X"7E",X"F7",X"7E",X"81",X"06",X"2E",X"0F",X"F6",X"EF",X"FD",X"C1",X"7E",X"27",X"03",X"7E",
		X"F1",X"A2",X"86",X"08",X"7E",X"EF",X"FD",X"81",X"07",X"2E",X"03",X"7E",X"FB",X"1D",X"81",X"08",
		X"2E",X"03",X"7E",X"FB",X"2A",X"81",X"0A",X"2E",X"05",X"80",X"09",X"7E",X"F6",X"86",X"81",X"0B",
		X"2E",X"0C",X"F6",X"EF",X"FD",X"C1",X"7E",X"26",X"69",X"86",X"06",X"7E",X"EF",X"FD",X"81",X"0C",
		X"2E",X"03",X"7E",X"FB",X"10",X"81",X"0D",X"2E",X"0C",X"F6",X"EF",X"FD",X"C1",X"7E",X"26",X"52",
		X"86",X"02",X"7E",X"EF",X"FD",X"81",X"0E",X"2E",X"0C",X"F6",X"EF",X"FD",X"C1",X"7E",X"26",X"42",
		X"86",X"03",X"7E",X"EF",X"FD",X"81",X"0F",X"2E",X"0C",X"F6",X"EF",X"FD",X"C1",X"7E",X"26",X"32",
		X"86",X"04",X"7E",X"EF",X"FD",X"81",X"13",X"26",X"0C",X"F6",X"EF",X"FD",X"C1",X"7E",X"26",X"22",
		X"86",X"05",X"7E",X"EF",X"FD",X"81",X"1C",X"2E",X"08",X"80",X"0E",X"BD",X"F7",X"DA",X"7E",X"F8",
		X"40",X"81",X"1D",X"2E",X"0C",X"F6",X"EF",X"FD",X"C1",X"7E",X"26",X"06",X"86",X"07",X"7E",X"EF",
		X"FD",X"39",X"86",X"01",X"7E",X"F1",X"8B",X"DF",X"08",X"9B",X"09",X"97",X"09",X"96",X"08",X"89",
		X"00",X"97",X"08",X"DE",X"08",X"39",X"0F",X"8E",X"00",X"7F",X"CE",X"FF",X"FF",X"5F",X"E9",X"00",
		X"09",X"8C",X"F0",X"00",X"26",X"F8",X"E1",X"00",X"27",X"01",X"3E",X"BD",X"F6",X"F9",X"20",X"E6",
		X"0C",X"03",X"47",X"05",X"FC",X"03",X"12",X"11",X"F0",X"03",X"29",X"07",X"1E",X"C0",X"0D",X"37",
		X"BD",X"00",X"2C",X"33",X"C1",X"14",X"22",X"F5",X"01",X"96",X"24",X"9B",X"21",X"97",X"24",X"C9",
		X"F6",X"5A",X"2A",X"FD",X"96",X"28",X"4C",X"84",X"0F",X"8A",X"10",X"97",X"28",X"DE",X"27",X"E6",
		X"00",X"F7",X"04",X"00",X"84",X"0F",X"39",X"4F",X"CE",X"00",X"10",X"C6",X"61",X"A7",X"00",X"08",
		X"5A",X"26",X"FA",X"C6",X"5F",X"D7",X"26",X"C6",X"37",X"D7",X"30",X"C6",X"7E",X"D7",X"2C",X"CE",
		X"F3",X"F2",X"DF",X"2D",X"D6",X"0C",X"D7",X"23",X"C0",X"03",X"BD",X"F1",X"E4",X"08",X"D6",X"23",
		X"C0",X"02",X"BD",X"F1",X"DD",X"26",X"F7",X"D6",X"20",X"96",X"21",X"9B",X"0D",X"D9",X"0C",X"97",
		X"0D",X"D7",X"0C",X"DB",X"22",X"86",X"19",X"11",X"24",X"01",X"81",X"16",X"D7",X"23",X"01",X"C0",
		X"09",X"BD",X"F1",X"E4",X"96",X"2F",X"16",X"48",X"C9",X"00",X"D7",X"2F",X"D6",X"23",X"C0",X"05",
		X"96",X"25",X"2A",X"06",X"7C",X"00",X"25",X"01",X"20",X"BE",X"5A",X"BD",X"F1",X"E4",X"DE",X"0A",
		X"A6",X"00",X"2A",X"12",X"81",X"80",X"27",X"5F",X"4C",X"97",X"25",X"08",X"FF",X"00",X"0A",X"D6",
		X"23",X"C0",X"06",X"7E",X"F2",X"28",X"08",X"E6",X"00",X"37",X"08",X"DF",X"0A",X"97",X"29",X"84",
		X"70",X"44",X"44",X"44",X"5F",X"8B",X"6B",X"C9",X"F3",X"97",X"2B",X"D7",X"2A",X"D6",X"23",X"D6",
		X"23",X"C0",X"0D",X"BD",X"F1",X"E4",X"5F",X"DE",X"2A",X"EE",X"00",X"6E",X"00",X"96",X"29",X"47",
		X"C2",X"00",X"D4",X"0C",X"32",X"10",X"9B",X"0C",X"97",X"0C",X"08",X"D6",X"23",X"C0",X"0A",X"7E",
		X"F2",X"2A",X"96",X"29",X"47",X"C2",X"00",X"D4",X"22",X"32",X"10",X"9B",X"22",X"97",X"22",X"20",
		X"EA",X"32",X"DE",X"0A",X"09",X"6E",X"00",X"96",X"26",X"81",X"5F",X"2B",X"01",X"39",X"D6",X"23",
		X"C0",X"07",X"BD",X"F1",X"E4",X"DE",X"25",X"6A",X"02",X"2B",X"12",X"EE",X"00",X"A6",X"00",X"36",
		X"08",X"DF",X"0A",X"F6",X"00",X"23",X"C0",X"09",X"BD",X"F1",X"E4",X"20",X"55",X"EE",X"00",X"08",
		X"DF",X"0A",X"96",X"26",X"8B",X"03",X"97",X"26",X"D6",X"23",X"C0",X"07",X"01",X"7E",X"F2",X"28",
		X"08",X"20",X"04",X"D7",X"20",X"D7",X"21",X"D6",X"29",X"C4",X"0F",X"CB",X"F8",X"C8",X"F8",X"32",
		X"9B",X"21",X"D9",X"20",X"97",X"21",X"D7",X"20",X"F6",X"00",X"23",X"C0",X"09",X"7E",X"F2",X"28",
		X"96",X"26",X"80",X"03",X"97",X"26",X"DE",X"25",X"96",X"0B",X"D6",X"0A",X"8B",X"FF",X"C9",X"FF",
		X"E7",X"00",X"A7",X"01",X"D6",X"29",X"C4",X"0F",X"E7",X"02",X"D6",X"23",X"C0",X"0C",X"BD",X"F1",
		X"E4",X"08",X"08",X"08",X"5F",X"01",X"32",X"47",X"49",X"C2",X"00",X"9B",X"0B",X"D9",X"0A",X"97",
		X"0B",X"F7",X"00",X"0A",X"D6",X"23",X"C0",X"07",X"7E",X"F2",X"28",X"F2",X"AD",X"F2",X"C2",X"F3",
		X"13",X"F3",X"10",X"F2",X"AD",X"F2",X"D1",X"F3",X"30",X"F3",X"56",X"F4",X"EF",X"F5",X"78",X"F4",
		X"27",X"F5",X"20",X"F3",X"A2",X"F5",X"31",X"F3",X"CD",X"F4",X"64",X"DE",X"2F",X"EE",X"03",X"08",
		X"DF",X"08",X"BD",X"F4",X"5E",X"08",X"39",X"EE",X"00",X"DF",X"08",X"CE",X"F4",X"64",X"DF",X"2D",
		X"01",X"39",X"96",X"30",X"81",X"37",X"23",X"12",X"DE",X"2F",X"6A",X"02",X"2A",X"E9",X"80",X"03",
		X"97",X"30",X"CE",X"F3",X"8B",X"DF",X"2D",X"6D",X"00",X"39",X"CE",X"F3",X"C2",X"DF",X"2D",X"01",
		X"20",X"05",X"08",X"08",X"01",X"8D",X"05",X"8D",X"03",X"6D",X"00",X"01",X"39",X"DE",X"2F",X"96",
		X"08",X"A7",X"03",X"96",X"09",X"A7",X"04",X"96",X"39",X"84",X"0F",X"A7",X"05",X"08",X"CE",X"F3",
		X"E4",X"DF",X"2D",X"39",X"96",X"30",X"8B",X"03",X"97",X"30",X"CE",X"F4",X"64",X"DF",X"2D",X"01",
		X"20",X"D5",X"7D",X"00",X"2F",X"26",X"CE",X"DE",X"08",X"A6",X"00",X"08",X"DF",X"08",X"97",X"39",
		X"2A",X"05",X"97",X"2F",X"A6",X"00",X"39",X"CE",X"F4",X"0E",X"FF",X"00",X"2D",X"39",X"5F",X"96",
		X"39",X"84",X"70",X"44",X"44",X"44",X"8B",X"7B",X"C9",X"F3",X"D7",X"37",X"97",X"38",X"DE",X"37",
		X"EE",X"00",X"DF",X"2D",X"DF",X"2D",X"39",X"96",X"39",X"84",X"0F",X"4C",X"4C",X"97",X"2F",X"20",
		X"1D",X"7C",X"00",X"32",X"DE",X"31",X"8C",X"00",X"68",X"27",X"13",X"A6",X"00",X"CE",X"F4",X"78",
		X"97",X"35",X"27",X"03",X"7E",X"F4",X"4A",X"CE",X"F4",X"31",X"DF",X"2D",X"08",X"39",X"86",X"5E",
		X"B7",X"00",X"32",X"CE",X"F4",X"31",X"7A",X"00",X"2F",X"27",X"03",X"7E",X"F4",X"61",X"CE",X"F3",
		X"F2",X"DF",X"2D",X"39",X"DE",X"08",X"5F",X"A6",X"00",X"4C",X"47",X"49",X"C2",X"00",X"9B",X"09",
		X"D9",X"08",X"97",X"09",X"D7",X"08",X"20",X"E6",X"96",X"32",X"80",X"5F",X"48",X"5F",X"9B",X"0F",
		X"D9",X"0E",X"D7",X"37",X"97",X"38",X"86",X"80",X"97",X"36",X"CE",X"F4",X"95",X"DF",X"2D",X"CE",
		X"00",X"10",X"DF",X"33",X"39",X"DE",X"37",X"EE",X"00",X"DF",X"37",X"CE",X"F4",X"AA",X"DF",X"2D",
		X"DE",X"31",X"A6",X"09",X"9B",X"35",X"A7",X"09",X"08",X"39",X"96",X"36",X"27",X"1D",X"74",X"00",
		X"36",X"DE",X"33",X"E6",X"00",X"94",X"37",X"26",X"09",X"FB",X"00",X"35",X"E7",X"00",X"7C",X"00",
		X"34",X"39",X"F0",X"00",X"35",X"E7",X"00",X"7C",X"00",X"34",X"39",X"D6",X"34",X"C1",X"20",X"27",
		X"0B",X"D6",X"38",X"D7",X"37",X"C6",X"80",X"F7",X"00",X"36",X"20",X"0F",X"CE",X"F3",X"F2",X"D6",
		X"2F",X"26",X"03",X"7E",X"F4",X"E9",X"CE",X"F4",X"31",X"DF",X"2D",X"6D",X"00",X"08",X"39",X"96",
		X"39",X"84",X"07",X"8B",X"60",X"97",X"32",X"DE",X"08",X"A6",X"00",X"08",X"DF",X"08",X"97",X"35",
		X"CE",X"F5",X"07",X"DF",X"2D",X"08",X"39",X"DE",X"31",X"5F",X"96",X"39",X"8B",X"F8",X"C2",X"00",
		X"E4",X"09",X"50",X"DB",X"35",X"D7",X"35",X"CE",X"F4",X"78",X"DF",X"2D",X"08",X"08",X"01",X"39",
		X"D6",X"39",X"54",X"C4",X"07",X"CA",X"60",X"D7",X"32",X"C6",X"FF",X"C9",X"00",X"C9",X"00",X"20",
		X"E4",X"96",X"39",X"47",X"25",X"13",X"CE",X"00",X"00",X"DF",X"60",X"DF",X"62",X"DF",X"64",X"DF",
		X"66",X"08",X"CE",X"F3",X"F2",X"FF",X"00",X"2D",X"39",X"85",X"02",X"26",X"0C",X"C6",X"5F",X"D7",
		X"32",X"CE",X"F5",X"5E",X"DF",X"2D",X"7E",X"F3",X"C9",X"FE",X"00",X"08",X"20",X"F6",X"5F",X"96",
		X"39",X"8B",X"AE",X"C2",X"00",X"D4",X"68",X"DE",X"08",X"A6",X"00",X"08",X"DF",X"08",X"10",X"97",
		X"35",X"CE",X"F4",X"78",X"FF",X"00",X"2D",X"39",X"C6",X"60",X"D7",X"32",X"DE",X"08",X"E6",X"00",
		X"D7",X"37",X"08",X"DF",X"08",X"D6",X"39",X"54",X"24",X"18",X"CE",X"F5",X"BC",X"DF",X"2D",X"39",
		X"5F",X"96",X"38",X"47",X"C2",X"00",X"DE",X"31",X"E4",X"00",X"1B",X"A7",X"00",X"7C",X"00",X"32",
		X"A6",X"00",X"CE",X"F5",X"A8",X"DF",X"2D",X"39",X"78",X"00",X"37",X"25",X"13",X"27",X"06",X"7C",
		X"00",X"32",X"7E",X"F3",X"C7",X"BD",X"F4",X"5E",X"6D",X"00",X"01",X"39",X"7A",X"00",X"32",X"08",
		X"A6",X"00",X"DE",X"08",X"A6",X"00",X"08",X"DF",X"08",X"97",X"38",X"CE",X"F5",X"90",X"DF",X"2D",
		X"39",X"00",X"00",X"00",X"00",X"AA",X"AA",X"0F",X"F0",X"C3",X"F0",X"18",X"CF",X"C7",X"A1",X"FF",
		X"00",X"00",X"FF",X"53",X"80",X"08",X"88",X"0A",X"10",X"09",X"08",X"0B",X"10",X"0C",X"20",X"0C",
		X"05",X"10",X"80",X"F0",X"23",X"10",X"80",X"10",X"23",X"70",X"F6",X"96",X"2E",X"00",X"EC",X"22",
		X"00",X"EC",X"80",X"20",X"F6",X"80",X"53",X"00",X"0A",X"05",X"FB",X"53",X"80",X"0A",X"1F",X"6F",
		X"03",X"6E",X"01",X"40",X"10",X"60",X"00",X"02",X"23",X"10",X"40",X"FE",X"22",X"10",X"20",X"FE",
		X"20",X"40",X"64",X"6F",X"03",X"6F",X"01",X"80",X"21",X"00",X"FC",X"2F",X"00",X"FC",X"80",X"53",
		X"00",X"09",X"FF",X"FB",X"6F",X"03",X"6E",X"01",X"40",X"10",X"40",X"FC",X"20",X"10",X"41",X"00",
		X"02",X"23",X"10",X"01",X"FE",X"23",X"50",X"40",X"7D",X"CE",X"CE",X"80",X"F5",X"E3",X"F5",X"FB",
		X"F6",X"06",X"F6",X"22",X"F6",X"2F",X"F6",X"48",X"F6",X"06",X"F6",X"48",X"F6",X"06",X"F5",X"FB",
		X"5F",X"D7",X"0D",X"48",X"48",X"8B",X"4C",X"C9",X"F6",X"D7",X"0A",X"97",X"0B",X"DE",X"0A",X"EE",
		X"00",X"DF",X"08",X"DE",X"0A",X"EE",X"02",X"E6",X"00",X"D7",X"0C",X"08",X"DF",X"0A",X"CE",X"F5",
		X"D1",X"DF",X"0E",X"7E",X"F2",X"07",X"16",X"2E",X"25",X"58",X"58",X"58",X"58",X"D7",X"03",X"16",
		X"86",X"04",X"10",X"36",X"BD",X"F6",X"C8",X"D6",X"03",X"CB",X"30",X"D7",X"03",X"BD",X"F6",X"C8",
		X"D6",X"03",X"C0",X"18",X"D7",X"03",X"BD",X"F6",X"C8",X"32",X"4A",X"26",X"E6",X"39",X"C6",X"7F",
		X"BD",X"F6",X"CA",X"C6",X"C0",X"BD",X"F6",X"CA",X"C6",X"FF",X"BD",X"F6",X"CA",X"C6",X"7F",X"BD",
		X"F6",X"CA",X"C6",X"3F",X"BD",X"F6",X"CA",X"39",X"D6",X"03",X"F7",X"04",X"00",X"CE",X"00",X"40",
		X"8D",X"19",X"36",X"C6",X"03",X"8D",X"14",X"5A",X"26",X"FB",X"32",X"4A",X"26",X"F4",X"8D",X"0B",
		X"81",X"7F",X"2E",X"EC",X"73",X"04",X"00",X"09",X"26",X"E6",X"39",X"96",X"02",X"44",X"98",X"02",
		X"44",X"44",X"76",X"00",X"01",X"76",X"00",X"02",X"39",X"4F",X"B7",X"04",X"00",X"CE",X"00",X"7F",
		X"DF",X"0C",X"96",X"0D",X"4A",X"36",X"32",X"36",X"32",X"36",X"32",X"26",X"F7",X"73",X"04",X"00",
		X"96",X"0D",X"4A",X"36",X"32",X"36",X"32",X"36",X"32",X"26",X"F7",X"73",X"04",X"00",X"8D",X"CB",
		X"16",X"5A",X"26",X"FD",X"73",X"04",X"00",X"16",X"5A",X"26",X"FD",X"73",X"04",X"00",X"7C",X"04",
		X"00",X"09",X"26",X"CC",X"39",X"4F",X"B7",X"04",X"00",X"CE",X"00",X"01",X"DF",X"0C",X"96",X"0D",
		X"4A",X"36",X"32",X"36",X"32",X"36",X"32",X"26",X"F7",X"73",X"04",X"00",X"96",X"0D",X"4A",X"36",
		X"32",X"36",X"32",X"36",X"32",X"26",X"F7",X"73",X"04",X"00",X"8D",X"8F",X"C6",X"20",X"5A",X"26",
		X"FD",X"4A",X"26",X"F8",X"73",X"04",X"00",X"8D",X"82",X"C6",X"20",X"5A",X"26",X"FD",X"4A",X"26",
		X"F8",X"73",X"04",X"00",X"7C",X"04",X"00",X"08",X"8C",X"00",X"10",X"26",X"BF",X"39",X"7F",X"00",
		X"03",X"58",X"58",X"58",X"D7",X"05",X"86",X"01",X"97",X"04",X"39",X"86",X"60",X"B7",X"04",X"00",
		X"96",X"05",X"C6",X"13",X"5A",X"26",X"FD",X"4A",X"26",X"F8",X"73",X"04",X"00",X"96",X"05",X"C6",
		X"13",X"5A",X"26",X"FD",X"4A",X"26",X"F8",X"73",X"04",X"00",X"7C",X"04",X"00",X"86",X"7F",X"B1",
		X"04",X"00",X"26",X"DC",X"96",X"05",X"C6",X"13",X"5A",X"26",X"FD",X"4A",X"26",X"F8",X"73",X"04",
		X"00",X"96",X"05",X"C6",X"13",X"5A",X"26",X"FD",X"4A",X"26",X"F8",X"73",X"04",X"00",X"7A",X"04",
		X"00",X"86",X"60",X"B1",X"04",X"00",X"26",X"DC",X"20",X"B6",X"16",X"58",X"1B",X"1B",X"1B",X"CE",
		X"F9",X"BB",X"BD",X"F1",X"A7",X"A6",X"00",X"16",X"84",X"0F",X"97",X"0F",X"54",X"54",X"54",X"54",
		X"D7",X"0E",X"A6",X"01",X"16",X"54",X"54",X"54",X"54",X"D7",X"10",X"84",X"0F",X"97",X"0C",X"DF",
		X"06",X"CE",X"F9",X"0C",X"7A",X"00",X"0C",X"2B",X"08",X"A6",X"00",X"4C",X"BD",X"F1",X"A7",X"20",
		X"F3",X"DF",X"13",X"BD",X"F8",X"CB",X"DE",X"06",X"A6",X"02",X"97",X"15",X"BD",X"F8",X"DD",X"DE",
		X"06",X"A6",X"03",X"97",X"11",X"A6",X"04",X"97",X"12",X"A6",X"05",X"16",X"A6",X"06",X"CE",X"FA",
		X"24",X"BD",X"F1",X"A7",X"17",X"DF",X"16",X"7F",X"00",X"1E",X"BD",X"F1",X"A7",X"DF",X"18",X"39",
		X"96",X"0E",X"97",X"1D",X"DE",X"16",X"DF",X"08",X"DE",X"08",X"A6",X"00",X"9B",X"1E",X"97",X"1C",
		X"9C",X"18",X"27",X"27",X"D6",X"0F",X"08",X"DF",X"08",X"CE",X"00",X"20",X"96",X"1C",X"4A",X"26",
		X"FD",X"A6",X"00",X"44",X"B7",X"04",X"00",X"08",X"9C",X"1A",X"26",X"F0",X"5A",X"27",X"D9",X"08",
		X"09",X"08",X"09",X"08",X"09",X"08",X"09",X"01",X"01",X"20",X"DE",X"96",X"10",X"8D",X"5E",X"7A",
		X"00",X"1D",X"26",X"C0",X"96",X"11",X"27",X"42",X"7A",X"00",X"12",X"27",X"3D",X"9B",X"1E",X"97",
		X"1E",X"DE",X"16",X"5F",X"96",X"1E",X"7D",X"00",X"11",X"2B",X"06",X"AB",X"00",X"25",X"08",X"20",
		X"0B",X"AB",X"00",X"27",X"02",X"25",X"05",X"5D",X"27",X"08",X"20",X"0F",X"5D",X"26",X"03",X"DF",
		X"16",X"5C",X"08",X"9C",X"18",X"26",X"DD",X"5D",X"26",X"01",X"39",X"DF",X"18",X"96",X"10",X"27",
		X"06",X"8D",X"08",X"96",X"15",X"8D",X"16",X"7E",X"F8",X"40",X"39",X"CE",X"00",X"20",X"DF",X"0A",
		X"DE",X"13",X"E6",X"00",X"08",X"BD",X"FA",X"9A",X"DE",X"0A",X"DF",X"1A",X"39",X"4D",X"27",X"2B",
		X"DE",X"13",X"DF",X"08",X"CE",X"00",X"20",X"97",X"0D",X"DF",X"0A",X"DE",X"08",X"D6",X"0D",X"D7",
		X"0C",X"E6",X"01",X"54",X"54",X"54",X"54",X"08",X"DF",X"08",X"DE",X"0A",X"A6",X"00",X"10",X"7A",
		X"00",X"0C",X"26",X"FA",X"A7",X"00",X"08",X"9C",X"1A",X"26",X"DE",X"39",X"08",X"7F",X"D9",X"FF",
		X"D9",X"7F",X"24",X"00",X"24",X"08",X"00",X"40",X"80",X"00",X"FF",X"00",X"80",X"40",X"10",X"7F",
		X"B0",X"D9",X"F5",X"FF",X"F5",X"D9",X"B0",X"7F",X"4E",X"24",X"09",X"00",X"09",X"24",X"4E",X"1C",
		X"80",X"40",X"29",X"1B",X"10",X"09",X"06",X"04",X"07",X"0C",X"12",X"1E",X"30",X"49",X"A4",X"C9",
		X"DF",X"EB",X"F6",X"FB",X"FF",X"FF",X"FB",X"F5",X"EA",X"DD",X"C7",X"9B",X"10",X"FF",X"FF",X"FF",
		X"FF",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"48",X"8A",X"95",
		X"A0",X"AB",X"B5",X"BF",X"C8",X"D1",X"DA",X"E1",X"E8",X"EE",X"F3",X"F7",X"FB",X"FD",X"FE",X"FF",
		X"FE",X"FD",X"FB",X"F7",X"F3",X"EE",X"E8",X"E1",X"DA",X"D1",X"C8",X"BF",X"B5",X"AB",X"A0",X"95",
		X"8A",X"7F",X"75",X"6A",X"5F",X"54",X"4A",X"40",X"37",X"2E",X"25",X"1E",X"17",X"11",X"0C",X"08",
		X"04",X"02",X"01",X"00",X"01",X"02",X"04",X"08",X"0C",X"11",X"17",X"1E",X"25",X"2E",X"37",X"40",
		X"4A",X"54",X"5F",X"6A",X"75",X"7F",X"0C",X"00",X"50",X"60",X"B0",X"20",X"20",X"F0",X"90",X"80",
		X"C0",X"50",X"70",X"07",X"40",X"09",X"35",X"0C",X"29",X"0F",X"20",X"71",X"23",X"09",X"00",X"00",
		X"1E",X"00",X"74",X"00",X"09",X"00",X"00",X"1A",X"1E",X"74",X"12",X"09",X"00",X"00",X"0A",X"38",
		X"11",X"06",X"06",X"02",X"20",X"03",X"42",X"11",X"04",X"0B",X"01",X"20",X"04",X"42",X"12",X"03",
		X"09",X"00",X"00",X"04",X"46",X"12",X"03",X"09",X"00",X"00",X"04",X"4A",X"16",X"00",X"09",X"00",
		X"00",X"16",X"4E",X"11",X"05",X"11",X"01",X"0F",X"01",X"38",X"1F",X"12",X"09",X"FF",X"05",X"04",
		X"64",X"F1",X"07",X"09",X"00",X"00",X"0E",X"68",X"68",X"20",X"00",X"02",X"26",X"03",X"04",X"08",
		X"47",X"0B",X"40",X"01",X"02",X"03",X"88",X"F3",X"90",X"13",X"B7",X"04",X"00",X"18",X"11",X"09",
		X"00",X"00",X"14",X"40",X"28",X"01",X"02",X"26",X"03",X"04",X"24",X"05",X"06",X"22",X"07",X"08",
		X"20",X"09",X"0A",X"1E",X"0B",X"0C",X"1C",X"0D",X"0E",X"1A",X"0F",X"10",X"18",X"11",X"12",X"16",
		X"13",X"14",X"40",X"01",X"3E",X"03",X"3C",X"05",X"3A",X"07",X"38",X"09",X"35",X"0C",X"32",X"0F",
		X"2F",X"12",X"2C",X"15",X"28",X"19",X"24",X"1D",X"20",X"21",X"20",X"21",X"08",X"40",X"08",X"40",
		X"08",X"40",X"08",X"40",X"08",X"40",X"01",X"02",X"03",X"04",X"20",X"18",X"20",X"01",X"01",X"30",
		X"28",X"30",X"1E",X"02",X"1B",X"04",X"23",X"07",X"1D",X"01",X"22",X"03",X"19",X"09",X"1F",X"06",
		X"1A",X"05",X"1C",X"0B",X"21",X"08",X"20",X"0A",X"40",X"10",X"08",X"01",X"08",X"80",X"10",X"78",
		X"18",X"70",X"20",X"60",X"28",X"58",X"30",X"50",X"40",X"48",X"36",X"A6",X"00",X"DF",X"08",X"DE",
		X"0A",X"A7",X"00",X"08",X"DF",X"0A",X"DE",X"08",X"08",X"5A",X"26",X"EF",X"32",X"39",X"48",X"48",
		X"48",X"48",X"80",X"03",X"97",X"15",X"C6",X"03",X"97",X"14",X"86",X"01",X"97",X"1F",X"86",X"FF",
		X"90",X"15",X"B7",X"04",X"00",X"D7",X"10",X"D6",X"10",X"96",X"02",X"44",X"44",X"44",X"98",X"02",
		X"44",X"76",X"00",X"01",X"76",X"00",X"02",X"24",X"07",X"B6",X"04",X"00",X"43",X"B7",X"04",X"00",
		X"96",X"14",X"4A",X"26",X"FD",X"5A",X"26",X"E1",X"96",X"14",X"9B",X"15",X"97",X"14",X"26",X"D7",
		X"39",X"4F",X"B7",X"04",X"00",X"97",X"0C",X"4F",X"91",X"0C",X"26",X"03",X"73",X"04",X"00",X"C6",
		X"12",X"5A",X"26",X"FD",X"4C",X"2A",X"F1",X"73",X"04",X"00",X"7C",X"00",X"0C",X"2A",X"E8",X"39",
		X"86",X"01",X"97",X"14",X"CE",X"03",X"E8",X"86",X"01",X"C6",X"FF",X"20",X"1A",X"86",X"00",X"97",
		X"14",X"CE",X"00",X"80",X"86",X"01",X"C6",X"C0",X"20",X"0D",X"86",X"01",X"97",X"14",X"CE",X"0F",
		X"A0",X"86",X"01",X"C6",X"FF",X"20",X"00",X"97",X"13",X"D7",X"0E",X"DF",X"11",X"7F",X"00",X"10",
		X"DE",X"11",X"B6",X"04",X"00",X"16",X"54",X"54",X"54",X"D8",X"02",X"54",X"76",X"00",X"01",X"76",
		X"00",X"02",X"D6",X"0E",X"7D",X"00",X"14",X"27",X"02",X"D4",X"01",X"D7",X"0F",X"D6",X"10",X"91",
		X"02",X"22",X"12",X"09",X"27",X"26",X"B7",X"04",X"00",X"DB",X"10",X"99",X"0F",X"25",X"16",X"91",
		X"02",X"23",X"F0",X"20",X"10",X"09",X"27",X"14",X"B7",X"04",X"00",X"D0",X"10",X"92",X"0F",X"25",
		X"04",X"91",X"02",X"22",X"F0",X"96",X"02",X"B7",X"04",X"00",X"20",X"B9",X"D6",X"13",X"27",X"B5",
		X"96",X"0E",X"D6",X"10",X"44",X"56",X"44",X"56",X"44",X"56",X"43",X"50",X"82",X"FF",X"DB",X"10",
		X"99",X"0E",X"D7",X"10",X"97",X"0E",X"26",X"98",X"C1",X"07",X"26",X"94",X"39",X"C6",X"FF",X"D7",
		X"18",X"CE",X"FB",X"C6",X"8D",X"09",X"CE",X"FB",X"CC",X"8D",X"04",X"5A",X"26",X"F3",X"39",X"BD",
		X"FB",X"D2",X"BD",X"FB",X"EB",X"39",X"20",X"03",X"FF",X"50",X"FF",X"00",X"50",X"03",X"01",X"20",
		X"FF",X"00",X"A6",X"00",X"97",X"0F",X"A6",X"01",X"97",X"10",X"A6",X"02",X"97",X"11",X"A6",X"03",
		X"97",X"12",X"A6",X"04",X"97",X"13",X"A6",X"05",X"97",X"14",X"39",X"96",X"18",X"37",X"D6",X"13",
		X"D7",X"15",X"D6",X"10",X"D7",X"16",X"43",X"D6",X"0F",X"B7",X"04",X"00",X"5A",X"26",X"FD",X"43",
		X"D6",X"0F",X"20",X"00",X"08",X"09",X"08",X"09",X"B7",X"04",X"00",X"5A",X"26",X"FD",X"7A",X"00",
		X"16",X"27",X"16",X"7A",X"00",X"15",X"26",X"DE",X"43",X"D6",X"13",X"B7",X"04",X"00",X"D7",X"15",
		X"D6",X"0F",X"9B",X"14",X"2B",X"1E",X"01",X"20",X"15",X"08",X"09",X"01",X"43",X"D6",X"10",X"B7",
		X"04",X"00",X"D7",X"16",X"D6",X"0F",X"D0",X"11",X"D1",X"12",X"D1",X"12",X"27",X"06",X"D7",X"0F",
		X"C0",X"05",X"20",X"B8",X"33",X"39",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"7E",X"F1",X"A7",X"00",X"00",X"F0",X"C1",X"F0",X"01",X"F1",X"B6",X"F0",X"01");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
