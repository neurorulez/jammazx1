library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rom_veca is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of rom_veca is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"AE",X"E8",X"B9",X"E8",X"C4",X"E8",X"CF",X"E8",X"DA",X"E8",X"E5",X"E8",X"F0",X"E8",X"FB",X"E8",
		X"06",X"E9",X"11",X"E9",X"1C",X"E9",X"27",X"E9",X"32",X"E9",X"3D",X"E9",X"48",X"E9",X"53",X"E9",
		X"5E",X"E9",X"6F",X"E9",X"80",X"E9",X"91",X"E9",X"A2",X"E9",X"B3",X"E9",X"C4",X"E9",X"D5",X"E9",
		X"E6",X"E9",X"F7",X"E9",X"08",X"EA",X"19",X"EA",X"2A",X"EA",X"3B",X"EA",X"4C",X"EA",X"5D",X"EA",
		X"6E",X"EA",X"87",X"EA",X"A0",X"EA",X"BA",X"EA",X"D3",X"EA",X"EC",X"EA",X"05",X"EB",X"1E",X"EB",
		X"37",X"EB",X"50",X"EB",X"69",X"EB",X"82",X"EB",X"9B",X"EB",X"B4",X"EB",X"CD",X"EB",X"E6",X"EB",
		X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",
		X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",
		X"75",X"E8",X"88",X"E8",X"9B",X"E8",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",
		X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",X"A0",X"E7",
		X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",
		X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",
		X"4F",X"ED",X"5F",X"ED",X"6F",X"ED",X"7F",X"ED",X"8F",X"ED",X"9F",X"ED",X"AF",X"ED",X"BF",X"ED",
		X"CF",X"ED",X"DF",X"ED",X"EF",X"ED",X"FF",X"ED",X"0F",X"EE",X"1F",X"EE",X"2F",X"EE",X"3F",X"EE",
		X"4F",X"EE",X"61",X"EE",X"73",X"EE",X"85",X"EE",X"97",X"EE",X"A9",X"EE",X"BB",X"EE",X"CD",X"EE",
		X"DF",X"EE",X"F1",X"EE",X"03",X"EF",X"15",X"EF",X"27",X"EF",X"39",X"EF",X"4B",X"EF",X"5D",X"EF",
		X"6F",X"EF",X"79",X"EF",X"83",X"EF",X"8D",X"EF",X"97",X"EF",X"A1",X"EF",X"AB",X"EF",X"B5",X"EF",
		X"BF",X"EF",X"C9",X"EF",X"D3",X"EF",X"DD",X"EF",X"E7",X"EF",X"F1",X"EF",X"FB",X"EF",X"05",X"F0",
		X"0F",X"F0",X"18",X"F0",X"21",X"F0",X"2A",X"F0",X"33",X"F0",X"3C",X"F0",X"45",X"F0",X"4E",X"F0",
		X"57",X"F0",X"60",X"F0",X"69",X"F0",X"72",X"F0",X"7B",X"F0",X"84",X"F0",X"8D",X"F0",X"96",X"F0",
		X"0F",X"F0",X"18",X"F0",X"21",X"F0",X"2A",X"F0",X"33",X"F0",X"3C",X"F0",X"45",X"F0",X"4E",X"F0",
		X"57",X"F0",X"60",X"F0",X"69",X"F0",X"72",X"F0",X"7B",X"F0",X"84",X"F0",X"8D",X"F0",X"96",X"F0",
		X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",
		X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",X"8B",X"E7",
		X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",
		X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"C0",
		X"9F",X"F0",X"B1",X"F0",X"C3",X"F0",X"D5",X"F0",X"E7",X"F0",X"F9",X"F0",X"0B",X"F1",X"1D",X"F1",
		X"2F",X"F1",X"41",X"F1",X"53",X"F1",X"65",X"F1",X"77",X"F1",X"89",X"F1",X"9B",X"F1",X"AD",X"F1",
		X"BF",X"F1",X"C9",X"F1",X"D3",X"F1",X"DD",X"F1",X"E7",X"F1",X"F1",X"F1",X"FB",X"F1",X"05",X"F2",
		X"0F",X"F2",X"19",X"F2",X"23",X"F2",X"2D",X"F2",X"37",X"F2",X"41",X"F2",X"4B",X"F2",X"55",X"F2",
		X"6F",X"EF",X"79",X"EF",X"83",X"EF",X"8D",X"EF",X"97",X"EF",X"A1",X"EF",X"AB",X"EF",X"B5",X"EF",
		X"BF",X"EF",X"C9",X"EF",X"D3",X"EF",X"DD",X"EF",X"E7",X"EF",X"F1",X"EF",X"FB",X"EF",X"05",X"F0",
		X"30",X"B5",X"00",X"C0",X"45",X"B5",X"00",X"C0",X"5A",X"B5",X"00",X"C0",X"6F",X"B5",X"00",X"C0",
		X"84",X"B5",X"00",X"C0",X"99",X"B5",X"00",X"C0",X"AE",X"B5",X"00",X"C0",X"C3",X"B5",X"00",X"C0",
		X"D8",X"B5",X"00",X"C0",X"ED",X"B5",X"00",X"C0",X"02",X"B6",X"00",X"C0",X"17",X"B6",X"00",X"C0",
		X"2C",X"B6",X"00",X"C0",X"41",X"B6",X"00",X"C0",X"56",X"B6",X"00",X"C0",X"6B",X"B6",X"00",X"C0",
		X"80",X"B6",X"00",X"C0",X"95",X"B6",X"00",X"C0",X"AA",X"B6",X"00",X"C0",X"BF",X"B6",X"00",X"C0",
		X"D4",X"B6",X"00",X"C0",X"E9",X"B6",X"00",X"C0",X"FE",X"B6",X"00",X"C0",X"13",X"B7",X"00",X"C0",
		X"28",X"B7",X"00",X"C0",X"3D",X"B7",X"00",X"C0",X"52",X"B7",X"00",X"C0",X"67",X"B7",X"00",X"C0",
		X"7C",X"B7",X"00",X"C0",X"91",X"B7",X"00",X"C0",X"A6",X"B7",X"00",X"C0",X"BB",X"B7",X"00",X"C0",
		X"D0",X"B7",X"00",X"C0",X"E5",X"B7",X"00",X"C0",X"FA",X"B7",X"00",X"C0",X"0F",X"B8",X"00",X"C0",
		X"24",X"B8",X"00",X"C0",X"39",X"B8",X"00",X"C0",X"4E",X"B8",X"00",X"C0",X"63",X"B8",X"00",X"C0",
		X"78",X"B8",X"00",X"C0",X"8D",X"B8",X"00",X"C0",X"A2",X"B8",X"00",X"C0",X"B7",X"B8",X"00",X"C0",
		X"CC",X"B8",X"00",X"C0",X"E1",X"B8",X"00",X"C0",X"F6",X"B8",X"00",X"C0",X"0B",X"B9",X"00",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"30",X"B5",X"5F",X"F2",X"45",X"B5",X"6E",X"F2",X"5A",X"B5",X"7D",X"F2",X"6F",X"B5",X"8C",X"F2",
		X"84",X"B5",X"9C",X"F2",X"99",X"B5",X"AB",X"F2",X"AE",X"B5",X"BA",X"F2",X"C3",X"B5",X"C9",X"F2",
		X"D8",X"B5",X"D8",X"F2",X"ED",X"B5",X"E7",X"F2",X"02",X"B6",X"F6",X"F2",X"17",X"B6",X"05",X"F3",
		X"2C",X"B6",X"14",X"F3",X"41",X"B6",X"23",X"F3",X"56",X"B6",X"32",X"F3",X"6B",X"B6",X"41",X"F3",
		X"80",X"B6",X"50",X"F3",X"95",X"B6",X"5F",X"F3",X"AA",X"B6",X"6E",X"F3",X"BF",X"B6",X"7D",X"F3",
		X"D4",X"B6",X"8C",X"F3",X"E9",X"B6",X"9B",X"F3",X"FE",X"B6",X"AA",X"F3",X"13",X"B7",X"B9",X"F3",
		X"28",X"B7",X"C8",X"F3",X"3D",X"B7",X"D7",X"F3",X"52",X"B7",X"E6",X"F3",X"67",X"B7",X"F5",X"F3",
		X"7C",X"B7",X"04",X"F4",X"91",X"B7",X"13",X"F4",X"A6",X"B7",X"22",X"F4",X"BB",X"B7",X"31",X"F4",
		X"D0",X"B7",X"40",X"F4",X"E5",X"B7",X"4F",X"F4",X"FA",X"B7",X"5E",X"F4",X"0F",X"B8",X"6D",X"F4",
		X"24",X"B8",X"7C",X"F4",X"39",X"B8",X"8B",X"F4",X"4E",X"B8",X"9A",X"F4",X"63",X"B8",X"A9",X"F4",
		X"78",X"B8",X"B8",X"F4",X"8D",X"B8",X"C7",X"F4",X"A2",X"B8",X"D6",X"F4",X"B7",X"B8",X"E5",X"F4",
		X"CC",X"B8",X"F4",X"F4",X"E1",X"B8",X"03",X"F5",X"F6",X"B8",X"12",X"F5",X"0B",X"B9",X"21",X"F5",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"30",X"B5",X"20",X"F9",X"45",X"B5",X"2B",X"F9",X"5A",X"B5",X"36",X"F9",X"6F",X"B5",X"41",X"F9",
		X"84",X"B5",X"4C",X"F9",X"99",X"B5",X"57",X"F9",X"AE",X"B5",X"62",X"F9",X"C3",X"B5",X"6D",X"F9",
		X"D8",X"B5",X"78",X"F9",X"ED",X"B5",X"83",X"F9",X"02",X"B6",X"8E",X"F9",X"17",X"B6",X"99",X"F9",
		X"2C",X"B6",X"A4",X"F9",X"41",X"B6",X"AF",X"F9",X"56",X"B6",X"BA",X"F9",X"6B",X"B6",X"C5",X"F9",
		X"80",X"B6",X"D0",X"F9",X"95",X"B6",X"DB",X"F9",X"AA",X"B6",X"E6",X"F9",X"BF",X"B6",X"F1",X"F9",
		X"D4",X"B6",X"FC",X"F9",X"E9",X"B6",X"07",X"FA",X"FE",X"B6",X"12",X"FA",X"13",X"B7",X"1D",X"FA",
		X"28",X"B7",X"28",X"FA",X"3D",X"B7",X"33",X"FA",X"52",X"B7",X"3E",X"FA",X"67",X"B7",X"49",X"FA",
		X"7C",X"B7",X"54",X"FA",X"91",X"B7",X"5F",X"FA",X"A6",X"B7",X"6A",X"FA",X"BB",X"B7",X"75",X"FA",
		X"D0",X"B7",X"80",X"FA",X"E5",X"B7",X"8B",X"FA",X"FA",X"B7",X"97",X"FA",X"0F",X"B8",X"A2",X"FA",
		X"24",X"B8",X"AD",X"FA",X"39",X"B8",X"B8",X"FA",X"4E",X"B8",X"C3",X"FA",X"63",X"B8",X"CE",X"FA",
		X"78",X"B8",X"D9",X"FA",X"8D",X"B8",X"E4",X"FA",X"A2",X"B8",X"EF",X"FA",X"B7",X"B8",X"FA",X"FA",
		X"CC",X"B8",X"05",X"FB",X"E1",X"B8",X"10",X"FB",X"F6",X"B8",X"1B",X"FB",X"0B",X"B9",X"26",X"FB",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"B9",X"80",X"E5",X"2B",X"B9",X"82",X"E5",X"36",X"B9",X"84",X"E5",X"41",X"B9",X"86",X"E5",
		X"4C",X"B9",X"88",X"E5",X"57",X"B9",X"8A",X"E5",X"62",X"B9",X"8C",X"E5",X"6D",X"B9",X"8E",X"E5",
		X"78",X"B9",X"90",X"E5",X"83",X"B9",X"92",X"E5",X"8E",X"B9",X"94",X"E5",X"99",X"B9",X"96",X"E5",
		X"A4",X"B9",X"98",X"E5",X"AF",X"B9",X"9A",X"E5",X"BA",X"B9",X"9C",X"E5",X"C5",X"B9",X"9E",X"E5",
		X"D0",X"B9",X"A0",X"E5",X"DB",X"B9",X"A2",X"E5",X"E6",X"B9",X"A4",X"E5",X"F1",X"B9",X"A6",X"E5",
		X"FC",X"B9",X"A8",X"E5",X"07",X"BA",X"AA",X"E5",X"12",X"BA",X"AC",X"E5",X"1D",X"BA",X"AE",X"E5",
		X"28",X"BA",X"B0",X"E5",X"33",X"BA",X"B2",X"E5",X"3E",X"BA",X"B4",X"E5",X"49",X"BA",X"B6",X"E5",
		X"54",X"BA",X"B8",X"E5",X"5F",X"BA",X"BA",X"E5",X"6A",X"BA",X"BC",X"E5",X"75",X"BA",X"BE",X"E5",
		X"80",X"BA",X"C0",X"E5",X"8B",X"BA",X"C2",X"E5",X"97",X"BA",X"C4",X"E5",X"A2",X"BA",X"C6",X"E5",
		X"AD",X"BA",X"C8",X"E5",X"B8",X"BA",X"CA",X"E5",X"C3",X"BA",X"CC",X"E5",X"CE",X"BA",X"CE",X"E5",
		X"D9",X"BA",X"D0",X"E5",X"E4",X"BA",X"D2",X"E5",X"EF",X"BA",X"D4",X"E5",X"FA",X"BA",X"D6",X"E5",
		X"05",X"BB",X"D8",X"E5",X"10",X"BB",X"DA",X"E5",X"1B",X"BB",X"DC",X"E5",X"26",X"BB",X"DE",X"E5",
		X"DD",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"B9",X"00",X"C0",X"2B",X"B9",X"00",X"C0",X"36",X"B9",X"00",X"C0",X"41",X"B9",X"00",X"C0",
		X"4C",X"B9",X"00",X"C0",X"57",X"B9",X"00",X"C0",X"62",X"B9",X"00",X"C0",X"6D",X"B9",X"00",X"C0",
		X"78",X"B9",X"00",X"C0",X"83",X"B9",X"00",X"C0",X"8E",X"B9",X"00",X"C0",X"99",X"B9",X"00",X"C0",
		X"A4",X"B9",X"00",X"C0",X"AF",X"B9",X"00",X"C0",X"BA",X"B9",X"00",X"C0",X"C5",X"B9",X"00",X"C0",
		X"D0",X"B9",X"00",X"C0",X"DB",X"B9",X"00",X"C0",X"E6",X"B9",X"00",X"C0",X"F1",X"B9",X"00",X"C0",
		X"FC",X"B9",X"00",X"C0",X"07",X"BA",X"00",X"C0",X"12",X"BA",X"00",X"C0",X"1D",X"BA",X"00",X"C0",
		X"28",X"BA",X"00",X"C0",X"33",X"BA",X"00",X"C0",X"3E",X"BA",X"00",X"C0",X"49",X"BA",X"00",X"C0",
		X"54",X"BA",X"00",X"C0",X"5F",X"BA",X"00",X"C0",X"6A",X"BA",X"00",X"C0",X"75",X"BA",X"00",X"C0",
		X"80",X"BA",X"00",X"C0",X"8B",X"BA",X"00",X"C0",X"97",X"BA",X"00",X"C0",X"A2",X"BA",X"00",X"C0",
		X"AD",X"BA",X"00",X"C0",X"B8",X"BA",X"00",X"C0",X"C3",X"BA",X"00",X"C0",X"CE",X"BA",X"00",X"C0",
		X"D9",X"BA",X"00",X"C0",X"E4",X"BA",X"00",X"C0",X"EF",X"BA",X"00",X"C0",X"FA",X"BA",X"00",X"C0",
		X"05",X"BB",X"00",X"C0",X"10",X"BB",X"00",X"C0",X"1B",X"BB",X"00",X"C0",X"26",X"BB",X"00",X"C0",
		X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"E0",X"F0",X"1F",X"57",X"E0",X"D4",X"1F",X"4D",X"E0",
		X"BB",X"1F",X"39",X"E0",X"AD",X"1F",X"1F",X"E0",X"A8",X"1F",X"00",X"E0",X"AC",X"1F",X"E1",X"FF",
		X"BC",X"1F",X"C7",X"FF",X"D4",X"1F",X"B3",X"FF",X"F0",X"1F",X"A9",X"FF",X"10",X"00",X"A9",X"FF",
		X"2C",X"00",X"B3",X"FF",X"45",X"00",X"C7",X"FF",X"53",X"00",X"E1",X"FF",X"58",X"00",X"00",X"E0",
		X"53",X"00",X"1F",X"E0",X"45",X"00",X"39",X"E0",X"2C",X"00",X"4D",X"E0",X"10",X"00",X"57",X"E0",
		X"00",X"1F",X"00",X"00",X"00",X"C0",X"3E",X"40",X"3F",X"41",X"20",X"42",X"21",X"41",X"24",X"40",
		X"21",X"5F",X"1D",X"5D",X"22",X"40",X"21",X"5F",X"20",X"5E",X"3F",X"5F",X"3C",X"40",X"3F",X"41",
		X"02",X"5E",X"20",X"45",X"20",X"45",X"02",X"40",X"20",X"5B",X"20",X"5B",X"1F",X"45",X"00",X"C0",
		X"00",X"4C",X"3A",X"40",X"3A",X"5A",X"20",X"54",X"26",X"5A",X"2C",X"40",X"26",X"46",X"20",X"4C",
		X"3A",X"46",X"3A",X"40",X"00",X"54",X"00",X"71",X"00",X"C0",X"1E",X"43",X"3E",X"5D",X"21",X"5D",
		X"22",X"5F",X"3B",X"5C",X"20",X"5B",X"24",X"5C",X"24",X"40",X"24",X"44",X"20",X"45",X"3B",X"44",
		X"22",X"41",X"21",X"43",X"3E",X"43",X"3C",X"40",X"3B",X"43",X"3E",X"44",X"05",X"56",X"3B",X"5F",
		X"3E",X"5C",X"08",X"42",X"3B",X"5D",X"3E",X"5B",X"0A",X"40",X"0A",X"40",X"3E",X"45",X"3B",X"43",
		X"08",X"5E",X"3E",X"44",X"3B",X"41",X"1E",X"43",X"25",X"43",X"22",X"44",X"17",X"56",X"1E",X"51",
		X"00",X"C0",X"5A",X"00",X"00",X"00",X"00",X"00",X"32",X"20",X"25",X"5B",X"20",X"56",X"3B",X"5B",
		X"25",X"5B",X"20",X"51",X"3B",X"5B",X"46",X"00",X"E2",X"1F",X"20",X"5B",X"2A",X"40",X"16",X"56",
		X"20",X"56",X"2A",X"40",X"0A",X"56",X"0A",X"40",X"5A",X"00",X"00",X"00",X"2A",X"40",X"A6",X"1F",
		X"00",X"20",X"00",X"00",X"00",X"00",X"0A",X"40",X"32",X"00",X"00",X"00",X"25",X"45",X"00",X"00",
		X"28",X"20",X"25",X"5B",X"CE",X"1F",X"00",X"20",X"14",X"00",X"C4",X"1F",X"25",X"45",X"2F",X"40",
		X"16",X"5B",X"20",X"5B",X"2A",X"40",X"16",X"4F",X"20",X"45",X"CE",X"1F",X"28",X"00",X"0A",X"40");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
