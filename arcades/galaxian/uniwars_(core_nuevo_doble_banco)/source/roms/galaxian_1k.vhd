-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity GALAXIAN_1K is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of GALAXIAN_1K is

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
    attribute INIT_06 of inst : label is "00004FEFF1111111EF400000F000000000264CEE1111111FEC4620000000000F";
    attribute INIT_07 of inst : label is "000000000000273F0000000037200000000000000000003F0000000030000000";
    attribute INIT_08 of inst : label is "000000000000003F000000003000000000006CEF00000000EC60000000000000";
    attribute INIT_09 of inst : label is "0000000000001337000000007B0000000000000000000137000000007B000000";
    attribute INIT_0A of inst : label is "0000000C00000111000000003112000000000004000013330000000012400000";
    attribute INIT_0B of inst : label is "88000088880000880000000031100000000000000009FF730000000031200000";
    attribute INIT_0C of inst : label is "07EF4FE7000000000000000000000000036C8C080000003FC80C8C63FF300000";
    attribute INIT_0D of inst : label is "FC0FFF001EEEEEE1000000000000000088888880000000000000000000000000";
    attribute INIT_0E of inst : label is "000002C0000035D608600000E9621200000800000084635B00000000667D1100";
    attribute INIT_0F of inst : label is "08088084081A08004005000000048140008880840E1012484444800084213C00";
    attribute INIT_10 of inst : label is "000000000100019900000000100010000000000000273F370000000020000000";
    attribute INIT_11 of inst : label is "08421108006137FF80880000FF73160E08800000000275570880000020000000";
    attribute INIT_12 of inst : label is "000000000000482000000000980400000402045530608488001A000000004386";
    attribute INIT_13 of inst : label is "008000800000AFFC80008000FFA00000081F0F18008CCC800000000000000000";
    attribute INIT_14 of inst : label is "CEFFF777FFFF0000777FFFEC0000FFFF0006600040000000E0002AAAE8880000";
    attribute INIT_15 of inst : label is "0000000000000000000FFFFF0000000000FFFF00000000000FFFFFFF00000000";
    attribute INIT_16 of inst : label is "C800FFFFFF000000FFF88FFF00000000008CEFFF00FFFF10C00CFFFEFFFF01FF";
    attribute INIT_17 of inst : label is "CEFF7777CEFF73337FFFFFEC33333310F00FFFFF000000000000000000000000";
    attribute INIT_18 of inst : label is "008800081FFF7EFD84422480FFFFF400000884EF137FFFF3EEFBFE0031001680";
    attribute INIT_19 of inst : label is "084224480001ACEF80000000FB7DFFF7000036EF08610000EE68000009737773";
    attribute INIT_1A of inst : label is "00000000897737F700000000BDEC000008004055FEC17673EEEFF60000000000";
    attribute INIT_1B of inst : label is "0000C0000AEFF777000000003923758003BFEECA00003277990000B93DEF5FC3";
    attribute INIT_1C of inst : label is "0000840060186040000000000A940210C88CEB3A0168026A0448800002080010";
    attribute INIT_1D of inst : label is "000000000002480400080000240249000000022000000000994422BE2104E630";
    attribute INIT_1E of inst : label is "0000840830C6102184208421402394008CE27AA2C00049000A01011112080124";
    attribute INIT_1F of inst : label is "124801AC0024490080481AC8920403C0084408840000102108453BEC80219400";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "00004400F111111100228800F0000000008822001111111F004400000000000F";
    attribute INIT_27 of inst : label is "0008800000000275000880005720000008880000000222750000888057222000";
    attribute INIT_28 of inst : label is "0000000000000022000000002200000000000022000000002200000000000000";
    attribute INIT_29 of inst : label is "0000000000000022000000002200000000000000008822000000000000440000";
    attribute INIT_2A of inst : label is "008000800000AFFC80008000FFA0000000000000000044000000000000228800";
    attribute INIT_2B of inst : label is "8800008888000088C00000002001000000000000000020010080000000030000";
    attribute INIT_2C of inst : label is "07EF4FE7000000000000000000000000036C8C080000003FC80C8C63FF300000";
    attribute INIT_2D of inst : label is "FC0FFF0000FFF0CF000000000000000088888880000000000000000000000000";
    attribute INIT_2E of inst : label is "000002C0000035D608600000E9621200000800000084635B00000000667D1100";
    attribute INIT_2F of inst : label is "08088084081A08004005000000048140008880840E1012484444800084213C00";
    attribute INIT_30 of inst : label is "81F0F18008CCC80000000000000000004C00F10018CCC8100000000000000000";
    attribute INIT_31 of inst : label is "0000000000001AC800000000CA10000001F00C4018CCC8100000000000000000";
    attribute INIT_32 of inst : label is "000000000000482000000000980400000402045530608488001A000000004386";
    attribute INIT_33 of inst : label is "BBBB330000FFFFFBFBBB110000FFFFEEFFF3330000333FFF00999BEC0699DD76";
    attribute INIT_34 of inst : label is "00008080F000008C08082480C800000100008080F000008C08080000C800000F";
    attribute INIT_35 of inst : label is "000088090000008C91992480C800000000008808C000008C81992480C8000000";
    attribute INIT_36 of inst : label is "084291910000008C18080000C8000000000091910000008C19190000C8000000";
    attribute INIT_37 of inst : label is "084288081000008C80880000C800000F084299080000008C80880000C800000C";
    attribute INIT_38 of inst : label is "008800081FFF7EFD84422480FFFFF400000884EF137FFFF3EEFBFE0031001680";
    attribute INIT_39 of inst : label is "084224480001ACEF80000000FB7DFFF7000036EF08610000EE68000009737773";
    attribute INIT_3A of inst : label is "00000000897737F700000000BDEC000008004055FEC17673EEEFF60000000000";
    attribute INIT_3B of inst : label is "000000000AEFF777000000003923758003BFEECA00003277990000B93DEF5FC3";
    attribute INIT_3C of inst : label is "0000840060186040000000000A940210C88CEB3A0168026A0448800002080010";
    attribute INIT_3D of inst : label is "000000000002480400080000240249000000021000000000994422BE2104E630";
    attribute INIT_3E of inst : label is "0000840830C6102184208421402394008CE27AA2C00049000A01011112080124";
    attribute INIT_3F of inst : label is "124801AC0024490080481AC8920403C0084408840000102108453BEC80219400";
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
    attribute INIT_06 of inst : label is "0000273FF000000037200000F88888880000003F0000000F300000008888888F";
    attribute INIT_07 of inst : label is "00004FEF00000000EF4000000000000000264CEE00000000EC46200000000000";
    attribute INIT_08 of inst : label is "00006CEF00000000EC600000000000000000003F000000003000000000000000";
    attribute INIT_09 of inst : label is "0000ACCC00000000C00000000100000000008CEC00000000C800000001000000";
    attribute INIT_0A of inst : label is "0004EEFE00000000C80000000000000000001CEF00000000E800000000000000";
    attribute INIT_0B of inst : label is "1100001111000011800000000000000000008EE8000000008000000000000000";
    attribute INIT_0C of inst : label is "00030300000000000000000000000000000011EF0000000FFFE11000CF000000";
    attribute INIT_0D of inst : label is "17FFFF008777777801377F0000000000FFFFFFF0000000000000000000000000";
    attribute INIT_0E of inst : label is "024CCCA7000003007B584800000000000008B68600000000CE78C20010000000";
    attribute INIT_0F of inst : label is "00802000000010060010580001010000003CE731034442111248870012222300";
    attribute INIT_10 of inst : label is "00000222000000002000000000000000004F808F000000004000000000000000";
    attribute INIT_11 of inst : label is "70C08CC8000002218CC80C001088421037FF4BB400000000FF73000000000000";
    attribute INIT_12 of inst : label is "0000420900000000582800000000000090618211012402A80120301642142000";
    attribute INIT_13 of inst : label is "013762F3000137FFF2673100F73100000F07F70F0000F0000000000000000000";
    attribute INIT_14 of inst : label is "FFFF0000FFFF00000000FFFF0000FFFF00066000200000003220122232221022";
    attribute INIT_15 of inst : label is "00EEEEEE00000000EEEFFFFF0000FFFF00FFFFCC00000000CFFFFFF700000000";
    attribute INIT_16 of inst : label is "FF007F88FF00000088FFFFFF0000000000FFFFFF00FFFF00FFFFFFFFFFFF00FF";
    attribute INIT_17 of inst : label is "0000000037FFFEEE009FFFFFEEEEEF73F00FFFFF00000000EEEEEE0000000000";
    attribute INIT_18 of inst : label is "7FDFFEFE00167FFFC0808610FFBF7300EFFEBBF700000001FF75100012244210";
    attribute INIT_19 of inst : label is "01680000000CEBFF09EEEFBEFFF613100008421101244221BEFBDEE010000000";
    attribute INIT_1A of inst : label is "7EB7EC0000000045000000003ADE80000099EFF71C000000EFFFF60000000000";
    attribute INIT_1B of inst : label is "00000CFE0417FFE6A2CC6FF164200000003FFF7F00000000DC62910800000011";
    attribute INIT_1C of inst : label is "0002108446F5CE6320000000904422107D049324010520009026490012001000";
    attribute INIT_1D of inst : label is "000000020244000148005E80224488BE00084021000000000004210000210000";
    attribute INIT_1E of inst : label is "00214813633ECA90940048408A910000F3008001100000122011200000001240";
    attribute INIT_1F of inst : label is "00001209000808AA00481015089AE47312221800842104219400900114210000";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "00220010F000000098000000F8888888000000890000000F010022008888888F";
    attribute INIT_27 of inst : label is "0037FF4B00000000B4FF73000000000037FFFE4B00000000B4EFFF7300000000";
    attribute INIT_28 of inst : label is "0000000000100019000000009100010000100019000000009100010000000000";
    attribute INIT_29 of inst : label is "0000000000010118000000008110100000000000000000890000000001002200";
    attribute INIT_2A of inst : label is "013762F3000137FFF2673100F731000000000000002200100000000098000000";
    attribute INIT_2B of inst : label is "110000111100001180080000300000000000001000000010C000000000000000";
    attribute INIT_2C of inst : label is "00030300000000000000000000000000000011EF0000000FFFE11000CF000000";
    attribute INIT_2D of inst : label is "17FFFF0000FFFF7101377F0000000000FFFFFFF0000000000000000000000000";
    attribute INIT_2E of inst : label is "024CCCA7000003007B584800000000000008B68600000000CE78C20010000000";
    attribute INIT_2F of inst : label is "00802000000010060010580001010000003CE731034442111248870012222300";
    attribute INIT_30 of inst : label is "F07F70F0000F00000000000000000000117F70C0000F00000000000000000000";
    attribute INIT_31 of inst : label is "00000000000001330000000031000000C07F70C0000F00000000000000000000";
    attribute INIT_32 of inst : label is "0000420900000000582800000000000090618211012402A80120301642142000";
    attribute INIT_33 of inst : label is "DDDDCC0000FFFFFD8DDF770000FFFDD8FFFCCC0000CCCFFF0374447303754430";
    attribute INIT_34 of inst : label is "80000026012400216200000F12000000F0000026000000216200000F12000000";
    attribute INIT_35 of inst : label is "0000002601248889620000009000000000000026012488816200000310000000";
    attribute INIT_36 of inst : label is "0000002600000029620000009A88421000000026000088A9620000009A880000";
    attribute INIT_37 of inst : label is "F000002600000001620000081000421070000026000002216200000012A84210";
    attribute INIT_38 of inst : label is "7FDFFEFE00167FFFC0808610FFDF7300EFFEDBF700000001FF75100012244210";
    attribute INIT_39 of inst : label is "01680000000CEBFF09EEEFBEFFF613100008421101244221BEFBDEE010000000";
    attribute INIT_3A of inst : label is "7EB7EC0000000045000000003ADE80000099EFF71C000000FFFFF60000000000";
    attribute INIT_3B of inst : label is "0000CCFE0417FFE6A2CC6FF164200000003FFF7F00000000DC62910800000011";
    attribute INIT_3C of inst : label is "0002108446F5CE6320000000904422107D049324010520009026490012001000";
    attribute INIT_3D of inst : label is "000000020244000148005E80224488BE00084001000000000004210000210000";
    attribute INIT_3E of inst : label is "00214813633ECA90940048408A910000F3008001100000122011200000001240";
    attribute INIT_3F of inst : label is "00001209000808AA00481015089AE47312221800842104219400900114210000";
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
