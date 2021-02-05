-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity chrrom is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of chrrom is

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
    attribute INIT_00 of inst : label is "036010030E33EC6F077310630F0CE73E030000100FCCCCCC013666210C23336C";
    attribute INIT_01 of inst : label is "011100670888C63F036676310E33E00E036007670E333E0E00076310066F66EE";
    attribute INIT_02 of inst : label is "076676670E33E33E06676631033F336C030036630C63F33E034437630E3FC22C";
    attribute INIT_03 of inst : label is "066676670000E00F033333330F00E00F076666670C63336C013666310E30003E";
    attribute INIT_04 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_05 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_06 of inst : label is "FF1FF1FF99999991CCCCCCC8FFCFF07733333333000000FF349AA943C291192C";
    attribute INIT_07 of inst : label is "FF1111FF08888880EE0000EE3766667389999990FF8888FF999999FF999999FF";
    attribute INIT_08 of inst : label is "03373733066F6F66000021330000426633011111000088CC034555430E0F5D1E";
    attribute INIT_09 of inst : label is "0000101100000888034635430B4A388004210657075384210030363008EBE8E8";
    attribute INIT_0A of inst : label is "000030000088E8800021012008AC8CA80100000108C666C8001333100C80008C";
    attribute INIT_0B of inst : label is "00000000000000000110000008800000000030000000E0000213000000000000";
    attribute INIT_0C of inst : label is "036010030E33EC6F077310630F0CE73E030000100FCCCCCC013666210C23336C";
    attribute INIT_0D of inst : label is "011100670888C63F036676310E33E00E036007670E333E0E00076310066F66EE";
    attribute INIT_0E of inst : label is "01010110008808800011011000880880030036630C63F33E034437630E3FC22C";
    attribute INIT_0F of inst : label is "00000663CC0C633E03100013008C6C800077077000FF0FF00001310006C808C6";
    attribute INIT_10 of inst : label is "013666310E30003E076676670E33E33E06676631033F336C0000000000000000";
    attribute INIT_11 of inst : label is "013666310F33700F066676670000E00F033333330F00E00F076666670C63336C";
    attribute INIT_12 of inst : label is "0667766607EC8C63036000000E333333030000030FCCCCCF066676660333F333";
    attribute INIT_13 of inst : label is "036666630E33333E06667776037FFB3306667776033BFF73033333330F000000";
    attribute INIT_14 of inst : label is "036036630E33E06C0667666707EC733E036666630D6F333E06676667000E333E";
    attribute INIT_15 of inst : label is "06777666037FFB330013766608CE7333036666660E333333000000030CCCCCCF";
    attribute INIT_16 of inst : label is "8888888F0000000F077310070F08CE7F000013330CCCE33306731376037ECE73";
    attribute INIT_17 of inst : label is "EFDDFDEF6FB6FDBAFFFC7FFFFFF7FFFFFF7F3FFFF9F36FFFFFFFFFFFF6FBFFFF";
    attribute INIT_18 of inst : label is "FF97DDFCFF9FFFF7FFFFFFFFFFFBDBFEBFB5FC3DFF7BFFBBFF5EFF777F9FFE79";
    attribute INIT_19 of inst : label is "889FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF33FFFFFFFF7AF7FFFFFFFF";
    attribute INIT_1A of inst : label is "FFFFFFFFFFFFFFFCFFFFFE88FFFFFFFF7FFFFFFFFFFFFFFFFFFFFFFFCCFFFFFF";
    attribute INIT_1B of inst : label is "FFE4EFFFFFF5FFFDFFE8EFFCFFF7FDFEFFFCCFFFFFFFFFFFFFFFFF77FFFFFFFF";
    attribute INIT_1C of inst : label is "FFFECEF6FFFF7FFFFFECEFFEFFF7FFFBBFFEFFF3FF737FFFFFFBE7FDFFF737FD";
    attribute INIT_1D of inst : label is "FFFFFFFFDCEFFEEFFBFECEFFFDFF7FFFFFECEFFFFFF7FFFFFFFFEFFFFEF737FF";
    attribute INIT_1E of inst : label is "11101133FF6FEEEFFFFFFFFF888888F9CC8C8FFF77FFFFFF777FF3AFFFFFF7FF";
    attribute INIT_1F of inst : label is "9F02FFCCFF3FFFFFF777C101FFEFB7FFFFFFCFFEFEEE6228C0008308FA517F17";
    attribute INIT_20 of inst : label is "0000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF";
    attribute INIT_21 of inst : label is "8EFFFE80008E8000000000000000000000000000000000000000000000000000";
    attribute INIT_22 of inst : label is "000000000000000036036630C66C06C00000CC88000000000000000000001100";
    attribute INIT_23 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_24 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73FFFFFFFF";
    attribute INIT_25 of inst : label is "11330000D0777777010000008800000077733000FFECC0000013000030000000";
    attribute INIT_26 of inst : label is "00EFBB8E00EFEFFF000000330037DDDDDDBFF800C8C88000ED9DDDD9FFFFFFCF";
    attribute INIT_27 of inst : label is "000000000000000000000000000000000000000000000000001000FD00000008";
    attribute INIT_28 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_29 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_2A of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_2B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_2C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_2D of inst : label is "1337F333FFFFFFFFFFFFD888CCCEE600FFFFECC4FFFFF73011337600FFFF9100";
    attribute INIT_2E of inst : label is "267FFFFF00089FFF08E773310008EFFFFFFFFFFFEEECC8C8FFFFFFFFFFFFFFFF";
    attribute INIT_2F of inst : label is "FFFFDDC80CCCC800D3F77000C3BBB7F7F1333100BCFFFF00226EEEFF000000FF";
    attribute INIT_30 of inst : label is "0017733300EEFEDDEEDD3FFF000FEEEC7BDDEFFCFFDA2BB30194FFFF6CB3B577";
    attribute INIT_31 of inst : label is "0FFFFFF00FFFFFF0FFFFFFFFFFFFF99F08BFFFFC000CC8800DDE97FF0FFFF79E";
    attribute INIT_32 of inst : label is "033333300FFFFFF0033333300FFFFFF0033333300FFFFFF0077777700FFFFFF0";
    attribute INIT_33 of inst : label is "033333300FFFFFF0033333300FFFFFF0033333300FFFFFF0033333300FFFFFF0";
    attribute INIT_34 of inst : label is "20036666000C66660006676780000C0E80000000200000000000000000000000";
    attribute INIT_35 of inst : label is "8000000000000000200000000000000000076666800E000000076767200E0C0E";
    attribute INIT_36 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_37 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_38 of inst : label is "001376660E33333E0366666308CE7333066766310F33700F01366631033F336C";
    attribute INIT_39 of inst : label is "066766670F00E00F0333333307EC733E03333333033BFF73066677760F00E00F";
    attribute INIT_3A of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3C of inst : label is "44EE76662277E6660077777000EEEEE04CCDFDC8233BFB3100033300000CCC00";
    attribute INIT_3D of inst : label is "777BBC62443FC8C601101FFF008880006EFFF770231067737700000067F38800";
    attribute INIT_3E of inst : label is "0CCC00C6777FEB1000061D3300000EF77FF32EF7C6B880001EFF30008EEEC000";
    attribute INIT_3F of inst : label is "001110F70EEE8FF0033303F300CCC8EF7F0111000FF8EEE03F303330FE8CCC00";
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
    attribute INIT_00 of inst : label is "036010030E33EC6F077310630F0CE73E030000100FCCCCCC013666210C23336C";
    attribute INIT_01 of inst : label is "011100670888C63F036676310E33E00E036007670E333E0E00076310066F66EE";
    attribute INIT_02 of inst : label is "076676670E33E33E06676631033F336C030036630C63F33E034437630E3FC22C";
    attribute INIT_03 of inst : label is "066676670000E00F033333330F00E00F076666670C63336C013666310E30003E";
    attribute INIT_04 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_05 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_06 of inst : label is "000000000000000000000000000000000000000000000000349AA943C291192C";
    attribute INIT_07 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_08 of inst : label is "03373733066F6F66000021330000426633011111000088CC034555430E0F5D1E";
    attribute INIT_09 of inst : label is "0000101100000888034635430B4A388004210657075384210030363008EBE8E8";
    attribute INIT_0A of inst : label is "000030000088E8800021012008AC8CA80100000108C666C8001333100C80008C";
    attribute INIT_0B of inst : label is "00000000000000000110000008800000000030000000E0000213000000000000";
    attribute INIT_0C of inst : label is "036010030E33EC6F077310630F0CE73E030000100FCCCCCC013666210C23336C";
    attribute INIT_0D of inst : label is "011100670888C63F036676310E33E00E036007670E333E0E00076310066F66EE";
    attribute INIT_0E of inst : label is "01010110008808800011011000880880030036630C63F33E034437630E3FC22C";
    attribute INIT_0F of inst : label is "00000663CC0C633E03100013008C6C800077077000FF0FF00001310006C808C6";
    attribute INIT_10 of inst : label is "013666310E30003E076676670E33E33E06676631033F336C0000000000000000";
    attribute INIT_11 of inst : label is "013666310F33700F066676670000E00F033333330F00E00F076666670C63336C";
    attribute INIT_12 of inst : label is "0667766607EC8C63036000000E333333030000030FCCCCCF066676660333F333";
    attribute INIT_13 of inst : label is "036666630E33333E06667776037FFB3306667776033BFF73033333330F000000";
    attribute INIT_14 of inst : label is "036036630E33E06C0667666707EC733E036666630D6F333E06676667000E333E";
    attribute INIT_15 of inst : label is "06777666037FFB330013766608CE7333036666660E333333000000030CCCCCCF";
    attribute INIT_16 of inst : label is "8888888F0000000F077310070F08CE7F000013330CCCE33306731376037ECE73";
    attribute INIT_17 of inst : label is "73775377FEDBFFFFEBFF8C0040880000FFFFFF40FFFF97E030110000FFFDB300";
    attribute INIT_18 of inst : label is "06E1FFFC0EFFFFFF000011230017FFF7FEFFFFFF6EEE2CEEF7FFE9FFFEFF7FFF";
    attribute INIT_19 of inst : label is "7F72223F311113FFFFFFFFFF88F8CCEFFCCCCFFF39FC805F0007FFFF000088C0";
    attribute INIT_1A of inst : label is "FFECCCEFFF621133FF3111F7FFFF3195CE9101BF33026D00ECCEFFFFF331DFF7";
    attribute INIT_1B of inst : label is "C83338CF7399937DC83338CE7399917EFE133CCFF319977FF310009EFFFFFF73";
    attribute INIT_1C of inst : label is "FC83338EF7399937483338C663999378EC999CE331CCC13EFEC991CCF31CCC11";
    attribute INIT_1D of inst : label is "FFFFFFFFEFFEFFFFF083338CF5399937C83338CF7399937FFAC999CEF31CCC13";
    attribute INIT_1E of inst : label is "1991BFBFFFDEFFFFFFFFFFFF777FFFDE3BEBFCDFF7FFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_1F of inst : label is "7FFFFFEEFFFFFFFFF777FB93FFFFFFFFFFFFFFEFFFFFFFD6ECEEEEE7FF737717";
    attribute INIT_20 of inst : label is "0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000";
    attribute INIT_21 of inst : label is "7100017FFF717FFF000CFFFF0003FFFF11000011FFFFFFFFFFFFFF73FFFFFFFF";
    attribute INIT_22 of inst : label is "0000000000000000FFFFFFFFFFFFFFFFFFFF3377FFFFFFFFFFFFFFFFFFFFEEFF";
    attribute INIT_23 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_24 of inst : label is "000000CC00000000000000FF000000FFCCCCCCCC00000000CCCCCEFF000000FF";
    attribute INIT_25 of inst : label is "C888CFFF0044666664CBF9FF337DFFFF6663BCFF0009D3FFDEC8CFEFBC77F46F";
    attribute INIT_26 of inst : label is "F1000000F1000000F99FEC88FC80000000000876111337F70000000004422100";
    attribute INIT_27 of inst : label is "000000000000000000000000000000000000000000000000FEC67000F75FF771";
    attribute INIT_28 of inst : label is "EE8AAAAFED5DDDEFCBFEFBCFE55D55EF8BDEBBCF6DDD55EFCEEEECEF6DDDDDEF";
    attribute INIT_29 of inst : label is "CBBCBBCFE55D55EFDDDEEF8FEDDDD56FCBB8BBCFE55DD5EFCBFF8B8FE555DD6F";
    attribute INIT_2A of inst : label is "9666669FFFFFFFFF7AAAAA7F3DDDDD3F00000000311BFB10CBFCBBCFE55555EF";
    attribute INIT_2B of inst : label is "000000000000000000000000000000000000000000000000FF5B5FFFF0BDE69F";
    attribute INIT_2C of inst : label is "000009FD0000088800000111000009FBC88DFD800000000000000000311BFB10";
    attribute INIT_2D of inst : label is "EFEA3EEF0955955800002777333119FF0000133B000008CFEECC89FF00006EFF";
    attribute INIT_2E of inst : label is "D9800000FFF76000F7188CCEFFF7100009AAAAA91D57F77F0222E22C0889AC88";
    attribute INIT_2F of inst : label is "FFFFDDEF3DDDDB7FD3F7707FC3BBB7FFF9BBBDEFBCFFFF0FDD911100FFFFFF00";
    attribute INIT_30 of inst : label is "FE977BBBF0EEFEDDEEDD3FFFFF1FEEEC7BDDEFFCFFDA2BB3CDD4FFFF6CB3B577";
    attribute INIT_31 of inst : label is "0000000000000000000000000000066078BFFFFCFF3DDBB73DDE97FF0FFFF79E";
    attribute INIT_32 of inst : label is "0FFFFFF0000000000EEEEEE0000000000CCCCCC0000000000888888000000000";
    attribute INIT_33 of inst : label is "0FFFFFF00FFFFFF00FFFFFF00EEEEEE00FFFFFF00CCCCCC00FFFFFF008888880";
    attribute INIT_34 of inst : label is "00036666000C66660006676700000C0E00000000000000003300000000000000";
    attribute INIT_35 of inst : label is "0000000066000000000000000000000000076666000E000088076767000E0C0E";
    attribute INIT_36 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_37 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_38 of inst : label is "001376660E33333E0366666308CE7333066766310F33700F01366631033F336C";
    attribute INIT_39 of inst : label is "066766670F00E00F0333333307EC733E03333333033BFF73066677760F00E00F";
    attribute INIT_3A of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3C of inst : label is "44488888222111110077777000EEEEE0800111001008880000033300000CCC00";
    attribute INIT_3D of inst : label is "7773308C442C373101100EEF0088800080000000100067737700000067730000";
    attribute INIT_3E of inst : label is "0CCC0008777104EF00061D2000000EF780000EF7318880000EFF300000000000";
    attribute INIT_3F of inst : label is "001110080EEE000F033300E100CCC00080011100F000EEE01E003330000CCC00";
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
