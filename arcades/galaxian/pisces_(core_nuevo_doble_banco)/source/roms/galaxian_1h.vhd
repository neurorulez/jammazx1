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
    attribute INIT_01 of inst : label is "8400C80000000462008000000CEEEE88000000000004DC2C002226C80C22AAEC";
    attribute INIT_02 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_03 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_04 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_05 of inst : label is "000000000000101000000000004000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "0000000000080041000000000008100000000000000104000000000090400000";
    attribute INIT_07 of inst : label is "0000000030100000000000000000103000000008004001080000000000002000";
    attribute INIT_08 of inst : label is "0001008002004000040002000000002000000000000000000000000000000000";
    attribute INIT_09 of inst : label is "0048002002000260020084000620002004802C080088491080C2084001948800";
    attribute INIT_0A of inst : label is "0000000008CEEE600000000006EEEC80000E0860084448900680E00009844480";
    attribute INIT_0B of inst : label is "0000000008CEEE600000000006EEEC800000000008CEEE600000000006EEEC80";
    attribute INIT_0C of inst : label is "FFFF3333FF333333333333330C82628C00EC813F000013C3FF318CE003C31000";
    attribute INIT_0D of inst : label is "0CE7808F04CDBC366C801FE0FC69ED630008000C0003D26FFFFFFFFFFFFFFF33";
    attribute INIT_0E of inst : label is "0000000000008227000000003140000008C800881773FFFF00088800FF737310";
    attribute INIT_0F of inst : label is "800480000129DD77C0008400F7F402000000000000080537840100007E444000";
    attribute INIT_10 of inst : label is "00000000004F0078000000008707887000000000069996070000000088707887";
    attribute INIT_11 of inst : label is "00000000089BD807000000008870788700000000048896070000000088707887";
    attribute INIT_12 of inst : label is "EF77FFFFFFFEEFFF7FFFFECEFDDBB7777BFFFFFFFFFFFFFFFB333333FFFEBDBF";
    attribute INIT_13 of inst : label is "08CC466600000000EE6777FF00000000FFFBDDFFFFF77EEEFFF77FFFBB7FFFFF";
    attribute INIT_14 of inst : label is "0008CC460000000066E7777F00000000FF7777EE000000006664CC8000000000";
    attribute INIT_15 of inst : label is "00008CC400000000666FFF7700000000F7777E660000000064CC800000000000";
    attribute INIT_16 of inst : label is "0000EFB000000EFF08FFE889F731119F77FFF666000000004CC8000000000000";
    attribute INIT_17 of inst : label is "0008000C0003D26F80000830FEE2F300FECEF76CF911137FEFFE0000FFF10000";
    attribute INIT_18 of inst : label is "0000000000000000ECC4C844FFDDFF74CCC4CEEE237BBFFF0000000000000000";
    attribute INIT_19 of inst : label is "DEE4CC20FFBBF7007DD7FFEF7BBDEFFFAEEF7BF7D7FDDDB7000DEEEE0427FFFE";
    attribute INIT_1A of inst : label is "EC6C80006688C0007BDDDB2EEDBFFE3C5EE677FF304FFFFF2402BB7B0F84E840";
    attribute INIT_1B of inst : label is "00042000E40000000137F6000133116E2646EC80C83108C802400000088110CC";
    attribute INIT_1C of inst : label is "000000000004880800000000E80084000897F7FF00000000F7FF311000000000";
    attribute INIT_1D of inst : label is "00000048048CFF73000000007FFFF80057FEDB77002100EF3BCFFF7030000012";
    attribute INIT_1E of inst : label is "026008CC08CFFFFFCCC8000078FFFF807FFEFFFF0310137FFFEFFEEEFFF10080";
    attribute INIT_1F of inst : label is "0000000000000011000000000423AA800000889100CEC08C0176FF0000091900";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "000000000000000000000000000000000000000000000000002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_27 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_28 of inst : label is "00000000000111FF00000000FD11100000000000000000000000000000000000";
    attribute INIT_29 of inst : label is "00000000000113330000000033777DBB00000000000000010000000011333F4D";
    attribute INIT_2A of inst : label is "000000004CCEECCC00000000CCEEFFDB00000000BBD77733000000003B3F86C0";
    attribute INIT_2B of inst : label is "0000000000000113C4000000F311000000000000BDCF33900088CCC000000000";
    attribute INIT_2C of inst : label is "000088CE0000006C8EC880000C82628C00EC813F000013C3FF318CE003C31000";
    attribute INIT_2D of inst : label is "11F003300F8FF00F000000000FFF7722000000000FF0F877000000008FFFF772";
    attribute INIT_2E of inst : label is "0000000000008227000000003140000008C800881773FFFF00088800FF737310";
    attribute INIT_2F of inst : label is "800480000129DD77C0008400F7F402000000000000080537840100007E444000";
    attribute INIT_30 of inst : label is "00000000004F0078000000008707887000000000069996070000000088707887";
    attribute INIT_31 of inst : label is "00000000089BD807000000008870788700000000048896070000000088707887";
    attribute INIT_32 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_33 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_34 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_35 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_36 of inst : label is "000008880001FFF38C8800003000000000000000000000000000000000000000";
    attribute INIT_37 of inst : label is "0000008C000026EFCC440000F900000000000088000026FFCCC88000F1000000";
    attribute INIT_38 of inst : label is "0000000000000000ECC4C844FFDDFF74CCC4CEEE237BBFFF0000000000000000";
    attribute INIT_39 of inst : label is "DEE4CC20FFBBF7007DD7FFEF7BBDEFFFAEEF7BF7D7FDDDB7000DEEEE0427FFFE";
    attribute INIT_3A of inst : label is "EC6C80006688C0007BDDDB2EEDBFFE3C5EE677FF304FFFFF2402BB7B0F84E840";
    attribute INIT_3B of inst : label is "00042000E40000000137F6000133116E2646EC80C83108C802400000088110CC";
    attribute INIT_3C of inst : label is "000000000004880800000000E80084000897F7FF00000000F7FF311000000000";
    attribute INIT_3D of inst : label is "00000048048CFF73000000007FFFF80057FEDB77002100EF3BCFFF7030000012";
    attribute INIT_3E of inst : label is "026008CC08CFFFFFCCC8000078FFFF807FFEFFFF0310137FFFEFFEEEFFF10080";
    attribute INIT_3F of inst : label is "0000000000000011000000000423AA800000889100CEC08C0176FF0000091900";
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
    attribute INIT_01 of inst : label is "133713000000000000013000331331430C6000000011330106F999F706FB9960";
    attribute INIT_02 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_03 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_04 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_05 of inst : label is "00000008000000000040000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "0020000200000001000040000000000000000481000000000040000000000000";
    attribute INIT_07 of inst : label is "0080C0600000000060C080000000000000001008000000000000200000000000";
    attribute INIT_08 of inst : label is "0200080020800140000040100400200100006060000000006060000000000000";
    attribute INIT_09 of inst : label is "04000668002100408660004004001200000110A3025421003A01100000124520";
    attribute INIT_0A of inst : label is "0000000000111000000000000001110000001023013310003201000000013310";
    attribute INIT_0B of inst : label is "0000000000111000000000000001110000000000001110000000000000011100";
    attribute INIT_0C of inst : label is "FFFFCCCCFFCCCCCCCCCCCCCC013C0C31007F0F1F000000120F1F0F70C2100000";
    attribute INIT_0D of inst : label is "003C1A7000013FD0E0F761F6F10F100000F948EC00001FC1FFFFFFFFFFFFFFCC";
    attribute INIT_0E of inst : label is "00001A8C00000000940000000000000007FFEFFF00000111FFFFFD8830000000";
    attribute INIT_0F of inst : label is "01248BAC00421000ED88C4203E0024000052A92C00000200CA81420024020000";
    attribute INIT_10 of inst : label is "002E20C2000000002C0C22C0000000000C222C0C0000000022C0C22C00000000";
    attribute INIT_11 of inst : label is "02222C0C0000000022C0C22C00000000026A220C0000000022C0C22C00000000";
    attribute INIT_12 of inst : label is "F773377E455BBFF7FE8FFDFF773333327737FFFF6597FFF7FF7EEEEE4BF77722";
    attribute INIT_13 of inst : label is "0013600600000000FF000EFF00000000DBFFFFFFF7333737DFFFEC8511177DDF";
    attribute INIT_14 of inst : label is "000013600000000006F000EF00000000FF000EFF000000006006310000000000";
    attribute INIT_15 of inst : label is "0000013600000000006FFF0000000000F000EF60000000000631000000000000";
    attribute INIT_16 of inst : label is "0000337F00000003FFFFFFFF33666FFF0EFFF600000000006310000000000000";
    attribute INIT_17 of inst : label is "00F948EC00001FC103C8CF00F3CF0000FFFFC8CFFFF66633FFFF000030000000";
    attribute INIT_18 of inst : label is "0000000000000000FFFFFF00217311004FF7EFFC000007330000000000000000";
    attribute INIT_19 of inst : label is "C4BDFF00F7735800FEDDA6FFFFDB7F77EFBABDEF2F7F3DEF005BBFF700421112";
    attribute INIT_1A of inst : label is "11189888125F6200FFE97319F374C8238523FFE6001231BF02F3B7301F66CD76";
    attribute INIT_1B of inst : label is "36A2000080001100000000020000000448CC0000100001330888C62400042001";
    attribute INIT_1C of inst : label is "0000000000CEDBFC00000000FFFB800000000153000000001000120000000000";
    attribute INIT_1D of inst : label is "002C008B8EF9FEFFCC808400FEEFFF300001F77F000000037773F80000000000";
    attribute INIT_1E of inst : label is "0248FFFF8F1EFFFEF0FFF310EFFFFFF001BF7BCF00003001FFEDB31010110001";
    attribute INIT_1F of inst : label is "000000880067700C00670000C40011100000133000010030000CD80000063300";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "00000000000000000000000000000000000000000000000006F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_27 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_28 of inst : label is "04CCCCC4000000104CCCCC400100000000000000000000000000000000000000";
    attribute INIT_29 of inst : label is "CCCCC800000000000000C80800644F4F00000CCC00000000CC88E8C800023171";
    attribute INIT_2A of inst : label is "0000000000001111000482C10001C8BE8D8C00007C744600008CCCCC07269DA1";
    attribute INIT_2B of inst : label is "00008CCE00000000FE440000110000009EDE8CCC5F55BA30D773100000000000";
    attribute INIT_2C of inst : label is "0000101F00000000FF101000013C0C31007F0F1F000000120F1F0F70C2100000";
    attribute INIT_2D of inst : label is "44700000074700070C880000010000000FF7EE6407773331CC88800011000000";
    attribute INIT_2E of inst : label is "00001A8C00000000940000000000000007FFEFFF00000111FFFFFD8830000000";
    attribute INIT_2F of inst : label is "01248BAC00421000ED88C4203E0024000052A92C00000200CA81420024020000";
    attribute INIT_30 of inst : label is "002E20C2000000002C0C22C0000000000C222C0C0000000022C0C22C00000000";
    attribute INIT_31 of inst : label is "000000000000000022C0C22C00000000026A220C0000000022C0C22C00000000";
    attribute INIT_32 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_33 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_34 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_35 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_36 of inst : label is "001B24D7000001137F3112002000000000000000000000000000000000000000";
    attribute INIT_37 of inst : label is "0088ABBF0000000174000000111100000044C9BF000000117710000013200000";
    attribute INIT_38 of inst : label is "0000000000000000FFFFFF00217311004FF7EFFC000007330000000000000000";
    attribute INIT_39 of inst : label is "C4BDFF00F7735800FEDDA6FFFFDB7F77EFBABDEF2F7F3DEF005BBFF700421112";
    attribute INIT_3A of inst : label is "11189888125F6200FFE97319F374C8238523FFE6001231BF02F3B7301F66CD76";
    attribute INIT_3B of inst : label is "36A2000080001100000000020000000448CC0000100001330888C62400042001";
    attribute INIT_3C of inst : label is "0000000000CEDBFC00000000FFFB800000000153000000001000120000000000";
    attribute INIT_3D of inst : label is "002C008B8EF9FEFFCC808400FEEFFF300001F77F000000037773F80000000000";
    attribute INIT_3E of inst : label is "0248FFFF8F1EFFFEF0FFF310EFFFFFF001BF7BCF00003001FFEDB31010110001";
    attribute INIT_3F of inst : label is "000000880067700C00670000C40011100000133000010030000CD80000063300";
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
