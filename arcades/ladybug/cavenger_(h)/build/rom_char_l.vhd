-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity rom_char_l is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of rom_char_l is

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
    attribute INIT_00 of inst : label is "880022E0C66E66C0C602E2E000E4C880C66006C0E6C066C0C8888C80C66666C0";
    attribute INIT_01 of inst : label is "ECCCCCE0ECCCCCE0ECCCCCE08C666C80ECCCCCE066CC8800C60C66C0C66C66C0";
    attribute INIT_02 of inst : label is "6666EE606666EE60ECCCCCE0ECCCCCE08C000000C88888C0ECCCCCE08C666C80";
    attribute INIT_03 of inst : label is "088CCCE08CCCCCE0C8888AE0C208CEC0ECCCCCE08C666C80ECCCCCE0C66666C0";
    attribute INIT_04 of inst : label is "C24842C0000000000000000000000000EEC806E0C8008C606C88CE608CE66660";
    attribute INIT_05 of inst : label is "08CEEE4000E00E00000E0000000E000080000080008880000000044840888800";
    attribute INIT_06 of inst : label is "065564400713170006AA620009579700848E4C806EC888888448048000C08448";
    attribute INIT_07 of inst : label is "FFFFFFFF00F70000000E8CE000FF1000000C08C0C295592C8888EC80000FF000";
    attribute INIT_08 of inst : label is "230000000F0000000000000000000000137FFFFFFFFFFFFFFFEECC8800000000";
    attribute INIT_09 of inst : label is "FFFFFFFFFF0000000000000032222222F0000000000000002222222200000000";
    attribute INIT_0A of inst : label is "00010000004000008000000000000000000000000000000000000000FFFFFFFF";
    attribute INIT_0B of inst : label is "F0000000F00000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00008000";
    attribute INIT_0C of inst : label is "000088CE00999900FFFFD1000000000000000000008888000000000000000000";
    attribute INIT_0D of inst : label is "FFFFECC440000000C00CC00C00CC0C0000EEEE00FFEEEEEECC88880000000000";
    attribute INIT_0E of inst : label is "EEFEEFEE0000000000333300311000000000000077777777FFFFFEEC00EEEE00";
    attribute INIT_0F of inst : label is "24800000FFCCCCFFFFF30000EEFEEFE3FFFFFC00FC000000EEFEEF63EFEC8000";
    attribute INIT_10 of inst : label is "C80000008125B77F73184210FF7308448137F00F8125B7FFFF73000FFF730881";
    attribute INIT_11 of inst : label is "FFFFFFFF000EEE00EE77EE75C8017FE0CCCCC80000000088CEEE6777FFFEEEEC";
    attribute INIT_12 of inst : label is "FFBBF5188CE73100888CEFFFFFFFFFFF00333300DDFFDDFFD5720FF7CCCEFFFF";
    attribute INIT_13 of inst : label is "00000000088CCEEF137FFFFF00008CEFFFFFFFFF0008CF733377FFFF80000000";
    attribute INIT_14 of inst : label is "EEFEEF93EFEC8000EEFEEFEECEFFFFFFFFFFFFFFFFFFFFFF1113377F00000000";
    attribute INIT_15 of inst : label is "00000000823310000000000010575000FFF30000EEFEEFE3FFFFFC00FC000000";
    attribute INIT_16 of inst : label is "FFFFFFFFC8924590FEEC8000FFEECC8800000000010000008007310001000000";
    attribute INIT_17 of inst : label is "FFFFFF30F300001FFFFFFFFFFFFFFFFF00000011FFFFFFFE008CFEC8000088CF";
    attribute INIT_18 of inst : label is "36CE208037E44EB1FFFFFFFF0000000077FFFFFF77FFFFFFFFFFFFFFCCE67331";
    attribute INIT_19 of inst : label is "00000088CCEEEFFF00000000FE000000FFFFFFFFFFFFFFFFFFFFFFFF00000000";
    attribute INIT_1A of inst : label is "FEECCCC88899F00044FFFF4444422111777FF0FF777BB8FFFC801364C8800000";
    attribute INIT_1B of inst : label is "FFFFF777FFFFFFFFF08C46223199F00022FFFF2222222111EEEFF0EEEEEEE0FF";
    attribute INIT_1C of inst : label is "FFFFF731FEC80000FFFFFFFF0007FEEDDBB770FFF631100044FFFF4444444888";
    attribute INIT_1D of inst : label is "FF731000FFFFFFF1FFC80000FFFEC80000000000FFFFFFEC137FFFFF00008CEF";
    attribute INIT_1E of inst : label is "FFFFF731FFFFFFFFFFFFFFF7FFFFFFFF31000000FFFFFFF773100000FFFFFFFF";
    attribute INIT_1F of inst : label is "00000000FFFFFFFF00000000FFFFFFFFF0000000F1000000FFFFF710FFFFFFFF";
    attribute INIT_20 of inst : label is "CEFFFFFF0000000CFFFFFFFF000000CFFFFFFFFF000EFFFF000000FF00000008";
    attribute INIT_21 of inst : label is "000137FFFFFFFFFFFFFFFFFF0000000008CCEFFF000000008CEFFFFF00000008";
    attribute INIT_22 of inst : label is "FFFFFFFF000CFFFF000000000CEEFFFF000017FF37FFFFFF13FFFFFFFFFFFFFF";
    attribute INIT_23 of inst : label is "0088CCEFFFFFFFFF0000008CFFFFFFFF11337FFFFFFFFFFF0000377FFFFFFFFF";
    attribute INIT_24 of inst : label is "FFFFFFFF0008EFFF0113377FFFFFFFFF000000CFFFFFFFFF000CEEFFFFFFFFFF";
    attribute INIT_25 of inst : label is "0000003FFFFFFFFFFFFFFFFF6FFFFFFF00000000088CEFFF00000000088CCEEE";
    attribute INIT_26 of inst : label is "00000000000CFFFF00000001FFFFFFFF0000137FFFFFFFFF137FFFFFFFFFFFFF";
    attribute INIT_27 of inst : label is "FFFFFFFF8CEFFFFF0000000008CCEEFFFFFFFFFF000088CFFFFFFFFF08CEFFFF";
    attribute INIT_28 of inst : label is "FFFFFFFFFFFFFFFF37FFFFFFFFFFFFFF000000008CCEFFFF137FFFFF01FFFFFF";
    attribute INIT_29 of inst : label is "00000000000CEFFF01337FFF000888CCCCCEEEFF113337FF0000013777777FFF";
    attribute INIT_2A of inst : label is "FFFFFFFF0000FFFF7FFFFFFF0017FFFFFFFFFFFF00008CEFFFFFFFFF0008EFFF";
    attribute INIT_2B of inst : label is "FFFFFFFF000008CEFFFFFFFF000008CFFFFFFFFF000008CEFFFFFFFF000008CC";
    attribute INIT_2C of inst : label is "FFFFFFFF37FFFFFFFFFFFFFF1337FFFFFFFFFFFF11137FFFFFFFFFFF1FFFFFFF";
    attribute INIT_2D of inst : label is "FFFFFFFFFFFFFFFFFC800000FFFE8000FFFFFFFFC000000000CFFFFF00FFFFFF";
    attribute INIT_2E of inst : label is "FFFFFFFFEC88000000000000FFFFEEC000000000FFFFFFFFF0000000FFFFFFFF";
    attribute INIT_2F of inst : label is "FFFFFFFFFEEC880000000000FFFFFFFFFFEECC8800000000FFFFFECC80000000";
    attribute INIT_30 of inst : label is "FFFFFFFFFFFFFFF733311100FFFFFFFFFFFFF773FFFF3311FFFFFFFFEC000000";
    attribute INIT_31 of inst : label is "FFFFFFFFFFFFFFF773310000FFFFFFFFFFFF7731FFFFFFFFFFFFFFFFFF773100";
    attribute INIT_32 of inst : label is "FFFFFFFEC8800000FFFFFEC880000000FFFFFFFFFEECC80000000000FFFFF731";
    attribute INIT_33 of inst : label is "31000000FFFFFFFFFFFF773311000000FFFFFFFFFFF77311FFFFFFFFFFFFF760";
    attribute INIT_34 of inst : label is "EC00888800000000FFFEEC8CCCEE800000000000FE80000000000000FFFFFF73";
    attribute INIT_35 of inst : label is "FFFFFFFFFFFFFEEECCCCC88800000000FFFFFFFFFFEEEECC88000000FFFFFFFF";
    attribute INIT_36 of inst : label is "FFFFF77331000000FFFFFFFFFFFF773311000000FFFFFF71FFFFFFFFFFFFFFF0";
    attribute INIT_37 of inst : label is "10000000FFFFFFFFFFFF773311000000FFFFFFFFFFFFFF7333111000FFFFFFFF";
    attribute INIT_38 of inst : label is "F3100000FFFFFF7310000000FFFFFF73FFFFFFFFFFFFFFFFFFFFFFFFFFFFF773";
    attribute INIT_39 of inst : label is "000000000008888CCCCCCEEFFFFFFFFF00000000000088CEFFFFFFFFFFFFFFFF";
    attribute INIT_3A of inst : label is "FFFFFFFF8CCEEEEFFFFFFFFF00000000000000000888CCCCEEEFFFFF00000000";
    attribute INIT_3B of inst : label is "000000011111133377FFFFFFFFFFFFFFFFFFFFFF01111333337777FFFFFFFFFF";
    attribute INIT_3C of inst : label is "00000000FFFFFFFFFFFECCCC80000000FFFFFFFFE88000001133777FFFFFFFFF";
    attribute INIT_3D of inst : label is "FFFFFFF8FFFFFFFFFEEEEECC8880000000000000FFFFFFFFFFFFEEECCCC88000";
    attribute INIT_3E of inst : label is "FFFF773311100000FFFFFFFFFFFFFFFFFF77733311000000FFFFFFFFFFFFF730";
    attribute INIT_3F of inst : label is "00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77333111FFFFFFFFFFFFFFFF";
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
    attribute INIT_00 of inst : label is "1136CCF07CC70C707CCC7070F6F666607CC7CC707C03CE70311111107CCCCC70";
    attribute INIT_01 of inst : label is "10030CF0FC030CF036CCC6307C800C707CC7CC70CCFCC5707CCFCC707CC7CC70";
    attribute INIT_02 of inst : label is "CCEFDCC0CCDDFEC0FC000010DC636C90366666F031111130E66766E07CE00C70";
    attribute INIT_03 of inst : label is "355888D0788888D0311115707EF71870DC67CC70D6DCC6301007CC707CCCCC70";
    attribute INIT_04 of inst : label is "72101100001001000001000000000000FC137EF0113376E0CE7336C026FBBBB0";
    attribute INIT_05 of inst : label is "137FEE400070070000070000111F111001222100210001201011244300013333";
    attribute INIT_06 of inst : label is "00000000055530000000000004AAAA00242F5731000242313443153111713443";
    attribute INIT_07 of inst : label is "FFFFFFFF00300000008FF03000700000000FF170349889433333F731000FF000";
    attribute INIT_08 of inst : label is "000000000F00000088000000000000000000137FFFFFFFFFFFFFFFFFFFEECC88";
    attribute INIT_09 of inst : label is "FFFFFFFFFF0000000000000000000000F0000000888888880000000088888888";
    attribute INIT_0A of inst : label is "00000000000000000000000000001000000000020400000000000800FFFFFFFF";
    attribute INIT_0B of inst : label is "F8888888F00000008888888800000000FFFFFFFFFFFFFFFFFFFFFFFF00000000";
    attribute INIT_0C of inst : label is "FFFFF77300777700FFFFF332200000000000000000CCCC00C880000000000000";
    attribute INIT_0D of inst : label is "FFFFB80000000000300330030033030000777700FF77777733111100EEEEEEEE";
    attribute INIT_0E of inst : label is "77F77F7700000000001111000000000000000000000000000000113700999900";
    attribute INIT_0F of inst : label is "FC812480FFCCCCFFF3000000FFFFF30077F77F7CFFFC00007F73100077F77F6C";
    attribute INIT_10 of inst : label is "137EC800FFEC011842100000184ADF77FFEC000FFFEC812218CEF00F184ADEEF";
    attribute INIT_11 of inst : label is "FFFFFFFF00CCCC00BBFFBBFFBAE40FFE00013FECCCEEFFFF10000000FFDDFA81";
    attribute INIT_12 of inst : label is "FFF77773310000003337FFFFFFFFFFFF0007770077EE77EA3108EF7011137FFF";
    attribute INIT_13 of inst : label is "888CCEEFFFFFFFFF0000137F8CEFFFFFFFFFFFFF333331000000001137776EEE";
    attribute INIT_14 of inst : label is "7F73100077F77F6C77F77F7713337777000000000113377F00000000FFFFFFFF";
    attribute INIT_15 of inst : label is "1C0000001000000011CC8000710CC800F3000000FFFFF30077F77F7CFFFC0000";
    attribute INIT_16 of inst : label is "FFFFFFFF3377FEECFFFFFFC0FFFFFFFF00000000000000003800000070760000";
    attribute INIT_17 of inst : label is "F7731000FC00008FFFFFFFFFFFFFFFFF00000088FFFFFFF7EEF77FFFEEFFFFFF";
    attribute INIT_18 of inst : label is "CE7337D8CE7227D8FF773311000000000013F7310000113FFFFFFFFF10422150";
    attribute INIT_19 of inst : label is "000EF77BBDDEE0FFFEC88000F4000000FFFFFFFFFFFFFFFFFFFFFFFF00000000";
    attribute INIT_1A of inst : label is "F77333311199F00022FFFF2222222111FFFFFEEEFFFFFFFFF0132644C899F000";
    attribute INIT_1B of inst : label is "EEEFF0FFEEEDD1FFF3108C623110000044FFFF4444444888777FF077777770FF";
    attribute INIT_1C of inst : label is "F7310000FFFFFEC8FFFFFFFF0000001133777FFF0000000022FFFF2222244888";
    attribute INIT_1D of inst : label is "10000000FFFFFF10FFFFEC80FFFFFFEC80000000FFFFFFFF0000137F8CEFFFFF";
    attribute INIT_1E of inst : label is "F7310000FFFFFFFFF7733110FFFFFFF800000000FF73310000000000FFFFF731";
    attribute INIT_1F of inst : label is "00000000FFFFFFFF00000000FFFFFFFFF0000000F0000000FF730000FFFFFFFF";
    attribute INIT_20 of inst : label is "FFFFFFFF0000CEFFFFFFFFFF0CCEEFFFFFFFFFFF8CFFFFFF00008FFF0000008F";
    attribute INIT_21 of inst : label is "000000001133377FFFFFFFFF0000CEEFFFFFFFFF000008CFFFFFFFFF0000CEFF";
    attribute INIT_22 of inst : label is "FFFFFFFF0003FFFF00008CEFFFFFFFFF00008EFF0003FFFF0001133FFFFFFFFF";
    attribute INIT_23 of inst : label is "CFFFFFFFFFFFFFFF88CCEFFFFFFFFFFF0000013FFFFFFFFF0000000001133377";
    attribute INIT_24 of inst : label is "FFFFFFFF08EFFFFF0000000001377FFF0000037FFFFFFFFFCEFFFFFFFFFFFFFF";
    attribute INIT_25 of inst : label is "00000000113777FFFFFFFFFF00137FFF0088CEEFFFFFFFFF00000CEFFFFFFFFF";
    attribute INIT_26 of inst : label is "00000008CEFFFFFF000008CEFFFFFFFF000000000113777F00001133377FFFFF";
    attribute INIT_27 of inst : label is "FFFFFFFFFFFFFFFF00008CEFFFFFFFFFFFFFFFFF8CEFFFFFFFFFFFFF0FFFFFFF";
    attribute INIT_28 of inst : label is "137777FFFFFFFFFF00111337777FFFFF000000CEFFFFFFFF0002FFFF000017FF";
    attribute INIT_29 of inst : label is "00000CEEEEFFFFFF00000FFF1BFFFFFFFFFFFFFF000000170000000000000001";
    attribute INIT_2A of inst : label is "FFFFFFFF088CFFFF0001FFFF0000037FFFFFFFFF0000011337FFFFFFEFFFFFFF";
    attribute INIT_2B of inst : label is "FFFFFFFF000027FFFFFFFFFF08CEFFFFFFFFFFFF88CEFFFFFFFFFFFF0088EFFF";
    attribute INIT_2C of inst : label is "3FFFFFFF000017FFFFFFFFFF00000037FFFFFFFF00000137FFFFFFFF0037FFFF";
    attribute INIT_2D of inst : label is "FFFFFFFFFFFFFFFFFFFFEECCFFFFFFE8FFFFFFFFFFC000000003777F0003FFFF";
    attribute INIT_2E of inst : label is "FFFFFFFFFFFFFFECC8800000FFFFFFFFFECC8000FFFFFFFFFFC00000FFFFFFFF";
    attribute INIT_2F of inst : label is "FFFFFFFFFFFFFFFFEECC8000FFFFFFFFFFFFFFFFFFEEC880FFFFFFFFFFEECC88";
    attribute INIT_30 of inst : label is "FFFFFFFF7733100000000000FFFFFFFF76000000FFFFFFFEFFFFFFFFFFFFFEC8";
    attribute INIT_31 of inst : label is "FFFFFFFFF773100000000000FFFFF77331000000FFFFFFFFFFF7733100000000";
    attribute INIT_32 of inst : label is "FFFFFFFFFFFFC000FFFFFFFFFFEC8000FFFFFFFFFFFFFFFFEC800000FFFFFEC8";
    attribute INIT_33 of inst : label is "00000000FFFF77333100000000000000FFFF773110000000FFFFFFFFF7310000";
    attribute INIT_34 of inst : label is "FFFFFFFFFECC8000FFFFFFFFFFFFFFECCCCCC800FFFFFECCCC800000F3110000";
    attribute INIT_35 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFECC8000FFFFFFFFFFFFFFFFFFFE8000FFFFFFFF";
    attribute INIT_36 of inst : label is "3100000000000000FFFF77731100000000000000FFFF7100FFFFFFFFFFF73100";
    attribute INIT_37 of inst : label is "00000000FFF733111100000000000000FFF777333311000000000000FFFFFFFF";
    attribute INIT_38 of inst : label is "10000000FFFF300000000000F7310000FFFFFFFFFFFFFFFFFFFFFFFFF7310000";
    attribute INIT_39 of inst : label is "88CCCEEEEFFFFFFFFFFFFFFFFFFFFFFF0088CCCEEFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3A of inst : label is "3777FFFF1333777FFFFFFFFF0088CCCCEEEEEFFFFFFFFFFFFFFFFFFF00000008";
    attribute INIT_3B of inst : label is "00000000000000000000111133777FFFFFFFFFFF000000000000000001113333";
    attribute INIT_3C of inst : label is "EECCC800FFFFFFFFFFFFFFFFFFFEECC8FFFFFFFFFFFFECC80000000000011337";
    attribute INIT_3D of inst : label is "FFFFFFF7FFFFFFFFFFFFFFFFFFFFFFEEECC88800FFFFFFFFFFFFFFFFFFFFFFFE";
    attribute INIT_3E of inst : label is "3100000000000000FFFFFF77773331100000000000000000FFFF777331100000";
    attribute INIT_3F of inst : label is "00000000FFFFFFFFFFFFFFFFFFFFFFFF7773100000000000FFFFFFFFFF777733";
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
