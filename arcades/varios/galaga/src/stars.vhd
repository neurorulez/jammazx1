---------------------------------------------------------------------------------
-- Galaga stars sets generator by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
--
-- Done from only available MAME information
--
-- star set data description
--
--  |    8 bits    |    8 bits           |
--  |------------------------------------| 
--	|    0x80      | scan line number    |  0x80 id for line number
--  | star 1 color | star 1 position     |  star color alway < 0x40
--  | star 2 color | star 2 position     |
--	|    0x80      | scan line number    |
--  | star 1 color | star 1 position     |
--	|    0x80      | scan line number    |
--  | star 1 color | star 1 position     |  from 1 up to 3 stars for 
--  | star 2 color | star 2 position     |  the given scan lien number
--  | star 3 color | star 3 position     |
--                ...
--	|    0xC0      | N.U.                |  end of list
--
--  Scan line number are 1 less than MAME list because of way of realisation
--  Scan line number are ordered from lower to higher.
--  There are 4 sets of 63 stars max. There can be up to 3 stars max for a given scan line.  


library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity stars is
port (
--	clk  : in  std_logic;
	addr_set0 : in  std_logic_vector( 6 downto 0);
	data_set0 : out std_logic_vector(15 downto 0);
	addr_set1 : in  std_logic_vector( 6 downto 0);
	data_set1 : out std_logic_vector(15 downto 0);
	addr_set2 : in  std_logic_vector( 6 downto 0);
	data_set2 : out std_logic_vector(15 downto 0);
	addr_set3 : in  std_logic_vector( 6 downto 0);
	data_set3 : out std_logic_vector(15 downto 0)
);
end entity;

architecture stars_table of stars is

type table0 is array(0 to  119) of std_logic_vector(15 downto 0);
signal data0 : table0 := (
X"8006",  -- line 0x06 
X"3584",  -- one star at 0x84, color is 0x35
X"8008",  -- line 0x08
X"308E",  -- one star at 0x8E, color is 0x30
X"801B",  -- ...
X"07E4",
X"801C",
X"3121",
X"8025",
X"1DE4",
X"8026",
X"2914",
X"802D",
X"3B7F",
X"802E",
X"1C96",
X"803B",
X"05B9",
X"803D",
X"3635",
X"8044", -- line 0x44  
X"0956", -- fist   star at 0x56, color is 0x09
X"3DCE", -- second star at 0xCE, color is 0x3D
X"804E",
X"2760",
X"8064",
X"1A86",
X"17D5",
X"806C",
X"3C0A",
X"806D",
X"2405",
X"806E",
X"3A17",
X"8079",
X"23A8",
X"807B",
X"1189",
X"8080",
X"0CD5",
X"8082",
X"3F66",
X"8083",
X"3838",
X"1471",
X"8084",
X"16EB",
X"8085",
X"108D",
X"8088",
X"251F",
X"808A",
X"0F94",
X"808D",
X"000D",
X"8091",
X"2E05",
X"8094",
X"0D06",
X"8097",
X"0BAD",
X"8098",
X"2DFF",
X"809B",
X"0185",
X"80A1",
X"3457",
X"3EFD",
X"80A8",
X"1FA1",
X"80AA",
X"0A40",
X"80AC",
X"323E",
X"03DD",
X"80B9",
X"26D3",
X"80BB",
X"1B6C",
X"80BD",
X"3961",
X"80BE",
X"18C8",
X"80C1",
X"046B",
X"80C3",
X"2158",
X"80CC",
X"0E5F",
X"1290",
X"80CF",
X"063E",
X"22F6",
X"80D0",
X"3343",
X"80D2",
X"0833",
X"80D9",
X"20D2",
X"80DD",
X"3770",
X"80E1",
X"2C72",
X"80E3",
X"2FB8",
X"80E4",
X"13A8",
X"80E7",
X"19D2",
X"80ED",
X"0236",
X"80F4",
X"15BC",
X"80F6",
X"280E",
X"80F7",
X"2B4E",
X"80FF",
X"2AFA",
X"C000");

type table1 is array(0 to  118) of std_logic_vector(15 downto 0);
signal data1 : table1 := (
X"8004",
X"3DFD",
X"8006",
X"10C3",
X"8007",
X"2D1D",
X"800B",
X"1F82",
X"800D",
X"3C2D",
X"800E",
X"001E",
X"2CD7",
X"800F",
X"1702",
X"8011",
X"3F94",
X"8017",
X"3569",
X"02CB",
X"8018",
X"32FF",
X"801D",
X"3691",
X"8021",
X"04E2",
X"802D",
X"372E",
X"802F",
X"0CEF",
X"803E",
X"069A",
X"804C",
X"07A3",
X"804D",
X"13E9",
X"804E",
X"2183",
X"8052",
X"0F32",
X"8053",
X"0E6F",
X"8059",
X"0805",
X"8060",
X"2880",
X"8061",
X"2936",
X"8067",
X"2F8E",
X"806A",
X"1D1A",
X"807C",
X"12BE",
X"807F",
X"3150",
X"8086",
X"2560",
X"808F",
X"0D69",
X"8091",
X"1969",
X"8092",
X"058F",
X"8096",
X"243A",
X"8097",
X"0A8B",
X"8099",
X"0305",
X"3837",
X"18A7",
X"80A6",
X"2075",
X"1CAC",
X"1EEB",
X"80AC",
X"1585",
X"80AF",
X"3E77",
X"80B3",
X"097A",
X"80B8",
X"3926",
X"80C2",
X"2387",
X"80C3",
X"3A43",
X"80C5",
X"34CE",
X"80C9",
X"3034",
X"80D1",
X"3B6D",
X"80D7",
X"16D5",
X"80D9",
X"2B39",
X"80E0",
X"11AA",
X"80E2",
X"1BDF",
X"80E6",
X"0B6E",
X"80E8",
X"14B7",
X"1AD8",
X"22F8",
X"80F1",
X"2E03",
X"80F8",
X"2648",
X"80F9",
X"010F",
X"80FB",
X"3338",
X"80FC",
X"2727",
X"C000");

