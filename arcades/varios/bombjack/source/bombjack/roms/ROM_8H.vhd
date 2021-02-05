-- generated with romgen v3.03 by MikeJ
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity ROM_8H is
port (
	CLK  : in  std_logic;
	ENA  : in  std_logic;
	ADDR : in  std_logic_vector(11 downto 0);
	DATA : out std_logic_vector(7 downto 0)
	);
end;

architecture RTL of ROM_8H is

	signal rom_addr : std_logic_vector(11 downto 0);

begin

	p_addr : process(ADDR)
	begin
		rom_addr <= (others => '0');
		rom_addr(11 downto 0) <= ADDR;
	end process;

	ROM_8H_0 : RAMB16_S4
	generic map (
		INIT_00 => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_01 => x"0CEE20020008F33F002EEE0033F80000FFFFFFFFFFFFFFFF0000000000000000",
		INIT_02 => x"FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF0000FFFF003300000000",
		INIT_03 => x"3300FFFF000000000000FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF",
		INIT_04 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_05 => x"000000000660000000000000000000000000000000000000026C800000008C62",
		INIT_06 => x"000EE0000CE222EC046222EC08888EE8046222EC06EEAA22022EE22008C622C8",
		INIT_07 => x"00AA00000EE0000000000000EE00AAEE0C2EAA2C0C2AAA2C002226C80CE222EC",
		INIT_08 => x"08C622EE0EE000000EE222200EE226C808C622640EE222EC0EE888EE00000000",
		INIT_09 => x"0CE222EC0EE08CEE0EE080EE0EE222200EE8CE62046222EC022EE2200EE000EE",
		INIT_0A => x"0CEC8CEC008CEC800CE222EC000EE000046222EC0EE8CE620CE2AECA0EE88880",
		INIT_0B => x"F1111111F00000001111111F0000000F0000000006EEA222000EE00006EC8CE6",
		INIT_0C => x"FFF00FF0FFF00FF0EFF00FF0FFF00FF066666666666666666666666666666666",
		INIT_0D => x"666666667770077667700FF0FFF0077666666EE0FEE6666667700FF0FFF00776",
		INIT_0E => x"FFF00FF0FFF00FF0EFF00FF0FFF00FF066666666666666666666666666666666",
		INIT_0F => x"666666667770077667700FF0FFF0077666666EE0FEE6666667700FF0FFF00776",
		INIT_10 => x"00000000000003770000000060000000000000000000034B0000000077200000",
		INIT_11 => x"008C63337F8000003336C800000008F7000008CC0037C800CC800000008C7300",
		INIT_12 => x"00000033000001187FEEC0004C01100000000E000000870800E0000000700400",
		INIT_13 => x"0000000000000000000000000000000000000033000801987FEEC00080431400",
		INIT_14 => x"FFF00FF0FFF00FF0EFF00FF0FFF00FF066666666666666666666666666666666",
		INIT_15 => x"666666667770077667700FF0FFF0077666666EE0FEE6666667700FF0FFF00776",
		INIT_16 => x"FFF00FF0FFF00FF0EFF00FF0FFF00FF066666666666666666666666666666666",
		INIT_17 => x"666666667770077667700FF0FFF0077666666EE0FEE6666667700FF0FFF00776",
		INIT_18 => x"33333333000000003333FFFF0000FFFFFFFF3333FFFF00003333333300000000",
		INIT_19 => x"33333333000000003333FFFF0000FFFF33333333000000003333FFFF0000FFFF",
		INIT_1A => x"33333333000000003333FFFF0000FFFF33333333000000003333FFFF0000FFFF",
		INIT_1B => x"0000000000000000000000000000000000000000FFFFFFFFFFFFFF00FFFF0000",
		INIT_1C => x"00000000FFFFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFF00FFFF0000FF000000",
		INIT_1D => x"FFFFFFFF00FFFFFF0000FFFF000000FF00000000000000000000000000000000",
		INIT_1E => x"8800000088888888000000080FF00F00000F00FF673843006666666600034837",
		INIT_1F => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_20 => x"000000000000000009B8800000088CF008F30000C8000000000002EC00000000",
		INIT_21 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_22 => x"FFFF0000FFFF0000FFFF00FFFFFF00FF33333333000000003333333300000000",
		INIT_23 => x"FF00FFFFFF00FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_24 => x"99999111FFFFFFFF11111111FFFFFFFF0C623199F00FFFFF99999999FFFFFFFF",
		INIT_25 => x"9999999900000011999999993377FFFF11111111FEEECC881111119980000000",
		INIT_26 => x"99991111C800017F11111111FE80003F99999111FFFFFFFF11119999FFE408CE",
		INIT_27 => x"9111119908EFFF70999999990008888F11111111F000FFE09999999900000100",
		INIT_28 => x"11111999CEFFFFEC1111111100FFFFF099911111FFFF7310111111110000088C",
		INIT_29 => x"1111111100000000111326C00000000F19999999001311009111111100000000",
		INIT_2A => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_2B => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_2C => x"FFF00FF0FFF00FF0EFF00FF0FFF00FF066666666666666666666666666666666",
		INIT_2D => x"666666667770077667700FF0FFF0077666666EE0FEE6666667700FF0FFF00776",
		INIT_2E => x"FFF00FF0FFF00FF0EFF00FF0FFF00FF066666666666666666666666666666666",
		INIT_2F => x"666666667770077667700FF0FFF0077666666EE0FEE6666667700FF0FFF00776",
		INIT_30 => x"00000000000037FE00000000EF73000000000000005773770000000073777300",
		INIT_31 => x"008C63337F8000003336C800000008F7000008CC0037C800CC800000008C7300",
		INIT_32 => x"00004A4A00EFFDEF04EEE000FFEFFF0000004A4A00EFFDEF0CEEA000FFEFFF00",
		INIT_33 => x"00004A4A00EFFDEF04EEE000FFEFFF0000004A4A00EFFDEF008CE000FFEFFF00",
		INIT_34 => x"F1111F1FF1F33F1FF1333F1FF1D5F51F3333333333333333333333FF01333333",
		INIT_35 => x"F1F1111FF1F3331FF1F33F1FF1F3371FF1F33F1FF1F11F1FF1333F1FF1F33F1F",
		INIT_36 => x"0EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE0",
		INIT_37 => x"0EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE0",
		INIT_38 => x"0000000600000019ECC800000001000000000E000000070800E0000000700000",
		INIT_39 => x"00000033000001187FEEC0004403100000000033000001107FEEC00080031000",
		INIT_3A => x"000000000000000C0000000000000000000000C000000070E0E0C00070707000",
		INIT_3B => x"000000000000000C0000000000000000000000000000000C0000000000000000",
		INIT_3C => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3D => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3F => x"0000000000000000000000000000000000000000000000000000000000000000"
	)
	port map (
		DO   => DATA(3 downto 0),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "0000",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

	ROM_8H_1 : RAMB16_S4
	generic map (
		INIT_00 => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_01 => x"00011999007336EF99110000E6337000FFFFFFFFFFFFFFFF0000000000000000",
		INIT_02 => x"FFFF0000FFFF000000000000FFFF00CCFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_03 => x"FFFFFFFFFFFFFFFF0000FFFFFFFFFFFF00000000CC00FFFF0000FFFF0000FFFF",
		INIT_04 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_05 => x"00000000000000000111111000000000000000000000000008C73000000037C8",
		INIT_06 => x"0CC89BEC037D99900EEAAAB90136CFF00089BFD804C99BF6004FF00003788C73",
		INIT_07 => x"00FFF00007755702000CE00077203322078BAB87078BAA8706F999F706F999F6",
		INIT_08 => x"037C89990FF999980FF999800FF88C73037C88C40FF999F6037C8C7300000000",
		INIT_09 => x"07F888F70FF731FF0FF737FF0FF000000FF136C8000000FF088FF8800FF111FF",
		INIT_0A => x"0FF131FF0FF101FF0FF000FF088FF88006F999D40FF889F707F888F70FF88887",
		INIT_0B => x"F0000000F88888880000000F8888888F000000000889BFEC0CF11FC00CE737EC",
		INIT_0C => x"FFF00FF0FFF00FF0FFF00FF07FF00FF0EEEEEEEEEEEEEEEEEEEEEEE66EEEEEEE",
		INIT_0D => x"EEE00EE6EEEEEEEEEEE00FF0FFF00EEEEEE00FF0FFF00EE6EEEEEFF8FFFEEEEE",
		INIT_0E => x"FFF00FF0FFF00FF0FFF00FF07FF00FF0EEEEEEEEEEEEEEEEEEEEEEE66EEEEEEE",
		INIT_0F => x"EEE00EE6EEEEEEEEEEE00FF0FFF00EEEEEE00FF0FFF00EE6EEEEEFF8FFFEEEEE",
		INIT_10 => x"0000088000000000000000000000000000002C2E00000000EC00000000000000",
		INIT_11 => x"EF10000000136CCC000001FECCC6310000CE3100000001330013EC0033100000",
		INIT_12 => x"0000E8000000200A003FF7005A00200000000F000028207700F0000043A00202",
		INIT_13 => x"000000000000000000000000000000000000E800004005A5003FF70031282102",
		INIT_14 => x"FFF00FF0FFF00FF0FFF00FF07FF00FF0EEEEEEEEEEEEEEEEEEEEEEE66EEEEEEE",
		INIT_15 => x"EEE00EE6EEEEEEEEEEE00FF0FFF00EEEEEE00FF0FFF00EE6EEEEEFF8FFFEEEEE",
		INIT_16 => x"FFF00FF0FFF00FF0FFF00FF07FF00FF0EEEEEEEEEEEEEEEEEEEEEEE66EEEEEEE",
		INIT_17 => x"EEE00EE6EEEEEEEEEEE00FF0FFF00EEEEEE00FF0FFF00EE6EEEEEFF8FFFEEEEE",
		INIT_18 => x"00000000CCCCCCCC0000FFFFCCCCFFFFFFFF0000FFFFCCCC00000000CCCCCCCC",
		INIT_19 => x"00000000CCCCCCCC0000FFFFCCCCFFFF00000000CCCCCCCC0000FFFFCCCCFFFF",
		INIT_1A => x"00000000CCCCCCCC0000FFFFCCCCFFFF00000000CCCCCCCC0000FFFFCCCCFFFF",
		INIT_1B => x"0000000000000000000000000000000000000000FFFFFFFFFFFFFF00FFFF0000",
		INIT_1C => x"00000000FFFFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFF00FFFF0000FF000000",
		INIT_1D => x"FFFFFFFF00FFFFFF0000FFFF000000FF00000000000000000000000000000000",
		INIT_1E => x"CC924800CCCCCCCC0008429C0FF00F00000F00FF221000002222222200000012",
		INIT_1F => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_20 => x"000000000000000000137FFE441373000F33332213300000C000000100000000",
		INIT_21 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_22 => x"FFFF0000FFFF0000FFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_23 => x"FF00FFFFFF00FFFF0000FFFF0000FFFF00000000CCCCCCCC00000000CCCCCCCC",
		INIT_24 => x"FFFFFFFEFFFFFFFFEECC8880FFFFFFFFF10CEFFFF00FFFFFFFFFFFFFFFFFFFFF",
		INIT_25 => x"11377FFF88800000FFFFFFFF0000001100000000FFFFFFFF00000000FFFEEECC",
		INIT_26 => x"3100CCEE7FFE8000800006EE37720001FFFFFFEC377FFFFF80001377F7000013",
		INIT_27 => x"000888806FFF3108003FFF3BCEF3FFF7E00080007000FFF01373B88008E00000",
		INIT_28 => x"00000001137FF7304CCCCC0003111000888888883100008C00000000CEEFFF30",
		INIT_29 => x"00000000000088880000001FCCCCE00F01FFFF7100000000D444000000000000",
		INIT_2A => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_2B => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_2C => x"FFF00FF0FFF00FF0FFF00FF07FF00FF0EEEEEEEEEEEEEEEEEEEEEEE66EEEEEEE",
		INIT_2D => x"EEE00EE6EEEEEEEEEEE00FF0FFF00EEEEEE00FF0FFF00EE6EEEEEFF8FFFEEEEE",
		INIT_2E => x"FFF00FF0FFF00FF0FFF00FF07FF00FF0EEEEEEEEEEEEEEEEEEEEEEE66EEEEEEE",
		INIT_2F => x"EEE00EE6EEEEEEEEEEE00FF0FFF00EEEEEE00FF0FFF00EE6EEEEEFF8FFFEEEEE",
		INIT_30 => x"0000CEF7000000007FEC00000000000000CEEACE00000000EECEEE0000000000",
		INIT_31 => x"EF10000000136CCC000001FECCC6310000CE3100000001330013EC0033100000",
		INIT_32 => x"0000101000233133057730003133310000001010002331330577300031333100",
		INIT_33 => x"0000101000233133077720003133310000001010002331330737300031333100",
		INIT_34 => x"F8CCCF8FF8FDDD8FF8FDDD8FF8F8988F00000000000000000000003700000000",
		INIT_35 => x"F8FDDC8FF8FDDC8FF8999F8FF8FCCE8FF8F9998FF8FDDF8FF8FDDF8FF8FDDF8F",
		INIT_36 => x"0777777007777770077777700777777007777770077777700777777007777770",
		INIT_37 => x"0777777007777770077777700777777007777770077777700777777007777770",
		INIT_38 => x"00000C8000000002037F60005000000000000F000000000700F0000000000000",
		INIT_39 => x"0000E80000000000003FF700960000000000E80000000001003FF70020000000",
		INIT_3A => x"00000480000000000000000012000000000000F500000000F5F5F00000000000",
		INIT_3B => x"0000048000000000000000001200000000000480000000000000000012000000",
		INIT_3C => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3D => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3F => x"0000000000000000000000000000000000000000000000000000000000000000"
	)
	port map (
		DO   => DATA(7 downto 4),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "0000",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

end RTL;