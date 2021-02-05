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
    attribute INIT_00 of inst : label is "00088CCC37FFFECCEEEEF773880000002E0E22E0002E20E22E0E22E00AAAE0E2";
    attribute INIT_01 of inst : label is "000080000000EF73C000000013100000000000000A8C62310000000000000000";
    attribute INIT_02 of inst : label is "FFFFFFFF00000001640000000000000000000000000001370000000037720000";
    attribute INIT_03 of inst : label is "00000000000000000FFFFFFF1100000000000000FFFFFFFF00000000D8800000";
    attribute INIT_04 of inst : label is "FF000000F77731000000000000000000000000000000000000000000007FFFFF";
    attribute INIT_05 of inst : label is "002333333333333333731000322000000000000000000000000000FF0013777F";
    attribute INIT_06 of inst : label is "0000089700000137FF980000F731000000013733000002233333320033333333";
    attribute INIT_07 of inst : label is "0000099F00000137FF980000F7310000000000000FFFFF0F00000000FF0FFFFF";
    attribute INIT_08 of inst : label is "000009FFFFFFFFFFFFFFFFF7FFFFFFF1000000000FFFFF0F00000000FF0FFFFF";
    attribute INIT_09 of inst : label is "0CEFFFFF008CFF73FFFFFB007FFFFFFF80000000FFFFFFFF00008EFFFFFFC880";
    attribute INIT_0A of inst : label is "00000000C8DFFD8C0EE8CE62C813318C037EC8006FFFFFFF000EFFC8FFFFFFFF";
    attribute INIT_0B of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_0C of inst : label is "0022EE220EE000EE00EE22220EE226C808C622640EE888EE002226C80C22AAEC";
    attribute INIT_0D of inst : label is "0EE222EC0000EE00046222EC0EE8CE620EE888800CE222EC0EE08CEE00EE2222";
    attribute INIT_0E of inst : label is "000000000000000000000000000000000000000000000000000000000000EE00";
    attribute INIT_0F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_10 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_11 of inst : label is "FFFF00FFFFFF00FFFFFF77FCFFFF00FFFFFF00FF000000000000000000000000";
    attribute INIT_12 of inst : label is "0000000000000000FF00EEEEFF00FFFF8000FFFFFF00FFFFFF00FFFFCCCCCCC8";
    attribute INIT_13 of inst : label is "FFF00FFF0000000000000000EEEEEEE00000000F0000000F0000000F0000000F";
    attribute INIT_14 of inst : label is "F00FFFF0F00FFFF0000000000000000000000000FFF00FFFFFF00FFFFFF33FFF";
    attribute INIT_15 of inst : label is "0FFFF00F0000000F0FFFF00F000000000000000000000000F0000000F00FFFF0";
    attribute INIT_16 of inst : label is "00000000FFF00FFFFFFCCF73FFF00FFF00000000000000000000000000000000";
    attribute INIT_17 of inst : label is "0000000000000000F000FFFF1000FFFFF000FFFF000077770000000000000000";
    attribute INIT_18 of inst : label is "7FFFCCFF000000000000000000FFFF0000FFFF0000FFFF000077770000000000";
    attribute INIT_19 of inst : label is "FF00FFFFFF00FFFFF700FFFF00007777000000008CEFFFFEFFFF00FFFFFF00FF";
    attribute INIT_1A of inst : label is "FFF00000FFFFF00F0000000F0000000F0000000F0000000F00000000C800FFFF";
    attribute INIT_1B of inst : label is "377FEEEE00000088CCC88000CCEFFF73FFFFFFFFFFF00000FFFCCCCCFFF00000";
    attribute INIT_1C of inst : label is "000000000FFFFF0F00000000FF0FFFFF0000089F00000137FF980000F7310000";
    attribute INIT_1D of inst : label is "0000000000F0FFFF000000001FFFF0F000000017000000010710000011000000";
    attribute INIT_1E of inst : label is "77331100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00113377137FFFFF";
    attribute INIT_1F of inst : label is "0000000000EE00000CE222EC08C622EE8889C8A80A8C62311326C8A0FFFFF731";
    attribute INIT_20 of inst : label is "00000000000001330000088076CCC8802E0E22E0002E20E22E0E22E00AAAE0E2";
    attribute INIT_21 of inst : label is "DFEEFECC01FFFFFFEEEECCCCFFFFFFF300000000080420000000000000000000";
    attribute INIT_22 of inst : label is "73100000FFFFFFF69BFFFF72FFFF8000017EECCC06FFFCC8FE88CC63C88DF700";
    attribute INIT_23 of inst : label is "13377FFF008CFFFFF00026F7EEFFFFFF8CCEEEFF0CECC800FECCEE61277FFEC8";
    attribute INIT_24 of inst : label is "FF000000D5773100000000000231000000FFFEEE000013FFCC880008FF800000";
    attribute INIT_25 of inst : label is "00EFFF73FFFFFFFF33731000FEECC8800000000000001320000000FF0013765D";
    attribute INIT_26 of inst : label is "0000001700000000071000000000000000013733088CCEEF37FFFE00FFFFFFFF";
    attribute INIT_27 of inst : label is "0000088800000137F8880000F73100000000000000F0FFFF000000001FFFF0F0";
    attribute INIT_28 of inst : label is "0FFFF600C889FFFE01BFFFF7CCEFFFF1000000000F0F00F000000000E0F00F0F";
    attribute INIT_29 of inst : label is "0CEFFFF1008CFF7300000CFF7FFEEECC800000007773337F00008EFFFFFFC880";
    attribute INIT_2A of inst : label is "11F0F11F00CCCC000EE8CE6200CCCC00037EC8006FFFFFFC000EFFC888888002";
    attribute INIT_2B of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_2C of inst : label is "0022EE220EE000EE00EE22220EE226C808C622640EE888EE002226C80C22AAEC";
    attribute INIT_2D of inst : label is "0EE222EC0000EE00046222EC0EE8CE620EE888800CE222EC0EE08CEE00EE2222";
    attribute INIT_2E of inst : label is "000000000000000000000000000000000000000000000000000000000000EE00";
    attribute INIT_2F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_30 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_31 of inst : label is "FFFF00FFFFFF00FFFFFF77FCFFFF00FFFFFF00FF000000000000000000000000";
    attribute INIT_32 of inst : label is "0000000000000000FFF0EEEEFF00FFFF8000FFFFFF00FFFFFF00FFFFCCCCCCC8";
    attribute INIT_33 of inst : label is "FFF00FFF0000000000000000EEEEEEE00000000F0000000F0000000F0000000F";
    attribute INIT_34 of inst : label is "F00FFFF0F00FFFF0000000000000000000000000FFF00FFFFFF00FFFFFF33FFF";
    attribute INIT_35 of inst : label is "0FFFF00F0000000F0FFFF00F000000000000000000000000F0000000F00FFFF0";
    attribute INIT_36 of inst : label is "00000000FFF00FFFFFFCCF73FFF00FFF00000000000000000000000000000000";
    attribute INIT_37 of inst : label is "0000000000000000F000FFFF1000FFFFF000FFFF000077770000000000000000";
    attribute INIT_38 of inst : label is "7FFFCCFF000000000000000000FFFF0000FFFF0000FFFF000077770000000000";
    attribute INIT_39 of inst : label is "FF00FFFFFF00FFFFF700FFFF00007777000000008CEFFFFEFFFF00FFFFFF00FF";
    attribute INIT_3A of inst : label is "FFF00000FFFFF00F0000000F0000000F0000000F0000000F00000000C800FFFF";
    attribute INIT_3B of inst : label is "08800000088CCC670000000033100000FFFFFFFFFFF00000FFFCCCCCFFF00000";
    attribute INIT_3C of inst : label is "000000000F0F00F000000000E0F00F0F0000088800000137F8880000F7310000";
    attribute INIT_3D of inst : label is "000000000FFFFF0F00000000FF0FFFFF0000089F00000136FF980000E6310000";
    attribute INIT_3E of inst : label is "77331100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00113377137FFFFF";
    attribute INIT_3F of inst : label is "0000000000EE00000CE222EC08C622EE8808C8280804200000024080FFFFF731";
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
    attribute INIT_00 of inst : label is "CEFFF73300011333110000007777FEEC23032230002300322303223002223032";
    attribute INIT_01 of inst : label is "000013EE00000000FFFE60000000000000000000C73001400000000000000000";
    attribute INIT_02 of inst : label is "7FF737F800000000000000000000000000000CEE00000000EFE4000000000000";
    attribute INIT_03 of inst : label is "00000000000000000EF73337000000008CCEFFC8FFFFFFFF8C40000071000000";
    attribute INIT_04 of inst : label is "FFFFEC8890000000880000000000000000000000000000000EEC888800EFFFFF";
    attribute INIT_05 of inst : label is "23333000600660060000000060066000000000880000000088CEFFFF00000009";
    attribute INIT_06 of inst : label is "00000FF60000000006FF00003000000000000000000660060003333260066006";
    attribute INIT_07 of inst : label is "00000F6000000000606F0000300000000EEEC88F01117FFFFF88CEEEFFFF7111";
    attribute INIT_08 of inst : label is "8EFFF7FF7FFFF711FFFFFDC81377FFF70EEEC88F01117FFFFF88CEEEFFFF7111";
    attribute INIT_09 of inst : label is "1377FFFF8F731CCEFFFFCC80EFF73111FFFEEEEEFF77FFFF8CFFF731FFFFFB10";
    attribute INIT_0A of inst : label is "0000000031BFFB130FF136C8318CC81308CFFFFF001FFFFFEEEFFFFFFFFFFF7F";
    attribute INIT_0B of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_0C of inst : label is "0088FF880FF111FF00FF99980FF88C73037C88C4037C8C7306F999F706FB9960";
    attribute INIT_0D of inst : label is "0FF999F60088FF8806F99D500FF889F70FF888F707F888F70FF731FF00FF0000";
    attribute INIT_0E of inst : label is "0000000000000000000000000000000000000000000000000000000000CF11FC";
    attribute INIT_0F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_10 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_11 of inst : label is "FFFF00FFFFFF88FFFFFF00FFFFFF00FFFFFFFFF7000000000000000000000000";
    attribute INIT_12 of inst : label is "00000000FE000000FF00FFFF7300FFFFFF00FFFFFF00FFFF3100FFFFFFFF33FF";
    attribute INIT_13 of inst : label is "37FFFF730000000000000000111111180000000F0000000F0000000F00000001";
    attribute INIT_14 of inst : label is "F00FFFF0100137FF000000000000000088800888FFF00FFFFFFCCFFFFFF00FFF";
    attribute INIT_15 of inst : label is "0777700F0EEEE00FFF73100F000000000000000000000000F008CEFFF00FFFF0";
    attribute INIT_16 of inst : label is "00000000FFF00FFFFFF33FECFFF00FFF000000000000000000000000FFEC8000";
    attribute INIT_17 of inst : label is "0000000000000000F000FFFF8000FFFFF000FFFF000000000000000000000000";
    attribute INIT_18 of inst : label is "00133331000000000000000000FFFF00FFFFFF0000FFFF000000000000000000";
    attribute INIT_19 of inst : label is "FF00FFFFFF00FFFF0000FFFF0000000000000000FFFF00FFFFFF00FFFFFF00FF";
    attribute INIT_1A of inst : label is "FFFFFFFF0000000F0000000F0000000F0000000F0000000F00000000FF00FFFF";
    attribute INIT_1B of inst : label is "00000011CEEF7777337FFFEC33311000FFF00000FFF00000FFF33333FFF00000";
    attribute INIT_1C of inst : label is "0EEEC88F01117FFFFF88CEEEFFFF711100000F6000000000006F000030000000";
    attribute INIT_1D of inst : label is "00C0C88F00207FFFFF88C0C00FFF70200000000F0000000055000000C0000000";
    attribute INIT_1E of inst : label is "0000000033111000F7777733FFFFFFFF3377777F000111330000000000001377";
    attribute INIT_1F of inst : label is "0000000000FF99980FF000FF037C899910141291C73001400410037C77310000";
    attribute INIT_20 of inst : label is "000008CC00000000E63331100000011023032230002300322303223002223032";
    attribute INIT_21 of inst : label is "1FFFFFFFC6733331EEE5DFFC1373373000000000061001000000000000000000";
    attribute INIT_22 of inst : label is "0008C80773111000FFFFF0000113376800CFF31184633311101BFF301337F600";
    attribute INIT_23 of inst : label is "0000CFFF86311110F1C8CCC80011113F73310037FFFF710073BFFF728EFFFF10";
    attribute INIT_24 of inst : label is "DDFFEC88F66000008AEC000000000000001FFFFF088CEFFFF1137777FF1000CE";
    attribute INIT_25 of inst : label is "EFFFF880FFFFFFFF00000000FFFFFFFF0000CEA80000000088CEF3DD0000066F";
    attribute INIT_26 of inst : label is "0000000900000000F9000000C000000000000000FFFFFFFF088FFFFEFFFFFFFF";
    attribute INIT_27 of inst : label is "00000FFF00000000FFFF0000F000000000C0C88F00207FFFFF88C0C00FFF7020";
    attribute INIT_28 of inst : label is "710CC8007FFFF71102FFFDC11377FFF70E2E00000131000000000E2EF0000131";
    attribute INIT_29 of inst : label is "1377FFFF8F731ECEE000337FEFF731117FFEEEEE008800008CFFF7311FFFFB10";
    attribute INIT_2A of inst : label is "11101111003333000FF136C80033330008CFFFFF001FFFFFE66F733373100080";
    attribute INIT_2B of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_2C of inst : label is "0088FF880FF111FF00FF99980FF88C73037C88C4037C8C7306F999F706FB9960";
    attribute INIT_2D of inst : label is "0FF999F60088FF8806F99D500FF889F70FF888F707F888F70FF731FF00FF0000";
    attribute INIT_2E of inst : label is "0000000000000000000000000000000000000000000000000000000000CF11FC";
    attribute INIT_2F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_30 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_31 of inst : label is "FFFF00FFFFFF88FFFFFF00FFFFFF00FFFFFFFFF7000000000000000000000000";
    attribute INIT_32 of inst : label is "00000000FE000000FFF0FFFF7300FFFFFF00FFFFFF00FFFF3100FFFFFFFF33FF";
    attribute INIT_33 of inst : label is "37FFFF730000000000000000111111180000000F0000000F0000000F00000001";
    attribute INIT_34 of inst : label is "F00FFFF0100137FF000000000000000088800888FFF00FFFFFFCCFFFFFF00FFF";
    attribute INIT_35 of inst : label is "0777700F0EEEE00FFF73100F000000000000000000000000F008CEFFF00FFFF0";
    attribute INIT_36 of inst : label is "00000000FFF00FFFFFF33FECFFF00FFF000000000000000000000000FFEC8000";
    attribute INIT_37 of inst : label is "0000000000000000F000FFFF8000FFFFF000FFFF000000000000000000000000";
    attribute INIT_38 of inst : label is "00133331000000000000000000FFFF00FFFFFF0000FFFF000000000000000000";
    attribute INIT_39 of inst : label is "FF00FFFFFF00FFFF0000FFFF0000000000000000FFFF00FFFFFF00FFFFFF00FF";
    attribute INIT_3A of inst : label is "FFFFFFFF0000000F0000000F0000000F0000000F0000000F00000000FF00FFFF";
    attribute INIT_3B of inst : label is "0113336E01100000CC80000000000000FFF00000FFF00000FFF33333FFF00000";
    attribute INIT_3C of inst : label is "0EEE00000131000000000E2EF000013100000FFF00000000FFFF0000F0000000";
    attribute INIT_3D of inst : label is "0EEEC88F01117FFFFF88CEEEFFFF711100000FF000000000AAFF000030000000";
    attribute INIT_3E of inst : label is "0000000033111000F7777733FFFFFFFF3377777F000111330000000000001377";
    attribute INIT_3F of inst : label is "0000000000FF99980FF000FF037C899910140091061001000010016077310000";
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
