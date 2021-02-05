library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_ic24 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_ic24 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"88",X"B1",X"E0",X"A0",X"88",X"60",X"84",X"00",
		X"00",X"01",X"08",X"01",X"88",X"44",X"F4",X"C8",X"18",X"1C",X"9C",X"FE",X"FE",X"7E",X"1E",X"00",
		X"00",X"78",X"7E",X"7F",X"7F",X"38",X"38",X"1C",X"20",X"10",X"88",X"C1",X"E1",X"70",X"38",X"1C",
		X"00",X"00",X"20",X"90",X"48",X"24",X"90",X"48",X"0E",X"07",X"03",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"02",X"0C",X"18",X"20",X"00",X"00",X"00",X"00",X"00",X"0E",X"24",X"00",X"00",X"00",
		X"00",X"02",X"02",X"00",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"28",X"60",X"C0",X"00",
		X"00",X"00",X"00",X"46",X"23",X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"68",X"00",X"00",X"00",
		X"00",X"00",X"08",X"08",X"10",X"08",X"08",X"00",X"00",X"08",X"08",X"00",X"10",X"08",X"00",X"00",
		X"C8",X"F0",X"44",X"00",X"00",X"80",X"00",X"00",X"5F",X"7F",X"FF",X"FF",X"FE",X"FD",X"FF",X"FC",
		X"00",X"00",X"00",X"04",X"02",X"0E",X"13",X"27",X"08",X"56",X"13",X"00",X"40",X"00",X"40",X"00",
		X"00",X"00",X"01",X"08",X"11",X"03",X"07",X"1D",X"0E",X"07",X"13",X"09",X"04",X"02",X"00",X"00",
		X"10",X"00",X"80",X"C4",X"E2",X"71",X"38",X"1C",X"00",X"00",X"00",X"00",X"80",X"C0",X"60",X"30",
		X"00",X"40",X"40",X"14",X"08",X"00",X"00",X"00",X"00",X"00",X"20",X"18",X"02",X"00",X"00",X"00",
		X"00",X"04",X"00",X"3C",X"14",X"20",X"00",X"00",X"00",X"00",X"10",X"08",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"60",X"3C",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"00",X"00",X"00",X"00",
		X"00",X"00",X"08",X"1C",X"08",X"00",X"00",X"00",X"00",X"00",X"1C",X"1C",X"1C",X"00",X"00",X"00",
		X"BB",X"55",X"55",X"E6",X"E6",X"55",X"55",X"BB",X"BB",X"55",X"65",X"C2",X"C2",X"65",X"55",X"BB",
		X"BB",X"65",X"41",X"80",X"80",X"41",X"65",X"BB",X"83",X"01",X"00",X"80",X"80",X"00",X"01",X"83",
		X"3C",X"42",X"91",X"91",X"91",X"91",X"42",X"3C",X"3C",X"42",X"99",X"99",X"99",X"99",X"42",X"3C",
		X"3C",X"42",X"99",X"BD",X"BD",X"99",X"42",X"3C",X"98",X"90",X"D0",X"51",X"70",X"30",X"30",X"10",
		X"18",X"18",X"1C",X"1F",X"1F",X"1C",X"18",X"18",X"10",X"30",X"30",X"70",X"51",X"D0",X"90",X"98",
		X"8F",X"FE",X"FC",X"FC",X"F8",X"F0",X"E0",X"C0",X"87",X"87",X"8F",X"FC",X"FF",X"8C",X"87",X"87",
		X"C0",X"E0",X"F0",X"F8",X"FC",X"FC",X"FE",X"8F",X"E0",X"E0",X"E0",X"E0",X"C0",X"C0",X"C0",X"C0",
		X"BB",X"D6",X"D4",X"E8",X"F8",X"D0",X"F0",X"B0",X"B0",X"F0",X"D0",X"F8",X"E8",X"D4",X"D6",X"BB",
		X"C0",X"C0",X"C0",X"C0",X"E0",X"E0",X"E0",X"E0",X"80",X"84",X"C8",X"F0",X"F0",X"F0",X"C8",X"84",
		X"18",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"18",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"EC",X"EE",X"FF",X"3F",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"E0",X"D0",X"B0",X"74",
		X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"0C",X"0E",X"0F",X"0F",X"0C",X"0F",X"07",X"07",
		X"F0",X"F4",X"EC",X"FE",X"7E",X"1E",X"00",X"00",X"C0",X"C0",X"E0",X"00",X"E0",X"F0",X"C8",X"38",
		X"07",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"03",X"03",X"03",X"07",X"07",
		X"00",X"F0",X"E8",X"D8",X"B0",X"F0",X"70",X"30",X"00",X"30",X"70",X"F0",X"B8",X"D8",X"E8",X"F0",
		X"07",X"07",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"07",
		X"0C",X"18",X"31",X"79",X"01",X"01",X"FF",X"FF",X"00",X"00",X"00",X"78",X"30",X"18",X"0C",X"00",
		X"00",X"F8",X"00",X"00",X"00",X"FC",X"FF",X"FF",X"00",X"FC",X"00",X"00",X"00",X"F8",X"00",X"FC",
		X"DC",X"3E",X"7F",X"FF",X"7F",X"3E",X"DC",X"00",X"00",X"60",X"70",X"00",X"70",X"60",X"00",X"00",
		X"E0",X"78",X"00",X"F8",X"00",X"78",X"E0",X"00",X"0E",X"5E",X"0C",X"58",X"F8",X"F0",X"B0",X"80",
		X"FE",X"F8",X"FC",X"FE",X"7E",X"3C",X"30",X"00",X"6F",X"DF",X"FE",X"FE",X"EE",X"CC",X"00",X"00",
		X"37",X"7F",X"9E",X"78",X"FC",X"FC",X"B8",X"90",X"00",X"00",X"00",X"04",X"26",X"37",X"9F",X"FF",
		X"00",X"00",X"00",X"02",X"04",X"29",X"0D",X"12",X"EF",X"7E",X"FE",X"FC",X"7C",X"30",X"00",X"00",
		X"2E",X"7F",X"EF",X"FE",X"FA",X"78",X"30",X"00",X"02",X"07",X"17",X"3E",X"B8",X"FC",X"EC",X"40",
		X"00",X"18",X"00",X"0C",X"2A",X"9D",X"95",X"EF",X"00",X"00",X"14",X"00",X"28",X"05",X"0F",X"3F",
		X"00",X"00",X"00",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",
		X"00",X"00",X"00",X"1C",X"1C",X"1C",X"00",X"00",X"00",X"00",X"08",X"1C",X"3E",X"1C",X"08",X"00",
		X"00",X"00",X"1C",X"3E",X"3E",X"3E",X"1C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",
		X"FE",X"FC",X"00",X"00",X"F8",X"F8",X"F8",X"F8",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"50",X"50",X"03",X"FC",X"00",X"00",X"00",X"00",X"54",X"54",X"00",X"00",X"FF",
		X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"54",X"54",X"00",X"54",X"54",X"00",X"FF",X"00",X"FF",X"FF",X"FF",X"00",X"00",X"00",
		X"FF",X"00",X"00",X"00",X"2A",X"00",X"00",X"FF",X"04",X"04",X"06",X"06",X"07",X"07",X"FF",X"00",
		X"F0",X"00",X"00",X"30",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"30",X"00",X"00",
		X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"3F",X"00",X"3F",X"00",X"00",X"00",X"01",X"00",X"00",
		X"1F",X"F0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"F0",
		X"7E",X"3F",X"FF",X"7F",X"7C",X"70",X"60",X"00",X"00",X"00",X"60",X"70",X"7C",X"7F",X"FF",X"3F",
		X"00",X"00",X"0E",X"1F",X"1F",X"1F",X"0E",X"00",X"00",X"00",X"0E",X"1F",X"1F",X"1F",X"0E",X"00",
		X"00",X"00",X"0E",X"1F",X"1F",X"1F",X"0E",X"00",X"00",X"00",X"0E",X"1F",X"1F",X"1F",X"0E",X"00",
		X"F7",X"81",X"81",X"82",X"02",X"84",X"A8",X"E0",X"00",X"E0",X"98",X"84",X"02",X"82",X"81",X"81",
		X"77",X"40",X"40",X"20",X"20",X"10",X"0C",X"03",X"00",X"03",X"0C",X"10",X"20",X"20",X"40",X"40",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"00",X"80",X"80",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",X"00",X"80",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"00",X"00",X"00",X"20",X"00",X"00",X"00",X"00",X"20",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"00",
		X"00",X"00",X"00",X"00",X"20",X"00",X"00",X"00",X"00",X"40",X"10",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"10",X"40",X"10",X"00",X"00",X"00",X"10",X"40",X"10",X"00",X"00",
		X"00",X"10",X"40",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"16",X"40",X"16",X"00",X"00",X"00",X"16",X"40",X"16",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"16",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"96",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"00",X"00",X"96",X"40",X"96",X"80",X"AE",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"AE",X"00",X"04",X"00",X"00",X"02",X"00",X"02",X"00",
		X"00",X"00",X"02",X"00",X"02",X"00",X"00",X"04",X"8F",X"80",X"8F",X"20",X"18",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"20",X"19",X"00",X"19",X"03",X"00",X"00",X"0C",X"00",
		X"0C",X"00",X"0C",X"00",X"0C",X"00",X"00",X"03",X"17",X"03",X"17",X"03",X"00",X"00",X"0C",X"00",
		X"00",X"0F",X"20",X"18",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"40",X"1E",
		X"33",X"01",X"33",X"02",X"00",X"00",X"0C",X"00",X"00",X"30",X"00",X"30",X"00",X"30",X"00",X"06",
		X"00",X"1E",X"40",X"30",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"20",X"0F",
		X"33",X"06",X"00",X"30",X"00",X"30",X"00",X"30",X"06",X"00",X"0C",X"00",X"00",X"02",X"33",X"01",
		X"20",X"18",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"40",X"1E",X"00",X"0F",
		X"33",X"02",X"00",X"00",X"0C",X"00",X"06",X"00",X"00",X"30",X"00",X"30",X"00",X"06",X"33",X"01",
		X"40",X"30",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"20",X"0F",X"00",X"1E",
		X"00",X"30",X"00",X"30",X"00",X"30",X"00",X"00",X"0C",X"00",X"00",X"02",X"33",X"01",X"33",X"06",
		X"00",X"30",X"40",X"1E",X"00",X"0F",X"20",X"18",X"00",X"00",X"0C",X"00",X"06",X"00",X"06",X"00",
		X"00",X"30",X"00",X"06",X"33",X"01",X"33",X"02",X"00",X"18",X"20",X"0F",X"00",X"1E",X"40",X"30",
		X"00",X"30",X"00",X"30",X"00",X"00",X"00",X"00",X"00",X"02",X"33",X"01",X"33",X"06",X"00",X"30",
		X"40",X"1E",X"00",X"0F",X"20",X"18",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",
		X"00",X"06",X"33",X"01",X"33",X"02",X"00",X"00",X"00",X"00",X"00",X"30",X"00",X"30",X"00",X"30",
		X"20",X"0F",X"00",X"1E",X"40",X"30",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",
		X"33",X"01",X"33",X"06",X"00",X"30",X"00",X"30",X"06",X"00",X"06",X"00",X"0C",X"00",X"00",X"02",
		X"F0",X"F0",X"E0",X"E0",X"00",X"00",X"18",X"20",X"F0",X"E0",X"F0",X"60",X"60",X"00",X"18",X"20",
		X"BC",X"FC",X"F8",X"F2",X"EC",X"F8",X"F8",X"F0",X"FC",X"FC",X"FC",X"F4",X"FC",X"FC",X"FC",X"F8",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"02",X"16",X"06",X"0E",X"0E",X"1E",X"3C",X"00",X"02",X"03",X"03",X"03",X"03",X"01",X"01",
		X"03",X"07",X"4F",X"2E",X"3E",X"3E",X"7E",X"FE",X"00",X"01",X"03",X"03",X"03",X"03",X"03",X"01",
		X"78",X"7C",X"3C",X"1C",X"1E",X"0E",X"26",X"02",X"00",X"80",X"80",X"E0",X"F0",X"F8",X"F4",X"F8",
		X"FE",X"FE",X"73",X"7E",X"7E",X"AF",X"0F",X"06",X"00",X"80",X"E4",X"E0",X"F8",X"FC",X"FC",X"F8",
		X"02",X"07",X"07",X"07",X"03",X"03",X"01",X"00",X"02",X"03",X"07",X"07",X"07",X"07",X"07",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0C",X"00",X"0C",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"06",X"00",X"06",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"06",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"06",X"00",X"06",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"00",X"30",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"06",X"00",X"06",X"00",X"0C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0C",X"00",X"06",X"00",X"06",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
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
