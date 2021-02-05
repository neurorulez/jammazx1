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
    attribute INIT_00 of inst : label is "880022E0C66E66C0C602E2E000E4C880C66006C0E6C066C0C8888C80C66666C0";
    attribute INIT_01 of inst : label is "ECCCCCE0ECCCCCE0ECCCCCE08C666C80ECCCCCE066CC8800C60C66C0C66C66C0";
    attribute INIT_02 of inst : label is "6666EE606666EE60ECCCCCE0ECCCCCE08C000000C88888C0ECCCCCE08C666C80";
    attribute INIT_03 of inst : label is "088CCCE08CCCCCE0C8888AE0C208CEC0ECCCCCE08C666C80ECCCCCE0C66666C0";
    attribute INIT_04 of inst : label is "C24842C0000000000000000000000000EEC806E0C8008C606C88CE608CE66660";
    attribute INIT_05 of inst : label is "08CEEE4000E00E00000E0000000E000080000080008880000000044840888800";
    attribute INIT_06 of inst : label is "065564400713170006AA620009579700848E4C806EC888888448048000C08448";
    attribute INIT_07 of inst : label is "FFFFFFFF00000000FFFFFFFF0EE2222E00000000C295592C8888EC80000FF000";
    attribute INIT_08 of inst : label is "0000FF88888888888888FF000000FF000000FF00000088888888888888888800";
    attribute INIT_09 of inst : label is "F111111FF1111111F111111FF1111111FFFFFFFF0000FF88888888888888FF00";
    attribute INIT_0A of inst : label is "8CEFFEC8F310013FF8AAAA8F000FF000000888000CEFFFEC009DDD9000000080";
    attribute INIT_0B of inst : label is "8CEFFEC88CEFFEC88CEFFEC88CEFFEC88CEFFEC88CEFFEC88CEFFEC88CEFFEC8";
    attribute INIT_0C of inst : label is "0CE531006000000068000000474000004E100000EFCC880FFFE400B66C800000";
    attribute INIT_0D of inst : label is "48C3C00022231248386100003C000000EA3200001117110022303C0000000000";
    attribute INIT_0E of inst : label is "B3333FFF1111108C666ECD912EEEEEEE6AA8CEEE08438CEFCEF300C280008EE3";
    attribute INIT_0F of inst : label is "DBBA8BA22222222200888877CCCCC800A9DDCCCE81F999D9222222223D111110";
    attribute INIT_10 of inst : label is "333B3FDBFEE77333001DF310FEEEEEEEFEEEEE66EC800000E7108C61B991326C";
    attribute INIT_11 of inst : label is "97641244F3001222FE86800086110888F277302AFBB377751222222246FFEEC9";
    attribute INIT_12 of inst : label is "00000073000000FF00000010000000FF000000FF00137FFF0000000C00088CEA";
    attribute INIT_13 of inst : label is "000000000000008E0000007F00000018000000C8000000C9377FFEC888E30008";
    attribute INIT_14 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_15 of inst : label is "4000000046700000467310004673191046731800467200004600000000000000";
    attribute INIT_16 of inst : label is "4673198046731800467300004670000046000000400000000000000000000000";
    attribute INIT_17 of inst : label is "0000000040000000460000004670000046730000467310004673190046731990";
    attribute INIT_18 of inst : label is "4673000046300000400000000000000046731C00466000004000000000000000";
    attribute INIT_19 of inst : label is "4673000000000000467311104610000046730000467311004673199046731900";
    attribute INIT_1A of inst : label is "46700000000000004673199C4670000040000000000000000000000046000000";
    attribute INIT_1B of inst : label is "420000004673199C46731000467319104673180046700000000000004673199C";
    attribute INIT_1C of inst : label is "4600000000000000000000004610000046731000420000004673199C46731100";
    attribute INIT_1D of inst : label is "46600000000000004673198C4600000000000000467200000000000046731880";
    attribute INIT_1E of inst : label is "000000004673191046731100420000004673199C467310004673199046731900";
    attribute INIT_1F of inst : label is "FFCCFF00E36C7C634673199CFFFFFFFF4000000046731000400000004673199C";
    attribute INIT_20 of inst : label is "000000004673198C0000000046731888000000004673198C4400000000000000";
    attribute INIT_21 of inst : label is "000000004673000000000000467311104673000046731980400000004673199C";
    attribute INIT_22 of inst : label is "467311100000000046731110000000004673111046731110440000004673199C";
    attribute INIT_23 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000";
    attribute INIT_24 of inst : label is "0E30000001E30F817C00000000380C300E3000000F018F073C00000070F830F0";
    attribute INIT_25 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_26 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_27 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_28 of inst : label is "4673180C00000000466208000000000046400000000000004670008000000000";
    attribute INIT_29 of inst : label is "400000004673199C000000004673088800000000464000000000000000000000";
    attribute INIT_2A of inst : label is "467311104673199C0000000046731910467311004673199C467000004673199C";
    attribute INIT_2B of inst : label is "4000000000000000467311100000000046731110421100004673199C00000000";
    attribute INIT_2C of inst : label is "0000000000000000C26C7C6300080C4000000000000000000000000000000000";
    attribute INIT_2D of inst : label is "236474630000102300000000002C7C6300000C63E26C7C63804C4C6200000000";
    attribute INIT_2E of inst : label is "00000023E36C7C63E36C7C6363647C630100302300000000E36C7C63E36C7C63";
    attribute INIT_2F of inst : label is "E36C7C6300003463C06C7C6300000000E36C7C6300080C420000000000000000";
    attribute INIT_30 of inst : label is "000000000000306300000000636C7C6300001023806C7C630000000000000000";
    attribute INIT_31 of inst : label is "E36C7C6300001063000C6C6300000000806C7C6300000000806C7C6300000000";
    attribute INIT_32 of inst : label is "000000000000080000000000000000000000000000000023E36C7C6300000023";
    attribute INIT_33 of inst : label is "232030630010100100000000E36C7C63E34C7C6301247C63E26C7C63804C4C40";
    attribute INIT_34 of inst : label is "E36C7C6301247C63E26C7C63800C4C40000000000000000000000000636C7C63";
    attribute INIT_35 of inst : label is "403E8000800000004673083E403E8000800000000100346300000000E36C7C63";
    attribute INIT_36 of inst : label is "99999999F1111111403E8000800000004673083E403E8000800000004673083E";
    attribute INIT_37 of inst : label is "0000000100000000CCCC000F4CCCCCCCC8800000013226449999911F99999999";
    attribute INIT_38 of inst : label is "00000000000000000377000F000007C00000000000000000EEEE000F36C80026";
    attribute INIT_39 of inst : label is "0088C631000000000000000F000C710000000000000000000033000F000000C7";
    attribute INIT_3A of inst : label is "467319104671C710CCCC000FCCCCCCCC08CCCCCCF00000008888000F00888888";
    attribute INIT_3B of inst : label is "4671C710C7100000467319104671C710C7000000467319104671C710C7100000";
    attribute INIT_3C of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7100000";
    attribute INIT_3D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
    attribute INIT_00 of inst : label is "1136CCF07CC70C707CCC7070F6F666607CC7CC707C03CE70311111107CCCCC70";
    attribute INIT_01 of inst : label is "10030CF0FC030CF036CCC6307C800C707CC7CC70CCFCC5707CCFCC707CC7CC70";
    attribute INIT_02 of inst : label is "CCEFDCC0CCDDFEC0FC000010DC636C90366666F031111130E66766E07CE00C70";
    attribute INIT_03 of inst : label is "355888D0788888D0311115707EF71870DC67CC70D6DCC6301007CC707CCCCC70";
    attribute INIT_04 of inst : label is "72101100001001000001000000000000FC137EF0113376E0CE7336C026FBBBB0";
    attribute INIT_05 of inst : label is "137FEE400070070000070000111F111001222100210001201011244300013333";
    attribute INIT_06 of inst : label is "00000000055530000000000004AAAA00242F5731000242313443153111713443";
    attribute INIT_07 of inst : label is "FFFFFFFF00000000FFFFFFFF0FF000FF00013660349889433333F731000FF000";
    attribute INIT_08 of inst : label is "0000FF11111111111111FF000000FF000000FF000000FF11111111111111FF00";
    attribute INIT_09 of inst : label is "F888888FF8888888F000000FF0000000FFFFFFFF000011111111111111111100";
    attribute INIT_0A of inst : label is "FDDDDDCF36400463199FF991111FF111000323000000000000F101F000D555D0";
    attribute INIT_0B of inst : label is "FBBB8A8FF8AA8A8FFBBBBB8FF8AA8E8FF8BB8E8FFB8AAEEFF8BB8B8FF8E8BA8F";
    attribute INIT_0C of inst : label is "E230000001680000EA32000010000000C00000005533BF13E7100F1000134800";
    attribute INIT_0D of inst : label is "ECCE23007777F72123008000C13480008000000068000000CCCCC87200EC0000";
    attribute INIT_0E of inst : label is "CDDDDDDD99999980A9DDCCCE40F8881977554453554444557100C300708EF300";
    attribute INIT_0F of inst : label is "111137FFFE4A7F7722667FFE11137FFE555554486666EE818CCCCCCC10000000";
    attribute INIT_10 of inst : label is "22277EFEF8999999F677302AFDD9BA6FE4463037F3777777000EB88E3FFF000C";
    attribute INIT_11 of inst : label is "FFECAFB3FF46F77F3F679326F0023311F667FB77113BF320FECCCCCC00005773";
    attribute INIT_12 of inst : label is "00008C42000000FF000000C8000000FF000000800000009B0008CAB0C6331113";
    attribute INIT_13 of inst : label is "000000270000003F00000001000000EF000000FF000000310000137FFF800069";
    attribute INIT_14 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_15 of inst : label is "000000002600000026E4000026EC810026EC898026EC800026E0000020000000";
    attribute INIT_16 of inst : label is "26EC899026EC890026EC800026EC000026E000004C0000002000000000000000";
    attribute INIT_17 of inst : label is "0000000000000000200000002600000026E0000026EC000026EC810026EC8910";
    attribute INIT_18 of inst : label is "26EC880026C80000268000000000000026EC899026EC00002600000000000000";
    attribute INIT_19 of inst : label is "266000000000000026EC80002000000026C0000026EC800026EC890026EC8990";
    attribute INIT_1A of inst : label is "26EC88002400000026EC899326EC880026800000000000000000000020000000";
    attribute INIT_1B of inst : label is "0000000026EC899326E0000026EC810026EC898026EC80002400000026EC8993";
    attribute INIT_1C of inst : label is "26EC800020000000000000002000000026E000000000000026EC899326E00000";
    attribute INIT_1D of inst : label is "26EC80002400000026EC899326EC88000000000026EC89802000000026EC8993";
    attribute INIT_1E of inst : label is "0000000026E40000260000000000000026EC89132660000026EC890026EC8990";
    attribute INIT_1F of inst : label is "FFCCFF007C63E36C26EC8993FFFFFFFF00000000260000000000000026EC8110";
    attribute INIT_20 of inst : label is "26EC800026EC899326CC800026EC899326EC000026EC899326EC880000000000";
    attribute INIT_21 of inst : label is "0000000026EC88800000000026EC00002000000026EC811026EC800026EC8993";
    attribute INIT_22 of inst : label is "2620000000000000262000000000000026200000262000002000000026EC8993";
    attribute INIT_23 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000";
    attribute INIT_24 of inst : label is "E3000000E010E0F007C000000E0F0C0FE3000000F1C0F1E007C000000E0F0C0E";
    attribute INIT_25 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_26 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_27 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_28 of inst : label is "26EC89932488000026EC89930000000026EC88800000000026EC898020000000";
    attribute INIT_29 of inst : label is "26E0000026EC899326EC880026EC89930000000026EC89800000000026EC8800";
    attribute INIT_2A of inst : label is "0000000026EC811300000000131000000000000026E441110000000026EC8993";
    attribute INIT_2B of inst : label is "0000000000000000262000000000000026200000000000002664010000000000";
    attribute INIT_2C of inst : label is "00804C4C000000007C63E36C7C63F16C6C62E36C08040C4C000000080000004C";
    attribute INIT_2D of inst : label is "000000000000000000000000000003640843E36C7C63E36C7C63E36C6C63E36C";
    attribute INIT_2E of inst : label is "000000003463E36C000103200000000000000000000000003463636C00010120";
    attribute INIT_2F of inst : label is "0023636C000000007C63E36C0842E36C7C63E36C6C63E36C0000000C0000C26C";
    attribute INIT_30 of inst : label is "0000806C000000000000000000010364000000003463E36C000000000000804C";
    attribute INIT_31 of inst : label is "1023E36C000000000063E36C0000000C7C63E36C000000247C63E36C0000006C";
    attribute INIT_32 of inst : label is "0842E36C6C63E36C4C40C06C0080800800000000000000000003636C00000000";
    attribute INIT_33 of inst : label is "0000000000000000000000007463E36C10032320000000007C63E36C7C63E36C";
    attribute INIT_34 of inst : label is "10032320000000007C63636C7C63636C0842E36C0800C26C0000000000000100";
    attribute INIT_35 of inst : label is "26E83E803E80000026EC898026E83E803E80000000000000000000007463E36C";
    attribute INIT_36 of inst : label is "01333333F000000026E83E803E80000026EC898026E83E803E80000026EC8980";
    attribute INIT_37 of inst : label is "00000000000000001111000F00111111001136C8000000003333300F33333333";
    attribute INIT_38 of inst : label is "000000000000000000CC000F0000003E00000000000000000000000F0003E800";
    attribute INIT_39 of inst : label is "3110000088C446227777000FC631004600000008000000000CEE000F00000E30";
    attribute INIT_3A of inst : label is "26EC01C720C710009999888F9999999999999999F88888883333000F23333333";
    attribute INIT_3B of inst : label is "20C710001000000026EC01C720C710001000000026EC01C720C7100010000000";
    attribute INIT_3C of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF10000000";
    attribute INIT_3D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
