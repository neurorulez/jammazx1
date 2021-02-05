-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity rom_sprite_l is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of rom_sprite_l is

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
    attribute INIT_00 of inst : label is "000F07C7CFC0CCC300F0535D550A0A16C3CDCDC505050F0075B57A959D5F53F0";
    attribute INIT_01 of inst : label is "0C03000C0000C0F3F050535D555A3A3A3330FF76F905050F56559659A55AADFF";
    attribute INIT_02 of inst : label is "000C070505C575FF00F35F9E0A0A05FACCFCFCCF05070C00C6C5CA75AA5D53F0";
    attribute INIT_03 of inst : label is "0FF5F537370F0C00F05093AD89090A5600003C3CFBF5C50FA559AA55AA555FF0";
    attribute INIT_04 of inst : label is "0C0C0F0F03CF737FF07070737D757535737F79C9C9090F00353696566E6360F0";
    attribute INIT_05 of inst : label is "0FC0707F707F7D790F0C0F0F07C5F51579797979C9C9050F161A5A6AAD9350F0";
    attribute INIT_06 of inst : label is "054A4A4A45020200559A1A1A550A0A0005050400CF0F0F0201014050FFFFFF02";
    attribute INIT_07 of inst : label is "0FC00F0F00050555F00FF3F000D0F7A6550000C00F00008AF7C505FACA0A0AA0";
    attribute INIT_08 of inst : label is "0000455A5A5A55800000559999995500800000FFFFCF0202005140FFFFFF0202";
    attribute INIT_09 of inst : label is "455A55800000000055995500000000000000000000FFCF0F0000515100FFFFFF";
    attribute INIT_0A of inst : label is "034C4000455A5252000000005599999955FFFFCF0202020255FFFFFF02020202";
    attribute INIT_0B of inst : label is "000C0F070505C6CA00F0535D95951535C5C5CA050505070CF5C53507FFD05CFF";
    attribute INIT_0C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0D of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_10 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_11 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_12 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_13 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_14 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_15 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_16 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_17 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_18 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_19 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1A of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1C of inst : label is "0202020202020202020202020202020202020202020202020202020202020202";
    attribute INIT_1D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02020205074F0705020105070F070501";
    attribute INIT_1E of inst : label is "00000000000004040000000050A0B0F00400000000000000B0A0500000000000";
    attribute INIT_1F of inst : label is "0000000200040D0D0000200052F0E0A80D0D040002000000A8E0F05200200000";
    attribute INIT_20 of inst : label is "0001050202000000004000004050501000000100000000000004000040600000";
    attribute INIT_21 of inst : label is "0800000A090C0000000000020206062C000000020C0200002480080000000000";
    attribute INIT_22 of inst : label is "0000000002080000000022C60703002000030B0B0000000050A0020200400000";
    attribute INIT_23 of inst : label is "0000400005030000000000000004042700400D01010000000001010210000000";
    attribute INIT_24 of inst : label is "00000003CFFF3C0000000060606061613CFFCF03000000006160606000000000";
    attribute INIT_25 of inst : label is "00C0F0F33F3F3C0000000000001010103C3F3FF3F0C000001010000000000000";
    attribute INIT_26 of inst : label is "00000000000FFF0000000000909A9A9AFF0F0000000000009A9A900000000000";
    attribute INIT_27 of inst : label is "0000000004040A0A000020205050A0A00A040C0C00000C0FA050D0F03030F0C0";
    attribute INIT_28 of inst : label is "000000080805050A000010A0A05050A00A0507030000030FA0505003030300C0";
    attribute INIT_29 of inst : label is "000000000805050A00000010A05050A28A4505C3F0F0C003AA55530F0C0C0F03";
    attribute INIT_2A of inst : label is "0F0FCFFF0CFFFFFA0000003030F0F0F0FA3A3A1455450505F0F0F03000000000";
    attribute INIT_2B of inst : label is "000000000000038F00000000000040058F8C8E4E4A4E0D054555105555755550";
    attribute INIT_2C of inst : label is "0000000000010101000000000011101001010000000000001010000000000000";
    attribute INIT_2D of inst : label is "0000000000010101000000000011101001010000000000000010000000000000";
    attribute INIT_2E of inst : label is "0000000000010101000000000011101101010000000000001111000000000000";
    attribute INIT_2F of inst : label is "0000000000010101000000000011101101010000000000000111000000000000";
    attribute INIT_30 of inst : label is "0000000000010101000000000011101101010000000000001011000000000000";
    attribute INIT_31 of inst : label is "0000000000010101000000000011101101010000000000000011000000000000";
    attribute INIT_32 of inst : label is "0000000000010101000000000011111101010000000000001110000000000000";
    attribute INIT_33 of inst : label is "0000000000010101000000000011111101010000000000000110000000000000";
    attribute INIT_34 of inst : label is "000505014050505A5055A5A5A5A5A5A545CFCFCF0F0E0E0555FFFFF3F3B0A0A0";
    attribute INIT_35 of inst : label is "000505014050505A5055A5A5A5A5A5A545CFCFCF0F0E0E0555FFFFFFF3B0A0A0";
    attribute INIT_36 of inst : label is "00000000000000002020202020505050040404040400000070F0D0F070505050";
    attribute INIT_37 of inst : label is "000000000000000020202020202020200000050505050500205051F5D5F55150";
    attribute INIT_38 of inst : label is "00080A0B0F8F8FAEA052A6A9AAAA7AFA6A6A96898A0A0A04F6F9FAEB6390A020";
    attribute INIT_39 of inst : label is "000A8AA56A9AAA5500B0BAFAF5FAFAF5AAAA9A6AA58A0A00FAFAFAF5FABAB000";
    attribute INIT_3A of inst : label is "0C00050A46569599F0C0516566AAAAAA999999FFFFCF0CC0AAAAAAFFFFFFFCFF";
    attribute INIT_3B of inst : label is "00000000AAA0440500000000AAA044050544A0AA000000000544A0AA00000000";
    attribute INIT_3C of inst : label is "060909898A8A8FCF929AAAAA9999FBFFCF8F8A8A89090906FFFBA9A99A9AAAA2";
    attribute INIT_3D of inst : label is "000000000004080100000000101CC000080002041000000000C000001C000000";
    attribute INIT_3E of inst : label is "0000000000000909000000001C1CD0E0020406040000000020E0C00C2C000000";
    attribute INIT_3F of inst : label is "0F06F6797979B9B5F090A3AD050505F5B67D7D7ECD0D0D0FC70C03300C00F030";
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
    attribute INIT_00 of inst : label is "00CFC53504FF3CDC00F05050538E8E8D53505F5676C90B0F5DAD5D5E63A0F030";
    attribute INIT_01 of inst : label is "0F07C70C0C0F0C0030D05050539E0E0DCCCFF7595576C90F0D5DAD5E6D9353F0";
    attribute INIT_02 of inst : label is "000F05C5715151FF00F050A3AFAD6D5ECCCCFCFFC905050FAD5FA353A350D030";
    attribute INIT_03 of inst : label is "FF55F5F53130030730D0A0A0A3635D9D0BC7CBC5CAF555FFAE5EAD5DAE5350F0";
    attribute INIT_04 of inst : label is "030F00CF705F509F0030D05050535303909F999999B5C70F0303A3A3A0A0D030";
    attribute INIT_05 of inst : label is "F0F030F3D0909F99C303FD0DFD7D4D0D999999999596BACF0D8DAD9350A0F000";
    attribute INIT_06 of inst : label is "559A909055A0A00051A585855502020000010504FFFFCF0040505000FFF3F000";
    attribute INIT_07 of inst : label is "CFF0F00F00055555F0C0F03000E0E0A1550000FFC30000AAE5E555CAFA02A0A0";
    attribute INIT_08 of inst : label is "000055A6060655A0000051959595550AA00000FFFFFF00000A4A5AFFFFF30000";
    attribute INIT_09 of inst : label is "551655A0000000005195550A0A0A0A0A0000000000FFFFFF0A0A4A5A5AFFFFF3";
    attribute INIT_0A of inst : label is "C010130355A6A4A4000000005195959555FFFFFF0000000055FFFFF300000000";
    attribute INIT_0B of inst : label is "000F05C6F6B9B95900F0A0A0A3AD0D0D5FA3737F75C5050F0DFDCD3D0DCFF0F0";
    attribute INIT_0C of inst : label is "0800000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0D of inst : label is "0808000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0E of inst : label is "0808080000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0F of inst : label is "0808080800000000000000000000000000000000000000000000000000000000";
    attribute INIT_10 of inst : label is "0808080808000000000000000000000000000000000000000000000000000000";
    attribute INIT_11 of inst : label is "0808080808080000000000000000000000000000000000000000000000000000";
    attribute INIT_12 of inst : label is "0808080808080800000000000000000000000000000000000000000000000000";
    attribute INIT_13 of inst : label is "0808080808080808000000000000000000000000000000000000000000000000";
    attribute INIT_14 of inst : label is "0808080808080808000000000000000008000000000000000000000000000000";
    attribute INIT_15 of inst : label is "0808080808080808000000000000000008080000000000000000000000000000";
    attribute INIT_16 of inst : label is "0808080808080808000000000000000008080800000000000000000000000000";
    attribute INIT_17 of inst : label is "0808080808080808000000000000000008080808000000000000000000000000";
    attribute INIT_18 of inst : label is "0808080808080808000000000000000008080808080000000000000000000000";
    attribute INIT_19 of inst : label is "0808080808080808000000000000000008080808080800000000000000000000";
    attribute INIT_1A of inst : label is "0808080808080808000000000000000008080808080808000000000000000000";
    attribute INIT_1B of inst : label is "0808080808080808000000000000000008080808080808080000000000000000";
    attribute INIT_1C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000004051D5514000004051D1514000";
    attribute INIT_1E of inst : label is "0000000004090A0200000000001060600A090400000000006010000000000000";
    attribute INIT_1F of inst : label is "00000800850F0B2A00000080001070702A0B0F85000800007070100080000000";
    attribute INIT_20 of inst : label is "0000004040909810000000505050100009020000000600000000000050000000";
    attribute INIT_21 of inst : label is "0000000001090A28002000000000000000002080000000000000000000002000";
    attribute INIT_22 of inst : label is "0002080000022A4C00000000C00000008C800000000000000070B08000000000";
    attribute INIT_23 of inst : label is "00000002C0C00000000000C01200000004020040400001004110505050010000";
    attribute INIT_24 of inst : label is "000000F4F407070400000000206060600707F4F4000000006060200000000000";
    attribute INIT_25 of inst : label is "0030F1F10909090900000000000000000909C9F1F13000000000000000000000";
    attribute INIT_26 of inst : label is "0000000000CFFF000000000060606165FFCF0000000000006160600000000000";
    attribute INIT_27 of inst : label is "00040A0A05050A0A00000000000020200A0505030303C300200000000000C030";
    attribute INIT_28 of inst : label is "0000050A0A05058A00000000001010A08A0505F0F0F0C000A01030F0C0C0F030";
    attribute INIT_29 of inst : label is "000000050A0545AA00000000001050A0AA55F5F0000030F0A050D0F0030300F0";
    attribute INIT_2A of inst : label is "C0F3CFCF0FCFCFFE00000000000000000E0E0D0D0D5D51400000000000000000";
    attribute INIT_2B of inst : label is "0000000000C0002000000000000050500020A0A4949F5F451115051515515050";
    attribute INIT_2C of inst : label is "0000000000551111000000000040404011550000000000004040000000000000";
    attribute INIT_2D of inst : label is "0000000000551015000000000040404011550000000000004040000000000000";
    attribute INIT_2E of inst : label is "0000000000551111000000000050105011550000000000000050000000000000";
    attribute INIT_2F of inst : label is "0000000000551015000000000050105011550000000000000050000000000000";
    attribute INIT_30 of inst : label is "0000000000551111000000000050105011550000000000001050000000000000";
    attribute INIT_31 of inst : label is "0000000000551015000000000050105011550000000000001050000000000000";
    attribute INIT_32 of inst : label is "0000000000551111000000000000101011550000000000005010000000000000";
    attribute INIT_33 of inst : label is "0000000000551015000000000000101011550000000000005010000000000000";
    attribute INIT_34 of inst : label is "05455A585010189A505051616565655555FFFFFFFF0F8F8555FFF3F0F0A0A020";
    attribute INIT_35 of inst : label is "05455A585010189A505051616565655555FFFFFFCF0F8F8555FFF3F0F0A0A020";
    attribute INIT_36 of inst : label is "00000000000405050000000000001010050D0D0D050505045050505050101000";
    attribute INIT_37 of inst : label is "000000000000000000000000000000000005054D4F0D05050010505070505010";
    attribute INIT_38 of inst : label is "080A06C9EBAF6F9F10A0A0A26296A9A9AFADAAAA6A9A850ABAF2F2F0E0A02000";
    attribute INIT_39 of inst : label is "000EAEAF5FAFAFAF00A0A25AA9A6AAAA5FAFAF5FAFAE0E0055AAA6A95AA2A000";
    attribute INIT_3A of inst : label is "0F03455999AAAAAA300050A091955666AAAAAAFFFFFF3FFF666666FFF3F33003";
    attribute INIT_3B of inst : label is "00000000AA0A115000000000AA0A115050110AAA0000000050110AAA00000000";
    attribute INIT_3C of inst : label is "8AAAA6666A6AEFFF90606062A2A2F2F3FFEF6666AAAAA686F3F2A2A262606090";
    attribute INIT_3D of inst : label is "000000000002040000000000C000CC000440000800000000000CC03000000000";
    attribute INIT_3E of inst : label is "000000000202084100000000C0C0CC0C494A060404000000000CCCC0C0000000";
    attribute INIT_3F of inst : label is "CF7565656191959630E06060635D5D5D5F63905C5F70C0CFFD3F0C0300000000";
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
