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
    attribute INIT_00 of inst : label is "000EE000CE222EC0CE2226408EE88880CE22264022AAEE6022EE22008C226C80";
    attribute INIT_01 of inst : label is "00000EE02222EE008C622EE046226C80CE222EE0EE888EE08C622200CEAA22C0";
    attribute INIT_02 of inst : label is "EEC80EE0EE080EE02222EE0026EC8EE0CE22264022EE2200EE000EE0EE226C80";
    attribute INIT_03 of inst : label is "08CEC800CE222EC000EE0000CE22264026EC8EE0ACEA2EC008888EE0CE222EC0";
    attribute INIT_04 of inst : label is "00AA0000CE62EAE0FFFFFFFFA4A22C00222AEE6000EE00006EC8CE608EC8CE80";
    attribute INIT_05 of inst : label is "C255592C00EC000000660000C22E0C222C0688E00CCCCC00008C800000008200";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000FF00000000000000FF";
    attribute INIT_07 of inst : label is "000000EE000000FF000000FF000000FF000000FF000000FF0000001100000000";
    attribute INIT_08 of inst : label is "08CE73110000000000000000000000000000000137EC800037EC800000000000";
    attribute INIT_09 of inst : label is "00FF00FF00FF807788800000F00FF000708FF0000000000008CE731000000000";
    attribute INIT_0A of inst : label is "0E0222E002484200FFFFFFFF4444444444444447888888880000888800FF00F0";
    attribute INIT_0B of inst : label is "FFFFFFFF00000402000408880000840200040888FFFFFFFFFFFFFFFFC62E0EC8";
    attribute INIT_0C of inst : label is "FFFFFFFF0024BFF7FFFFFFFFFFFFFFFF0CCE39F200000066FFFFFFFFFFFFFFFF";
    attribute INIT_0D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_0E of inst : label is "77B7000077B7000077B7000077B70000000107F1000107F10007FFCC0007FFCC";
    attribute INIT_0F of inst : label is "77B700008880000077B700000024BFF7FF70500040408000FF7050000083777F";
    attribute INIT_10 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70500040408000FF7050000083777F";
    attribute INIT_11 of inst : label is "00000000030000000300000003000000EF700000EF700000EF700000EF700000";
    attribute INIT_12 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_13 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8880000088800000FFFFFFFFFFFFFFFF";
    attribute INIT_14 of inst : label is "777777777777777F0EFF77FFF77FFE0F3EE800003EE800000000000000000000";
    attribute INIT_15 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_16 of inst : label is "EECA20000000000000000000000088AAAAAAAABBFFFFFFFC0000000000000000";
    attribute INIT_17 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02222664CCAAA64CAA6CA6C8";
    attribute INIT_18 of inst : label is "C2202E20C2C02E20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_19 of inst : label is "C220C220C2C0C220C220E4C0C2C0E4C0C220C240C2C0C240C2202A60C2C02A60";
    attribute INIT_1A of inst : label is "C220CA20C2C0CA20C220C2C0C2C0C2C0C2200E00C2C00E00C220C2C0C2C0C2C0";
    attribute INIT_1B of inst : label is "0E00A4A0C2C0A4A0C220A4A0E4C0A4A0C240A4A02A60A4A0C2C0C2C0C2C0C2C0";
    attribute INIT_1C of inst : label is "0000000F7777777F7777777700010000000010000000000000000000C2C0A4A0";
    attribute INIT_1D of inst : label is "EF700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_1E of inst : label is "FFFFFFFFFFFFFFFFEF700000EF700000EF700000EF700000EF70000003000000";
    attribute INIT_1F of inst : label is "00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_20 of inst : label is "F710000000000000000000CC00CFFFFF37777310000000000000000000000000";
    attribute INIT_21 of inst : label is "001F710000000000EC000000FFFFF40003FF00000000376000CEFFFECCCEF73F";
    attribute INIT_22 of inst : label is "3110000000017FFFFFEC0000710000000000000000000000000008EF008FFFFF";
    attribute INIT_23 of inst : label is "088CCEEFF73110000000000000000000FFFEECCC00000000008EFFFFFFFFFF10";
    attribute INIT_24 of inst : label is "FFFFF000FFF1000000000000FFFFFFFF000000000000008F0000003FCEFEC800";
    attribute INIT_25 of inst : label is "000000000000000000000000000000000000000000000000FFFFFEECCFFFFF70";
    attribute INIT_26 of inst : label is "8CEFFEEC000000CE000000000000008C08FFFFFF003110000000000000000000";
    attribute INIT_27 of inst : label is "F8000000FFF0000000000800CCCEFFFFFFFFEE80017FFFFFCEEEFFFF10000000";
    attribute INIT_28 of inst : label is "000000000000000000008EFF00EFFFFFFFFFFF1000011000FF10000000000000";
    attribute INIT_29 of inst : label is "EFEEEEFF00000008CEFFFFF7FFFF700001000008FEC00000700000000000000F";
    attribute INIT_2A of inst : label is "10000000FFE00000FFECC000FFFFFFF0FFFFFF738CCEEEFF311001FF00000000";
    attribute INIT_2B of inst : label is "0000000000000000FFFFFEEC8FFFFFF0FFFFF000FFF100000000000000000000";
    attribute INIT_2C of inst : label is "1000000008CFFEEC000000CE000000000000008C08FFFFF70010000000000000";
    attribute INIT_2D of inst : label is "000000FF0000088CFFFFF73100000000008CEEFFFFFFEEC0017FFFFFCEEEFFFF";
    attribute INIT_2E of inst : label is "1000000000000000EC800000FF10000EF000001300000000EEFFFFFE10000FFF";
    attribute INIT_2F of inst : label is "FFFFFFF7FE0000000000008C00CFFFFF011000000003FFFF000CEFFFFFFF7300";
    attribute INIT_30 of inst : label is "311000000000008FF80000313100000000000088EFFFFF77F7100000000008CE";
    attribute INIT_31 of inst : label is "EC800000F730000000088CCEFFFFFFFE08CFFFFFFFF7310000000000CCEEEEFF";
    attribute INIT_32 of inst : label is "FFFF310000000000008CCFFE77FFFFEC000000000000000300008EFFFFFFFFFF";
    attribute INIT_33 of inst : label is "0003108800000000EEECC8800001137700000000FFFFFFF0000000CECCCC8000";
    attribute INIT_34 of inst : label is "000017FFEFFFF80031000000CEFFFFFF0000000000000000FFFFFFEE00EFFFFF";
    attribute INIT_35 of inst : label is "000000007311000000000000FFFEC000017FFFFF00000000FFFFFFF70CEFFFE8";
    attribute INIT_36 of inst : label is "008ECCCC08CEEFFFFFFF300037FF10000000000000000000000000FFFC800000";
    attribute INIT_37 of inst : label is "0000007FC8800000FF73100000000000FFFFFFEECEEFFFFFFFEEC88000001337";
    attribute INIT_38 of inst : label is "0000000C00000EFF00000089CEFFFFFFFFFFFFFF101377FF0000000000000000";
    attribute INIT_39 of inst : label is "FFFFFFFF000000088EFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFF013FFFFF";
    attribute INIT_3A of inst : label is "FFF710CF1377FFFFFFFFFFFF88888891FFFFFFFF0137FFFF00000008CD9BBFFF";
    attribute INIT_3B of inst : label is "FFFFFFFFFFFF9CCEFFFFFFFFFFF73100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3C of inst : label is "FFFFFF7700000000EC000000FFE44000FFFFFFFFFFFFFFFFFFFFEEE0F7731300";
    attribute INIT_3D of inst : label is "00000000EEEC0000FFFFF000FFF700003000000000000000FFFF8EF0F7331000";
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
    attribute INIT_06 of inst : label is "0CCCCCCCCCCCCCEECCCCCCCCCCCCC0CC000000CC000000FFCCCCCCCCCCCCCCFF";
    attribute INIT_07 of inst : label is "000000FF00000CFF000000FF00000011000000DDCCCCC0DD00000000CCCCC000";
    attribute INIT_08 of inst : label is "73100000000000CE000000CC800000000000000000013FEE000137ECC0000000";
    attribute INIT_09 of inst : label is "00FF00FF00013333D13FE000F00FF00033310000000008CCF310000000000CEE";
    attribute INIT_0A of inst : label is "3705557002101200FFFFFFFF33333333333333335555555500EF31D500FF00F0";
    attribute INIT_0B of inst : label is "FFFFFFFF0807EFF70058FFF70807EFF70058FFF7FFFFFFFFFFFFFFFF36470701";
    attribute INIT_0C of inst : label is "FFFFFFFF00000002FFFFFFFFFFFFFFFF031FFF8E00008CF7FFFFFFFFFFFFFFFF";
    attribute INIT_0D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_0E of inst : label is "010000CC01000000010000000100000000000010000000100000011100000111";
    attribute INIT_0F of inst : label is "010000CCFFE128000100000000000002000100CCFFFE00000001000000001010";
    attribute INIT_10 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000100CCFFFE00000001000000001010";
    attribute INIT_11 of inst : label is "000000CC000000000000000000000000100000CC100000001000000010000000";
    attribute INIT_12 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_13 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE12800FFE12800FFFFFFFFFFFFFFFF";
    attribute INIT_14 of inst : label is "008DFFCCCFFD800F001376777673100FFE370000FE3700000000000000000000";
    attribute INIT_15 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_16 of inst : label is "FFFFFE91000000000000000088AAAAAAAAAAEEFFFF137FFFE8C0000000000000";
    attribute INIT_17 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000111322777FFFF";
    attribute INIT_18 of inst : label is "4570072034300720FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_19 of inst : label is "4570457034304570457072103430721045706540343065404570342034303420";
    attribute INIT_1A of inst : label is "4570343034303430457025203430252045707460343074604570553034305530";
    attribute INIT_1B of inst : label is "7460000055300000457000007210000065400000342000003430343034303430";
    attribute INIT_1C of inst : label is "0000000F0000000F000000000000000000000000000C44000044C00025200000";
    attribute INIT_1D of inst : label is "10000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_1E of inst : label is "FFFFFFFFFFFFFFFF100000001000000010000000100000001000000000000000";
    attribute INIT_1F of inst : label is "00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_20 of inst : label is "10000000000000000000CFFFCFFFFFF700000000000000000000000000000000";
    attribute INIT_21 of inst : label is "0000000000000000FFFC00007FFF3000001FF800000000004333FFFFFFF71000";
    attribute INIT_22 of inst : label is "000088CE00000011FF7100000000000000000000000000000000EFFF00FFFF71";
    attribute INIT_23 of inst : label is "FFFFFFFF0000000000000000C80000003377FFFF000008CE0EFFFFF3FFFF3000";
    attribute INIT_24 of inst : label is "FFFF00007F100000000000007777333300000008000000FF00000001FFFFFF72";
    attribute INIT_25 of inst : label is "0000000000000000000000000000000000000000000000003FFFFFF7FFFFFF00";
    attribute INIT_26 of inst : label is "33777FFF0000001300000000000CEFFF07FFF730000000110000000000000000";
    attribute INIT_27 of inst : label is "FF800000111000000000CFFEFFFFF7777FFFFFFF0001FFFFFFF7773300000000";
    attribute INIT_28 of inst : label is "0000000000000000000CFFFF8FFFFFF3037FF100C88000007000000080000000";
    attribute INIT_29 of inst : label is "37777773008CEFFFFFFFF710FFF3000000000033FF1000000000000E00000003";
    attribute INIT_2A of inst : label is "00000000FF330000FFFFFF008FFFFFFF33110000FFFFFFFF0000000F00000000";
    attribute INIT_2B of inst : label is "00000000000000003FFFFFF7FFFFFF00FFFF0000373000000000000080000000";
    attribute INIT_2C of inst : label is "0000000033777FFF0000000100000000000CEFFF07FF77100000000000000000";
    attribute INIT_2D of inst : label is "000000378CEEFFFF33100000000000080037FFF73FFFFFFF0001FFFFFFF77333";
    attribute INIT_2E of inst : label is "0000000000000000FFF00000F00000FFFF40000000000000FFF77FFF000003FF";
    attribute INIT_2F of inst : label is "33331100300000000000CFFF0FFFF77300CCCCEE000001138EFFFFF7F7310000";
    attribute INIT_30 of inst : label is "00000008800000FFFF40000000000000008CEFFFFFF7300000000000C88CEFFF";
    attribute INIT_31 of inst : label is "FFFE000010000000CEFFFFFF3377FFFFEFFFFF737310000000000000FFFFF773";
    attribute INIT_32 of inst : label is "FFFFFEEE0000E800CFFFFF708CEFFFFF00000008000000000008BFFFFFFFFFFF";
    attribute INIT_33 of inst : label is "00000001000000007FFFFFFF00000000EECCC800FFFFFF3000000037FFFFFFE0";
    attribute INIT_34 of inst : label is "0088C013FFF73100008CC8881133333300000000EEC88000011BFFFF007FFF30";
    attribute INIT_35 of inst : label is "EEEEE66200000000FC800000FFFFFFE800003777088CEFFE33311100013FFFFF";
    attribute INIT_36 of inst : label is "067FFFFFFFFFFF73FFFFE00000000000000000000000000C0000003FFFFEC000";
    attribute INIT_37 of inst : label is "00000003FFFFEE0010000000EEC8800000133FFFFF77733177FFFFFF00000000";
    attribute INIT_38 of inst : label is "000000EF000003FF00009BBFFFFFFFFFF7FFFFFF0000000000000000000000CF";
    attribute INIT_39 of inst : label is "333311000008CC03FFFFFFFFFFFFFFFFFFFFFFFF0199DDFF3FFFFFFF00001333";
    attribute INIT_3A of inst : label is "10000013FFFFFFFF33333311FFFFFFFF7FFFFFFF000001138EEEFFFFFFFFFFFF";
    attribute INIT_3B of inst : label is "11111110FFFFFFFFFFECC89131000000FFFF7733FFFFFFFF7FFFFFFFFFFFF3FF";
    attribute INIT_3C of inst : label is "7331000000000000F3000000FFFFFFEEFFFFFFDDF7777777FFFFFFF000000000";
    attribute INIT_3D of inst : label is "00000000FFFFC000FFFFF000FF30000000000000CC800000FFFFFF30CCC88800";
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
