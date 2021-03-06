-- generated with romgen v3.03 by MikeJ
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity ROM_4P is
port (
	CLK  : in  std_logic;
	ENA  : in  std_logic;
	ADDR : in  std_logic_vector(11 downto 0);
	DATA : out std_logic_vector(7 downto 0)
	);
end;

architecture RTL of ROM_4P is

	signal rom_addr : std_logic_vector(11 downto 0);

begin

	p_addr : process(ADDR)
	begin
		rom_addr <= (others => '0');
		rom_addr(11 downto 0) <= ADDR;
	end process;

	ROM_4P_0 : RAMB16_S4
	generic map (
		INIT_00 => x"F9873510E111111FF895B4D11111111FF987B5E11111111FFFFFFFFFFFFFFFFF",
		INIT_01 => x"F6CAA21F8111111FFD9435176111111FF985B3154111111FF895B4132111111F",
		INIT_02 => x"F67AA2521011111FF65AA25EDF11111FF64AA25EDC11111FF67AA24BA911111F",
		INIT_03 => x"FFFFFFFFFFFFFFFFF65BB3E11111111FF64BB4E11111111FF67325311111111F",
		INIT_04 => x"A88888AAAAAAAAA8A88888AAAAAAAAA8888888AAAAAAAAAAAAAAAAAAAA888888",
		INIT_05 => x"A88888AAAAAAAAAA888888AAAAAAAAAA888888AAAAAAAAAA888888AAAAAAAAA8",
		INIT_06 => x"888888AAAAAAAAAA888888AAAAAAAAAA888888AAAAAAAAAA888888AAAAAAAAAA",
		INIT_07 => x"FFFFFFFFFFFFFFFF888888AAAAAAAAAA888888AAAAAAAAAA888888AAAAAAAAA8",
		INIT_08 => x"F11A98766543211FF119DCBA6543211FF1CA10FE6543211FFFFFFFFFFFFFFFFF",
		INIT_09 => x"FC1798766543211FF118DCBA6543211FF1C610FE6543211FFB1954326543211F",
		INIT_0A => x"F1CA54326543211FF11610FE6543211FF118DCBA6543211FF1B798766543211F",
		INIT_0B => x"FFFFFFFFFFFFFFFFFB1910FE6543211FF11ADCBA6543211FFC1998766543211F",
		INIT_0C => x"88888888AAAAAAAA88888888AAAAAAAA88888888AAAAAAAAFFFFFFFFFFFFFFFF",
		INIT_0D => x"88888888AAAAAAAA88888888AAAAAAAA88888888AAAAAAAA88888888AAAAAAAA",
		INIT_0E => x"88888888AAAAAAAA88888888AAAAAAAA88888888AAAAAAAA88888888AAAAAAAA",
		INIT_0F => x"FFFFFFFFFFFFFFFF88888888AAAAAAAA88888888AAAAAAAA88888888AAAAAAAA",
		INIT_10 => x"F1CBA987D111111FF16543211111111FF10111111111111FFFFFFFFFFFFFFFFF",
		INIT_11 => x"F8765A411111111FF3210FEDC111111FFBA198765111111FF430210FE111111F",
		INIT_12 => x"F19AAAAE8761111FF154AAAE3211111FF10FAAAED111111FF8CBAAA91111111F",
		INIT_13 => x"FFFFFFFFFFFFFFFFF19AAAFE1111111FF19AAAADC111111FF19AAAAEBA11111F",
		INIT_14 => x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFF",
		INIT_15 => x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
		INIT_16 => x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
		INIT_17 => x"FFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
		INIT_18 => x"FDCB0E321111111FF8B98B011111111FFC9C08901111111FFFFFFFFFFFFFFFFF",
		INIT_19 => x"FD6543210FEDC11FFD7BA9876543211FFC8865411111111FFE9B0A011111111F",
		INIT_1A => x"FA0B6F411111111FF0AFEDCBA111111FFB9876543210111FF8FEDCBA9871111F",
		INIT_1B => x"FFFFFFFFFFFFFFFFFEBAC98A1111111FFDC08B032111111FFE989E321111111F",
		INIT_1C => x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
		INIT_1D => x"AAA8888888888AAAAAAAA88888888AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
		INIT_1E => x"AAAAAAAAAAAAAAAAAAAAA8888AAAAAAAAAA188888888AAAAAAA88888888AAAAA",
		INIT_1F => x"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
		INIT_20 => x"F12399111111111FF12388777611111FF12344444511111FFFFFFFFFFFFFFFFF",
		INIT_21 => x"F1230F111111111FF123CDE11111111FF12399111111111FF12399AAB111111F",
		INIT_22 => x"F12366666661111FF12355555551111FF12343111111111FF12312111111111F",
		INIT_23 => x"FFFFFFFFFFFFFFFFF123BC111111111FF123BC111111111FF123A9888871111F",
		INIT_24 => x"AAAA888888888888AAAA888888888888AAAA888888888888FFFFFFFFFFFFFFFF",
		INIT_25 => x"AAAA888888888888AAAA888888888888AAAA888888888888AAAA888888888888",
		INIT_26 => x"AAAA888888888888AAAA888888888888AAAA888888888888AAAA888888888888",
		INIT_27 => x"FFFFFFFFFFFFFFFFAAAA888888888888AAAA888888888888AAAA888888888888",
		INIT_28 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_29 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2A => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2B => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2C => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2D => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2E => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2F => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_30 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_31 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_32 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_33 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_34 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_35 => x"FFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFF",
		INIT_36 => x"FFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFF",
		INIT_37 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_38 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_39 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_3A => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_3B => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_3C => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_3D => x"FFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFF",
		INIT_3E => x"FFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFFFFFFF777777FFFFF",
		INIT_3F => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
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

	ROM_4P_1 : RAMB16_S4
	generic map (
		INIT_00 => x"F00004110000000FF00004000000000FF00004600000000FFFFFFFFFFFFFFFFF",
		INIT_01 => x"F00004101000000FF60004111000000FF00004111000000FF00004111000000F",
		INIT_02 => x"F00004222200000FF00004211100000FF00004211100000FF00004211100000F",
		INIT_03 => x"FFFFFFFFFFFFFFFFF00004600000000FF00004600000000FF00004200000000F",
		INIT_04 => x"0000000000000000000008000000000000000000000000000000000000000000",
		INIT_05 => x"0000000000000000000000800000000000000080000000000000000000000000",
		INIT_06 => x"0000000000000000000000800000000000000800000000000000080000000000",
		INIT_07 => x"FFFFFFFFFFFFFFFF000000000000000000000880000000000008880000000000",
		INIT_08 => x"F00433337777770FF00433337777770FF04444337777770FFFFFFFFFFFFFFFFF",
		INIT_09 => x"F40422227777770FF00422227777770FF04433227777770FF40433337777770F",
		INIT_0A => x"F04433337777770FF00433227777770FF00422227777770FF04422227777770F",
		INIT_0B => x"FFFFFFFFFFFFFFFFF40444337777770FF00433337777770FF40433337777770F",
		INIT_0C => x"888888880000000088888888000000008888888800000000FFFFFFFFFFFFFFFF",
		INIT_0D => x"8888888800000000888888880000000088888888000000008888888800000000",
		INIT_0E => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_0F => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_10 => x"F88888888000000FF88888800000000FF88000000000000FFFFFFFFFFFFFFFFF",
		INIT_11 => x"FAAAAAA00000000FFAAAA9999000000FF99C99999000000FF99C99988000000F",
		INIT_12 => x"FBBAAAAABBB0000FFBBBAAAABB00000FFBBAAAAAA000000FFAAAAAAA0000000F",
		INIT_13 => x"FFFFFFFFFFFFFFFFFBBAAABB0000000FFBBAAAABB000000FFBBAAAAABB00000F",
		INIT_14 => x"000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF",
		INIT_15 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_16 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_17 => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_18 => x"FFFF7FFF0000000FFFFFFF7F0000000FFFFF7FFF0000000FFFFFFFFFFFFFFFFF",
		INIT_19 => x"FFDDDDDDDCCCC00FFFFCCCCCCCCCC00FFFFFFFF00000000FFFFF7FF00000000F",
		INIT_1A => x"FF7FF6F00000000FF7FEEEEEE000000FFFEEEEEEEEEE000FFFDDDDDDDDD0000F",
		INIT_1B => x"FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF7FF7FF000000FFFFFFFFF0000000F",
		INIT_1C => x"0880080000000000000000000000000008080080000000000000000000000000",
		INIT_1D => x"0000000000000000080000000000000008800000000000000008800000000000",
		INIT_1E => x"0088808000000000008000000000000008000000000000000000000000000000",
		INIT_1F => x"0000000000000000088000008000000000000888800000000080008800000000",
		INIT_20 => x"F55555000000000FF55555555500000FF55555555500000FFFFFFFFFFFFFFFFF",
		INIT_21 => x"F55565000000000FF55555500000000FF55555000000000FF55555555000000F",
		INIT_22 => x"F55566666660000FF55566666660000FF55566000000000FF55566000000000F",
		INIT_23 => x"FFFFFFFFFFFFFFFFF55566000000000FF55566000000000FF55566666660000F",
		INIT_24 => x"000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF",
		INIT_25 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_26 => x"0000000000000000000000000000000000000000000000000000000000000000",
		INIT_27 => x"FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000",
		INIT_28 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_29 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2A => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2B => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2C => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2D => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2E => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_2F => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_30 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_31 => x"FFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFF",
		INIT_32 => x"FFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFF",
		INIT_33 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_34 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_35 => x"FFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFF",
		INIT_36 => x"FFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFF",
		INIT_37 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_38 => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_39 => x"FFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFF",
		INIT_3A => x"FFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFFFFFFF444444FFFFF",
		INIT_3B => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_3C => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
		INIT_3D => x"FFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFF",
		INIT_3E => x"FFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF000000FFFFF",
		INIT_3F => x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
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
