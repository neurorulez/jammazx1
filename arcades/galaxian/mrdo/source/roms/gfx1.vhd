-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity GFX1 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of GFX1 is

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
    attribute INIT_01 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_02 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_03 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_04 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_05 of inst : label is "FBFFFFFFFFFFFF7FDFFFFFF7FFEFF7FF0000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "F7310001FFDFFEDA8001B7F749E1FFFF37FF3D6700321123B6DB7F7313123200";
    attribute INIT_07 of inst : label is "FBFFFFF7FDA6179F5FFFFFF759F922DFF73108000FFFFFFF8008137FFFFFFFF0";
    attribute INIT_08 of inst : label is "FFFFFFFFFFFFFFFFEEEEEEEEFFFFFFFF00001100800888000011000000888008";
    attribute INIT_09 of inst : label is "EAECCC88FFFFFF7FCCC8CCC4FFEFF7FF00000000000000000000000000000000";
    attribute INIT_0A of inst : label is "000008CE00006F9FEECC8000ACCC8800000044EE00006F9FC8888000ACCCC400";
    attribute INIT_0B of inst : label is "00008C0003777DD7EE08800037FF3F300000008800006F9FCCC00000ACCC8000";
    attribute INIT_0C of inst : label is "000C800003777DD700EE0000FF7F30000008C00003777DD70008800037FF7310";
    attribute INIT_0D of inst : label is "B55A978FFB050B0E0F7CB7FF19041AEFF8C88F88FFFFFF7F8CF88887FFEFF7FF";
    attribute INIT_0E of inst : label is "000000000008C5590000000019D55900FF7BDEE3FFB1429EF7EEDB7FC928D7FF";
    attribute INIT_0F of inst : label is "CCCFFFEC00CFFFFFC00CFFFC00003FFF0000000000009BA20000000022AAA200";
    attribute INIT_10 of inst : label is "0008800000CE6C0F000000000F000000EFF731000000008C00000000CEFFF800";
    attribute INIT_11 of inst : label is "00000000000030080000000084300000008800000C66C0F000000000000F0000";
    attribute INIT_12 of inst : label is "008800040CEEDECFCC800000FFFCE71000088C80ECD9B3BF08EEC0003FF3FB33";
    attribute INIT_13 of inst : label is "CCCCCC2E00001331E2CCCCCC13310000CCCCCC2E00007FFFE2CCCCCC77FFEC00";
    attribute INIT_14 of inst : label is "000FFFFF7F7108EE7F7100003FFFE80031000000FFF300003FFF90080000000D";
    attribute INIT_15 of inst : label is "0008FFFF8000011108CFFFFF0111110000CEC800FFFF700000000FFFFFFFFFFF";
    attribute INIT_16 of inst : label is "0010000CCC80000000000CCCFFEEEEC888888FFF000888880008888800888888";
    attribute INIT_17 of inst : label is "11111111000000001111111100000000F1111111F00000001111111100000000";
    attribute INIT_18 of inst : label is "11111111000000001111111100000000111111110000000077FFEC8000000000";
    attribute INIT_19 of inst : label is "F1111111F0000032111111112200000011111111000000001111111F0000000F";
    attribute INIT_1A of inst : label is "1111111100000223111111112200000011111111000000301111111103000000";
    attribute INIT_1B of inst : label is "11111111000000121111111F2100000F11111111000000321111111121000000";
    attribute INIT_1C of inst : label is "000888000FFFFD9B88888000B8CFFFF0000888000FFFFC880088800088CFFFF0";
    attribute INIT_1D of inst : label is "0000FFFFFF77777300007FFFEFFFFFEC000888880FFFFD9B00888000B8CFFFF0";
    attribute INIT_1E of inst : label is "FF777777ECC808CEFF777FFEEC88CCEEFFFFFFFEFFFFFFFFFFFFFFFF000008CE";
    attribute INIT_1F of inst : label is "0884444400000000444448800000000031131121003203031013113703023200";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "008CEEEC00000000A6EC80000000000008000842583202100480008020233209";
    attribute INIT_27 of inst : label is "000000000023A2DB00000000CA553000008CE6EE000000886EE6C8008B772000";
    attribute INIT_28 of inst : label is "00002B7FFEA48000EEEECA8025BFFFFFEFFECCEF37FFFFFFFECCEFFEFFFFFF73";
    attribute INIT_29 of inst : label is "111132660000000022262223000000000FDFF0FB0FEBF0F7FF0FF3F0EF0FF7F0";
    attribute INIT_2A of inst : label is "0002222800006F9F044000007B3800000022220400006F9F000808E07B340020";
    attribute INIT_2B of inst : label is "0000002000207DD7A2066220104101C00088882A00006F9F222000007B380000";
    attribute INIT_2C of inst : label is "0020000000107DD700A200001820D0300002000000107DD700000000102810E0";
    attribute INIT_2D of inst : label is "00000000004E400000000000004E400003367077000000005307537000000000";
    attribute INIT_2E of inst : label is "008C808C001BF66EC808C800EEE66A00000008400004E4000048000002720000";
    attribute INIT_2F of inst : label is "4443992400C30007C00C303C00003C0300EC8EC80037ECCC8CE8CE00CCCCC400";
    attribute INIT_30 of inst : label is "0008808C00CE7FF0CCCCC80000FFB10021842100000000840000000042107800";
    attribute INIT_31 of inst : label is "00000000000037FF00000000F7300000008808CC0C67FF00CCCCCC400000F640";
    attribute INIT_32 of inst : label is "00880004F004093B400000803B3B10000444C0009090028C000422222EE2C803";
    attribute INIT_33 of inst : label is "C0808C2E30000101E2C8040C01000003C0808C2E00000414E2C8040C1050808F";
    attribute INIT_34 of inst : label is "000F00006861086E686100003C0168000CEECEEE70C300003C0690086ECEEEEC";
    attribute INIT_35 of inst : label is "0008700F80000111084300070111110000C248000008700000000F001110000F";
    attribute INIT_36 of inst : label is "0010000C4480000000000C440122224888888F40000888880008888800888888";
    attribute INIT_37 of inst : label is "11111111000000301111111103000000F1111111F00000321111111122000000";
    attribute INIT_38 of inst : label is "1111111100000032111111112100000011111111000002235591248022000000";
    attribute INIT_39 of inst : label is "F1111111F0000032111111112200000011111111000000121111111F2100000F";
    attribute INIT_3A of inst : label is "1111111100000223111111112200000011111111000000301111111103000000";
    attribute INIT_3B of inst : label is "11111111000000121111111F2100000F11111111000000321111111121000000";
    attribute INIT_3C of inst : label is "0019BEC80F8002648CCCC440473008F00019BEC80F8000008CEB9100000008F0";
    attribute INIT_3D of inst : label is "0000F00F19554443000078002111112C044CCCC80F8002648CEB9100473008F0";
    attribute INIT_3E of inst : label is "19555555244808429955599A2488442A99999992999999991199999900000842";
    attribute INIT_3F of inst : label is "0895576400000000467559800000000040202202583203032020224803023209";
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
    attribute INIT_01 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_02 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_03 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_04 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_05 of inst : label is "FFFFDFFFFDFFFFFBFFDFFFFFFFFFFFFF011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "FEC804C2FDFFFFFF1C4ADEFFDABAADFF00D7E636FAC88C8CD3EE7100888CC8CB";
    attribute INIT_07 of inst : label is "FFF739CFFDFFECC9FC937FFFDCCEFFFF1EEFFFEFFEDBBBB0FFFFFEE03BBBBDEF";
    attribute INIT_08 of inst : label is "FFFFFFFF777777FFFFFFFFFFFFFFFFFF00622644FCB744BC44622600CB447BCF";
    attribute INIT_09 of inst : label is "FFFFDFFF31033311FFDFFFFF3777337700000000000000000000000000000000";
    attribute INIT_0A of inst : label is "003337FF00000377F773100077731000003337FF00000377F7FDDCC077310000";
    attribute INIT_0B of inst : label is "0CEFF78000000000BFEFF8000033000000CCDFFF00000377F7F7333077331100";
    attribute INIT_0C of inst : label is "0CFFF78000000000AFFFEE00330000000EFFF7800000000088FFFFC000330000";
    attribute INIT_0D of inst : label is "EC1869E0FDFEFFFAE3CB49A1FFFEFFFFFFFFDFFFF1111F11FFDFFFFF11F3111F";
    attribute INIT_0E of inst : label is "00008C44000133314444440001333100F077BD2DFDFFEFFB3C0B77BCFFFFFFFF";
    attribute INIT_0F of inst : label is "11110011FFFF7311FFFF737F000000370000E311000374431111110003744300";
    attribute INIT_10 of inst : label is "007F970E001321033E0000000300000031000000FFFFFFF7FFFFFFFF11137FFF";
    attribute INIT_11 of inst : label is "00008422000000000080000000000000079970E301221030113E000000030000";
    attribute INIT_12 of inst : label is "0037F6E900113377FF9E4C80377310000089B7FF13777001FFFF900077771000";
    attribute INIT_13 of inst : label is "0CCCC9FF00000755FF9CCCC0557000000000C9FF00000331FF9C000000011100";
    attribute INIT_14 of inst : label is "000137730000EFFF00000C00003FFFE08000000031000000001377770888084B";
    attribute INIT_15 of inst : label is "EEFF7310FFEEEEEEFFFFFF3FEEEEEEEF0CFFFFFF733100000000037733FFFF31";
    attribute INIT_16 of inst : label is "00000007FFFFE00000000FFF111FFFFF777FFFFFFEFF777FFEFF777FEFFF777F";
    attribute INIT_17 of inst : label is "00000000888888880000000088888888F0000000F88888880000000088888888";
    attribute INIT_18 of inst : label is "0000000088888888000000008888888800000000888888880001FFFF88888888";
    attribute INIT_19 of inst : label is "F00000EAF8888888A20000008888888800000000888888880000000F8888888F";
    attribute INIT_1A of inst : label is "0000000E88888888000000008888888800000068888888888600000088888888";
    attribute INIT_1B of inst : label is "000000E8888888888E00000F8888888F000000EC88888888A200000088888888";
    attribute INIT_1C of inst : label is "0EFFFFF20037444727FFFFE0744473000EFFF10000374447001FFFE074447300";
    attribute INIT_1D of inst : label is "EEEFFFFC1000CEEE0000CFFFFFFFFFF70EFFFFF20037444727FFFFE074447300";
    attribute INIT_1E of inst : label is "10008880113FFFFF000000003FF731100000000100000000F100000000000FFF";
    attribute INIT_1F of inst : label is "00000000017E888E00000000E888E71000EA0686FAC88C8C0E00E000888CC8CB";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "0013777300000000567310000000000020E80888012442420800820446402430";
    attribute INIT_27 of inst : label is "000084AC0000010036C8000011000000001000100000010F0664010080100000";
    attribute INIT_28 of inst : label is "0800002477762600BFFFFFDA00A47FFFFF9DD9BB00374431BB9DD9FF13447300";
    attribute INIT_29 of inst : label is "00000000C4744466000000004888CC880FFDF0FD0F9FF0FDFF0F5FF0FF0FBFF0";
    attribute INIT_2A of inst : label is "003010280000000289400000002000100030020900000020894081D002000000";
    attribute INIT_2B of inst : label is "004049EE00000000C20410000022003000C0402800000002A810203002000020";
    attribute INIT_2C of inst : label is "004058EE00000000C08200E022003000002058EE00000000C404060000220010";
    attribute INIT_2D of inst : label is "00000000000000000000000000000000000000000CEAE0EE000000006E0CE6E0";
    attribute INIT_2E of inst : label is "00FF733300013331333333000133310000021000000000000000300000000000";
    attribute INIT_2F of inst : label is "1111001199884311899842480000003400FF1000000374430000000013744300";
    attribute INIT_30 of inst : label is "007F9FF10013213001FFD8000033310021000000999999849999999911124899";
    attribute INIT_31 of inst : label is "00008CEE00000000EC800000000000000799FF10012213000001F62000003320";
    attribute INIT_32 of inst : label is "80020CE900000020FF9EC070020000000080020A000200370A09000077777300";
    attribute INIT_33 of inst : label is "C0803777000007557773800C5570000000003777002264547773000000000231";
    attribute INIT_34 of inst : label is "000124420000E10F00000C00003C01E007FFEFF72100000000124554FFFF7F73";
    attribute INIT_35 of inst : label is "AA9842100122AAAA90000E2CAAAAAAA90C300899423100000000034422C00C21";
    attribute INIT_36 of inst : label is "000000070001E00000000F00111E000F444C000E1218444C12184448E10C4448";
    attribute INIT_37 of inst : label is "00000068888888888600000088888888F00000EAF8888888A200000088888888";
    attribute INIT_38 of inst : label is "000000EC88888888A2000000888888880000000E888888880001E00F88888888";
    attribute INIT_39 of inst : label is "F00000EAF8888888A200000088888888000000E8888888888E00000F8888888F";
    attribute INIT_3A of inst : label is "0000000E88888888000000008888888800000068888888888600000088888888";
    attribute INIT_3B of inst : label is "000000E8888888888E00000F8888888F000000EC88888888A200000088888888";
    attribute INIT_3C of inst : label is "0E31000D00377447D80013E0744773000E31000000377667000013E076677300";
    attribute INIT_3D of inst : label is "AAA9803C1000C2220000C30E800000870E31000D00376667D80013E076667300";
    attribute INIT_3E of inst : label is "10008880112C100E000000002C8421100000000100000000E100000000000F00";
    attribute INIT_3F of inst : label is "00000000017EECCE00000000ECCEE71020EA0686012442420E00E00446402430";
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
