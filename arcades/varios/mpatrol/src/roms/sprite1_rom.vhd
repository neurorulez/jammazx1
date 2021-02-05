library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity sprite1_rom is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of sprite1_rom is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0E",
		X"00",X"00",X"00",X"00",X"00",X"40",X"40",X"40",X"40",X"40",X"40",X"41",X"43",X"4F",X"47",X"0F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"7E",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"F0",X"01",
		X"3F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FC",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0D",X"E1",X"FC",X"FC",X"FC",X"FC",X"F8",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"40",X"02",X"18",X"98",X"19",X"00",X"24",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"10",X"02",X"40",X"18",X"19",X"98",X"00",X"42",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"48",X"00",X"30",X"B4",X"00",X"48",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"20",X"00",X"00",X"B4",X"30",X"00",X"00",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"02",X"02",X"01",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"0F",X"0F",X"0F",X"0F",X"1F",X"3F",X"1F",X"9F",X"BF",
		X"00",X"00",X"00",X"7C",X"FF",X"FF",X"FC",X"F8",X"F3",X"F7",X"FF",X"FE",X"FE",X"FC",X"FE",X"FE",
		X"00",X"00",X"10",X"98",X"88",X"00",X"10",X"B8",X"F8",X"F8",X"F0",X"30",X"10",X"00",X"10",X"00",
		X"00",X"01",X"0F",X"1F",X"1F",X"3E",X"3C",X"3C",X"38",X"18",X"1C",X"00",X"00",X"00",X"00",X"00",
		X"3C",X"7C",X"F0",X"F0",X"F8",X"B0",X"10",X"02",X"90",X"00",X"00",X"00",X"40",X"00",X"00",X"00",
		X"FC",X"30",X"20",X"20",X"00",X"00",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"1F",X"3F",X"3F",X"15",X"00",X"20",X"0C",X"0C",X"20",
		X"00",X"00",X"00",X"02",X"04",X"04",X"08",X"10",X"C0",X"E3",X"FB",X"FF",X"FF",X"FF",X"F3",X"F0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"7C",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"C0",X"E0",X"E0",
		X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"0C",X"2C",X"00",X"01",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FD",X"FC",X"7F",X"FF",X"FF",X"7F",X"3F",X"18",X"00",X"03",X"0B",X"00",X"00",X"02",X"00",X"00",
		X"C0",X"70",X"10",X"80",X"84",X"CC",X"E8",X"F0",X"60",X"20",X"40",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"0F",X"3F",X"7F",
		X"00",X"00",X"00",X"20",X"20",X"20",X"E0",X"E0",X"E0",X"41",X"E3",X"EF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"F0",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"7F",X"3F",X"3F",X"0C",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"BF",X"1F",X"1F",X"06",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"C3",X"81",X"81",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FC",X"FC",X"FC",X"FC",X"F8",X"F8",X"F0",X"E0",X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"1D",
		X"00",X"01",X"02",X"12",X"11",X"09",X"CD",X"67",X"37",X"7F",X"7F",X"33",X"60",X"E0",X"C0",X"C7",
		X"04",X"08",X"08",X"10",X"10",X"38",X"B8",X"FD",X"FF",X"CF",X"83",X"02",X"00",X"00",X"60",X"F9",
		X"02",X"84",X"44",X"44",X"42",X"66",X"F7",X"FF",X"FF",X"C8",X"00",X"00",X"18",X"7D",X"FF",X"FF",
		X"00",X"00",X"04",X"04",X"08",X"18",X"70",X"E1",X"FB",X"7F",X"3E",X"0F",X"07",X"C3",X"E3",X"E1",
		X"00",X"00",X"00",X"00",X"00",X"10",X"60",X"80",X"00",X"00",X"60",X"98",X"00",X"80",X"C0",X"F0",
		X"00",X"00",X"00",X"01",X"01",X"03",X"06",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",
		X"E7",X"4F",X"4F",X"C7",X"E3",X"B0",X"18",X"3E",X"3F",X"37",X"63",X"41",X"41",X"82",X"02",X"00",
		X"FF",X"FF",X"FF",X"CF",X"87",X"00",X"00",X"4E",X"FF",X"FF",X"3B",X"10",X"10",X"20",X"20",X"20",
		X"FF",X"FF",X"FF",X"BB",X"00",X"00",X"03",X"0F",X"1F",X"FF",X"EF",X"CB",X"C9",X"44",X"44",X"20",
		X"F1",X"F3",X"E3",X"47",X"0F",X"06",X"07",X"CF",X"FD",X"7C",X"38",X"1C",X"04",X"02",X"01",X"01",
		X"88",X"00",X"80",X"C0",X"E0",X"60",X"10",X"80",X"C0",X"C0",X"20",X"20",X"10",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"07",X"0F",X"07",X"0E",X"1E",X"1F",
		X"00",X"00",X"01",X"0B",X"1F",X"1F",X"3F",X"7E",X"FE",X"FC",X"CC",X"00",X"00",X"01",X"03",X"07",
		X"00",X"00",X"C1",X"F3",X"FF",X"FF",X"FF",X"3F",X"19",X"10",X"00",X"00",X"60",X"F9",X"FF",X"FF",
		X"00",X"80",X"C0",X"F3",X"FF",X"FF",X"E7",X"C3",X"82",X"00",X"00",X"00",X"E3",X"CF",X"FF",X"FF",
		X"00",X"00",X"00",X"B0",X"F8",X"FC",X"FE",X"3E",X"1F",X"13",X"01",X"01",X"83",X"C3",X"C7",X"83",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"E0",X"F0",X"F0",X"E0",X"F0",
		X"1F",X"0F",X"1F",X"0F",X"07",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"87",X"C3",X"80",X"00",X"00",X"82",X"C7",X"CF",X"FF",X"7F",X"7F",X"3F",X"33",X"00",X"00",X"00",
		X"FF",X"7F",X"3F",X"0D",X"00",X"00",X"00",X"00",X"83",X"87",X"CF",X"FF",X"FF",X"F3",X"20",X"00",
		X"FF",X"FF",X"FD",X"D8",X"00",X"00",X"08",X"0C",X"1F",X"9F",X"FF",X"FE",X"FC",X"60",X"00",X"00",
		X"E1",X"C1",X"81",X"03",X"27",X"3F",X"3F",X"7F",X"FE",X"FC",X"F0",X"E0",X"60",X"00",X"00",X"00",
		X"F0",X"E0",X"E0",X"C0",X"C0",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"03",X"07",X"07",X"77",X"7E",X"7C",X"F0",X"E0",X"E1",X"E1",X"70",X"70",X"39",X"3F",X"1F",X"0D",
		X"00",X"CE",X"FF",X"FF",X"71",X"00",X"68",X"FF",X"FF",X"99",X"00",X"00",X"CF",X"FF",X"F3",X"80",
		X"39",X"FF",X"FF",X"CF",X"00",X"00",X"CF",X"FF",X"FF",X"CF",X"00",X"00",X"39",X"FF",X"EF",X"C3",
		X"80",X"C0",X"F0",X"FC",X"FE",X"3E",X"0F",X"87",X"C6",X"06",X"0C",X"0E",X"CE",X"FC",X"F0",X"30",
		X"00",X"00",X"00",X"00",X"01",X"07",X"0F",X"1F",X"1F",X"1F",X"0F",X"03",X"01",X"01",X"00",X"00",
		X"00",X"00",X"00",X"00",X"9C",X"FF",X"E7",X"80",X"00",X"91",X"FF",X"FF",X"F3",X"C0",X"00",X"00",
		X"00",X"00",X"00",X"70",X"FC",X"FF",X"93",X"01",X"00",X"81",X"93",X"FF",X"FB",X"60",X"00",X"00",
		X"00",X"00",X"00",X"00",X"C0",X"E0",X"F0",X"F0",X"F0",X"F0",X"E0",X"E0",X"40",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"0C",X"3F",X"70",X"73",X"3F",X"0C",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"F0",X"BC",X"0E",X"1E",X"F4",X"C0",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"20",X"70",X"F0",X"60",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"60",X"F0",X"70",X"20",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"60",X"F0",X"F0",X"60",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"01",X"03",X"03",X"01",X"03",X"03",X"01",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"B0",X"F8",X"FC",X"FC",X"FE",X"FC",X"FC",X"FC",X"F8",X"98",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"08",X"18",X"28",X"00",X"02",X"26",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"02",X"00",X"08",X"00",X"01",X"03",X"06",X"80",X"10",X"21",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"60",X"E0",X"E0",X"E0",X"20",X"30",X"70",X"D0",X"18",X"3C",X"1C",
		X"00",X"03",X"00",X"00",X"04",X"08",X"08",X"00",X"00",X"00",X"04",X"08",X"00",X"82",X"C0",X"80",
		X"00",X"C0",X"E0",X"60",X"70",X"20",X"60",X"50",X"10",X"30",X"20",X"30",X"30",X"78",X"3C",X"7E",
		X"07",X"07",X"03",X"07",X"09",X"01",X"02",X"02",X"04",X"00",X"00",X"04",X"08",X"00",X"00",X"00",
		X"00",X"00",X"80",X"80",X"80",X"80",X"E0",X"30",X"30",X"50",X"10",X"28",X"48",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"08",X"04",X"02",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"08",X"08",X"08",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"08",X"08",X"08",X"08",X"04",X"02",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"03",X"04",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"FE",X"FF",X"00",X"00",X"03",X"00",X"01",X"04",X"31",X"7B",X"7B",X"31",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"80",X"20",X"8C",X"DE",X"DE",X"8C",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"78",X"7E",X"3F",X"1F",X"0F",X"1F",X"0F",X"0F",X"1F",X"07",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"30",X"E0",X"E0",X"C0",X"FF",X"FF",X"FF",X"FF",X"03",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"70",X"FC",X"F0",X"F0",X"F0",X"C0",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"E0",X"E0",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"78",X"78",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"03",X"0F",X"1E",X"38",X"71",X"73",X"27",X"67",X"63",X"70",X"60",X"39",X"1F",X"06",X"00",
		X"00",X"C0",X"F0",X"7C",X"1C",X"8E",X"C6",X"E4",X"E4",X"CE",X"86",X"0C",X"BC",X"F8",X"C0",X"00",
		X"06",X"0F",X"3F",X"32",X"70",X"46",X"CF",X"CF",X"87",X"CF",X"66",X"E0",X"70",X"3C",X"1F",X"07",
		X"C0",X"F0",X"9C",X"0C",X"46",X"E2",X"F3",X"E2",X"F7",X"F7",X"C3",X"06",X"06",X"DC",X"F8",X"B0",
		X"00",X"00",X"00",X"00",X"01",X"07",X"0F",X"0F",X"03",X"00",X"00",X"38",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"C0",X"E0",X"E0",X"80",X"00",X"00",X"38",X"00",X"00",X"00",X"00",
		X"00",X"01",X"03",X"07",X"07",X"07",X"03",X"05",X"18",X"3C",X"7E",X"7F",X"7E",X"3C",X"18",X"00",
		X"00",X"80",X"C0",X"E0",X"E0",X"E0",X"C0",X"A0",X"18",X"3C",X"7E",X"FE",X"7E",X"3C",X"18",X"00",
		X"00",X"00",X"00",X"00",X"18",X"3D",X"7E",X"7E",X"7E",X"3C",X"1A",X"01",X"00",X"00",X"00",X"00",
		X"30",X"78",X"FC",X"FC",X"FC",X"78",X"30",X"10",X"10",X"30",X"78",X"FC",X"FC",X"FC",X"78",X"30",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1C",X"03",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0C",X"03",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"03",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"09",X"04",X"02",X"00",X"20",X"C0",X"18",X"23",X"02",X"04",X"00",X"00",X"00",
		X"00",X"00",X"80",X"00",X"10",X"60",X"C0",X"40",X"00",X"10",X"00",X"50",X"40",X"20",X"00",X"00",
		X"00",X"00",X"00",X"20",X"11",X"09",X"24",X"00",X"20",X"0A",X"1A",X"23",X"49",X"11",X"02",X"00",
		X"00",X"00",X"40",X"80",X"8C",X"10",X"60",X"00",X"08",X"40",X"A0",X"10",X"40",X"20",X"00",X"00",
		X"02",X"81",X"24",X"32",X"08",X"00",X"B8",X"6C",X"00",X"02",X"07",X"1D",X"20",X"40",X"89",X"10",
		X"02",X"20",X"88",X"B0",X"E1",X"74",X"38",X"10",X"40",X"E0",X"7C",X"D2",X"88",X"84",X"00",X"10",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"04",X"03",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"40",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"05",X"03",X"03",X"03",X"01",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"40",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"14",X"0F",X"5C",X"30",X"E0",X"40",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"A0",X"C0",X"E4",X"38",X"0D",X"06",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"01",X"05",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"02",X"4F",X"2F",X"39",X"F0",X"C0",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"C0",X"F4",X"FE",X"9F",X"0F",X"03",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"C0",X"D0",
		X"03",X"07",X"07",X"06",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"60",X"70",X"38",X"18",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"04",X"02",X"02",X"01",X"00",X"20",X"14",X"03",X"07",X"07",X"53",
		X"04",X"04",X"40",X"42",X"22",X"20",X"04",X"02",X"57",X"3F",X"3F",X"FF",X"F9",X"F0",X"E0",X"C0",
		X"10",X"00",X"20",X"22",X"02",X"04",X"44",X"20",X"60",X"FB",X"FF",X"7F",X"1F",X"0B",X"02",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"20",X"80",X"00",X"20",X"C4",X"C8",X"C0",X"E0",X"EA",
		X"0F",X"0E",X"1E",X"1E",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F0",X"7C",X"FC",X"3C",X"1E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"09",X"05",X"07",X"07",X"0F",X"0F",X"1F",X"1F",X"7F",
		X"08",X"04",X"0D",X"8F",X"5F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"20",X"40",X"E0",X"F8",X"FC",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"40",X"80",X"90",X"E0",X"E0",X"E0",X"F4",X"F8",X"F8",X"F8",X"FC",
		X"3F",X"3F",X"3F",X"1F",X"7F",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FE",X"F7",X"FA",X"F0",X"E0",X"F8",X"FD",X"FB",X"7F",X"5F",X"1F",X"0F",X"03",X"01",X"01",
		X"FF",X"FF",X"6F",X"5F",X"0F",X"1F",X"3F",X"3E",X"5E",X"F4",X"F0",X"E0",X"C0",X"80",X"80",X"00",
		X"F8",X"FC",X"FC",X"FE",X"FE",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"03",X"03",X"01",X"03",X"43",X"27",
		X"00",X"00",X"00",X"01",X"00",X"01",X"21",X"13",X"1B",X"1F",X"1F",X"BF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"04",X"08",X"98",X"D8",X"FE",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"20",X"60",X"E0",X"C0",X"E0",X"F2",
		X"3F",X"1F",X"1F",X"1F",X"1F",X"1F",X"BF",X"7F",X"7F",X"3F",X"7F",X"7F",X"7F",X"7F",X"FF",X"FC",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"F0",X"D0",X"C0",X"80",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"9F",X"0F",X"01",X"00",X"00",X"00",
		X"F4",X"FC",X"F8",X"F8",X"FD",X"FE",X"FC",X"FC",X"FD",X"FE",X"FE",X"FE",X"FE",X"7F",X"3F",X"0F",
		X"70",X"20",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"20",X"10",X"10",X"40",X"21",X"13",X"1F",X"3F",X"1F",X"3F",X"3F",X"1D",
		X"00",X"00",X"00",X"50",X"00",X"20",X"20",X"40",X"C0",X"C0",X"F0",X"F9",X"FA",X"FC",X"F8",X"DC",
		X"00",X"00",X"00",X"00",X"01",X"01",X"81",X"03",X"47",X"67",X"F7",X"FB",X"7F",X"7F",X"3F",X"7B",
		X"80",X"00",X"80",X"80",X"00",X"80",X"80",X"C8",X"E0",X"E2",X"C4",X"EC",X"DE",X"FE",X"FE",X"CC",
		X"00",X"04",X"00",X"00",X"00",X"40",X"40",X"21",X"3D",X"9F",X"7F",X"FF",X"FF",X"FF",X"7B",X"39",
		X"00",X"00",X"04",X"00",X"00",X"00",X"C0",X"E1",X"F0",X"F8",X"FE",X"FF",X"FF",X"FF",X"FF",X"46",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"00",X"04",X"02",X"12",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"08",X"07",X"01",X"00",X"10",X"29",X"07",X"07",X"03",X"03",X"01",X"00",
		X"11",X"09",X"8B",X"4F",X"2F",X"BF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"F7",X"FB",X"FB",X"71",
		X"10",X"10",X"B2",X"F4",X"F9",X"FA",X"FE",X"FC",X"FE",X"FE",X"FE",X"FF",X"F7",X"EF",X"CF",X"9E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"10",X"10",X"10",X"08",X"08",X"89",X"45",X"45",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"40",X"80",X"80",X"88",X"11",X"22",X"64",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"08",X"06",X"03",X"03",X"03",X"07",X"07",X"0F",X"0F",X"07",X"07",X"03",X"03",X"01",X"00",
		X"67",X"37",X"37",X"1F",X"BF",X"BF",X"BF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FB",X"BB",X"71",
		X"E6",X"F8",X"F9",X"FF",X"FE",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"DF",X"8E",
		X"00",X"40",X"80",X"00",X"20",X"40",X"80",X"80",X"D0",X"C0",X"80",X"80",X"80",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"03",X"03",X"02",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"E0",X"60",X"F8",X"F8",X"F4",X"FE",
		X"01",X"01",X"00",X"18",X"2E",X"7E",X"7E",X"3D",X"7F",X"6F",X"36",X"00",X"00",X"00",X"00",X"00",
		X"FE",X"FC",X"D8",X"30",X"00",X"02",X"07",X"0D",X"0F",X"06",X"66",X"B0",X"F8",X"78",X"60",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"05",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"A0",X"E0",
		X"0F",X"0F",X"07",X"02",X"01",X"00",X"08",X"1C",X"1A",X"2E",X"3E",X"18",X"00",X"00",X"00",X"00",
		X"D0",X"F0",X"F0",X"E0",X"C0",X"18",X"3E",X"3E",X"5D",X"7F",X"7F",X"36",X"0E",X"04",X"00",X"00",
		X"01",X"0F",X"1F",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"B0",X"F0",X"F0",X"F0",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"1F",X"3F",X"79",
		X"00",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"3C",X"7E",X"7E",X"FF",X"FF",X"FF",X"FF",X"E7",X"C3",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"F8",X"FC",X"9E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"04",X"03",X"03",X"07",X"0F",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"80",X"40",X"40",X"60",X"60",X"E0",X"F0",X"F0",X"70",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"01",X"08",X"04",X"06",X"03",X"07",X"0F",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"80",X"C0",X"40",X"60",X"60",X"E0",X"F0",X"F0",X"70",X"10",X"00",X"00",X"00",X"00",X"00",
		X"01",X"08",X"04",X"06",X"02",X"07",X"07",X"0F",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"80",X"C0",X"C0",X"60",X"60",X"60",X"E0",X"F0",X"F0",X"70",X"10",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"1F",X"3F",X"79",
		X"7E",X"7E",X"7E",X"7E",X"7E",X"3C",X"3C",X"7E",X"7E",X"7E",X"FF",X"FF",X"FF",X"FF",X"E7",X"C3",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"F8",X"FC",X"9E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"1F",X"3F",X"79",
		X"00",X"00",X"20",X"64",X"7E",X"3C",X"3C",X"7E",X"7E",X"7E",X"FF",X"FF",X"FF",X"FF",X"E7",X"C3",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"E0",X"F8",X"FC",X"9E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"06",X"0F",X"06",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"78",X"7E",X"3F",X"1F",X"0F",X"1F",X"0F",X"0F",X"1F",X"07",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"06",X"0F",X"06",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"78",X"7E",X"3F",X"1F",X"0F",X"1F",X"0F",X"0F",X"1F",X"07",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3C",X"21",X"21",X"39",X"05",X"05",X"38",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C6",X"29",X"29",X"29",X"29",X"29",X"C6",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"98",X"A5",X"A5",X"A5",X"A5",X"A5",X"98",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C6",X"29",X"29",X"29",X"29",X"29",X"C6",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;