-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity GALAXIAN_1K_B is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of GALAXIAN_1K_B is

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

  component RAMB16_S4
    --pragma translate_off
    generic (
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
      DO    : out std_logic_vector (3 downto 0);
      ADDR  : in  std_logic_vector (11 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (3 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(11 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(11 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_01 of inst : label is "FFFFFFFF2442244220000000000000022002200200000000002226C80C22AAEC";
    attribute INIT_02 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_03 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_04 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_05 of inst : label is "244224422442244200000002200000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "0000004224000000000004422440000000000002200000002442244224422442";
    attribute INIT_07 of inst : label is "2002200200000000244220022440000024422442244220002002200200000000";
    attribute INIT_08 of inst : label is "2002244200000002244220022000000000022442000004422442244200022442";
    attribute INIT_09 of inst : label is "000C800000000000000000001BEE710000000002200000002002200200000000";
    attribute INIT_0A of inst : label is "000000CC00008CC0000000002000000000000000002666000C80000024422442";
    attribute INIT_0B of inst : label is "0000CC8000008CE00000000010000000000008CC00088C400000000020000000";
    attribute INIT_0C of inst : label is "000EC8CE000000000EC8CE000000000000EFE00C001710070C00EFE007001710";
    attribute INIT_0D of inst : label is "333FFE003300EFF3F0000000F0000000F0000000F00F07880000000070000000";
    attribute INIT_0E of inst : label is "00000008000021900000000004A2000000000004003413A388800000C3052000";
    attribute INIT_0F of inst : label is "120201021810013708004021F7EC2048004800C200420080008C400013011120";
    attribute INIT_10 of inst : label is "000000000488960700000000887078870000000004F00EAA0000000000000000";
    attribute INIT_11 of inst : label is "0000000006999607000000008870788700000000089BD8070000000088707887";
    attribute INIT_12 of inst : label is "000000000000000000000000004F007800000000870788700000000078870000";
    attribute INIT_13 of inst : label is "000000000000000000000000000F007800000000000000000000000048896078";
    attribute INIT_14 of inst : label is "0000000000004F00000000007999007800000000000000000000000069996078";
    attribute INIT_15 of inst : label is "EEEEECEE27C3FFFBEEEEEEC23FFFEE330000000000889BC00000000048896078";
    attribute INIT_16 of inst : label is "0008C6600000017F66C8000077200000CEEEECEE07C3FFFBEEEEEEC03FFFEE31";
    attribute INIT_17 of inst : label is "0000000E0000DFD800000000DF7600000000000600000F7F80000000F7F00000";
    attribute INIT_18 of inst : label is "0000080000008800000800000880000000000000000000000000000000000000";
    attribute INIT_19 of inst : label is "0000000000037FFE00000000EFF73000008CC40A00137EE7CC400000FEC80000";
    attribute INIT_1A of inst : label is "00000000446121000000884021000000000260000000000100CC880024800000";
    attribute INIT_1B of inst : label is "024CC00000000013000000E83FA000000000000000088C610800000011000081";
    attribute INIT_1C of inst : label is "37FFB333000000013333333337EC8000000333FF000000FFFF333000FF000000";
    attribute INIT_1D of inst : label is "0FF00000037EC80000000FF0008CE73008CE7333FF800000333FFF0000000088";
    attribute INIT_1E of inst : label is "FF000000000000FF3333333300000000FF333333FF000000333333FF000000FF";
    attribute INIT_1F of inst : label is "0000000000000046000730000600000000000000000000230000000003000000";
    attribute INIT_20 of inst : label is "0000000000000000000000002210031000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "0000000000000000000000000000001100000000000000000000000000000310";
    attribute INIT_22 of inst : label is "0000000000000000000000002211000000000000000000110000000022110000";
    attribute INIT_23 of inst : label is "0000000000000008000000004300000000000000221100000000000000000011";
    attribute INIT_24 of inst : label is "00000000000003C0000000000000000000000000000003480000000000000000";
    attribute INIT_25 of inst : label is "000000000000000000000000C3000000000003C00000000000000000C3000000";
    attribute INIT_26 of inst : label is "008CC00000060E8308000000D91B090000000000000003C0C300000000000000";
    attribute INIT_27 of inst : label is "CCCEFFEE004013FFECCEEE60FF331100888CEEA2000EA6C16EEC0000F91F6400";
    attribute INIT_28 of inst : label is "00000CC8007FF8B688CC000046E55110CCEFFFFE00CC0011EEFF7700FFFB3241";
    attribute INIT_29 of inst : label is "66ECCF8C7FC9268ECFECFFB0E7C17FF706248CEE07FFC924ECCCCC80EFC5D136";
    attribute INIT_2A of inst : label is "04444C8800799FFE00480000C8808000CCE777FF807CC88CFFFFFD88F017F9D2";
    attribute INIT_2B of inst : label is "000000000009906F00000000F9FE97000C4C80040793FFFDC8000000BDBDB000";
    attribute INIT_2C of inst : label is "008CCCC8000CFF708CCCC80007FFC000000000000006739C00000000C4D94C10";
    attribute INIT_2D of inst : label is "0000000004889607000000008870788700CCCC88000FFFC088CCCC000CFFF000";
    attribute INIT_2E of inst : label is "00000000000000000C031B000000000000000004003413A388800000C3052000";
    attribute INIT_2F of inst : label is "E22E0F11061016068C47126A80314480812211722110046F1480942302090872";
    attribute INIT_30 of inst : label is "000000000488960700000000887078870000000004F00EAA00000000A9078887";
    attribute INIT_31 of inst : label is "006C2ECA00000000E6A2260000000000CEEEECEE07E9700066EEEEC800017F31";
    attribute INIT_32 of inst : label is "000000000000000000000000004F007800000000870788700000000078870000";
    attribute INIT_33 of inst : label is "000000000000000000000000124F007800000000000000000000000048896078";
    attribute INIT_34 of inst : label is "0000000000004F00000000007999007800000000000000000000000069996078";
    attribute INIT_35 of inst : label is "EEEEECEE27C3FFFBEEEEEEC23FFFEE330000000000889BC00000000048896078";
    attribute INIT_36 of inst : label is "0008C6600000017F66C8000077200000CEEEECEE07C3FFFBEEEEEEC03FFFEE31";
    attribute INIT_37 of inst : label is "0000000E0000DFD800000000DF7600000000000600000F7F80000000F7F00000";
    attribute INIT_38 of inst : label is "000000000124F007000000008870788700000000089BD8070000000088707887";
    attribute INIT_39 of inst : label is "00000000F07887070000000088707887000000000EAAA9070000000088707887";
    attribute INIT_3A of inst : label is "000000C000000440000006C07AA003100000080000000F0000000000F5500000";
    attribute INIT_3B of inst : label is "0000000000006F770000000017160000000000000000067700000C8071716100";
    attribute INIT_3C of inst : label is "00000C880004CFC4000000007AA000000000000000000F0000000000F5500000";
    attribute INIT_3D of inst : label is "0000000000006777008000001716000000000000000006770000800071716000";
    attribute INIT_3E of inst : label is "000E60000011010100000000011000000088000000CE2E2C0000000011330000";
    attribute INIT_3F of inst : label is "00000000000000000000000000000000000000000000221C44CC0000E0000000";
  begin
  inst : RAMB16_S4
      --pragma translate_off
      generic map (
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
        DO   => DATA(3 downto 0),
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "0000",
        EN   => ENA,
        SSR  => '0',
        WE   => '0'
        );
  end generate;
  rom1 : if true generate
    attribute INIT_00 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_01 of inst : label is "FFFFFFFF244224422000000000000002000000000000000006F999F706FB9960";
    attribute INIT_02 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_03 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_04 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_05 of inst : label is "00022442244220000000000220000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "2442244224422442244224422442244200000042240000000000000220000000";
    attribute INIT_07 of inst : label is "0000000000000042244000002442240024422000244224400000000024000000";
    attribute INIT_08 of inst : label is "0000000200000442200000002440000000000442004224420002244204422442";
    attribute INIT_09 of inst : label is "0000136C0000022380008E003110000000000002200000000000000000000000";
    attribute INIT_0A of inst : label is "0000001300011100080000000000000000000000000000000330000024422442";
    attribute INIT_0B of inst : label is "0000013000001100400000000000000000000013000110000800000000000000";
    attribute INIT_0C of inst : label is "0007301F000000000F1037000000000000FFF7EF000000000FE7FFF000000000";
    attribute INIT_0D of inst : label is "CCCFF700CC007FFCF000000010000000F0080088700000000000000000000000";
    attribute INIT_0E of inst : label is "000240130000000020A500000000000000247CAF00000000C865100000000000";
    attribute INIT_0F of inst : label is "0002008C84280200ECC0001000080000008910C8000000009810000001400000";
    attribute INIT_10 of inst : label is "026A220C0000000022C0C22C0000000002E20422000000002C0C222C00000000";
    attribute INIT_11 of inst : label is "0C222C0C0000000022C0C22C0000000002222C0C0000000022C0C22C00000000";
    attribute INIT_12 of inst : label is "0000000000000000002E20C2000000002C0C22C000000000C22C000000000000";
    attribute INIT_13 of inst : label is "0000000C00000000444E40C212400000000000000000000026A220C200000000";
    attribute INIT_14 of inst : label is "00002E2000000000C222C0C2000000000000000000000000C222C0C200000000";
    attribute INIT_15 of inst : label is "F8FFFFFF24533443FFFF7FFF64573442004222C00000000026A220C200000000";
    attribute INIT_16 of inst : label is "000000A900000000CA00000000000000F8FFFFFF00111003FFFF7FFF64573000";
    attribute INIT_17 of inst : label is "00008CCC00001110FCC00000110000000000008C00000000F800000000000000";
    attribute INIT_18 of inst : label is "0000001000000000001000000000000000000000000000000000000000000000";
    attribute INIT_19 of inst : label is "000CFFF7000000017FFFC0001000000000BCF67F000000007CE6200000113200";
    attribute INIT_1A of inst : label is "70000800001117004E23100000000000260007EE000000000001001000012480";
    attribute INIT_1B of inst : label is "0000133B000000008000001300000000000000000210000007C4000C00000003";
    attribute INIT_1C of inst : label is "000137ECCCCCCCCC80000000CCCDFFEC000000FF000CCCFFFF000000FFCCC000";
    attribute INIT_1D of inst : label is "0FF666660000137E66666FF0E7310000FF1000000137ECCC03333333CCCCCE73";
    attribute INIT_1E of inst : label is "FF000000000000FF00000000CCCCCCCCFF000000FFCCCCCC000000FFCCCCCCFF";
    attribute INIT_1F of inst : label is "000336C000000000000000000000000000000633000000000000000000000000";
    attribute INIT_20 of inst : label is "000000000000000000088EC80000000000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "00000000000000002244880000000000000000000000000022488EC800000000";
    attribute INIT_22 of inst : label is "0000000000000000000088440000000022448800000000000000884400000000";
    attribute INIT_23 of inst : label is "000000000000026F000000006200000000008844000000002244880000000000";
    attribute INIT_24 of inst : label is "000000000000000300000000C0000000000000000000026F0000000062000000";
    attribute INIT_25 of inst : label is "00000000000000C3000000000000000000000003000000C3C000000000000000";
    attribute INIT_26 of inst : label is "111DDFFF00000110CFEC880033331100000000C30000000300000000C0000000";
    attribute INIT_27 of inst : label is "710DDDDF0000303FFFFFFFF0F9360000100DDFFF00001110CFFB000033767000";
    attribute INIT_28 of inst : label is "07D913BB00001133337FFE80330000003888CCFF00003300FFFFB14074130013";
    attribute INIT_29 of inst : label is "CC019C0D013376C9937FFFFEA06301300CEC01D50013FFFED93FFFE065411000";
    attribute INIT_2A of inst : label is "0000889F00001133FE6E4C0033331100718C22CC3364C93517FB364205300141";
    attribute INIT_2B of inst : label is "00EAEF6300001322337632402222200010001FEC00111333FD98000033110000";
    attribute INIT_2C of inst : label is "00FF7337003110007337FF000001130000E88CC800026C9B8CCC8800BABBA100";
    attribute INIT_2D of inst : label is "026A220C0000000022C0C22C000000000033377F00000330F773330003300000";
    attribute INIT_2E of inst : label is "0000000200000000140102200000000000247CAF00000000C865100000000000";
    attribute INIT_2F of inst : label is "00001040221024001280201005601000098C226C000000000881880000000011";
    attribute INIT_30 of inst : label is "026A220C0000000022C0C22C0000000002E20422000000002C0C222C00000000";
    attribute INIT_31 of inst : label is "00000000000000001000000000000000F87FF9100000000003FF37FF00031000";
    attribute INIT_32 of inst : label is "0000000000000000002E20C2000000002C0C22C000000000C22C000000000000";
    attribute INIT_33 of inst : label is "0000000C00000000444E40C200000000000000000000000026A220C200000000";
    attribute INIT_34 of inst : label is "00002E2000000000C222C0C2000000000000000000000000C222C0C200000000";
    attribute INIT_35 of inst : label is "F8FFFFFF24533443FFFF7FFF64573442004222C00000000026A220C200000000";
    attribute INIT_36 of inst : label is "000000A900000000CA00000000000000F8FFFFFF00111003FFFF7FFF64573000";
    attribute INIT_37 of inst : label is "00008CCC00001110FCC00000110000000000008C00000000F800000000000000";
    attribute INIT_38 of inst : label is "C444E40C0000000022C0C22C0000000004222C0C0000000022C0C22C00000000";
    attribute INIT_39 of inst : label is "E0C22C0C0000000022C0C22C0000000004222C0C0000000022C0C22C00000000";
    attribute INIT_3A of inst : label is "0000023300000000EFF222F70000000000000F630026CFC6CEE0000021100000";
    attribute INIT_3B of inst : label is "0044CE000264CFC400600000620000000002AE620000000022222AF700000000";
    attribute INIT_3C of inst : label is "00000F1000000100EFF000000000000000000F6300013731CEE0000001100000";
    attribute INIT_3D of inst : label is "002E62220000000022F72000000000000002AE62000000002222F72000000000";
    attribute INIT_3E of inst : label is "008D4C48000000002E8000000000000000710000000000000000000000000000";
    attribute INIT_3F of inst : label is "000000000000000000000000000000000000BBE0000000000000000000000000";
  begin
  inst : RAMB16_S4
      --pragma translate_off
      generic map (
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
        DO   => DATA(7 downto 4),
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "0000",
        EN   => ENA,
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
