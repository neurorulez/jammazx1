-- generated with romgen v3.03 by MikeJ
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity ROM_8L is
port (
	CLK  : in  std_logic;
	ENA  : in  std_logic;
	ADDR : in  std_logic_vector(12 downto 0);
	DATA : out std_logic_vector(7 downto 0)
	);
end;

architecture RTL of ROM_8L is

	signal rom_addr : std_logic_vector(12 downto 0);

begin

	p_addr : process(ADDR)
	begin
		rom_addr <= (others => '0');
		rom_addr(12 downto 0) <= ADDR;
	end process;

	ROM_8L_0 : RAMB16_S2
	generic map (
		INIT_00 => x"1FBE0EE9FBF8EFEB3BFA1AFBFEA79FBF00000000000000000000000000000000",
		INIT_01 => x"C5BC000013250000FFFF05FAFFFFA80076FE0040F7AF00007835000006440000",
		INIT_02 => x"FEEBAEFAFE2E6FEBBBFADAFBFEA79FBFD94203DFFFF3E390FD398FDF67FF9002",
		INIT_03 => x"3C0F3C0F03C003C00F03FFFFC0F0FFFC0000AA0000000000FCFD000044500277",
		INIT_04 => x"03C03FC0F03CF03C028FFFFFF03CFFFF0000AAAA0000AAAA0F030F03C0F0C0F0",
		INIT_05 => x"F03CF03C0F030F03F03CFFFF0F03FFFFC0F0C0F03C0F3C00C000FFFF0A00FFFF",
		INIT_06 => x"0FF00FF00FF00FF00FF0FFFF0FF0FFFFFFFF0000540000003C0FFFFF03C0FFFF",
		INIT_07 => x"FFFF0000FFFF057F0FF00FF00FF00FF00FF0FFFF0FF0FFFFFFFF0000FFFF0000",
		INIT_08 => x"00000000000000FF0FF00FF00FF00FF00FF0FFFF0FF0FFFF0A9F0000FFFF0000",
		INIT_09 => x"F08004C902130187A4892048C89B04510000FFFF0000FFFF0000FFFF0000FFFF",
		INIT_0A => x"2000100140002404DB084021E828008880000488000080270601001402831063",
		INIT_0B => x"001012108019800092802000D2088000008019C82208100040830508C04200E0",
		INIT_0C => x"58108802008103000521042004210001860E70D91DE49400E820000002403000",
		INIT_0D => x"5220400A040801800480002041020002C20BF4D96008E3C86448006002004820",
		INIT_0E => x"90A6440812080A1201000200484900000830BF1FB4B0BD1C21440C0068208408",
		INIT_0F => x"240820002020210014200800408008002600A510B20125045608240010204049",
		INIT_10 => x"FEEBAEFAFEEE6FEBBBFADAFBFEA79FBFBC2C50070B0B87C281A220210C238012",
		INIT_11 => x"E26CD2DBBA602F0FB2B8783262C93DB33BFA3AFBFEA79FBFAFBEAEE9FBF8EFEB",
		INIT_12 => x"0000248C00003280B0024C280009F6F1B2B8783262D93DB3E221F6D8BA62474B",
		INIT_13 => x"000000000000000000000000000000000000000000000000000009850000C200",
		INIT_14 => x"0000000000000000542A000081500000FFFFFFFFFFFFFFFF0000000000000000",
		INIT_15 => x"F878F878787F787F78780000787F787FF0C3F0C30C300C30F0C3F0C30C300C30",
		INIT_16 => x"000A000AAAAAAAAA000A000AAAAAAAAAC0C0C0C0C0C0C0C0C0C0C0C0C0FFC0FF",
		INIT_17 => x"0317001555D355500000000000000000324C0000FFFFFFFF5555AAAA557FAABF",
		INIT_18 => x"000000AB0000AAAA0000AEA00000FFF00030000000000000FD55FEAA5555AAAA",
		INIT_19 => x"4000000000030003C000C00000030003C000C000000300030000000000300000",
		INIT_1A => x"00C0FFFF00C0FFFF00C0FFFF00030003FFFFFFFF00030003C000C00000030003",
		INIT_1B => x"00000000000000000000000000000000FFFF71D8FFFF002FFFFFFFFFFFFFFFFF",
		INIT_1C => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_1D => x"0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_1E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_1F => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_20 => x"000000000000000055400000000000000000202000000808FFFF000BFFFFD2BF",
		INIT_21 => x"A800000C00000000FFF8FEE02A1F3FFAAAEAF4FFAA00FF00FEEA800000000000",
		INIT_22 => x"FE08FFFFAAAAFFEF447F0000FFFF12AA00000000000000000000000001550000",
		INIT_23 => x"FFE2000E400A0000FFFF57FD0FFF4000FD00000000000000A02FC3FFFFFFFFCF",
		INIT_24 => x"155587FD07FA601FFFFFFFD4FFFD000000000000000000000000550000000000",
		INIT_25 => x"500000020000FEA5FFFFA77FBABFFE8603FF0000FFFF000055FF000000000000",
		INIT_26 => x"FFFFFFFEFF6A80000000FFFF0000F1EAFFF1FD5F5FFFFFFFFFFF00FFFFFDFF00",
		INIT_27 => x"99A3A640800700BDD555038055550000001F000000051C1E00000000001E0000",
		INIT_28 => x"FFFDFF75FDFF682BFFC0AEAF0000FFFFABFFFE18FFFF06E8D2BF97E17D7D7FFF",
		INIT_29 => x"F9FFC0074200FFFFFF81F7FFFFEEFD5F404220407FFF1041A42211D4B2A00000",
		INIT_2A => x"F02AD7FF07D0FFFD44108084911803A65808955048600000FFFFFFFFFFFFFFFF",
		INIT_2B => x"FA84802ABFFF1755575165554755595545D1E84055500000557FFFFCFFCFFE3A",
		INIT_2C => x"559517FFA456FFFFAA87FFF4FFF40000FFFFFFFFFFFFFFFFFF5500007FDD5FFF",
		INIT_2D => x"F55AFFABF5FFF57F7D560000B5740000FF3FFFFFFFFFFF0FAE0480A0811FA8B6",
		INIT_2E => x"2055551016557FAB07FF0000FAFF1FFFFFFFFFFFFFFFFFFF5441D9FE4D95BF55",
		INIT_2F => x"8080122A10C199A800010000A100000080465155FFFD5E55001D000045710074",
		INIT_30 => x"5F00F000000000004000000000000000AA210000AAFF0015A87EFFD5EEEA0035",
		INIT_31 => x"FFFFFFF0C3FC2FFCAA90FFF103C00000FBC0FFE40000000055C0FF0000000000",
		INIT_32 => x"FF00FFEC00000000D7FFFFFFF4F8F280FFFFFFFEC0FC03FCFC0FFC0F03FC03FC",
		INIT_33 => x"0000BFFD000F803FD00000030015FFFF0000000000051FFF0000000000FF000C",
		INIT_34 => x"2A83ABFFFFFFC003ABFFF555C00340030F000006FFFF000F0000C0002C2AEFFF",
		INIT_35 => x"3FF8000FFFFFD0000000880000000000FFFFF3FFFFFFFFFCF00C400CECED0000",
		INIT_36 => x"FFFB5D7FFAAAD500FD000000000000000000003C000030C3000087F800000000",
		INIT_37 => x"0000AAAA0000AAAAFFFFFF55FFFF557FFF00E444003F444E0000C57E00002F54",
		INIT_38 => x"FD0303F333FC3BFC03F303FC3FFC3FFF3FC20300BFFA3FC00000000003000000",
		INIT_39 => x"D2CEC000CC070C0003FFFFFFFCAAFFFF3C00BC00000301C0D2FFFFFD69C0002C",
		INIT_3A => x"0000000081EB000700000000007F000000000000000000020000000007FF1FFF",
		INIT_3B => x"000000000000000000000000000B1BFF003F00007FFFFFDB00000000FC00FE82",
		INIT_3C => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3D => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3F => x"0000000000000000000000000000000000000000000000000000000000000000"
	)
	port map (
		DO   => DATA(1 downto 0),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

	ROM_8L_1 : RAMB16_S2
	generic map (
		INIT_00 => x"03FE0FBBBFBBAFBA3FEE2BB3CEAFEBEE00000000000000000000000000000000",
		INIT_01 => x"0110000000700000FFFF2A05FFFFFFFA2DFA0000C7E60000D410400005000000",
		INIT_02 => x"BBFBFBCFBEAEAEEFAFEEEBB3CEAFEBEEFB2B783DFE06BF91527EC3FD0BFF80BB",
		INIT_03 => x"3C0F3C0F03C003C00F03FFFFC0F0FFFD000055000000000010000000000BB5DD",
		INIT_04 => x"0BC03FC0F03CF03C03FFFFFFF03CFFFF00005555000055550F030F03C0F0C0F0",
		INIT_05 => x"F03CF03C0F030F03F03CFFFF0F03FFFFC0F0C0F03C0F1400C000FFFF0FE0FFFF",
		INIT_06 => x"0FF00FF00FF00FF00FF0FFFF0FF0FFFFF5400000000000003C0FFFFF03C0FFFF",
		INIT_07 => x"5BFF0000FFFF00000FF00FF00FF00FF00FF0FFFF0FF0FFFFDFFF0000FFFF0000",
		INIT_08 => x"000000000000007F0FF00FF00FF00FF00FF0FFFF0FF0FFFF0050000055570000",
		INIT_09 => x"350B81703077008360214080346380110000FFFF0000FFFF0000FFFF0000FFF5",
		INIT_0A => x"6710220947058E22A008000823A00180081408210846834B0600042110071823",
		INIT_0B => x"5171260A14461A194204008020100102880802500000210101001048E2048030",
		INIT_0C => x"0432200014119800110A010010418100DBE30560EAA42248044081904002060C",
		INIT_0D => x"261480429112040510204000100000006F2D1D0CDB3C3419200188118040A008",
		INIT_0E => x"118090C0491102088044008021002000879841C1EF6BAC41401011C005B00240",
		INIT_0F => x"002000020400002142000001080100002E410008C36902008212800108100001",
		INIT_10 => x"BBFBFBCFBEAEAEEFAEFEEBB3DFAFEBEEDADA0400E6BF41019100400482400002",
		INIT_11 => x"57EDDF8FE4FBE724E5EE9E79FBF7E76F2FEE2BB3CEAFEBEEAEFEEFBFBFBBAFBA",
		INIT_12 => x"000001240000180073009F36A397E766E5EE9E79FBF7E76456C9978E648771E7",
		INIT_13 => x"0FD00FD00FD00FD0000000000000000000000000000000000000212400001000",
		INIT_14 => x"0000000000000000AA800000A8550000FFFFFFFFFFFFFFFF0000000000000000",
		INIT_15 => x"C787C787878F878F07870000878F078FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_16 => x"000A000AAAAAAAAA000A000AAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCF",
		INIT_17 => x"0317001555D755500000000000000000360D0000FFFFFFFFAAAA0000AABF003F",
		INIT_18 => x"005500FF5555FFFF5555FFF05554FFF05555555555545554FEAAFC00AAAA0000",
		INIT_19 => x"0000000000030003C000C00000030003C000C000000300030055005555555555",
		INIT_1A => x"AAEA0303AAEA0303AAEA0300000300030300030000030003C000C00000030003",
		INIT_1B => x"00000000000000000000000000000000FFFFA000FFFF02FF0303030303030303",
		INIT_1C => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_1D => x"0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_1E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_1F => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_20 => x"000000000000000000000000000000000000F7FD0000BFFB7FFF486FFFFF2FFF",
		INIT_21 => x"5000001000000000FFFCFFFCFFE1FFF5FFFFD01FFFC0D400FFFFA000FD000000",
		INIT_22 => x"FFFFA229FFFFFFFF000F0000FFFF007F00000000000000000000000000000000",
		INIT_23 => x"FFFC002F001FF801FFFF000033FE0000D0000000000000007C3F03FFB5DFFFFF",
		INIT_24 => x"E800FC1F00FFF80F7FFFF400FFF000000000000000000000FAAAFFA00000B800",
		INIT_25 => x"0002000B00AAFFFFEFFF57EBFFF5D7E083FF0000FFAF0000BF00000000000002",
		INIT_26 => x"FFEDFFF4EE6D0000000AFFFF282FF805FC40F43F015FFFFFF1FF00FFFFFCFD00",
		INIT_27 => x"B9A78C00000B02FE300000C00000000000070000800007010000000000010000",
		INIT_28 => x"F7FFD2AAFFDFFFFD8502FCFFB860FFFF7FFFA090FFFF5DFFFFEF3678FBFB07FF",
		INIT_29 => x"161CC0682FEA55FFFD407EA114B53FEA9654419507FF07518848120084000000",
		INIT_2A => x"FFFF3081AB955044105C951119104604515D554045000000FFFFFFFFFFFFFFFF",
		INIT_2B => x"55F90850FFFF2083D5515175D555155C505CFF4074000000BDDFFFFFDFE0FFBF",
		INIT_2C => x"07D9FFFFE5B5FFFFABFAAF40FF400000FFFFFFFFFFFFFFFFFFB0C1000D010000",
		INIT_2D => x"FFFFBABAFF5DABEA07F70000D7400000FFCFFFFFFFFFFF0F0100080804850102",
		INIT_2E => x"51680845052A57D5007F0000FFAF01FEFFFFFFFFFFFFFFFF0DFABFBF0181D2BF",
		INIT_2F => x"6A080482AEA80A210000000019A600002A5D35515611555C00010000D5C5000F",
		INIT_30 => x"FA00F000000000000000000000000000FFFD85EEFFFFEFABFFFDF7F9FFFF4AAA",
		INIT_31 => x"FFFFFFF5FBFCFFF1FFFCFF40000000007770FFC000000000FF80FF8000000000",
		INIT_32 => x"FE40FFFB00002000EBFFC3FFF3D8F380BFFFFE7FD6FC03FCFE2FFE2F03FC03FC",
		INIT_33 => x"0008FFF40007003F000000032FFFC3CF000000000AFF0FFF00000000003F000C",
		INIT_34 => x"F54BFFFFF5F6C003F555F555400340030F01000057FF5C0F8000C000B03FFFFF",
		INIT_35 => x"0FFE00033FFD40000000FFEE00008AE2FFFFF15DFFFF5554FC0C000C00000000",
		INIT_36 => x"FFFF0C3FFFFFC0000000000000000000002F003EFFFFB0EB8000F8FF0000800B",
		INIT_37 => x"0000FFFF0000FFFFFFFFFF00FFFF003FDFEAF000AAFD000FE000FF3F0002FF00",
		INIT_38 => x"F4B303F333FC3FD00153BFF43FFF2AAB0F030000FFF01F400000000003000000",
		INIT_39 => x"C000C0000C0F0C005BFF57FFFC57FFFFFC00FC0001C300C02FF61540FCC000BC",
		INIT_3A => x"00000000F8150000000000000007000000000000000000270000000107FF1D5F",
		INIT_3B => x"00000000000000000000000000275FFF001A0000FFFFD55500000000FFEBFFFF",
		INIT_3C => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3D => x"000029B800000000000000000000000000000000000000000000000000000000",
		INIT_3E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3F => x"0000000000000000000000000000000000000000000000000000000000000000"
	)
	port map (
		DO   => DATA(3 downto 2),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

	ROM_8L_2 : RAMB16_S2
	generic map (
		INIT_00 => x"0BAF2EBFAFFB9BBF3FAF3EAFFBEBEEFF00000000000000000000000000000000",
		INIT_01 => x"0000002000000000FFFFFD7FFFFF8ADB2F2C0000C33C00000000C00000000000",
		INIT_02 => x"FFE2E8FAFFBFF7ABBFAFFEAFFBEBEEFFFEF6FF8877EFFDAFEDBFF5F7E5FF41FF",
		INIT_03 => x"3C0F3C0F03C003C00F03FFFFC0F0FFFC0000F00000000000000000A7002BE803",
		INIT_04 => x"3FC03FCBF03CF03C0BFF5555F03CFFFF0000FFFF0000FFFF0F030F03C0F0C0F0",
		INIT_05 => x"F03CF03C0F030F03F03CFFFF0F03D555C0F0C0F03C0F0000FF4055542FD05554",
		INIT_06 => x"0FF00FF00FF00FF00FF0FFFF0FF0FFFF00000000000000003C0FFFFF03C0FFFF",
		INIT_07 => x"0FFF0000FFF300000FF00FF00FF00FF00FF0FFFF0FF0FFFF3FFF0000FF540000",
		INIT_08 => x"000000000000003F0FF00FF00FF00FF00FF0FFFF0FF0FFFF00000000017A0000",
		INIT_09 => x"1C80859C20035107881120129F2704260000FFFF0000FFFF0000FFFF0000FFFF",
		INIT_0A => x"4020401000000060214C0210148602008148574180069D17E447F44516671CCF",
		INIT_0B => x"090600000040000204000200018000200401D4FF4042C4458204CE500E00501D",
		INIT_0C => x"000000880012420240800200091200067CEF2020D54002948A6841CC688E51E1",
		INIT_0D => x"840C0880144881080001008006010040CDB80300F6FB0002886A112518831494",
		INIT_0E => x"44024000409242100000000002040000D6F72030AE4F0380A239C518A0A6504D",
		INIT_0F => x"04000200000400800040000800020000BCBD9924BCFF48499A263411B2822719",
		INIT_10 => x"FFE2E8FAFFBFFFABBFAFFEAFFBEBEEFFDFDF9120FEFF42580125090408268104",
		INIT_11 => x"8C98DBD1387BC0405E6D33DD9866C1E23FAFBEAFFBEBEEFFEBAFBEBFAFFBBFBF",
		INIT_12 => x"00960000E00000005FCF3EDD31A7EDE65E6D33DD9866C1E3CDF8CBD8F2E3487E",
		INIT_13 => x"0540054005400540000000000000000000000000000000000000403000006000",
		INIT_14 => x"00000000000000000000000000000000FFFFFEABFFFFFEAB0000000000000000",
		INIT_15 => x"F878F878787F787F00780000787F007FF0C3F0C30C300C30F0C3F0C30C300C30",
		INIT_16 => x"000A000AAAAAAAAA000A000AAAAAAAAAC0C0C0C0C0C0C0C0C0C0C0C0C0FFC0FF",
		INIT_17 => x"1555001555515550000000000000000010450000FFFF5FFF00005555003F557F",
		INIT_18 => x"000000FF0000FFFF0000FFF0000000000000000000000000FC00FD5500005555",
		INIT_19 => x"0000000000030003C000C00000030003C000C000000300030000000000000000",
		INIT_1A => x"FFFFFFFFFFFFFFFFFFFFFFFF00030003FFFFFFFF00030003C000C00000030003",
		INIT_1B => x"00000000000000000000000000000000FFFF4000FFD22FFFFFFFFFFFFFFFFFFF",
		INIT_1C => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_1D => x"0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_1E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_1F => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_20 => x"000000000000000000000000000000000000FFFF0000FFFD87D1BEFC57FFFFFF",
		INIT_21 => x"000000000000000077F0FFFFFFFFFFAB5F4FC804FD000000DB47000040000000",
		INIT_22 => x"FFFF4DD5FF54DF4700030000DFFF000000000000000000000000000000000000",
		INIT_23 => x"01F8FFFF0000FFFFFFFC0000F3D000000000000000000000B80701FF7F7BFFFF",
		INIT_24 => x"FE20FFEB003FEAFFBBFAD000D7C000000000000000000000FFFFFFFFFC00FFC0",
		INIT_25 => x"000D002FBFFFFFFFE1FF03FFFA00FFFF1BFF0000FFFF00004400000000000AFF",
		INIT_26 => x"FF99FC0064450000FE8F7FFFFA05FFABFFBA000FAAAFFFFFF7FFAAFFFFF0FC00",
		INIT_27 => x"65209400000F002E180000700000000000010000C03201C00000000000000000",
		INIT_28 => x"FFEFBFFFFFFFFDEBFEFEFC7DFFFF7705EA57FEBFF755FFFFFFFF669CFFFF0079",
		INIT_29 => x"2802EC2FBFFFA8FFFFD047FF004717FF8004A882245F108422AA400004000000",
		INIT_2A => x"FFDD2A2455FF292105400102651540915D15500050000000FFFFFFFFFFFFFFFF",
		INIT_2B => x"7FEAA084AF57A8045435D541555D57D55601F400400000007045FFFF0FFCFFFF",
		INIT_2C => x"E00055D60104FFFF57F5F40074000000FFFFFFFFFFFFFFFFFFFA7F040400028B",
		INIT_2D => x"FFD5AED75FFF55FF00780000F4000000FFCFFFFFFFFFFF15415D108024564210",
		INIT_2E => x"5355000000BD7F5500070000FEAA001EFFFFFFFFFFFFFFFFFFDFD547FFEF5559",
		INIT_2F => x"8AB000228042A422000000000047000057540556555655750000000031D50001",
		INIT_30 => x"F7F0C000000000000000000000000000464EAA049FDF1555FFFC40523FFF20B1",
		INIT_31 => x"0F0FFFF00FFC7FF0FFFFFC0000000000BBB8FFC000000000FFF0FFA400000000",
		INIT_32 => x"FFD0FFFF00005880FFFFFFFFF3F0F3F0FFFFFFFF03FC03FCFFFFFFFF03FC03FC",
		INIT_33 => x"00BCFFD0000B003F00000001FFFFA00F00000000FFFF07FF00000000001D002E",
		INIT_34 => x"F00F00005053C003F555F555400340030FA00000030F0C0FF0004000C03FC7FF",
		INIT_35 => x"01FF00008F4000000000FFFF0000FFFFFFFFF00CFFFFDCDCFC0C155500005555",
		INIT_36 => x"AAAAAEBDAAA80000000000000000000000FF001FFFFFFFFFF800FE3F0000F8BF",
		INIT_37 => x"0000FFFF0000FFFFFFFFFF00FFFF003FC3DFF0007DF0000FFE0001A8002FC010",
		INIT_38 => x"73F303F333FC3F2C03F9FFF03FFF3FFF03000000FFF00F000000000001000000",
		INIT_39 => x"C000C5550C0F55550FFFFC01FFF37FFF7EAA3FFFA0C0F2C0FD6FFFF3FC4033FC",
		INIT_3A => x"00000000FF8200000000000000000000000000000000007F0000000D2FFFCC0F",
		INIT_3B => x"0000000000000000000000030CFFAFFF000F0000FFFCFFFF00000000FD55FC00",
		INIT_3C => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3D => x"0000FFD000000000000000000000000000000000000000000000000000000000",
		INIT_3E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3F => x"0000000000000000000000000000000000000000000000000000000000000000"
	)
	port map (
		DO   => DATA(5 downto 4),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

	ROM_8L_3 : RAMB16_S2
	generic map (
		INIT_00 => x"0AFE2FE2FA9EFFBE3EEE3FEEEFEFFFEB00000000000000000000000000000000",
		INIT_01 => x"0000ABFF0000AE8BFFFFAFD7FFFFDB940E54AA0A80C0FA3A0000FA820000AB83",
		INIT_02 => x"EEFFBBBFFBF7B8EEBEEEABEEEFEFFFEBF5AFFFBC83FFBFFF3FFBF1E4FC1D3A9F",
		INIT_03 => x"3C0F3C0F03C003C07F9F0000E7F80000000000000000000000009BFF001FEFE9",
		INIT_04 => x"3FC0000FF03CF03CFFFF0000F9FE00000000FFFF0000FFFF0F030F03C0F0C0F0",
		INIT_05 => x"F03CF03C0F030F03F9FE00007F9F0000C0F0C0F03C000000FFFF0000FFFF0000",
		INIT_06 => x"0FF00FF00FF00FF02F50FFFF2FF9FFF50000000000000000FE7F00009FE70000",
		INIT_07 => x"00570000FFFE00000FF00FF00FF00FF02F50FFFF2F50FFFF07F5000040000000",
		INIT_08 => x"00000000000000030FF00FF00FF00FF02F50FFFF2F50FFFF0000000000000000",
		INIT_09 => x"A7A20106209F424B0191020A130600200000FFFF0000FFFF0000FFFF0000FFFF",
		INIT_0A => x"002E4512282205060120020062108800418281880140001B00920011404B8803",
		INIT_0B => x"82829109924804492004A000811209004220204710600C80146C080946510053",
		INIT_0C => x"06060C00088220184002400000401200E1950200F20248021207600004502006",
		INIT_0D => x"6610102020A100080400400000002020BFCF206AB78F04829E10024030520818",
		INIT_0E => x"822102102201801000000102082008086FEF8204E7E0C902042000280580020A",
		INIT_0F => x"80210000102004040000000040002088BBF04182F26742491080100402522108",
		INIT_10 => x"EEFFFFFFFBF7FFFFBEEEFFFFEFEFFFFF7D3C80607973429A0201000109000188",
		INIT_11 => x"6C3C918193A70400349208491E203E963EEEFFFEEFEFFFFBFAFEEFEEFA9EFFFE",
		INIT_12 => x"019200009840000035B31D49DC38309C349208491E20369C6F2D0186B9DE0526",
		INIT_13 => x"00000000000000000000000000000000000000000000000000A2000000000000",
		INIT_14 => x"0000FFFF0000FFFF0000000000000000FFFFAA01FFFF42AD0000000000000000",
		INIT_15 => x"C787C787878F878F00070000878F0007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_16 => x"000A000AAAAAAAAA000A000AAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCF",
		INIT_17 => x"0015001555505550000000000000000000000000FFFF00FF5555AAAA557FAABF",
		INIT_18 => x"03FF0055FFFF5555FFFF5550FFFF00005555555555545554FD55FEAA5555AAAA",
		INIT_19 => x"0000000000030003C000C00000030003C000C000000300030055005555555555",
		INIT_1A => x"030303030303030303000300000300030300FBBB00030003C000C00000030003",
		INIT_1B => x"00000000000000000000000000000000FFFF22BA740BFFFF0303BBBB0303BBBB",
		INIT_1C => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_1D => x"0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_1E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_1F => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_20 => x"0000E800000000000000000000000000000010000000010000025555BF065555",
		INIT_21 => x"000800000000000000405FFFFD54FFF5AABA515FB400FD00AB28000000000000",
		INIT_22 => x"FFFFFBFFF862EAA800010000BFFF000000000000000003FF0000000000000000",
		INIT_23 => x"003CFFFF0000FFFFFFFE0000F00000000000000000000000F0A200058A005555",
		INIT_24 => x"FFFF5555003F4154FFFF4000D40000000000000000000000FFD5FE0000000000",
		INIT_25 => x"0024BBB557FF7FFFE4FF03FF5000FFFF0015000057FF0000000002FA0000A000",
		INIT_26 => x"5000000000000000FFEF0015F0805555D0BFF583FFFFFFFFC1FFFFF4FFD01000",
		INIT_27 => x"E45052AF002FFFFF0E0000300000000200000000603100700000000000000000",
		INIT_28 => x"FFFFFFFFFFF7FD54FF7FFEAAFFFFAAAA976A5FFFAAFFFFFFFFFF949FFFFF001F",
		INIT_29 => x"81EFFF9FFFFFFED5FFF89227A880FF95742118A855042492E840400040000000",
		INIT_2A => x"FFFF4089EA3D48129A92959488815D195545400000000000FFFFFFFFFFFFFFFF",
		INIT_2B => x"29578809FFFF020455E4550555519555D1C4000000000000AAAAF5FF0001FFFF",
		INIT_2C => x"FEAAFF5FFFFFFD7FF43F400040000000FFFFFFFFFFFFFFFFFFFFFFF8FAAA0BFF",
		INIT_2D => x"57FFABFFFAAAD55F0000000000000000FFFBFFFFFFFFFF571082615908404814",
		INIT_2E => x"45111FFF7FD5FFFF000000007F550007FFFFFFFFFFFFFFFF7F57FD55FFFF57FF",
		INIT_2F => x"2061000215200908000000000056000056550041D50555D10000000007470000",
		INIT_30 => x"F000C000000000000000000000000000F75FFFFAFFFFFFFFDFF0EBFE05DFF755",
		INIT_31 => x"AFAFFFF0ACCE1FC0FFFFF08000000000FFFCFFC000000000FF04FF0000000000",
		INIT_32 => x"FFF0FFFF0000AC60FFFCFFFF3390C3F4FFFDFFFF03FC03FCFFFFFFFF03FC03FC",
		INIT_33 => x"0BFEFD00D57F003F00030000FFFF000F000000003FFF03FF00000000000C000C",
		INIT_34 => x"03FF000AC003C003F5555F554003400307F0000003AF0C0FD0000000C03FC07F",
		INIT_35 => x"007F0000E10000000000FFFF0000FFFFFFFFF00CFFFDCCCCD40C777100001113",
		INIT_36 => x"FFFFFFD0FFD000000000000000000000007D000075D715407F80FF870000FFFF",
		INIT_37 => x"0000FFFF0000FFFFFFFFFF00FFFF003FC888F0008888000F8FE0A05C02FC4800",
		INIT_38 => x"03F303F333FC3FBC03FC3FC03FFF155703000000FFC003000000000000000000",
		INIT_39 => x"C00044440C054DDDBFFF3FFFFFFAE1573D553C2851400000FFFFFFF3D00033FC",
		INIT_3A => x"00000000007F02AA0000000000000000000000000000003C000000CC0BFFCC0F",
		INIT_3B => x"00000000000000000000000B03F0FFFF00010000FFF4FC0000000000FC005C00",
		INIT_3C => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3D => x"0000FF4000000000000000000000000000000000000000000000000000000000",
		INIT_3E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_3F => x"0000000000000000000000000000000000000000000000000000000000000000"
	)
	port map (
		DO   => DATA(7 downto 6),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

end RTL;