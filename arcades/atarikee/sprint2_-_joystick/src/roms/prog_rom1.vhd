-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity prog_rom1 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prog_rom1 is

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
    attribute INIT_00 of inst : label is "FB5545D94444332322FB95CCCCCCCCCC5F554493CCCCCCCCCC3F052021262006";
    attribute INIT_01 of inst : label is "11FB654E4444221221A24E4434222212B25F654E4444342222A2D94434232222";
    attribute INIT_02 of inst : label is "1111FB4E3344830130A24E432321222211B16F4E3443222223A24E5424222212";
    attribute INIT_03 of inst : label is "2112113333336A0E00A04E44A4B21F111111B14D44340A0E00A14E4433F81111";
    attribute INIT_04 of inst : label is "1121221122226A0E00A04E44A412B11F2122113123336A0E00A04E44A412FB11";
    attribute INIT_05 of inst : label is "CCCCCCCCCCCCDC0770A04E54B51F11B11F11211211919D0D00A04E54A41211FB";
    attribute INIT_06 of inst : label is "666666776666666601A04E6466665665666666666666667600A04E5455CBCCCC";
    attribute INIT_07 of inst : label is "666656656666667700A05E6566666666667766666666667600A05E6566666666";
    attribute INIT_08 of inst : label is "8888888888888888881DFB6666776666666666666666760700D96E6666666666";
    attribute INIT_09 of inst : label is "443333FB95CCCCCCFC233233333322C9CCCCCC3F0460224C212CB78888888888";
    attribute INIT_0A of inst : label is "333322A24E443433232AC9CCCCFCE344343323A2D9443433B33F33333323924D";
    attribute INIT_0B of inst : label is "332222A24E44342322DA44443323EB44332322A24E443433229A4D4433B3EF44";
    attribute INIT_0C of inst : label is "220E11A14E44A417125A443423223133231E11A14E443412125A44443322E234";
    attribute INIT_0D of inst : label is "920E00A24E44A407105A45A410111122220E10A14E44A407115A453411111123";
    attribute INIT_0E of inst : label is "7D0E00A04E44A40700FB3533FB101111D90E00A04E44A407005A45B30F111121";
    attribute INIT_0F of inst : label is "770E00A04E44A40700112222A2666666770E00A04E44A40700B13333A3888888";
    attribute INIT_10 of inst : label is "770E00A04E44A4FB00112122A2666666770E00A04E44A40F00112222A2666666";
    attribute INIT_11 of inst : label is "DC0700A04E44B55F8B8888886D666666970D00A04E44A4B50F111122D9666666";
    attribute INIT_12 of inst : label is "CCCCCCCCCCFC4395CCCCCCCCCC3F0460237222524E4455CBCCCCCCCCCCCCCCCC";
    attribute INIT_13 of inst : label is "3333332222228B4D4434332222A2D9443333332322B23FD94434332322FB95CC";
    attribute INIT_14 of inst : label is "443322212222E2444434222222A24E44343323222222E2444434232222A24E44";
    attribute INIT_15 of inst : label is "44D9A1001111E14444A4D91011A14E444493FC101111E1444494FC1111A14E44";
    attribute INIT_16 of inst : label is "449A7D770011E15544A477971FA14E44442AD9701011E14544A47D0711A14E44";
    attribute INIT_17 of inst : label is "447A77000090ED4534A307B10DA04E4444DA77000010E95544A307E00AA14E44";
    attribute INIT_18 of inst : label is "447A00000811CC333333FB1107A04E44447A070700A0A24434B30F1077A04E44";
    attribute INIT_19 of inst : label is "447A00101C0011222222E21000A05E44447A00A0E01021222222E21077A04E44";
    attribute INIT_1A of inst : label is "54B50F101111111111917D1000A04E4554FB0010212222222222D91077A05E45";
    attribute INIT_1B of inst : label is "CCCCCCCCCCCCCC4F0460249823784E545455CBCCCCCCCCCCCCDC777077A04E54";
    attribute INIT_1C of inst : label is "33122221122222A2D94433332222222222222222222222FB95CCCCCCCCCCCCCC";
    attribute INIT_1D of inst : label is "22222222222222A24E443322B2D8333323222222222222A24E44332322283233";
    attribute INIT_1E of inst : label is "55554544B41F11A15E45C91F112222C9CCCCCCCCFC1111A15E44232222223323";
    attribute INIT_1F of inst : label is "66554544330E10A15E55B5CCCCCCDC6656554544340E11A15E55FBFB1111916D";
    attribute INIT_20 of inst : label is "77894533330E00A06E6666666666666666564534330E00A16E66666666666666";
    attribute INIT_21 of inst : label is "CCCC3D23220E00A0FB77777767666677973D3E33330E00A06E66666666666676";
    attribute INIT_22 of inst : label is "22222222220E00A0D94444332322222222222222220E00A0A5CCCCCCCCCCCCCC";
    attribute INIT_23 of inst : label is "11111111D90700A05E5544232222222222222222920D00A05E45443322222222";
    attribute INIT_24 of inst : label is "CC3F046025BE249E5E5555CCCCCCCCCCCCCCCCCC7D0700A05E55452222111111";
    attribute INIT_25 of inst : label is "22A2D94434332322222232232222222222FB95CCCCCCCCCCCCCCCCCCCCCCCCCC";
    attribute INIT_26 of inst : label is "22A25E4434232222222322222222122122A24E44343322222222232222222122";
    attribute INIT_27 of inst : label is "11A15E5544888888888888888888881F11A15E45342222112222222222222222";
    attribute INIT_28 of inst : label is "00A16E66665555B51FD966666666760710A15E55555555FB11915D5555556607";
    attribute INIT_29 of inst : label is "901D6E6666664544B36E66776776770700D96E6666565544FB6E666666667707";
    attribute INIT_2A of inst : label is "22FB8B888888483333B37F7707C0CCCCCC3F6E666666463433FB767777777707";
    attribute INIT_2B of inst : label is "22A24E44343322222222A20F1011222222A2D944343323222222FB7710212222";
    attribute INIT_2C of inst : label is "11A15E45342222222222D9B50F10112122A25E44342322222222A2FB00111122";
    attribute INIT_2D of inst : label is "25C45E55B5CCCCCCCCCCCCCCCCCCDC1111A15E552411111111915D55FB001111";
    attribute INIT_2E of inst : label is "232222222222FBD9443433FB95CCCCCCCCCCCCCCCCCC3F95CCCCCC3F046026E4";
    attribute INIT_2F of inst : label is "222222222222A245443322A24E443433222222222222A24D443423A2D9443433";
    attribute INIT_30 of inst : label is "555555FB1111A14544E311A14E4434938888881F1111A145442322A24E443423";
    attribute INIT_31 of inst : label is "665555550E10A14544E300A14E44946D665555B51F11A14544E310A14E4434D9";
    attribute INIT_32 of inst : label is "775A66660700A04533E300A04E44A466665655550700A14534E300A04E44A466";
    attribute INIT_33 of inst : label is "00B16F777700D93333E300A04E44A47707FB66760700A03433E300A04E44A477";
    attribute INIT_34 of inst : label is "001121222222222222E200A04E44A4070011CBCCCCCC3D3333E300A04E44A477";
    attribute INIT_35 of inst : label is "001111212222222222D900A04E44A400001111222222222222E200A04E44A400";
    attribute INIT_36 of inst : label is "CCCCCCCCCCCCCCCCDC7700A04E4455FB0011111111111111917D00A04E44B50F";
    attribute INIT_37 of inst : label is "6656554544FB95CCCCCCCCCCCCCCCCCCCCCCCCCCCC3F0460280A26EA4E4455B5";
    attribute INIT_38 of inst : label is "6666554544A46E6666666666666666666666554544A4D9666666666666666666";
    attribute INIT_39 of inst : label is "B39F4D4433A37E77978888888888888888885F4444A36E666666666666666666";
    attribute INIT_3A of inst : label is "22424433931D7E0710DB33333323222222DB443433D97E77B09F3D3333333333";
    attribute INIT_3B of inst : label is "111133931D110E00101122222222222222123433D9117E001021223233222222";
    attribute INIT_3C of inst : label is "333313B10F00FB00101111921D11113A331313E101000E00101121228988881F";
    attribute INIT_3D of inst : label is "22220711B10F95CCCCCCCCCCCCCCDC3333331011FB00B788888888D83333933D";
    attribute INIT_3E of inst : label is "92BD0F1011A14E44342322222222222222F9071011FBD9443433222222222222";
    attribute INIT_3F of inst : label is "CCCC7C0000A14E442422111111111111D955FB0010A14E443422222222222222";
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
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
