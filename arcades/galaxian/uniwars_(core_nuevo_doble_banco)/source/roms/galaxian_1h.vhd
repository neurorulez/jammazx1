-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity GALAXIAN_1H is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of GALAXIAN_1H is

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
    attribute INIT_05 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "00EF8F80F11111118FCFE000F000000008AECC801111111F8CCEA8000000000F";
    attribute INIT_07 of inst : label is "000000000001101F0000000010110000000000001111111F0000000011111110";
    attribute INIT_08 of inst : label is "000000000000111F000000001110000004ECECE0000000008CECE40000000000";
    attribute INIT_09 of inst : label is "0000000001367772000000007900000000000000001133320000000079100000";
    attribute INIT_0A of inst : label is "0000004C0267333180000000111200000000000401337771C800000012400000";
    attribute INIT_0B of inst : label is "000F00000000000000000000111000000000008000088CEF0000000011200000";
    attribute INIT_0C of inst : label is "07E080E7000000000000000000000000000360E00000000F00E06300CF000000";
    attribute INIT_0D of inst : label is "FC0FFF00F359953F000000F0000000000000000F000000000000000000000000";
    attribute INIT_0E of inst : label is "004800000008427A08608400EFEB3200000000000001566400800000A5264100";
    attribute INIT_0F of inst : label is "00400282101208015000040010040101008880000000B6C80000000000843C00";
    attribute INIT_10 of inst : label is "000000000023666600000000663200000000000001101F100000000011000000";
    attribute INIT_11 of inst : label is "00008808C060008C81112480C800060008800880004008800880000004000000";
    attribute INIT_12 of inst : label is "0000044060000020040080001000000200000444006000120008000002214300";
    attribute INIT_13 of inst : label is "4E7E400000008C83004E7E408C800000081F0F180133B3370000000000000000";
    attribute INIT_14 of inst : label is "000000000000000000000000000000000006600040000000E0002AAAE8880000";
    attribute INIT_15 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_16 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_17 of inst : label is "CEFF7777CEFF73337FFFFFEC3333331000000000000000000000000000000000";
    attribute INIT_18 of inst : label is "00880000FDEFFFFF00000000F7BDE4008CEEFFDB137EDB737FFFFE0031000000";
    attribute INIT_19 of inst : label is "000000000000886F00000000FFFFFEDF000037F700000000BDFFEC1001316773";
    attribute INIT_1A of inst : label is "0000000077BBDDEE00000000ECC00884C4EEBFEEFFF7F773DDB7F60031300000";
    attribute INIT_1B of inst : label is "000000000AEF3DEE0000000CE6DDBB7F03BF7BDD00003377EEF589317FFF7FFF";
    attribute INIT_1C of inst : label is "00000000FFFFFFFE00000000DDE87100C88CEFF7FFFFF511FFFFF20011100000";
    attribute INIT_1D of inst : label is "0000000007FDB7FF00000000EEEFFEFF0277FFFF00000277FFFFFFFE77331107";
    attribute INIT_1E of inst : label is "8CCE6AC0FFFFEFCE00000000BFDC60008CEEFFFFFFFFB6FFE5FEFEC0EDF73000";
    attribute INIT_1F of inst : label is "0000080007DBB6FF008000006DFFFFFF013BF77B0067EFD7F7BBFFEC7FDE6BFF";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "0008CCCEF1111111EEE64400F000000000446EEE1111111FECCC80000000000F";
    attribute INIT_27 of inst : label is "0008800800004008800880008004000008880008000840088000888080048000";
    attribute INIT_28 of inst : label is "00000000088CEEEE00000000EEEEC880088CEEEE00000000EEEEC88000000000";
    attribute INIT_29 of inst : label is "00000000088CEEEE00000000EEEEC8800000000000446EEE00000000ECCC8000";
    attribute INIT_2A of inst : label is "4E7E400000008C83004E7E408C800000000000000008CCCE00000000EEE64400";
    attribute INIT_2B of inst : label is "000F000000000000080000005F7000000000000000002F7C8C000000FF700000";
    attribute INIT_2C of inst : label is "07E080E7000000000000000000000000000360E00000000F00E06300CF000000";
    attribute INIT_2D of inst : label is "FC0FFF0000FFF0CF000000F0000000000000000F000000000000000000000000";
    attribute INIT_2E of inst : label is "004800000008427A08608400EFEB3200000000000001566400800000A5264100";
    attribute INIT_2F of inst : label is "00400282101208015000040010040101008880000000B6C80000000000843C00";
    attribute INIT_30 of inst : label is "81F0F180133B337000000000000000004C00F100733B33700000000000000000";
    attribute INIT_31 of inst : label is "0000000000001240000000004210000001F00C40733B33700000000000000000";
    attribute INIT_32 of inst : label is "0000044060000020040080001000000200000444006000120008000002214300";
    attribute INIT_33 of inst : label is "BBBB330000FFFFFBFBBB110000FFFFEEFFF3330000333FFF00999BEC0699DD76";
    attribute INIT_34 of inst : label is "08421111F0213773100024803773120100001111F0213773111100003773120F";
    attribute INIT_35 of inst : label is "0842000110113773111124803773110F08421100C0113773011124803773110C";
    attribute INIT_36 of inst : label is "08421111F0213773100024803773120100001111F0213773111100003773120F";
    attribute INIT_37 of inst : label is "0842000110113773111124803773110F08421100C0613773011124803F73160C";
    attribute INIT_38 of inst : label is "00880000FDEFFFFF00000000F7BDE4008CEEFFDB137EDB737FFFFE0031000000";
    attribute INIT_39 of inst : label is "000000000000886F00000000FFFFFEDF000037F700000000BDFFEC1001316773";
    attribute INIT_3A of inst : label is "0000000077BBDDEE00000000ECC00884C4EEBFEEFFF7F773DDB7F60031300000";
    attribute INIT_3B of inst : label is "000000000AEF3DEE0000000CE6DDBB7F03BF7BDD00003377EEF589317FFF7FFF";
    attribute INIT_3C of inst : label is "00000000FFFFFFFE00000000DDE87100C88CEFF7FFFFF511FFFFF20011100000";
    attribute INIT_3D of inst : label is "0000000007FDB7FF00000000EEEFFEFF0277FFFF00000277FFFFFFFE77331107";
    attribute INIT_3E of inst : label is "8CCE6AC0FFFFEFCE00000000BFDC60008CEEFFFFFFFFB6FFE5FEFEC0EDF73000";
    attribute INIT_3F of inst : label is "0000080007DBB6FF008000066DFFFFFF013BF77B0067EFD7F7BBFFEC7FDE6BFF";
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
    attribute INIT_05 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "0001101FF000000010110000F88888881111111F0000000F111111108888888F";
    attribute INIT_07 of inst : label is "00EF8F80000000008FCFE0000000000008AECC80000000008CCEA80000000000";
    attribute INIT_08 of inst : label is "04ECEC80000000008CECE400000000000000111F000000001110000000000000";
    attribute INIT_09 of inst : label is "0080800500000000FE6000000100000008C8880000000000CDEC000001000000";
    attribute INIT_0A of inst : label is "0000883700000000F3000000000000000080080300000000F760000000000000";
    attribute INIT_0B of inst : label is "004F4000000000000000000000000000000003FF000233100000000000000000";
    attribute INIT_0C of inst : label is "0000F000000000000000000000000000000007100000000F60170000FF000000";
    attribute INIT_0D of inst : label is "17FFFF00FCA99ACF000000F0000000000707570F000000000000000000000000";
    attribute INIT_0E of inst : label is "02449AE6211000005EF10800000032200080467E0000000025A4200000000000";
    attribute INIT_0F of inst : label is "080020080020040A801040A0410402000033D63100000000136D000012222300";
    attribute INIT_10 of inst : label is "88CEEEEE00000000EEEC880000000000EFCFEFEF00000000CEE0000000000000";
    attribute INIT_11 of inst : label is "00C000260124888162000C031220000037DB400400000000BD73000000000000";
    attribute INIT_12 of inst : label is "40100008000100224800010C002110000061000400001220C000300002100000";
    attribute INIT_13 of inst : label is "0000000C000137FF00000000F73100000F8B1B8F0013F3100000000000000000";
    attribute INIT_14 of inst : label is "0000000000000000000000000000000000066000200000003220122232221022";
    attribute INIT_15 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_16 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_17 of inst : label is "0000000037FFFEEE009FFFFFEEEEEF7300000000000000000000000000000000";
    attribute INIT_18 of inst : label is "FFF7BCEE17FFFFBD00800000EFDF7300FB7FFFFF00000000FE51000000000000";
    attribute INIT_19 of inst : label is "00000000000CEFFE08CA6FFEDBFFFF770000000100000000BFFFF7BF00000000";
    attribute INIT_1A of inst : label is "FEFFEC84339FFFBB00080000DDEF9000DFEEDDBB11000000BBDEF60000000000";
    attribute INIT_1B of inst : label is "0000CCFE049FFEDDEECCEFFFBBE93398003FEDBB00000000BBDDEEFE00000015";
    attribute INIT_1C of inst : label is "CC8CC00077F7FFFF08CCC8007FB00000FFFB7FFF33373000EFD9310000000000";
    attribute INIT_1D of inst : label is "0000880000009BFF00000008FFFFFFFF0000001B00000000FFFFFFFF00000001";
    attribute INIT_1E of inst : label is "FFDEF7EC733F356F6AEC0000756EFF20FFFF7FB737713301FEEA110011000000";
    attribute INIT_1F of inst : label is "008EEDF608C7F755FFB7EFEAFFFFF7730008E7FF000011006BFF7FFF22163773";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "01115766F000000066331000F8888888000133660000000F667711108888888F";
    attribute INIT_27 of inst : label is "0037DB400000000004BD73000000000037C9BE400000000004EB9C7300000000";
    attribute INIT_28 of inst : label is "0000000000023666000000006663200000023666000000006663200000000000";
    attribute INIT_29 of inst : label is "0000000000023666000000006663200000000000000133660000000066771110";
    attribute INIT_2A of inst : label is "0000000C000137FF00000000F731000000000000011157660000000066331000";
    attribute INIT_2B of inst : label is "004F4000000000002FE0000001000000000008FF000003213DFE000010000000";
    attribute INIT_2C of inst : label is "0000F000000000000000000000000000000007100000000F60170000FF000000";
    attribute INIT_2D of inst : label is "17FFFF0000FFFF71000000F0000000000707570F000000000000000000000000";
    attribute INIT_2E of inst : label is "02449AE6211000005EF10800000032200080467E0000000025A4200000000000";
    attribute INIT_2F of inst : label is "080020080020040A801040A0410402000033D63100000000136D000012222300";
    attribute INIT_30 of inst : label is "F8B1B8F0013F31000000000000000000C1B1B0C0013F31000000000000000000";
    attribute INIT_31 of inst : label is "000000000000BE20000000002EB00000C0B1B1C0013F31000000000000000000";
    attribute INIT_32 of inst : label is "40100008000100224800010C002110000061000400001220C000300002100000";
    attribute INIT_33 of inst : label is "DDDDCC0000FFFFFD8DDF770000FFFDD8FFFCCC0000CCCFFF0374447303754430";
    attribute INIT_34 of inst : label is "80808CEE01240008EEC8080F88884210F0808CEE00008888EEC8080F88880000";
    attribute INIT_35 of inst : label is "F0008CEE01248888EEC800081000421070008CEE01248880EEC8000300884210";
    attribute INIT_36 of inst : label is "80808CEE01240008EEC8080F88884210F0808CEE00008888EEC8080F88880000";
    attribute INIT_37 of inst : label is "F0008CEE01248888EEC800088000421070C08CEE01248880EEC80C0300884210";
    attribute INIT_38 of inst : label is "FFF7BCEE17FFFFBDC0800000EFDF7300FB7FFFFF00000000FE51000000000000";
    attribute INIT_39 of inst : label is "00000000000CEFFE08CA6FFEDBFFFF770000000100000000BFFFF7BF00000000";
    attribute INIT_3A of inst : label is "FEFFEC84339FFFBB00080000DDEF9000DFEEDDBB11000000BBDEF60000000000";
    attribute INIT_3B of inst : label is "0000CCFE049FFEDDEECCEFFFBBE93398003FEDBB00000000BBDDEEFE00000015";
    attribute INIT_3C of inst : label is "CC8CC00077F7FFFF08CCC8007FB00000FFFB7FFF33373000EFD9310000000000";
    attribute INIT_3D of inst : label is "0000880000009BFF00000008FFFFFFFF0000001B00000000FFFFFFFF00000001";
    attribute INIT_3E of inst : label is "FFDEF7EC733F356F6AEC0000756EFF20FFFF7FB737713301FEEA110011000000";
    attribute INIT_3F of inst : label is "008EEDF608C7F755FFB7EFEAFFFFF7730008E7FF000011006BFF7FFF22163773";
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