type table2 is array(0 to  122) of std_logic_vector(15 downto 0);
signal data2 : table2 := (
X"8006",
X"19F9",
X"8007",
X"2DE3",
X"800A",
X"0371",
X"801B",
X"0083",
X"801D",
X"29B9",
X"8022",
X"04E2",
X"8026",
X"2AD0",
X"8032",
X"3088",
X"8036",
X"275A",
X"803A",
X"3683",
X"803F",
X"0D52",
X"8040",
X"1D07",
X"1A54",
X"8041",
X"31A9",
X"2BFA",
X"8046",
X"16BB",
X"8052",
X"3992",
X"8057",
X"10B8",
X"8059",
X"2853",
X"805A",
X"01E5",
X"805D",
X"1BA6",
X"805E",
X"352C",
X"8062",
X"2113",
X"806D",
X"1F68",
X"806F",
X"0BCD",
X"8075",
X"2FDE",
X"8077",
X"12CA",
X"807C",
X"234D",
X"8084",
X"0F49",
X"8086",
X"2511",
X"808C",
X"3267",
X"8095",
X"2002",
X"809C",
X"1709",
X"80A3",
X"085A",
X"80A4",
X"3E5E",
X"2E71",
X"80A6",
X"06CB",
X"80AB",
X"0C89",
X"80AD",
X"26DF",
X"80AF",
X"0AF2",
X"80B4",
X"1374",
X"80B7",
X"1167",
X"80C2",
X"2C6C",
X"80C3",
X"1475",
X"80C4",
X"1ECE",
X"80C5",
X"1C03",
X"80C6",
X"3F12",
X"80C7",
X"3CB8",
X"80D7",
X"3404",
X"3A94",
X"80D8",
X"02FB",
X"80DC",
X"09E6",
X"80E1",
X"051C",
X"80E6",
X"3304",
X"80E9",
X"3B1B",
X"80ED",
X"37A1",
X"80EE",
X"0727",
X"80EF",
X"18DC",
X"80F0",
X"386C",
X"80F2",
X"0EA0",
X"80F7",
X"3D73",
X"80F9",
X"2268",
X"80FF",
X"243E",
X"C000");

type table3 is array(0 to  122) of std_logic_vector(15 downto 0);
signal data3 : table3 := (
X"8010",
X"3470",
X"8011",
X"23AE",
X"8014",
X"269F",
X"8017",
X"0201",
X"8019",
X"314A",
X"801C",
X"0E92",
X"801E",
X"251A",
X"8020",
X"2E31",
X"3AED",
X"8022",
X"2F78",
X"8023",
X"176B",
X"8025",
X"11BB",
X"8029",
X"3040",
X"802E",
X"321B",
X"8031",
X"01B8",
X"8032",
X"0582",
X"803A",
X"1294",
X"803F",
X"070C",
X"8041",
X"331F",
X"8045",
X"2C91",
X"8047",
X"08D3",
X"804B",
X"2DA0",
X"3BD1",
X"8052",
X"24D5",
X"805F",
X"1C99",
X"8060",
X"3D15",
X"8063",
X"1F19",
X"8066",
X"28CC",
X"8067",
X"10FE",
X"8069",
X"2034",
X"806C",
X"048E",
X"2AC9",
X"8074",
X"0959",
X"8078",
X"385F",
X"8079",
X"1E71",
X"807F",
X"2936",
X"8080",
X"1411",
X"8082",
X"2B28",
X"8098",
X"3683",
X"8099",
X"3731",
X"80A0",
X"19BA",
X"80A3",
X"3E3D",
X"80A6",
X"1A49",
X"80A7",
X"2128",
X"80B7",
X"229C",
X"80B9",
X"156B",
X"80C0",
X"0A0B",
X"80C3",
X"0FC1",
X"80C9",
X"0D2E",
X"80CE",
X"16D1",
X"0BF2",
X"80CF",
X"2774",
X"80D5",
X"3519",
X"80D6",
X"3925",
X"80DA",
X"3C7F",
X"80DD",
X"00A8",
X"80EB",
X"03BB",
X"80EF",
X"1B31",
X"80F0",
X"3F66",
X"80F1",
X"18EE",
X"80F3",
X"0CA7",
X"80F9",
X"1DDD",
X"80FA",
X"132B",
X"C000");

begin
--process(clk)
--begin
--	if rising_edge(clk) then
		data_set0 <= data0(to_integer(unsigned(addr_set0)));
		data_set1 <= data1(to_integer(unsigned(addr_set1)));
		data_set2 <= data2(to_integer(unsigned(addr_set2)));
		data_set3 <= data3(to_integer(unsigned(addr_set3)));
--	end if;
--end process;
end architecture;

