-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_G is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_G is

  function romgen_str2bv (str : string) return bit_vector is
    variable result : bit_vector (str'length*4-1 downto 0);
  begin
    for i in 0 to str'length-1 loop
      case str(str'high-i) is
        when '0'       => result(i*4+3 downto i*4) := x"0";
        when '1'       => result(i*4+3 downto i*4) := x"1";
        when '2'       => result(i*4+3 downto i*4) := x"2";
        when '3'       => result(i*4+3 downto i*4) := x"3";
        when '4'       => result(i*4+3 downto i*4) := x"4";
        when '5'       => result(i*4+3 downto i*4) := x"5";
        when '6'       => result(i*4+3 downto i*4) := x"6";
        when '7'       => result(i*4+3 downto i*4) := x"7";
        when '8'       => result(i*4+3 downto i*4) := x"8";
        when '9'       => result(i*4+3 downto i*4) := x"9";
        when 'A'       => result(i*4+3 downto i*4) := x"A";
        when 'B'       => result(i*4+3 downto i*4) := x"B";
        when 'C'       => result(i*4+3 downto i*4) := x"C";
        when 'D'       => result(i*4+3 downto i*4) := x"D";
        when 'E'       => result(i*4+3 downto i*4) := x"E";
        when 'F'       => result(i*4+3 downto i*4) := x"F";
        when others    => null;
      end case;
    end loop;
    return result;
  end romgen_str2bv;

  attribute INITP_00 : string;
  attribute INITP_01 : string;
  attribute INITP_02 : string;
  attribute INITP_03 : string;
  attribute INITP_04 : string;
  attribute INITP_05 : string;
  attribute INITP_06 : string;
  attribute INITP_07 : string;

  attribute INIT_00 : string;
  attribute INIT_01 : string;
  attribute INIT_02 : string;
  attribute INIT_03 : string;
  attribute INIT_04 : string;
  attribute INIT_05 : string;
  attribute INIT_06 : string;
  attribute INIT_07 : string;
  attribute INIT_08 : string;
  attribute INIT_09 : string;
  attribute INIT_0A : string;
  attribute INIT_0B : string;
  attribute INIT_0C : string;
  attribute INIT_0D : string;
  attribute INIT_0E : string;
  attribute INIT_0F : string;
  attribute INIT_10 : string;
  attribute INIT_11 : string;
  attribute INIT_12 : string;
  attribute INIT_13 : string;
  attribute INIT_14 : string;
  attribute INIT_15 : string;
  attribute INIT_16 : string;
  attribute INIT_17 : string;
  attribute INIT_18 : string;
  attribute INIT_19 : string;
  attribute INIT_1A : string;
  attribute INIT_1B : string;
  attribute INIT_1C : string;
  attribute INIT_1D : string;
  attribute INIT_1E : string;
  attribute INIT_1F : string;
  attribute INIT_20 : string;
  attribute INIT_21 : string;
  attribute INIT_22 : string;
  attribute INIT_23 : string;
  attribute INIT_24 : string;
  attribute INIT_25 : string;
  attribute INIT_26 : string;
  attribute INIT_27 : string;
  attribute INIT_28 : string;
  attribute INIT_29 : string;
  attribute INIT_2A : string;
  attribute INIT_2B : string;
  attribute INIT_2C : string;
  attribute INIT_2D : string;
  attribute INIT_2E : string;
  attribute INIT_2F : string;
  attribute INIT_30 : string;
  attribute INIT_31 : string;
  attribute INIT_32 : string;
  attribute INIT_33 : string;
  attribute INIT_34 : string;
  attribute INIT_35 : string;
  attribute INIT_36 : string;
  attribute INIT_37 : string;
  attribute INIT_38 : string;
  attribute INIT_39 : string;
  attribute INIT_3A : string;
  attribute INIT_3B : string;
  attribute INIT_3C : string;
  attribute INIT_3D : string;
  attribute INIT_3E : string;
  attribute INIT_3F : string;

  component RAMB16_S9
    --pragma translate_off
    generic (
      INITP_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";

      INIT_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_08 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_09 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_10 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_11 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_12 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_13 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_14 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_15 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_16 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_17 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_18 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_19 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_20 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_21 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_22 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_23 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_24 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_25 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_26 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_27 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_28 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_29 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_30 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_31 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_32 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_33 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_34 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_35 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_36 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_37 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_38 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_39 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000"
      );
    --pragma translate_on
    port (
      DO    : out std_logic_vector (7 downto 0);
      DOP   : out std_logic_vector (0 downto 0);
      ADDR  : in  std_logic_vector (10 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (7 downto 0);
      DIP   : in  std_logic_vector (0 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(10 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(10 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "20053AF0164F20303A06ADCDEB20292A08F7CD0A20CD2005323C20053A203332";
    attribute INIT_01 of inst : label is "C0010862C2A77E09002001C5E508E6C2A67A086CDABB263E086CDABB202B3A5F";
    attribute INIT_02 of inst : label is "C32B0867D20F2005323C20053A0A20CD08F7CA0D77B67AE1C10862C2A77E09FF";
    attribute INIT_03 of inst : label is "DFC2A77E224B2108ECC30A2ACD2005323D20053A081DC30F1608E6C3E1C1081B";
    attribute INIT_04 of inst : label is "DA070702DB0881C2A720363A203C32AF08A6C308CFD208B8CA0001FE224C3A07";
    attribute INIT_05 of inst : label is "08C7CAE0FE20133AC906C4CD0F06EB20172AEB06ADCDEB20122A08B8DA0708CF";
    attribute INIT_06 of inst : label is "013E08A6C32013323D08DECA30FE20133A08A6C3224C32FF3E08A6C32013323C";
    attribute INIT_07 of inst : label is "C601C62F878720053A20193220323A202832013E201F3277B67A08A6C3224C32";
    attribute INIT_08 of inst : label is "40CAA72004323D20043A0743CD200332053EC0A72003323D20033AC9202932C8";
    attribute INIT_09 of inst : label is "08B2C3D106ADCDE5EB20122AEB6F8520172A0707070720103201E63C20103A09";
    attribute INIT_0A of inst : label is "C305B9C3074ECD095FCAF1111ACDF5201B323D201B3A074ECD0959C2A720363A";
    attribute INIT_0B of inst : label is "002120262267278C20273A6F278520263A20222AC0A720363AC8A720503A05CF";
    attribute INIT_0C of inst : label is "3E2003320A3E200032013E09B5DA25FE20053AC8A7201F3AC910AECD20222200";
    attribute INIT_0D of inst : label is "053A0E5021090701202C3209D2C3202332201032013E2015220E102120043216";
    attribute INIT_0E of inst : label is "193AC8A720283A0962C3201F32AF2022327E09C1C20D040404042309CEDAB820";
    attribute INIT_0F of inst : label is "3220283209F5C23D23003600CE1F4720053AAF06ADCDEB20292AC02019323D20";
    attribute INIT_10 of inst : label is "C9202F32AF202E322780202E3A479BC62F20333A202B3290202B3A0738CD2002";
    attribute INIT_11 of inst : label is "36C0352037210A4BC320083AC92033322799C620333AC92033322701C620333A";
    attribute INIT_12 of inst : label is "21C90136203921C9203832013E0A3ADA38FE20083AC9FF362039210A59DA0F20";
    attribute INIT_13 of inst : label is "FE7D2313771A0E7011200021201B32201A320E8A3A2045222026222024220000";
    attribute INIT_14 of inst : label is "201B32243E0AA0CAA720363A0A7AC240FE7D0AAFCA34FE0AA8CA24FE0AA1CA1A";
    attribute INIT_15 of inst : label is "C1E520242A21A032023E0A7AC3A71E372E0A7AC3981E282E0A7AC38C1E1C2EC9";
    attribute INIT_16 of inst : label is "21A03AD1E50ADDC3D1C50ADBC30AD6DAB97D0ADBC30AD6DA0ACECAB87C20262A";
    attribute INIT_17 of inst : label is "0B82C201E6224D3AC92034327B2035327A0AC3C34B4220342A0AEFCA21A0323D";
    attribute INIT_18 of inst : label is "0B7EC2A77E223C210B38C2A7224A3A0B6ECAA722323A0B63CAA722343A0C61CD";
    attribute INIT_19 of inst : label is "7E224A21A722363A224C323C2F0C5E3A0B5ADA0F223C327FE686200A2122433A";
    attribute INIT_1A of inst : label is "224C320C5E3A0B45C30CF7C32236320FE622413A77FEE60CF7C37701F60B49CA";
    attribute INIT_1B of inst : label is "C3350CF7C3224B32013E2232320FE622403A0B18C30C7CD230FE202B3A0B38C3";
    attribute INIT_1C of inst : label is "08360BABC2352233210B00C377AF2B77FEE67E224D21340B97C235223C210CF7";
    attribute INIT_1D of inst : label is "21340BBFF2352234210C24CD07360BBFC235223521340BABF2352232210C24CD";
    attribute INIT_1E of inst : label is "210C24CD07360BE9C235223121340BD3F2352236210C24CD08360BD3C2352237";
    attribute INIT_1F of inst : label is "2247210BF5C20577177E2B177E2247210706C934224F210D14C30BE9C2352230";
    attribute INIT_20 of inst : label is "013E223532053E223332023E0C0CC2051B2B127E2247110C59210806C977177E";
    attribute INIT_21 of inst : label is "FE350C51DA10FE350C51DA04FE350C51DA02FE350C51DA01FE20253AC9223632";
    attribute INIT_22 of inst : label is "000100010502E65D19B5AD8C4BD4C9350C51DA80FE350C51DA40FE350C51DA20";
    attribute INIT_23 of inst : label is "40E601DB0C71C3FF3E2B773C2FC977AF2B770C73DA223F2196201321200A3A02";
    attribute INIT_24 of inst : label is "80E6223E3A0CA6C30CDFC280E6223E3A0CE2C30CD0CD0C9BC220E601DB0C90C2";
    attribute INIT_25 of inst : label is "D0CD77224C21224C32013E0CCBC280E6223E3A0CECCAA7223F3A0CDFC30CA6C2";
    attribute INIT_26 of inst : label is "CDC9223D328607E6224F3A0036223D210CB7C3FF3E0CF7C30CECDABE223F3A0C";
    attribute INIT_27 of inst : label is "3A0C24CD0F362249210B76C32234320FE622413A0CA6D296223D21223F3A0CD0";
    attribute INIT_28 of inst : label is "210BE9C32230320FE622443A0B97C30D1FC2A77E2001210B97DA00BE0FE6224F";
    attribute INIT_29 of inst : label is "E622453A7701F67E224D21FF360D35C20136224C21A77E2B0B97D209FE7E223F";
    attribute INIT_2A of inst : label is "04C50D451215048911512D8F0C060340554D090B0585060B97C3223C320AC60F";
    attribute INIT_2B of inst : label is "0301049A44400525058D09C55B5109A205040626190D162519E208204EA140A3";
    attribute INIT_2C of inst : label is "002E51550988870D840390800DC402E1366309C209039DA70325001421710B87";
    attribute INIT_2D of inst : label is "4D0C1883428F809D0230055B433982890907136008CC8B070C260449C8981082";
    attribute INIT_2E of inst : label is "AC8A1C4880FF82894AC8003E605200C9048A1870CA8094868D930E0048601855";
    attribute INIT_2F of inst : label is "4D450125081CC8628A1D12CDCA1A0081084F0E80A06D12060BDC0B410488024D";
    attribute INIT_30 of inst : label is "00400805A30A035B0F27270B4B4084114A001F070F0E153FE53F150E0F071F00";
    attribute INIT_31 of inst : label is "00002080C8C0E0CDF0F4C0F49220C000080C0304492F032F0FA3070313010400";
    attribute INIT_32 of inst : label is "2920230417E01100010706050403020115882102D2D0E4E4F0DAC050C5A01002";
    attribute INIT_33 of inst : label is "000000000030300000000000000000008200F8E0F070A8FCA7FCA870F0E0F800";
    attribute INIT_34 of inst : label is "0000060000E0C8000000000000000000000000050505000E600E0000E0C80000";
    attribute INIT_35 of inst : label is "0200403F704605E70000001C041404641C08C82A092500000000000000080304";
    attribute INIT_36 of inst : label is "49050004030D017C292A0B8B07270F860D412E890005210E656490160060088D";
    attribute INIT_37 of inst : label is "120204CF2B89083F008501692347006A042C0810094712450B9600444110083C";
    attribute INIT_38 of inst : label is "868686862200210F44CD020F44CD020F44CD02AF2201323CAF0F0CC3220132AF";
    attribute INIT_39 of inst : label is "150F44CD23027E05161911FF110F36C3112D110F33C2BB001E22013A00266F86";
    attribute INIT_3A of inst : label is "BA30160F76CABAFF16D5131A134F1A13471AD1C9E14D4409002021E5C90F39C2";
    attribute INIT_3B of inst : label is "2200320FE622023AE9E10F54C3D10F0CCD2200320F72C34D44090100210F6CC2";
    attribute INIT_3C of inst : label is "0FBACA01E601DBC90F00CD3C1E012200320F0F0F0FF0E622023A0F00CD3D1E01";
    attribute INIT_3D of inst : label is "3AC9220332AFC92203323CAF0F78CD220232273C22023A0FB9C2B8AF4722033A";
    attribute INIT_3E of inst : label is "012200320F0F0F0FF0E6200E3A0F07CD2C03010F00CD371C012200320FE6200E";
    attribute INIT_3F of inst : label is "351C01220032243E0FFAC3013E0FF8CA00FE200F3A0F07CD2D03010F00CD361C";
  begin
  inst : RAMB16_S9
      --pragma translate_off
      generic map (
        INITP_00 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_01 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_02 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_03 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_04 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_05 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_06 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_07 => x"0000000000000000000000000000000000000000000000000000000000000000",

        INIT_00 => romgen_str2bv(inst'INIT_00),
        INIT_01 => romgen_str2bv(inst'INIT_01),
        INIT_02 => romgen_str2bv(inst'INIT_02),
        INIT_03 => romgen_str2bv(inst'INIT_03),
        INIT_04 => romgen_str2bv(inst'INIT_04),
        INIT_05 => romgen_str2bv(inst'INIT_05),
        INIT_06 => romgen_str2bv(inst'INIT_06),
        INIT_07 => romgen_str2bv(inst'INIT_07),
        INIT_08 => romgen_str2bv(inst'INIT_08),
        INIT_09 => romgen_str2bv(inst'INIT_09),
        INIT_0A => romgen_str2bv(inst'INIT_0A),
        INIT_0B => romgen_str2bv(inst'INIT_0B),
        INIT_0C => romgen_str2bv(inst'INIT_0C),
        INIT_0D => romgen_str2bv(inst'INIT_0D),
        INIT_0E => romgen_str2bv(inst'INIT_0E),
        INIT_0F => romgen_str2bv(inst'INIT_0F),
        INIT_10 => romgen_str2bv(inst'INIT_10),
        INIT_11 => romgen_str2bv(inst'INIT_11),
        INIT_12 => romgen_str2bv(inst'INIT_12),
        INIT_13 => romgen_str2bv(inst'INIT_13),
        INIT_14 => romgen_str2bv(inst'INIT_14),
        INIT_15 => romgen_str2bv(inst'INIT_15),
        INIT_16 => romgen_str2bv(inst'INIT_16),
        INIT_17 => romgen_str2bv(inst'INIT_17),
        INIT_18 => romgen_str2bv(inst'INIT_18),
        INIT_19 => romgen_str2bv(inst'INIT_19),
        INIT_1A => romgen_str2bv(inst'INIT_1A),
        INIT_1B => romgen_str2bv(inst'INIT_1B),
        INIT_1C => romgen_str2bv(inst'INIT_1C),
        INIT_1D => romgen_str2bv(inst'INIT_1D),
        INIT_1E => romgen_str2bv(inst'INIT_1E),
        INIT_1F => romgen_str2bv(inst'INIT_1F),
        INIT_20 => romgen_str2bv(inst'INIT_20),
        INIT_21 => romgen_str2bv(inst'INIT_21),
        INIT_22 => romgen_str2bv(inst'INIT_22),
        INIT_23 => romgen_str2bv(inst'INIT_23),
        INIT_24 => romgen_str2bv(inst'INIT_24),
        INIT_25 => romgen_str2bv(inst'INIT_25),
        INIT_26 => romgen_str2bv(inst'INIT_26),
        INIT_27 => romgen_str2bv(inst'INIT_27),
        INIT_28 => romgen_str2bv(inst'INIT_28),
        INIT_29 => romgen_str2bv(inst'INIT_29),
        INIT_2A => romgen_str2bv(inst'INIT_2A),
        INIT_2B => romgen_str2bv(inst'INIT_2B),
        INIT_2C => romgen_str2bv(inst'INIT_2C),
        INIT_2D => romgen_str2bv(inst'INIT_2D),
        INIT_2E => romgen_str2bv(inst'INIT_2E),
        INIT_2F => romgen_str2bv(inst'INIT_2F),
        INIT_30 => romgen_str2bv(inst'INIT_30),
        INIT_31 => romgen_str2bv(inst'INIT_31),
        INIT_32 => romgen_str2bv(inst'INIT_32),
        INIT_33 => romgen_str2bv(inst'INIT_33),
        INIT_34 => romgen_str2bv(inst'INIT_34),
        INIT_35 => romgen_str2bv(inst'INIT_35),
        INIT_36 => romgen_str2bv(inst'INIT_36),
        INIT_37 => romgen_str2bv(inst'INIT_37),
        INIT_38 => romgen_str2bv(inst'INIT_38),
        INIT_39 => romgen_str2bv(inst'INIT_39),
        INIT_3A => romgen_str2bv(inst'INIT_3A),
        INIT_3B => romgen_str2bv(inst'INIT_3B),
        INIT_3C => romgen_str2bv(inst'INIT_3C),
        INIT_3D => romgen_str2bv(inst'INIT_3D),
        INIT_3E => romgen_str2bv(inst'INIT_3E),
        INIT_3F => romgen_str2bv(inst'INIT_3F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(7 downto 0),
        DOP  => open,
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "00000000",
        DIP  => "0",
        EN   => ENA,
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
