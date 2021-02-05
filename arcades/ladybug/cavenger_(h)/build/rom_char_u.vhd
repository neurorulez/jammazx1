-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity rom_char_u is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of rom_char_u is

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
    attribute INIT_00 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_01 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_02 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_03 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_04 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_05 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFF00FC00000C8808C0000000000000000000000000";
    attribute INIT_08 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_09 of inst : label is "FFFFFFFFF0000000000000000000000000000000000000000000000000000000";
    attribute INIT_0A of inst : label is "000000200040000080000000000000000000000000000000000000000FFFFFFF";
    attribute INIT_0B of inst : label is "F0000000F00000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00010000";
    attribute INIT_0C of inst : label is "EFFFFFFFFF6666FFF6F7FFFFFFFE8000000000008C6666C80000000000000000";
    attribute INIT_0D of inst : label is "F1F1FFFFFFFFFF303FF33FF3FF33F3FFFF1111FFF7F7F3BFFFFFFFFEEEEEEEEE";
    attribute INIT_0E of inst : label is "2E3EE3E20001137FFFCCCCFFFFF7773310000000FFFFFFFFFFFFFFFFFF1111FF";
    attribute INIT_0F of inst : label is "C8000000FFFFFFFF2FE300002E3E2FE32F0F7C007C0000002E3EAF632F6C8000";
    attribute INIT_10 of inst : label is "000000007EC93777BDE73100F7BDE7337EDB7FF07EC937FFF7BCFFF0F7BCF77E";
    attribute INIT_11 of inst : label is "DD888000CFFFBFFFFFFFFFFDC8000000CCCCC800000000880000000888880000";
    attribute INIT_12 of inst : label is "FFFFF51000000000888CEF31EECCC888FFFEEFFFFFFFFFFFF7720000CCCE7710";
    attribute INIT_13 of inst : label is "FFFFFFFFF7733990EC811222FFFF7394048881130008CF733377FEEE00137FFF";
    attribute INIT_14 of inst : label is "D1C1509CD0937FFFD1C11C1D30448822122F442211AA2204EEECC991FFFFFFFF";
    attribute INIT_15 of inst : label is "FA000000FDCC67D1FEA8C000FFA8AF71D01CFFFFD1C1D01CD0F083FF83FFFFFF";
    attribute INIT_16 of inst : label is "00CFF300FFEDBA6FFEEC80000000CC0000000000FF7D0000FF38C6F1FFFDC200";
    attribute INIT_17 of inst : label is "FFFFFF300CFFFFE0888CEF7773100000FFFFFFFFF11999FE0000000000000000";
    attribute INIT_18 of inst : label is "0000000037E44EB10003FF00FF77331100011000000000137FFE0000FFFFFFFF";
    attribute INIT_19 of inst : label is "00000088CCEEEFFF00000000BFFFFFFFFFFFFFFF0000000F0000000037ECCEB1";
    attribute INIT_1A of inst : label is "011333377766000088FFFF88888CCEEEFFFFFF00888CCFFF037FEC8800000000";
    attribute INIT_1B of inst : label is "FFFFFFFFFFFFFFFF0F73B9DDCE660000DDFFFFDDDDDDDEEEFFFFFF1111111FFF";
    attribute INIT_1C of inst : label is "FFFFF731FEC80000FFFFFFFF1117FFFEECC88FFF01000000BBFFFFBBBBBBB777";
    attribute INIT_1D of inst : label is "8CEFFFFF000000FF17FFFFFF0137FFFFFFFFFFFF0000137F137FFFFF00008CEF";
    attribute INIT_1E of inst : label is "0008CFFF00000000000000CF0000008EFFFFFFFF000008CCEFFFFFFF00000000";
    attribute INIT_1F of inst : label is "FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0008CFFF00000000";
    attribute INIT_20 of inst : label is "F7311000FFFFFFFF71000000FFFFFFF710000000FFFF3000FFFFFFF0FFFFFFFF";
    attribute INIT_21 of inst : label is "FFFFFEC88000000000000000FFFFFFFFFFF77300FFFFFFFFFF731000FFFFFFFF";
    attribute INIT_22 of inst : label is "00000000FFFF7000FFFFFFFFFF733000FFFFFFC0FEC80000FFE8000000000000";
    attribute INIT_23 of inst : label is "FFFFF77310000000FFFFFFFF70000000FFFEEC0000000000FFFFFECC88000000";
    attribute INIT_24 of inst : label is "31000000FFFFF300FFFFEECC88000000FFFFFFF710000000FFFF733110000000";
    attribute INIT_25 of inst : label is "FFFFFFFE8000000000000000FF900000FFFFFFFFFFFF7300FFFFFFFFFFFF7733";
    attribute INIT_26 of inst : label is "FFFFFFFFFFFF7100FFFFFFFFF0000000FFFFFFEC88000000FFEC800000000000";
    attribute INIT_27 of inst : label is "00000000FF731000FFFFFFFFFFF7733110000000FFFFFFF710000000FFF73111";
    attribute INIT_28 of inst : label is "0000000000000000FEC0000000000000FFFFFFFFFF773000FFEC8000FFF88000";
    attribute INIT_29 of inst : label is "FFFFFFFFFFFF7300FFFEEC00FFFFFFF777773331FFEEEEC0FFFFFFFECCCCCC88";
    attribute INIT_2A of inst : label is "71000000FFFFF000FC880000FFFFC80000000000FFFFFFF310000000FFFFF300";
    attribute INIT_2B of inst : label is "00000000FFFFFFF731000000FFFFFFF710000000FFFFFFF731100000FFFFFFF7";
    attribute INIT_2C of inst : label is "F0000000FEC8800000000000FFEEC88000000000FFFFEC0000000000FF800000";
    attribute INIT_2D of inst : label is "FFFFFFFF000000017FFFFFFF003FFFFF00000007FFFFFFFFFFFF1000FFF80000";
    attribute INIT_2E of inst : label is "000011137FFFFFFFFFFFFFFF001337FFFFFFFFFF00000001FFFFFFFF0000000F";
    attribute INIT_2F of inst : label is "00000011337FFFFFFFFFFFFF0000000113377FFFFFFFFFFF0011377FFFFFFFFF";
    attribute INIT_30 of inst : label is "00000000000088CEEEFFFFFF000000008888CCEF000EEFFF000011137FFFFFFF";
    attribute INIT_31 of inst : label is "00000000000088CCEEFFFFFF00000000088CCEFF00000000000000088CCEFFFF";
    attribute INIT_32 of inst : label is "00001137FFFFFFFF001137FFFFFFFFFF000000013377FFFFFFFFFFFF0000CEFF";
    attribute INIT_33 of inst : label is "FFFFFFFF00000000088CCEEFFFFFFFFF0000000088CCEFFF000000000008DFFF";
    attribute INIT_34 of inst : label is "7FFFFFFFFFFFFFFF00337FFF777FFFFFFFFFFFFF3FFFFFFFFFFFFFFF00088CEE";
    attribute INIT_35 of inst : label is "00001111111133377777FFFFFFFFFFFF000011111333377FFFFFFFFF00000113";
    attribute INIT_36 of inst : label is "0888CCEEFFFFFFFF00000000088CCEEFFFFFFFFF00000CFF00000000000019FF";
    attribute INIT_37 of inst : label is "FFFFFFFF00000000088CCEEFFFFFFFFF0000000000088CEEEFFFFFFF00000000";
    attribute INIT_38 of inst : label is "EFFFFFFF00008CEFFFFFFFFF00088CEFFFFFFFFF0000000F000000000008CCEF";
    attribute INIT_39 of inst : label is "FFFFFFFFFFFFFFFF7777773311100000FFFFFFFFFFFFFFF7FFFFFFFF00000000";
    attribute INIT_3A of inst : label is "00000000FF77333311100000FFFFFFFFFFFFFFFFFFFFF77773331111FFFFFFFF";
    attribute INIT_3B of inst : label is "FFFFFFFFFFFFFFEEECC880000000000000000000FFFFFFEEEEECCCC888000000";
    attribute INIT_3C of inst : label is "FFFFFFFF00000001113777FFFFFFFFFF00000003FFFFFFFFFFFEECCC88880000";
    attribute INIT_3D of inst : label is "000003FF000001113333377FFFFFFFFFFFFFFFFF000000011113337777FFFFFF";
    attribute INIT_3E of inst : label is "088CCEEFFFFFFFFF00000000000000888CCCEEEFFFFFFFFF000000000088CEFF";
    attribute INIT_3F of inst : label is "FFFFFFFF00000000FFFFFFFF000000000000888CCEEEFFFF0000000000000000";
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
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
  rom1 : if true generate
    attribute INIT_00 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_01 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_02 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_03 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_04 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_05 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFF0070000007F73170000000000000000000000000";
    attribute INIT_08 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_09 of inst : label is "FFFFFFFFF0000000000000000000000000000000000000000000000000000000";
    attribute INIT_0A of inst : label is "000000000000000000000000000010000000000204000000000008000FFFFFFF";
    attribute INIT_0B of inst : label is "F8888888F00000008888888800000000FFFFFFFFFFFFFFFFFFFFFFFF00000000";
    attribute INIT_0C of inst : label is "FFFFFFFFFF8888FFF8F8FFFFFFFFFFC000088CEFFF3333FFFFFEEECC80000000";
    attribute INIT_0D of inst : label is "F6FEFFFFFFF71000CFFCCFFCFFCCFCFFFF8888FFFEFFFCDFFFFFFFF7FFFFFFFF";
    attribute INIT_0E of inst : label is "47C77C7400000000136666310000000000000000777777777FFFFFFFFF6666FF";
    attribute INIT_0F of inst : label is "DB7EC800FFFFFFFFE30000004F0FE30047C74F7C4F7C00006F63100047C75F6C";
    attribute INIT_10 of inst : label is "00000000FED3FEE731000000E739CEFFFED3FFF0FEDB7ECCE7BCEFF0E739CEEE";
    attribute INIT_11 of inst : label is "77333111FFF77FFFFFFFFFFFFEE4000000013FECCCEEF777008CEFFFFFFFFA80";
    attribute INIT_12 of inst : label is "11110000000000003337EE80331110003FFFDFFFFFFFFFFB3100000011137FC8";
    attribute INIT_13 of inst : label is "7773315402244422FFFFEC827398224464440112333331000000001100000001";
    attribute INIT_14 of inst : label is "B09CEFFFB838A013B838838BEDCC889BFFFFFFFFFEECC992FFFFFFFF08A22644";
    attribute INIT_15 of inst : label is "FFEB0000F7513000FF336EB8FFF337E81CFFFFFFB0F01CFFB838B0033083FFFF";
    attribute INIT_16 of inst : label is "EFF70000FFFFFFFFFFFFFFC0000CFF00FFEECC88F5000000FFFB3200FFFFFEF8";
    attribute INIT_17 of inst : label is "F773100003FFFF7011137FEEEC800000FFFFFFFFF88999F7000880000000008C";
    attribute INIT_18 of inst : label is "000000000000000000003300000000000000000000000000003FFC00FFBDDEAF";
    attribute INIT_19 of inst : label is "888EFFF773311FFF00000000FFFFFFFFFFFFFFFF0000000F0000000CC6374010";
    attribute INIT_1A of inst : label is "088CCCCEEE660000DDFFFFDDDDDDDEEEFFFFFFFFFFFFFFFF0FECD9BB37660000";
    attribute INIT_1B of inst : label is "FFFFFF0011133FFF0CEF731100000000BBFFFFBBBBBBB777FFFFFF8888888FFF";
    attribute INIT_1C of inst : label is "F7310000FFFFFEC8FFFFFFFF0000001133777FFF0000000011FFFF1111133777";
    attribute INIT_1D of inst : label is "FFFFFFFF00008FFF00037FFF0000037FFFFFFFFF000000070000137F8CEFFFFF";
    attribute INIT_1E of inst : label is "CEFFFFFF00000008CCEEFFFF000000FFFFFFFFFF8CEEFFFFFFFFFFFF0088CEFF";
    attribute INIT_1F of inst : label is "FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CEFFFFF00000088";
    attribute INIT_20 of inst : label is "00000000FFFFF73100000000FF77331000000000FF710000FFFFFF10FFFFFFFF";
    attribute INIT_21 of inst : label is "FFFFFFFFFFFEEECC80000000FFFFF73311000000FFFFFFF710000000FFFFF731";
    attribute INIT_22 of inst : label is "C0000000FFFFE000FFFFFF7311000000FFFFFF30FFFFE000FFFFFFEE80000000";
    attribute INIT_23 of inst : label is "F710000000000000FFF7731000000000FFFFFFFE80000000FFFFFFFFFFFFEEEC";
    attribute INIT_24 of inst : label is "00000000FFF30000FFFFFFFFFFFECC00FFFFFFFC88000000F731000000000000";
    attribute INIT_25 of inst : label is "FFFFFFFFFFFECCC880000000FFFFEC80FFFFF73311000000FFFFFF7311000000";
    attribute INIT_26 of inst : label is "FFFFFFFFF7310000FFFFFFF730000000FFFFFFFFFFFFECCCFFFFFFFEEECC8000";
    attribute INIT_27 of inst : label is "80000000F8000000FFFFFF731100000000000000FF73100000000000FF000000";
    attribute INIT_28 of inst : label is "FFECCCC880000000FFFFFFEECCCC8000FFFFFFFFB0000000FFFFF000FFFFFFC8";
    attribute INIT_29 of inst : label is "FFFFFF7333310000FFFFFF00FFF1000000000000FFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_2A of inst : label is "00000000FFFF7000FFFFF000FFFFFFEC80000000FFFFFFFFEEC00000F3110000";
    attribute INIT_2B of inst : label is "80000000FFFFFFC880000000FFF7310000000000FFF7310000000000FFFFF300";
    attribute INIT_2C of inst : label is "FE800000FFFFFFC880000000FFFFFFFFC0000000FFFFFFFEC0000000FFFEC888";
    attribute INIT_2D of inst : label is "FFFFFFFF000000000013377F000013FF0000000017FFFFFFFFFFECCCFFFFE000";
    attribute INIT_2E of inst : label is "0000000000011377FFFFFFFF00000011377FFFFF0000000017FFFFFF0000000F";
    attribute INIT_2F of inst : label is "0000000000000113377FFFFF00000000000000011337FFFF0000000013377FFF";
    attribute INIT_30 of inst : label is "0000088CCEEFFFFFFFFFFFFF0000088CFFFFFFFF0001113F00000000011137FF";
    attribute INIT_31 of inst : label is "00000008CCEFFFFFFFFFFFFF0008CCEEFFFFFFFF0000000888CCEEFFFFFFFFFF";
    attribute INIT_32 of inst : label is "000000000017FFFF00000000137FFFFF00000000000001137FFFFFFF000037FF";
    attribute INIT_33 of inst : label is "FFFFFFFF088CCEEEFFFFFFFFFFFFFFFF088CCEFFFFFFFFFF00000008CEFFFFFF";
    attribute INIT_34 of inst : label is "01111001377FFFFF00000000000013777777FFFF001137777FFFFFFFEFFFFFFF";
    attribute INIT_35 of inst : label is "000000000000000000000001377FFFFF0000000000000000013FFFFF00000000";
    attribute INIT_36 of inst : label is "FFFFFFFFFFFFFFFF088CCCEFFFFFFFFFFFFFFFFF088CFFFF0000000888CEFFFF";
    attribute INIT_37 of inst : label is "FFFFFFFF88CEEFFFFFFFFFFFFFFFFFFF08CCCEEEEFFFFFFFFFFFFFFF0000888E";
    attribute INIT_38 of inst : label is "FFFFFFFF008EFFFFFFFFFFFFCEFFFFFFFFFFFFFF0000000F00000008CEFFFFFF";
    attribute INIT_39 of inst : label is "FFF77733331100000000000000000000FFFFF77733111000FFFFFFFF0000000F";
    attribute INIT_3A of inst : label is "EECCC888FFEEECCC88000000FFFFF777733333111100000000000000FFFFFFFF";
    attribute INIT_3B of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFEECCC8880000000FFFFFFFFFFFFFFFFFFFFFEEE";
    attribute INIT_3C of inst : label is "377FFFFF0000000000000000113377FF00000000001377FFFFFFFFFFFFFFFFEE";
    attribute INIT_3D of inst : label is "000000CF00000000000000000011133377FFFFFF000000000000000000001133";
    attribute INIT_3E of inst : label is "FFFFFFFFFFFFFFFF00888CCCCEEEFFFFFFFFFFFFFFFFFFFF088CCCEEFFFFFFFF";
    attribute INIT_3F of inst : label is "FFFFFFFF00000000FFFFFFFF0000000CCCEFFFFFFFFFFFFF000000088CCCCEEE";
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
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
