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
    attribute INIT_00 of inst : label is "000EE000CE222EC0CE2226408EE88880CE22264022AAEE6022EE22008C226C80";
    attribute INIT_01 of inst : label is "00000EE02222EE008C622EE046226C80CE222EE0EE888EE08C622200CEAA22C0";
    attribute INIT_02 of inst : label is "EEC80EE0EE080EE02222EE0026EC8EE0CE22264022EE2200EE000EE0EE226C80";
    attribute INIT_03 of inst : label is "08CEC800CE222EC000EE0000CE22264026EC8EE0ACEA2EC008888EE0CE222EC0";
    attribute INIT_04 of inst : label is "00AA0000CE62EAE0FFFFFFFFA4A22C00222AEE6000EE00006EC8CE608EC8CE80";
    attribute INIT_05 of inst : label is "C255592C00EC000000660000C22E0C222C0688E00CCCCC00008C800000008200";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "000000EE000000FF000000EE000000FF000000FF000000FF0000000000000000";
    attribute INIT_08 of inst : label is "08CE73000000000000000000000000000000000137EC800037EC800000000000";
    attribute INIT_09 of inst : label is "00F000FF00F8807788800000F000F0007088F0000000000008CE731000000000";
    attribute INIT_0A of inst : label is "0E0222E002484200FFFFFFFF4444444444444447888888880000888800F000F0";
    attribute INIT_0B of inst : label is "FFFFFFFF00008402000008880000000000040000FFFFFFFFFFFFFFFFC62E0EC8";
    attribute INIT_0C of inst : label is "FFFFFFFF00000110FFFFFFFFFFFFFFFF0CCEFE0D00000066FFFFFFFFFFFFFFFF";
    attribute INIT_0D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_0E of inst : label is "47B7000047B7000047B7000047B70000060107F1060107F10007FFCC0007FFCC";
    attribute INIT_0F of inst : label is "3000000088800000300000000024BEE7FF70000040408000FF7000000080000C";
    attribute INIT_10 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00005000000000000000500000037773";
    attribute INIT_11 of inst : label is "83040000830400008304000083040000EF700000EF700000EF700000EF700000";
    attribute INIT_12 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_13 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF";
    attribute INIT_14 of inst : label is "555555555555555F0EC013222310CE0FFEE80000FEE800000000000000000000";
    attribute INIT_15 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_16 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_17 of inst : label is "0000000000000000000013333331000000000000000000000000000000000000";
    attribute INIT_18 of inst : label is "C2202E20C2C02E20FFFFFFFFFFFFFFFF00000000000000000088880000888800";
    attribute INIT_19 of inst : label is "C220C220C2C0C220C220E4C0C2C0E4C0C220C240C2C0C240C2202A60C2C02A60";
    attribute INIT_1A of inst : label is "C220CA20C2C0CA20C220C2C0C2C0C2C0C2200E00C2C00E00C220C2C0C2C0C2C0";
    attribute INIT_1B of inst : label is "0E00A4A0C2C0A4A0C220A4A0E4C0A4A0C240A4A02A60A4A0C2C0C2C0C2C0C2C0";
    attribute INIT_1C of inst : label is "0000000F5555555F55555555001266FFFF66210008CEEECCCCEEEC80C2C0A4A0";
    attribute INIT_1D of inst : label is "EF700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_1E of inst : label is "FFFFFFFFFFFFFFFFEF700000EF700000EF700000EF700000EF70000083040000";
    attribute INIT_1F of inst : label is "00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_20 of inst : label is "F710000000000000000000CC00CFFFFF37777310000000000000000000000000";
    attribute INIT_21 of inst : label is "FFFF7100FFFFFFECEC000000FFFFFCEF03FFFFFF0000377700CEFFFECCCEF73F";
    attribute INIT_22 of inst : label is "FFFFFFFF10017FFFFFEEEEEE71000000C888888C111111110088CCEFFFFFFFFF";
    attribute INIT_23 of inst : label is "088CCEEFFFF91000FFFFF000F7100000FFFEECCCECCC880001BFFFFFFFFFFFFF";
    attribute INIT_24 of inst : label is "FFFFF000FFF10000FFEC8800FFFFFFFF000008CE0CFFFFFF7FFFFFFFCEFFFFFF";
    attribute INIT_25 of inst : label is "000000000000000000000000000000001100000000000000FFFFFEECFFFFFF73";
    attribute INIT_26 of inst : label is "FFFFFEEC000000CEFFFFFFEE000003FF08FFFFFF88FFFFFF0000000000011337";
    attribute INIT_27 of inst : label is "F800CFFFFFFFFFFF00000BFFCCCEFFFFFFFFEE80C97FFFFFFFFFFFFFFFFFFF00";
    attribute INIT_28 of inst : label is "888888CC111111000008CEFFFFFFFFFFFFFFFF10FFFFDC88FF10001100000000";
    attribute INIT_29 of inst : label is "FFEEEEFF80000008FFFFFFFFFFFFFFFFEFFFFFFFFECCCCC8700001130000000F";
    attribute INIT_2A of inst : label is "10000000FFE00000FFECC000FFFFFFF0FFFFFF738CCEEEFF311001FFFF000000";
    attribute INIT_2B of inst : label is "777777FFCCCCCCCCFFFFFEECFFFFFFFFFFFFF000FFF10000FFFFEEEC00000000";
    attribute INIT_2C of inst : label is "FFFFF000FFFFFEEC000000CEFFFFFFEC00003FFF08FFFFFFEEFFFFFF00000000";
    attribute INIT_2D of inst : label is "000000FF0000088CFFFFF73100000000008CEEFFFFFFEEC0817FFFFFFFFEFFFF";
    attribute INIT_2E of inst : label is "10000000FFFFFEEEEC800008FFFFFFFFFFFFFFFB0000137FEEFFFFFE10000FFF";
    attribute INIT_2F of inst : label is "FFFFFFF7FFFFFFEE0000008D00CFFFFFEFFFFFFF0003FFFFCCEEEFFFFFFF7300";
    attribute INIT_30 of inst : label is "3110008C0CFFFFFFFFFFFFF131001377CC800088FFFFFFF7FFFFFFFFFF7318CE";
    attribute INIT_31 of inst : label is "EC800000F730000000000000FFFFFFFEEEFFFFFFFFF73100FFEC8800CCEEEEFF";
    attribute INIT_32 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_33 of inst : label is "008FFFFF00000000EEECC880000113770000000000000002000000CE00000000";
    attribute INIT_34 of inst : label is "00001FFFFFFFFFFFFFFF0000FFFFFFFF00000000013FFFECFFFFFFFF00EFFFFF";
    attribute INIT_35 of inst : label is "FFFFFFFF73110000008CCEEFFFFFF100FFFFFFFF1377FFFFFFFFFFF70CEFFFE8";
    attribute INIT_36 of inst : label is "FFFECCCCECCEEFFFFFFFFFFF37FFFFFFFFF77310FFFFFFEE000000FFFC800000";
    attribute INIT_37 of inst : label is "00000000C8800000FF73100000000000FFFFFFEECEEFFFFFFFEEC880FC001337";
    attribute INIT_38 of inst : label is "000000000000000000000000310000000000000007EC8800000000000000008E";
    attribute INIT_39 of inst : label is "0000000000000086710000010000000000000000000000000000000000000000";
    attribute INIT_3A of inst : label is "0008EF30EC880000000000007777776E00000000000000000008CCE632644000";
    attribute INIT_3B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3C of inst : label is "00000088100000000000000000088CC8000000000000000000001111088CE000";
    attribute INIT_3D of inst : label is "0000000011000000000000000000000000000000880000000000710000000000";
    attribute INIT_3E of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3F of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
    attribute INIT_00 of inst : label is "CEB98CC00999D7301BAAAEE00FFC63108DFB98006FB99C4000FF400037C88730";
    attribute INIT_01 of inst : label is "89999FF08999FF0037C88FF04C88C7306F999FF037C8C7307F999F600699BF60";
    attribute INIT_02 of inst : label is "FF137FF0FF737FF00000FF008C631FF0FF00000088FF8800FF111FF09998C730";
    attribute INIT_03 of inst : label is "FF101FF0FF000FF088FF880005D99F607F988FF07F888F707F888FF07F888F70";
    attribute INIT_04 of inst : label is "6EB98E607FC88C40FFFFFFFF00699600CEFB9880CF11FC00CE737EC0FF131FF0";
    attribute INIT_05 of inst : label is "349AA94300000000000000002557070007034470000000006FF7FF6000EF7000";
    attribute INIT_06 of inst : label is "0CCCCCCCCCCCC0CC0CCCCCCCCCCCC00000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "000000FF000000DD000000FF0000001100000011CCCCC01100000000CCCCC000";
    attribute INIT_08 of inst : label is "73100000000000CE000000CC8000000000000000000133CC000137EC00000000";
    attribute INIT_09 of inst : label is "00F000FF00003222C032E000F000F00022300000000008CC33100000000000CC";
    attribute INIT_0A of inst : label is "3705557002101200FFFFFFFF22222222222222224444444400E230C400F000F0";
    attribute INIT_0B of inst : label is "FFFFFFFF0007EF9000007FF10800006700588006FFFFFFFFFFFFFFFF36470701";
    attribute INIT_0C of inst : label is "FFFFFFFF00000002FFFFFFFFFFFFFFFF031FFFFF00008CF7FFFFFFFFFFFFFFFF";
    attribute INIT_0D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_0E of inst : label is "0100000001000000010000000100000000000410000004100000011100000111";
    attribute INIT_0F of inst : label is "0000000033612800000000000000000000000000880000000000000000001010";
    attribute INIT_10 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0001000077FE00000001000000000000";
    attribute INIT_11 of inst : label is "1000000010000000100000001000000010000000100000001000000010000000";
    attribute INIT_12 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_13 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC800000CC800000FFFFFFFFFFFFFFFF";
    attribute INIT_14 of inst : label is "000133000331000F004C8000008C400FFF370000FF3700000000000000000000";
    attribute INIT_15 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_16 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_17 of inst : label is "0000088CC8800000000000000000000000008000000000000000000000000000";
    attribute INIT_18 of inst : label is "4570072034300720FFFFFFFFFFFFFFFF000044CCCC4400000074470000744700";
    attribute INIT_19 of inst : label is "4570457034304570457072103430721045706540343065404570342034303420";
    attribute INIT_1A of inst : label is "4570343034303430457025203430252045707460343074604570553034305530";
    attribute INIT_1B of inst : label is "7460000055300000457000007210000065400000342000003430343034303430";
    attribute INIT_1C of inst : label is "0000000F0000000F00000000000000000000000007F333FFFF333F7025200000";
    attribute INIT_1D of inst : label is "10000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_1E of inst : label is "FFFFFFFFFFFFFFFF100000001000000010000000100000001000000010000000";
    attribute INIT_1F of inst : label is "00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_20 of inst : label is "10000000000000000000CFFFCFFFFFF700000000000000000000000000000000";
    attribute INIT_21 of inst : label is "FFFFC00001377FFFFFFC00087FFFFFFF001FFFFF000000004333FFFFFFF71000";
    attribute INIT_22 of inst : label is "FFFFFFFF00000011FF77777F00000000FFFFFFFF00000000EFFFFFFFFFFFFF71";
    attribute INIT_23 of inst : label is "FFFFFFFFFFFFC000FFF70000C80000003377FFFFFFFFFFFE0EFFFFFFFFFFFFFF";
    attribute INIT_24 of inst : label is "FFFF0000FF1000000111333377773333000CFFFFEFFFFFFF03FFFFFFFFFFFF73";
    attribute INIT_25 of inst : label is "EE66677377777777CCCCCCCCCEEEFF770000000077666EEC3FFFFFFFFFFFFF00";
    attribute INIT_26 of inst : label is "33777FFFCCC880130017FFFF000CEFFF07FFFFFF33311111FFFFEEEE00000000";
    attribute INIT_27 of inst : label is "FF8FFFFF1113FFFF0000CFFFFFFFF7777FFFFFFFFFE9FFFFFFFFFF33FFFF7100";
    attribute INIT_28 of inst : label is "FFFFFFFF00000000EFFFFFFFFFFFFFF3FFFFF100FFFFFFFF70000000800000CE";
    attribute INIT_29 of inst : label is "37777773FFFEEFFFFFFFFFFFFFFFFFFFF7733133FFFFFFFF0000000E00000003";
    attribute INIT_2A of inst : label is "00000000FF330000FFFFFF008FFFFFFF33110000FFFFFFFFF800000FF3000000";
    attribute INIT_2B of inst : label is "00000000FFFFFFFFBFFFFFFFFFFFFF00FFFF0000FF30000033777FFF80000000";
    attribute INIT_2C of inst : label is "FFFF100033777FFFECC88001137FFFFF000CEFFF07FFFFFFF7773331EEEEEEEE";
    attribute INIT_2D of inst : label is "000000378CEEFFFF33100000000000080037FFF73FFFFFFFFE81FFFFFFFFF333";
    attribute INIT_2E of inst : label is "EC80000001133333FFF8CEFFFFFFFFFFFF77FFFF00000000FFF77FFF000003FF";
    attribute INIT_2F of inst : label is "33331100333377FF0000CFFF0FFFFFFF33FFFFFF00000113FFFFFFF7F7310000";
    attribute INIT_30 of inst : label is "000CEFFF8FFFFFFFFF7FFFFE00000000FFFFEFFFFFFFFFFFFFFFFF71C88CEFFF";
    attribute INIT_31 of inst : label is "FFFE622010000000200000003377FFFFFFFFFF737310000000111332FFFFF773";
    attribute INIT_32 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_33 of inst : label is "23110001000011377FFFFFFF0000000000000000000000000000003700000000";
    attribute INIT_34 of inst : label is "FC88CFFFFFFF313FFFFDC88811333333EECC8000EEC8FFFF011BFFFF007FFFFF";
    attribute INIT_35 of inst : label is "FFFFF77300000000FFFFFFFFFFFFFFE8FFFFFFFF088CEFFF33311100013FFFFF";
    attribute INIT_36 of inst : label is "777FFFFFFFFFFFFFFFFFFFFFCEFFFFFF00000000777777FF0000003FFFFEC888";
    attribute INIT_37 of inst : label is "00000000FFFFEE0010000000EEC8800000133FFFFF77733177FFFFFFFFF00000";
    attribute INIT_38 of inst : label is "00000000000000008CEE64400000000008000000000133370000000000000030";
    attribute INIT_39 of inst : label is "0000000008C633FC000000000000000000000000766622000000000000000000";
    attribute INIT_3A of inst : label is "6773100000000000004444660000000000000000000000000011000000000000";
    attribute INIT_3B of inst : label is "6666666700000000001337660000000000000000000000000000000000000C00";
    attribute INIT_3C of inst : label is "8CC6711000000000000000000000001100000022088888880000000033110000";
    attribute INIT_3D of inst : label is "C000000000000000000000000000000000000000337FE80000000000333776EC";
    attribute INIT_3E of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3F of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
