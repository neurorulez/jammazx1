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
    attribute INIT_01 of inst : label is "0EE00000002480000888C88800088000FFFFEEC88CEFFFFF002226C80C22AAEC";
    attribute INIT_02 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_03 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_04 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_05 of inst : label is "00000000C295552C0248913D000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "000000000000000000000000000000000000037700000000B773000000000000";
    attribute INIT_07 of inst : label is "111FFFFFC295512C0000000000000000CCCCFEC8113211110000000000000000";
    attribute INIT_08 of inst : label is "0000000004F0078800000000870788870000113F00000374F311000046200000";
    attribute INIT_09 of inst : label is "0000000004899707000000008870788700000000048896070000000088707887";
    attribute INIT_0A of inst : label is "0000E00013333333000E00003333333100088CCE17FFFFFFECC88000FFFFFF71";
    attribute INIT_0B of inst : label is "000000CA000001073AC0000087010000007FF00F00000001FF00FF70F1000000";
    attribute INIT_0C of inst : label is "00000888F7777777888000007777777F00000004000000204000000002000000";
    attribute INIT_0D of inst : label is "00088CCE17FFFFFFECC88000FFFFFF710000000FF1111117F00000007111111F";
    attribute INIT_0E of inst : label is "00000000000001070CE6100087010000084AE6BD0C6DB5EB5B7EC0005EB56D00";
    attribute INIT_0F of inst : label is "D3108CD3AB9DCAEA31C80D31AEACD9BA0000003E00000107C000000087010000";
    attribute INIT_10 of inst : label is "000000000000001000000000110000001111111F11111111F1111111FFFFFFFF";
    attribute INIT_11 of inst : label is "0000000000000003000000001000000000000000000337770000000022330032";
    attribute INIT_12 of inst : label is "0000000000000023000000002000000000000000000000130000000010000000";
    attribute INIT_13 of inst : label is "0000000000000002000000882211319F78000078ABDDCAAE80000780EAACD9BA";
    attribute INIT_14 of inst : label is "0000000000201111000000883713119F0000000011116F660000000072011110";
    attribute INIT_15 of inst : label is "0000000000011001000000881330119F00000000731304740000000047031110";
    attribute INIT_16 of inst : label is "0000000000111211000000881213119F00000000731234470000000044331110";
    attribute INIT_17 of inst : label is "B730FFF7AB9DCAAE77FF0B73EAACD9BA00000000731107440000000074031110";
    attribute INIT_18 of inst : label is "FFFF0000FFF00000FF000000F0000000FFFFFFFF00000000D6BD6BD6FFFFFFFF";
    attribute INIT_19 of inst : label is "6FF6006F13437FFEF6006FF68CE73431FFFFFFFFFFFFFFF0FFFFFF00FFFFF000";
    attribute INIT_1A of inst : label is "000008881172FDB500000000643110003B12913F000BB000744CC447FFFFFFFF";
    attribute INIT_1B of inst : label is "0000000000F93FFF00000000FFF77FD08048000022F637CF00084008C736E320";
    attribute INIT_1C of inst : label is "488001E02110369F0000086152312448038000C000200036020C210013144800";
    attribute INIT_1D of inst : label is "12C8C869003DE5FAE80C42112BD7F500168008CC08877ACB8F800084A6F61224";
    attribute INIT_1E of inst : label is "004000060A81008A40026000000880480000CEFF6FFFFFFFE8000000FFFFFF30";
    attribute INIT_1F of inst : label is "E307A63E3092798AEEEB3DE929343DD35263E1A55739DF551C4DD2DE8D5FCDE0";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "0EE00000002480000888C88800088000FFFFEEC88CEFFFFF002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "00000000C295552C0000913D000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "084300000003480000034800842100000000348800000000C884300030000000";
    attribute INIT_27 of inst : label is "111FFFFFC295512C0000000000000000CCCCFEC8113211110000000000000000";
    attribute INIT_28 of inst : label is "0000000004F0078800000000870788870000113F00000374F311000046200000";
    attribute INIT_29 of inst : label is "0000000004899707000000008870788700000000048896070000000088707887";
    attribute INIT_2A of inst : label is "0000000000108DCC00000000CCD8010000000000000000000000000000000000";
    attribute INIT_2B of inst : label is "000000CA000012783AC000007872100000000FF00000001E00FF00000E100000";
    attribute INIT_2C of inst : label is "0000088FF7567735F88000005377657F000088EA000137DFAE880000FD731000";
    attribute INIT_2D of inst : label is "0000000000000000000000000000000000000000000022EF00000000FE220000";
    attribute INIT_2E of inst : label is "00000000000012780CE6100078721000008C48E600CA5EB5AEC80000E5EBD000";
    attribute INIT_2F of inst : label is "D3108CD3AB9DCAEA31C80D31AEACD9BA0000003E00001278C000000078721000";
    attribute INIT_30 of inst : label is "000000000000001000000000110000001111111F11111111F1111111FFFFFFFF";
    attribute INIT_31 of inst : label is "0000000000000003000000001000000000000000000337770000000022330032";
    attribute INIT_32 of inst : label is "0000000000000023000000002000000000000000000000130000000010000000";
    attribute INIT_33 of inst : label is "0000000000000002000000882211319F78000078ABDDCAAE80000780EAACD9BA";
    attribute INIT_34 of inst : label is "0000000000201111000000883713119F0000000011116F660000000072011110";
    attribute INIT_35 of inst : label is "0000000000011001000000881330119F00000000731304740000000047031110";
    attribute INIT_36 of inst : label is "0000000000111211000000881213119F00000000731234470000000044331110";
    attribute INIT_37 of inst : label is "B730FFF7AB9DCAAE77FF0B73EAACD9BA00000000731107440000000074031110";
    attribute INIT_38 of inst : label is "FFFF0000FFF00000FF000000F0000000FFFFFFFFFFFFFFFFBD6BD6BD00000000";
    attribute INIT_39 of inst : label is "6FF6006F13437FFEF6006FF68CE73431FFFFFFFFFFFFFFF0FFFFFF00FFFFF000";
    attribute INIT_3A of inst : label is "000008881172FDB500000000643110003B12913F000BB000744CC447FFFFFFFF";
    attribute INIT_3B of inst : label is "0000000000F93FFF00000000FFF77FD08048000022F637CF00084008C736E320";
    attribute INIT_3C of inst : label is "488001E02110369F0000086152312448038000C000200036020C210013144800";
    attribute INIT_3D of inst : label is "12C8C869003DE5FAE80C42112BD7F500168008CC08877ACB8F800084A6F61224";
    attribute INIT_3E of inst : label is "0C000024848100C4540045008000C0080000CEFF6FFFFFFFE8000000FFFFFF30";
    attribute INIT_3F of inst : label is "E46DC4CC75E3DFBC218000006B712580404EC000DE7BEB4784210000008F6266";
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
    attribute INIT_01 of inst : label is "0FF99998000001240123232100011000800000000000000C06F999F706FB9960";
    attribute INIT_02 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_03 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_04 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_05 of inst : label is "00000000349AAA430F00135000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000007000000000000000";
    attribute INIT_07 of inst : label is "999F999F349AA84364646464000000003333F7310000000000000000E6CC631F";
    attribute INIT_08 of inst : label is "02E20C22000000002C0C222C0000000000000CE2842100222640000022001248";
    attribute INIT_09 of inst : label is "04222C0C0000000022C0C22C00000000026A220C0000000022C0C22C00000000";
    attribute INIT_0A of inst : label is "8CCCCDEE00000000EEDCCCC8000000008EFFFFFF0013377FFFFFFFE8F7733100";
    attribute INIT_0B of inst : label is "00000C1F000000000F1C0000F00000000000100F00000000FF00100000000000";
    attribute INIT_0C of inst : label is "F8CEFFFF00000000FFFFEC8F00000000EEEEEEEE00000000EEEEEEEE00000000";
    attribute INIT_0D of inst : label is "8EFFFFFF0013377FFFFFFFE8F7733100E0000008000000008000000C00000000";
    attribute INIT_0E of inst : label is "00000C0E000000001F1C0000F0000000013D6FA500132756FA5AF5E033111000";
    attribute INIT_0F of inst : label is "1EC033FE01344FFCEEF30DE0CFF4431000000C0F000000001F0C0000F0000000";
    attribute INIT_10 of inst : label is "000000C800000000CC880000000000008888888F88888888F8888888FFFFFFFF";
    attribute INIT_11 of inst : label is "0000008800000000CC40000000000000CEABFBBF00000000BBFBFFFE00000000";
    attribute INIT_12 of inst : label is "000000CF00000000C0000000000000000000000800000000CC00000000000000";
    attribute INIT_13 of inst : label is "00002000000000008A6E8447000000000FC023FF01347CCFFF320CF0FCC74310";
    attribute INIT_14 of inst : label is "0000048C00000000C4EAE44700000000824EDCEC00000320DECEEEC800000000";
    attribute INIT_15 of inst : label is "00426C8C000000004CAEC04700000000FECECFDD00000000FDCECCC800000000";
    attribute INIT_16 of inst : label is "880088CC000000000C8EC04700000000FECEECDF00000000DDEECCC800000000";
    attribute INIT_17 of inst : label is "3CC033FC01347CCFCC330EC0FCC74310764ECDFD00000000DFCECCC800000000";
    attribute INIT_18 of inst : label is "FFFF0000FFF00000FF000000F0000000FFFFFFFF000000006BD6BD6BFFFFFFFF";
    attribute INIT_19 of inst : label is "8C2CEFF70000236F137EC2C8F6320000FFFFFFFFFFFFFFF0FFFFFF00FFFFF000";
    attribute INIT_1A of inst : label is "4EBEBF7800000001ACC8008800000000FC98C8DF06C89F70E223322EFFFFFFFF";
    attribute INIT_1B of inst : label is "000004CC00000111C88008C0000000104B492ACC00012100CA2942B401210000";
    attribute INIT_1C of inst : label is "0011D6D500843000AC23100012480000000168C4010042106A81000000400012";
    attribute INIT_1D of inst : label is "884EDF5E84211001EDBFB442B50112484809FBCE1000001192EBC10017800000";
    attribute INIT_1E of inst : label is "1100C0040004A200420060204010004200EFFFFF000177FFFFFEE880FF733000";
    attribute INIT_1F of inst : label is "5213CB27219CB223F7077E07210C32C3C80E072EC423C4DCE3FC36C35CE1FC02";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "0FF99998000001240123232100011000800000000000000C06F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00000000349AAA430F00011000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "124800000008421000008430124800000000000700000000F700000000000000";
    attribute INIT_27 of inst : label is "999F999F349AA84364646464000000003333F7310000000000000000E6CC631F";
    attribute INIT_28 of inst : label is "02E20C22000000002C0C222C0000000000000CE2842100222640000022001248";
    attribute INIT_29 of inst : label is "04222C0C0000000022C0C22C00000000026A220C0000000022C0C22C00000000";
    attribute INIT_2A of inst : label is "0080080000000111008008001110000000000000000000000000000000000000";
    attribute INIT_2B of inst : label is "0000C0D30000000FC3D0C0000F00000000000FF00000000100FF0000F1000000";
    attribute INIT_2C of inst : label is "F8CE7BDE00000000EDB7EC8F0000000000111111000000011111110010000000";
    attribute INIT_2D of inst : label is "00000000000000000000000000000000000088CF000008CFFC880000FC800000";
    attribute INIT_2E of inst : label is "0000C0C20000000FD3D0C0000F0000000012DA5F00011323A5F5AE0011000000";
    attribute INIT_2F of inst : label is "1EC033FE01344FFCEEF30DE0CFF443100000C0C30000000FD3C0C0000F000000";
    attribute INIT_30 of inst : label is "000000C800000000CC880000000000008888888F88888888F8888888FFFFFFFF";
    attribute INIT_31 of inst : label is "0000008800000000CC40000000000000CEABFBBF00000000BBFBFFFE00000000";
    attribute INIT_32 of inst : label is "000000CF00000000C0000000000000000000000800000000CC00000000000000";
    attribute INIT_33 of inst : label is "00002000000000008A6E8447000000000FC023FF01347CCFFF320CF0FCC74310";
    attribute INIT_34 of inst : label is "0000048C00000000C4EAE44700000000824EDCEC00000320DECEEEC800000000";
    attribute INIT_35 of inst : label is "00426C8C000000004CAEC04700000000FECECFDD00000000FDCECCC800000000";
    attribute INIT_36 of inst : label is "880088CC000000000C8EC04700000000FECEECDF00000000DDEECCC800000000";
    attribute INIT_37 of inst : label is "3CC033FC01347CCFCC330EC0FCC74310764ECDFD00000000DFCECCC800000000";
    attribute INIT_38 of inst : label is "FFFF0000FFF00000FF000000F0000000FFFFFFFFFFFFFFFFD6BD6BD600000000";
    attribute INIT_39 of inst : label is "8C2CEFF70000236F137EC2C8F6320000FFFFFFFFFFFFFFF0FFFFFF00FFFFF000";
    attribute INIT_3A of inst : label is "4EBEBF7800000001ACC8008800000000FC98C8DF06C89F70E223322EFFFFFFFF";
    attribute INIT_3B of inst : label is "000004CC00000111C88008C0000000104B492ACC00012100CA2942B401210000";
    attribute INIT_3C of inst : label is "0011D6D500843000AC23100012480000000168C4010042106A81000000400012";
    attribute INIT_3D of inst : label is "884EDF5E84211001EDBFB442B50112484809FBCE1000001192EBC10017800000";
    attribute INIT_3E of inst : label is "101840000100E601860046004001004600EFFFFF000177FFFFFEE880FF733000";
    attribute INIT_3F of inst : label is "5D7DB7ED57933001BF4D6A21248000015BD36A5F3233480048088444072FE880";
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
