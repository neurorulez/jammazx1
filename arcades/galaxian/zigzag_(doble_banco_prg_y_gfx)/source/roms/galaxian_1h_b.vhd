-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity GALAXIAN_1H_B is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of GALAXIAN_1H_B is

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
    attribute INIT_01 of inst : label is "FFFFFFFFFFFFFFFFF90000000000009F3113311300000000002226C80C22AAEC";
    attribute INIT_02 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_03 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_04 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_05 of inst : label is "FFFFFFFFFFFFFFFF000001BFFB1000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "000008DFFD800000C88CCEFFFFECC88C0000009FF9000000F77FFFFFFFFFF77F";
    attribute INIT_07 of inst : label is "3113313700000000FFFF7313FFF90000FFFFFF73FFFFF9007313311300000000";
    attribute INIT_08 of inst : label is "311337FF0000009FFF733113F90000003137FFFF00009FFF37FFFFFF009FFFFF";
    attribute INIT_09 of inst : label is "000C80000000000000000000132000000000009FF90000003113311300000000";
    attribute INIT_0A of inst : label is "000000000000013700880000F775100000000000000000BF00000000FFFFFFFF";
    attribute INIT_0B of inst : label is "0000000000000113C4000000F3110000000000000000001300088000BF725100";
    attribute INIT_0C of inst : label is "000088CE0000006C8EC88000FC600000000C000C000008070C000C00F7080000";
    attribute INIT_0D of inst : label is "333FFE003300EFF3000000000FFF7722000000000FF0F877000000008FFFF772";
    attribute INIT_0E of inst : label is "0000000000008227000000003140000008C800881773FFFF00088800FF737310";
    attribute INIT_0F of inst : label is "800480000129DD77C0008400F7F402000000000000080537840100007E444000";
    attribute INIT_10 of inst : label is "000000000488960700000000887078870000000004F00EAA00000000F295552C";
    attribute INIT_11 of inst : label is "0000000006999607000000008870788700000000089BD8070000000088707887";
    attribute INIT_12 of inst : label is "000000000000000000000000004F007800000000870788700000000078870000";
    attribute INIT_13 of inst : label is "000000000000000000000000000F007800000000000000000000000048896078";
    attribute INIT_14 of inst : label is "0000000000004F00000000007999007800000000000000000000000069996078";
    attribute INIT_15 of inst : label is "39911311F83DF6079111193FF7D011CE0000000000009BC00000000048896078";
    attribute INIT_16 of inst : label is "000000060000016B800000007520000008800200003DF60780000800F7D01100";
    attribute INIT_17 of inst : label is "000CEE2E0000000226EC08007200000000808CE600000000A6C8400000000000";
    attribute INIT_18 of inst : label is "0000000000036631000000001366300000CC8800000000000088CC0000000000";
    attribute INIT_19 of inst : label is "008004C0000377720C40080027773000008CCC8C00004CC4CC400000EC800000";
    attribute INIT_1A of inst : label is "0000000045612142000000003100000008C260722110000042D8000000000000";
    attribute INIT_1B of inst : label is "0004C000000003F3000000802C8000000000001200000861AC00000011101245";
    attribute INIT_1C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1D of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1F of inst : label is "00008CC40007FFB94CC0000099960000000CC44000037FDCCC440000C4430000";
    attribute INIT_20 of inst : label is "0000000000000000000000002210000000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "0000000000000000000000000000001100000000000000000000000000000000";
    attribute INIT_22 of inst : label is "0000000000000000000000002211000000000000000000110000000022110000";
    attribute INIT_23 of inst : label is "0000000000000008000000004300000000000000221100000000000000000011";
    attribute INIT_24 of inst : label is "00000000000003C0000000000000000000000000000003480000000000000000";
    attribute INIT_25 of inst : label is "000000000000000000000000C3000000000003C00000000000000000C3000000";
    attribute INIT_26 of inst : label is "0000088800FF9FFCC0008E00000A090000000000000003C0C300000000000000";
    attribute INIT_27 of inst : label is "000000110E737C001000000E00006CC00000004C00FFB7FE8000C800000C0000";
    attribute INIT_28 of inst : label is "00000C400000077E00440000CEF6A610000000018EFF33EE1000002800000000";
    attribute INIT_29 of inst : label is "666C07730037EE8E30003330E7FE8000062C0066000037EC20000C80EFF6EE06";
    attribute INIT_2A of inst : label is "0080800400799FE0C800C40000808000C00899117FFCC88C00011100FFE80000";
    attribute INIT_2B of inst : label is "000004C400066FFF404C4440F9FF9FF000004C880793FE0004C8800024242000";
    attribute INIT_2C of inst : label is "008C44C8000C79708444C8000797C0000000000000088CEF00000000F7EE7FE0";
    attribute INIT_2D of inst : label is "0000000004889607000000008870788700C44C88000F93C088C44C000C39F000";
    attribute INIT_2E of inst : label is "000000002231110000ECE4FF0000000008C800881773FFFF00088800FF737310";
    attribute INIT_2F of inst : label is "1DC0F0EEF100690173B8EC807FC888007EDDEE8D00000000EB7F6BDC7000008D";
    attribute INIT_30 of inst : label is "000000000488960700000000887078870000000004F00EAA00000000A9078887";
    attribute INIT_31 of inst : label is "02024426000000000C44000000000000008CC600001600004CC88804003EA000";
    attribute INIT_32 of inst : label is "000000000000000000000000004F007800000000870788700000000078870000";
    attribute INIT_33 of inst : label is "000000000000000000000000124F007800000000000000000000000048896078";
    attribute INIT_34 of inst : label is "0000000000004F00000000007999007800000000000000000000000069996078";
    attribute INIT_35 of inst : label is "39911311F83DF6079111193FF7D011CE0000000000009BC00000000048896078";
    attribute INIT_36 of inst : label is "000000060000016B800000007520000008800200003DF60780000800F7D01100";
    attribute INIT_37 of inst : label is "000CEE2E0000000226EC08007200000000808CE600000000A6C8400000000000";
    attribute INIT_38 of inst : label is "000000000124F007000000008870788700000000089BD8070000000088707887";
    attribute INIT_39 of inst : label is "00000000F07887070000000088707887000000000EAAA9070000000088707887";
    attribute INIT_3A of inst : label is "0088CC0800713331CCC806C0000F7310004C480000E27F7388800000000FF300";
    attribute INIT_3B of inst : label is "000C4400007F9F88C44000008888000000C880000007F9880C440C8088888100";
    attribute INIT_3C of inst : label is "008884000075FFF7CCC80000000F7100004C480000E27F7388800000000FF300";
    attribute INIT_3D of inst : label is "000C4400007F8888C4C000008888000000C880000007F9880C44800088888000";
    attribute INIT_3E of inst : label is "00008CCC37EEE662EEA3300030000000000008CCCE3111116000000000000000";
    attribute INIT_3F of inst : label is "0000800000008420C0008000C0248000008CCC80001300008800000011100110";
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
    attribute INIT_01 of inst : label is "FFFFFFFFFFFFFFFFF90000000000009F00000000C88CC88C06F999F706FB9960";
    attribute INIT_02 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_03 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_04 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_05 of inst : label is "311337FFFF7331130000009FF9000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "FEEFFFFFFFFFFEEFFFFFFFFFFFFFFFFF000008DFFD800000000001BFFB100000";
    attribute INIT_07 of inst : label is "00000000C88CC8CEFFF90000FFFFEC8CFFFFF900FFFFFFEC00000000EC8CC88C";
    attribute INIT_08 of inst : label is "0000009FC88CCEFFF9000000FFECC88C00009FFFC8CEFFFF009FFFFFCEFFFFFF";
    attribute INIT_09 of inst : label is "0000136C0000000080000000000000000000009FF900000000000000C88CC88C";
    attribute INIT_0A of inst : label is "000008CC00000000CED0000032000000000000CC00000130CC8C6400FFFFFFFF";
    attribute INIT_0B of inst : label is "00008CCE00000000FE440000110000000000088C00000000CCFC800032000000";
    attribute INIT_0C of inst : label is "0000101F00000000FF10100070000000000F27EF0000037FFFE72F00FF730000";
    attribute INIT_0D of inst : label is "CCCFF700CC007FFC0C880000010000000FF7EE6407773331CC88800011000000";
    attribute INIT_0E of inst : label is "00001A8C00000000940000000000000007FFEFFF00000111FFFFFD8830000000";
    attribute INIT_0F of inst : label is "01248BAC00421000ED88C4203E0024000052A92C00000200CA81420024020000";
    attribute INIT_10 of inst : label is "026A220C0000000022C0C22C0000000002E20422000000002C0C222C349AA963";
    attribute INIT_11 of inst : label is "0C222C0C0000000022C0C22C0000000002222C0C0000000022C0C22C00000000";
    attribute INIT_12 of inst : label is "0000000000000000002E20C2000000002C0C22C000000000C22C000000000000";
    attribute INIT_13 of inst : label is "0000000C00000000444E40C212400000000000000000000026A220C200000000";
    attribute INIT_14 of inst : label is "00002E2000000000C222C0C2000000000000000000000000C222C0C200000000";
    attribute INIT_15 of inst : label is "07BEEFB3FFEEEFFCFF6080E09BA8CFFF004222C00000000026A220C200000000";
    attribute INIT_16 of inst : label is "0000000800000000780000000000000007BEEFB300000000FF6080E013200000";
    attribute INIT_17 of inst : label is "0011100C00000000300111000000000000013100000000003000000000000000";
    attribute INIT_18 of inst : label is "000E33EC00000000CECCE0000000000000885533000000003355880000000000";
    attribute INIT_19 of inst : label is "003EEEE4000000004EEEE3000000000000303333000000007C62200000112200";
    attribute INIT_1A of inst : label is "84422A2C00335F010000000016C000002609E126000000000001000000000000";
    attribute INIT_1B of inst : label is "000001D700000E01221122700000000000000007000000008FCC444C00000000";
    attribute INIT_1C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1D of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1F of inst : label is "0000013F00000113FF70000030000000000899CC00000001FFB0000010000000";
    attribute INIT_20 of inst : label is "0000000000000000000880000000000000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "0000000000000000224488000000000000000000000000002248800000000000";
    attribute INIT_22 of inst : label is "0000000000000000000088440000000022448800000000000000884400000000";
    attribute INIT_23 of inst : label is "0000000000000001000000000000000000008844000000002244880000000000";
    attribute INIT_24 of inst : label is "000000000000000300000000C000000000000000000000010000000000000000";
    attribute INIT_25 of inst : label is "00000000000000C3000000000000000000000003000000C3C000000000000000";
    attribute INIT_26 of inst : label is "066220000000333330113F0000000000000000C30000000300000000C0000000";
    attribute INIT_27 of inst : label is "0EE22220017CF700000000000000000006622000001333333000030000003000";
    attribute INIT_28 of inst : label is "0716ECCC000000004C800080001100000777330037CCFF730000001000000000";
    attribute INIT_29 of inst : label is "03FEEF3F00000137EC8000006CEF71300013FEE600000001EEC0000013231000";
    attribute INIT_2A of inst : label is "033777400000110001181800000000009EFF33FF001337FDE80000008DF70000";
    attribute INIT_2B of inst : label is "00E2209C00000011CC89CC8011111100006C6013000110000001300000000000";
    attribute INIT_2C of inst : label is "00FC6226003110006226CF000001130000E88036000113774003640076776730";
    attribute INIT_2D of inst : label is "026A220C0000000022C0C22C000000000032266C00000330C662230003300000";
    attribute INIT_2E of inst : label is "000088CC00000000633000100000000007FFEFFF00000111FFFFFD8830000000";
    attribute INIT_2F of inst : label is "FFFFEFBF11000100E9111000021300000073111300000000F77E77FF00000000";
    attribute INIT_30 of inst : label is "026A220C0000000022C0C22C0000000002E20422000000002C0C222C00000000";
    attribute INIT_31 of inst : label is "000000100000000000000000000000000797060000000000001FF86000000000";
    attribute INIT_32 of inst : label is "0000000000000000002E20C2000000002C0C22C000000000C22C000000000000";
    attribute INIT_33 of inst : label is "0000000C00000000444E40C200000000000000000000000026A220C200000000";
    attribute INIT_34 of inst : label is "00002E2000000000C222C0C2000000000000000000000000C222C0C200000000";
    attribute INIT_35 of inst : label is "07BEEFB3FFEEEFFCFF6080E09BA8CFFF004222C00000000026A220C200000000";
    attribute INIT_36 of inst : label is "0000000800000000780000000000000007BEEFB300000000FF6080E013200000";
    attribute INIT_37 of inst : label is "0011100C00000000300111000000000000013100000000003000000000000000";
    attribute INIT_38 of inst : label is "C444E40C0000000022C0C22C0000000004222C0C0000000022C0C22C00000000";
    attribute INIT_39 of inst : label is "E0C22C0C0000000022C0C22C0000000004222C0C0000000022C0C22C00000000";
    attribute INIT_3A of inst : label is "0030FFCC00000000322332F7000000000001F98C0026CFC6311FE80020010000";
    attribute INIT_3B of inst : label is "003333FF0264DFF7F7000000731000000012719F00000113FF722AF733110000";
    attribute INIT_3C of inst : label is "0030FEEF00000100100FFC00000000000001F98C00013731311FE80000010000";
    attribute INIT_3D of inst : label is "00219FFF00001133FFF72000311000000012319F00000113FF72F72033110000";
    attribute INIT_3E of inst : label is "8C723333000000001111330000000000008EFFFF13777331E631000000000000";
    attribute INIT_3F of inst : label is "0008892000000000102988001000000007FF001F00000000FFFF9B2000000000";
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
