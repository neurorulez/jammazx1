-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ROM_OBJ_1 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ROM_OBJ_1 is

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

  attribute INITP_00 : string;
  attribute INITP_01 : string;
  attribute INITP_02 : string;
  attribute INITP_03 : string;
  attribute INITP_04 : string;
  attribute INITP_05 : string;
  attribute INITP_06 : string;
  attribute INITP_07 : string;

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

  component RAMB16_S9
    --pragma translate_off
    generic (
      INITP_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";

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
      DO    : out std_logic_vector (7 downto 0);
      DOP   : out std_logic_vector (0 downto 0);
      ADDR  : in  std_logic_vector (10 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (7 downto 0);
      DIP   : in  std_logic_vector (0 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(10 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(10 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "00048692B2F2DE8C0046CE9E9ABAF26200000242FEFE020200387C8682C27C38";
    attribute INIT_01 of inst : label is "00C0C08E9EB0E0C0003C7ED292929E0C00E4E6A2A2A2BE1C00183868C8FEFE08";
    attribute INIT_02 of inst : label is "00FEFE929292FE6C003E7EC888C87E3E0060F2929296FC78006CF2B29A9A6E0C";
    attribute INIT_03 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_04 of inst : label is "00387CC68282C64400FEFE929292FE6C003E7EC888C87E3E0000000000000000";
    attribute INIT_05 of inst : label is "00387CC682929E9E00FEFE90909090800000FEFE9292928200FEFE8282C67C38";
    attribute INIT_06 of inst : label is "00FEFE183C6EC682000406020202FEFC00008282FEFE828200FEFE101010FEFE";
    attribute INIT_07 of inst : label is "007CFE828282FE7C00FEFE70381CFEFE00FEFE703870FEFE0000FEFE02020202";
    attribute INIT_08 of inst : label is "0064F69292D25E0C00FEFE888C9EF672007CFE828A8EFC7A00FEFE888888F870";
    attribute INIT_09 of inst : label is "00F8FE1C381CFEF800F0F81C0E1CF8F000FCFE020202FEFC00008080FEFE8080";
    attribute INIT_0A of inst : label is "001010101010101000868E9EBAF2E2C20000C0F01E1EF0C000C6EE7C387CEEC6";
    attribute INIT_0B of inst : label is "00000000602080F00000000003020007F8F8F8E8C08000000F0F0F0B01000000";
    attribute INIT_0C of inst : label is "0000E0F0F83810D00000070F1F1C080BE0C0F0383838F00007030F1C1C1C0F00";
    attribute INIT_0D of inst : label is "008080D0F8D0E0E0000000050F070707E0D0B8D08080000007070F0500000000";
    attribute INIT_0E of inst : label is "8080C8CCF8D0E0E0000009190F070707E0D0B8CC8880000007070F1908000100";
    attribute INIT_0F of inst : label is "8080C0C0F8D8E0E0000001010F0F0707E0D0B8C08080400007070F0100000000";
    attribute INIT_10 of inst : label is "06002226040640420048E4060042440400A59C00004424040406232000080800";
    attribute INIT_11 of inst : label is "00001010000202000606464000CC2800004048080039A5000000000848230604";
    attribute INIT_12 of inst : label is "EFD7EE7BF5FA7EB77FEF566DFEFF6F566AF6FFDEAEDEFEFEEF3D7AFDEF576F7F";
    attribute INIT_13 of inst : label is "FF818181818181FF3C4299A5A581423C0000387C7C7C38000000004C62400000";
    attribute INIT_14 of inst : label is "00000C0C9CCCCC40000030303933330200804ECE5ECE4E40000172737A737202";
    attribute INIT_15 of inst : label is "000000C0E06878E8000000030F0F1B1BF8F8F810F8D8F8F81F1F171F1F0F1E1E";
    attribute INIT_16 of inst : label is "F8F878F0E8E8E8F8171F0F1F1F1D1F1FF8F8B8B0B8F8F8F81F1B1B1F0F1F1D1F";
    attribute INIT_17 of inst : label is "F8F8B8B8F0B838881F1F0F1F171F1E11F830E080000000000707070100000000";
    attribute INIT_18 of inst : label is "0020E02000C0202000040F000007080820C000C0202020C00807000708080807";
    attribute INIT_19 of inst : label is "002060A0202000C000040808090600072020C000C02020C00808070007080807";
    attribute INIT_1A of inst : label is "FEFEFEFCF0F0B0B00101000003030101D0D0D0D0D050D0000000000000010100";
    attribute INIT_1B of inst : label is "00000000C0783C3C00000020210004023C3C78C0000000000204002120000000";
    attribute INIT_1C of inst : label is "00000000008040A000000000000B120FE0C08000000000001F130B0000000000";
    attribute INIT_1D of inst : label is "00000000008040A000000000000B120FE0C08000000000001F130B0000000000";
    attribute INIT_1E of inst : label is "00000000008040A000000000000B120FE0C08000000000001F130B0000000000";
    attribute INIT_1F of inst : label is "00000040A080E0A00000000305010707A0408000000000000703010000000000";
    attribute INIT_20 of inst : label is "00000040A080E0A00000000305010707A0408000000000000703010000000000";
    attribute INIT_21 of inst : label is "00000040A080E0A00000000305010707A0408000000000000703010000000000";
    attribute INIT_22 of inst : label is "0000000080E0E0F0000000000107070FF0E0E080000000000F07070100000000";
    attribute INIT_23 of inst : label is "000000000080C0E00000000000010307E0C08000000000000703010000000000";
    attribute INIT_24 of inst : label is "0000000000000080000000000000000180000000000000000100000000000000";
    attribute INIT_25 of inst : label is "0000000080C0E0A00000000001030707A0A04080000000000707030100000000";
    attribute INIT_26 of inst : label is "000000000080C0C0000000000000010180800000000000000100000000000000";
    attribute INIT_27 of inst : label is "00101010103030700000000000000000B0B0D0D0E0C0C0800103070505030100";
    attribute INIT_28 of inst : label is "404ECE5ECE4E80000272737A7372010040CCCC9C0C0C00000233333930300000";
    attribute INIT_29 of inst : label is "00001C808C805CC00030083101310A330050101000A80000000A080800150000";
    attribute INIT_2A of inst : label is "000000E010000808000000070800101008C00008080800001003001010101000";
    attribute INIT_2B of inst : label is "0000000000000000000000000000000000000808080000000000101010000000";
    attribute INIT_2C of inst : label is "000040808000000000000008193B3F3F00C0A0F0683830181F0D030000000000";
    attribute INIT_2D of inst : label is "3060F0A0C0C0A070000000000000000028180800080800200000000000000000";
    attribute INIT_2E of inst : label is "000080C0C0C08040000002060E0F0F07E0C0F060783818380301000000000000";
    attribute INIT_2F of inst : label is "3058707020E0C0400000000000000000C0804060201010080000000000000000";
    attribute INIT_30 of inst : label is "0040D0D0F0F0D87800000001010100003038287070C0C0400000000000000000";
    attribute INIT_31 of inst : label is "E0503028181810300000000000000000202040C0008000000000000000000000";
    attribute INIT_32 of inst : label is "0080C0402060E040000300000000000070F0B0F0F0D0F0F00000010000000100";
    attribute INIT_33 of inst : label is "E0F0B0F2FEF6FE7C0001030101010103F0F0D0F0F0E0F2F60703010103050301";
    attribute INIT_34 of inst : label is "FE7E3EFCF03030100101010107070E1C303010101010100078B0F06000000000";
    attribute INIT_35 of inst : label is "00FE020202008080007F00000000202080808080000000002020202020202000";
    attribute INIT_36 of inst : label is "00FE020202000808007F000000002020080E0202828282002021203C00000000";
    attribute INIT_37 of inst : label is "00F8080E02020202001F004000002020020202F2020008002020203F00000000";
    attribute INIT_38 of inst : label is "0060E0E0E0E0E0C00000000101030307E0C0A0C0000000001F7FFFB7B2703000";
    attribute INIT_39 of inst : label is "000000C0F098E8F8000000030C1C1D1FF8F8F8F0C00000001F1D1C0C03000000";
    attribute INIT_3A of inst : label is "0000C0E090E8F8F8000007182C09637FF8F8F8F0E0C000007F63092C18070000";
    attribute INIT_3B of inst : label is "00C0F8CCF4FEFEFE00031F372360617FFEFEFEFCFCF8C0007F616023371F0300";
    attribute INIT_3C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3D of inst : label is "00E02038080E02020007001000400800028282F2020202002021202020202000";
    attribute INIT_3E of inst : label is "000000FE020202020000007F0000000082828282820202002020202020202000";
    attribute INIT_3F of inst : label is "00000000C0783C3C00000020210006073C3C78C0000000000706006160000000";
  begin
  inst : RAMB16_S9
      --pragma translate_off
      generic map (
        INITP_00 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_01 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_02 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_03 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_04 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_05 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_06 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_07 => x"0000000000000000000000000000000000000000000000000000000000000000",

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
        DO   => DATA(7 downto 0),
        DOP  => open,
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "00000000",
        DIP  => "0",
        EN   => ENA,
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
