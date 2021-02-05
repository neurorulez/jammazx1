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
    attribute INIT_01 of inst : label is "08CC800000002330000880006BB26FFA0000000000CEEFE2002226C80C22AAEC";
    attribute INIT_02 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_03 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_04 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_05 of inst : label is "000000000000140200000000801000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "0000000000010001080000000208000000000000000000200000000000400000";
    attribute INIT_07 of inst : label is "0000000030100000000000000000103000000008004040200000000010400000";
    attribute INIT_08 of inst : label is "0208020100400050001000000208002000000000000000000000000000000000";
    attribute INIT_09 of inst : label is "024804800042A5B7084084207B5A2400000000000002377F00000000F7732000";
    attribute INIT_0A of inst : label is "0000000000066000000000000660000000000000008AB77F00000000F77BA800";
    attribute INIT_0B of inst : label is "0000000000000660000000000006600000000000000066000000000000660000";
    attribute INIT_0C of inst : label is "CCCCCCCCCCCCCCCCCCCCCCCC008AEA80000801150000003C55110800FC300000";
    attribute INIT_0D of inst : label is "00080000000003FF80000000FFF610000000000000003FFFCCCCCCCCCCCCCCCC";
    attribute INIT_0E of inst : label is "00000008000021900000000004A2000000000004003413A388800000C3052000";
    attribute INIT_0F of inst : label is "120201021810013708004021F7EC2048004800C200420080008C400013011120";
    attribute INIT_10 of inst : label is "00000000004F0078000000008707887000000000069996070000000088707887";
    attribute INIT_11 of inst : label is "00000000089BD807000000008870788700000000048896070000000088707887";
    attribute INIT_12 of inst : label is "1088000000011000C801133302244888C40000000000000004CEEEEE00013240";
    attribute INIT_13 of inst : label is "000088880000007F008888008888FF8800042200044881110008880088000000";
    attribute INIT_14 of inst : label is "0000008800000000880888807F88FF880088880088FF888888880000F7000000";
    attribute INIT_15 of inst : label is "00000008000000008880008807F8888F0888808888FF88F78800000000000000";
    attribute INIT_16 of inst : label is "0000EFFE00001FFFCEFFECEF3100000088000888F8888F708000000000000000";
    attribute INIT_17 of inst : label is "0000000000003FFF00000000FFFF3000FECEFFEC00000013EFFE0000FFF10000";
    attribute INIT_18 of inst : label is "2000000080000000E40AE080486A7D5004C806661967B8480000000200000211";
    attribute INIT_19 of inst : label is "F6EC4A004FFFD600EEE977DD8CCA7F7BCCE7BDDEBB3FEEC8013A8A6D8805D6ED";
    attribute INIT_1A of inst : label is "DEA4C200E9511000FFBBB7EAFEFFF20C7F7BBB772D4DDD7F48C674BF087C2FC0";
    attribute INIT_1B of inst : label is "00000000EC0000000117FE400133104E2646E880C81218C800000000000100EC";
    attribute INIT_1C of inst : label is "00000000000008C800000000080000000013DEE400000000CEF6200000000000";
    attribute INIT_1D of inst : label is "F0010000000CEDBF00884000F39EFF8013B7EC8800008610CCB7FE6001E00000";
    attribute INIT_1E of inst : label is "000008CC08CF65EFCCC80000FFFCFF8077BFEDBE0008531FEFB8CFFFF0010000";
    attribute INIT_1F of inst : label is "00000000000081110008000000008880000088800CEEC0000076F00000880800";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "6400FEEE777FFFFE00CEFF77EECC800033333376008CEE77002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "36CC8337CEF7333380000000633766EC0000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "FFF31000320137FF000EFFF333376C80008CEFF3766CC80008CEE7777FFFF330";
    attribute INIT_27 of inst : label is "00001FFFE007FFF8000FFFFFCCC00000FFFFCCCC000000003377EEC808CEFF73";
    attribute INIT_28 of inst : label is "0000000000000018000000008E0000007FFFCCCC0FFFFC01FC000000F80001FF";
    attribute INIT_29 of inst : label is "0000000000000000000000E000000244000000000000000000000000000000B2";
    attribute INIT_2A of inst : label is "0000000000000000000000000000002400000000442000000000000000CEE800";
    attribute INIT_2B of inst : label is "0000CC8000008CE0000000001000000000000000423000800000000000000000";
    attribute INIT_2C of inst : label is "000EC8CE000000000EC8CE00008AEA80000801150000003C55110800FC300000";
    attribute INIT_2D of inst : label is "11F003300F8FF00FF0000000F0000000F0000000F00F07880000000070000000";
    attribute INIT_2E of inst : label is "00000008000021900000000004A2000000000004003413A388800000C3052000";
    attribute INIT_2F of inst : label is "120201021810013708004021F7EC2048004800C200420080008C400013011120";
    attribute INIT_30 of inst : label is "00000000004F0078000000008707887000000000069996070000000088707887";
    attribute INIT_31 of inst : label is "CCCCCCCC089BD807000000008870788700000000048896070000000088707887";
    attribute INIT_32 of inst : label is "FFFF80008000000300007FFF00000000CC17FFF8CCCCCCCC03FFFFCC003FFFC0";
    attribute INIT_33 of inst : label is "111000010000000173311000088CEEFF00000000FFF00000000000FF03FFFF80";
    attribute INIT_34 of inst : label is "0111111111111110C000000100003FFF111110000000001111100000FFF91111";
    attribute INIT_35 of inst : label is "00008CEFFFFF00000000007F9991111136CC888900113001FF11100000000137";
    attribute INIT_36 of inst : label is "00000000000007F70000000077330000370000000000113301113300F7000000";
    attribute INIT_37 of inst : label is "000000000000002788000000FF310000000000000000003F08000000F7331000";
    attribute INIT_38 of inst : label is "2000000080000000E40AE080486A7D5004C806661967B8480000000200000211";
    attribute INIT_39 of inst : label is "F6EC4A004FFFD600EEE977DD8CCA7F7BCCE7BDDEBB3FEEC8013A8A6D8805D6ED";
    attribute INIT_3A of inst : label is "DEA4C200E9511000FFBBB7EAFEFFF20C7F7BBB772D4DDD7F48C674BF087C2FC0";
    attribute INIT_3B of inst : label is "00000000EC0000000117FE400133104E2646E880C81218C800000000000100EC";
    attribute INIT_3C of inst : label is "00000000000008C800000000080000000013DEE400000000CEF6200000000000";
    attribute INIT_3D of inst : label is "F0010000000CEDBF00884000F39EFF8013B7EC8800008610CCB7FE6001E00000";
    attribute INIT_3E of inst : label is "000008CC08CF65EFCCC80000FFFCFF8077BFEDBE0008531FEFB8CFFFF0010000";
    attribute INIT_3F of inst : label is "00000000000081110008000000008880000088800CEEC0000076F00000880800";
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
    attribute INIT_01 of inst : label is "266BE4000000000000122100777DCE3046E600000000103006F999F706FB9960";
    attribute INIT_02 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_03 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_04 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_05 of inst : label is "00000408000000002000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "00200A0000000100004000000020000000004081000000000000000000000000";
    attribute INIT_07 of inst : label is "0080C0600000000060C080000000000000405028000001000418000010010000";
    attribute INIT_08 of inst : label is "0240020000020100040140000400000000006060000000006060000000000000";
    attribute INIT_09 of inst : label is "00245ADE04210210EDA5420001201240000009DC00233000CD90000000033200";
    attribute INIT_0A of inst : label is "00000000000000000000000000000000000009DF00100000FD90000000000100";
    attribute INIT_0B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0C of inst : label is "3333333333333333333333330013F3100007FEE000000001F0EEF70031000000";
    attribute INIT_0D of inst : label is "0003EC8F0000001FFF088E00FFF000000006800F0000003F3333333333333333";
    attribute INIT_0E of inst : label is "000240130000000020A500000000000000247CAF00000000C865100000000000";
    attribute INIT_0F of inst : label is "0002008C84280200ECC0001000080000008910C8000000009810000001400000";
    attribute INIT_10 of inst : label is "002E20C2000000002C0C22C0000000000C222C0C0000000022C0C22C00000000";
    attribute INIT_11 of inst : label is "02222C0C0000000022C0C22C00000000026A220C0000000022C0C22C00000000";
    attribute INIT_12 of inst : label is "8CCCC881766CC08401700200442233338CC8000076E80084008919117C884633";
    attribute INIT_13 of inst : label is "00001FF100000001001FF100FFFFFFFF24000000862334242000137A23364E28";
    attribute INIT_14 of inst : label is "0000001F00000000F101FF1001FFFFFF001FF100FFFFFFFF1FF1000010000000";
    attribute INIT_15 of inst : label is "0000000100000000FF10001F001FFFFF01FF101FFFFFFF10F100000000000000";
    attribute INIT_16 of inst : label is "0000FFFF00000003FFFFF91120444CEFF10001FFFFFFF1001000000000000000";
    attribute INIT_17 of inst : label is "0006800F0000003FFC000000FF300000119FFFFFFEC44402FFFF000030000000";
    attribute INIT_18 of inst : label is "200000000100000002B5DD84321310002BAF9523100003030000011100000002";
    attribute INIT_19 of inst : label is "3BCEB7007250100001337FED73BD5653DDCF731037ADDB77003DEF7A10008421";
    attribute INIT_1A of inst : label is "13D54440212673207FFF7301F314CEE3087FFFFB026456FF016773B01715FE52";
    attribute INIT_1B of inst : label is "1622000000100000008800000000000028CC0912104201310888C62000000001";
    attribute INIT_1C of inst : label is "0000000000867E730000000037DEC20000001110000000001160000000000000";
    attribute INIT_1D of inst : label is "100000008EB60100CC90000001177F300001314600010000FF71300000011100";
    attribute INIT_1E of inst : label is "0004E13F8FF12FF7FFF790007C877FF001339CFF00100001F7FFFB1010000000";
    attribute INIT_1F of inst : label is "012308C80067770C02770000800011100001373000110000000CC00000373300";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "00001FFF0000FFFF807FFFC0013FFFEC00000000EFF3100006F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00013300FFF00000FFEC000F00000003011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "FFF800000000001F0007FFF80000003300FFFFF000001332FFFFF00003FFFC00";
    attribute INIT_27 of inst : label is "00046FFF0047FFFFCEFFFFF77330000801377777FC800000000007FF0FFFFF00";
    attribute INIT_28 of inst : label is "00000008000000108000000001000000013FFF998FFF7300FFEC8888FF80001F";
    attribute INIT_29 of inst : label is "00000000000000000000C0D000644C3C00000000000000004488604000023060";
    attribute INIT_2A of inst : label is "0000000000000000000482480000C8890E0C00004B4446000000000000117110";
    attribute INIT_2B of inst : label is "00000130000011004000000000000000125600002C16AA300000000000000000";
    attribute INIT_2C of inst : label is "0007301F000000000F1037000013F3100007FEE000000001F0EEF70031000000";
    attribute INIT_2D of inst : label is "4470000007470007F000000010000000F0080088700000000000000000000000";
    attribute INIT_2E of inst : label is "000240130000000020A500000000000000247CAF00000000C865100000000000";
    attribute INIT_2F of inst : label is "0002008C84280200ECC0001000080000008910C8000000009810000001400000";
    attribute INIT_30 of inst : label is "002E20C2000000002C0C22C0000000000C222C0C0000000022C0C22C00000000";
    attribute INIT_31 of inst : label is "99DFFF710000000022C0C22C00000000026A220C0000000022C0C22C00000000";
    attribute INIT_32 of inst : label is "FFFFFEC8FC88804CE0008FFFC8888FFF7300137F9999FFFF000137FF0003FFFC";
    attribute INIT_33 of inst : label is "000000448800000000000000FFFFF3100000008EF7300000C8888CFF00037FFE";
    attribute INIT_34 of inst : label is "0000000000000000FC000000000CCFFF000000000000000000000000FFFFC000";
    attribute INIT_35 of inst : label is "EEEFF7773377FEEE000000013310000000001133000000001760000000000000";
    attribute INIT_36 of inst : label is "001324DF00000000FFF000000000000000000000000000000000000030000000";
    attribute INIT_37 of inst : label is "008888AF00000000FFEC8000000000000044C9BF00000000FFFC000000000000";
    attribute INIT_38 of inst : label is "200000000100000002B5DD84321310002BAF9523100003030000011100000002";
    attribute INIT_39 of inst : label is "3BCEB7007250100001337FED73BD5653DDCF731037ADDB77003DEF7A10008421";
    attribute INIT_3A of inst : label is "13D54440212673207FFF7301F314CEE3087FFFFB026456FF016773B01715FE52";
    attribute INIT_3B of inst : label is "1622000000100000008800000000000028CC0912104201310888C62000000001";
    attribute INIT_3C of inst : label is "0000000000867E730000000037DEC20000001110000000001160000000000000";
    attribute INIT_3D of inst : label is "100000008EB60100CC90000001177F300001314600010000FF71300000011100";
    attribute INIT_3E of inst : label is "0004E13F8FF12FF7FFF790007C877FF001339CFF00100001F7FFFB1010000000";
    attribute INIT_3F of inst : label is "012308C80067770C02770000800011100001373000110000000CC00000373300";
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
