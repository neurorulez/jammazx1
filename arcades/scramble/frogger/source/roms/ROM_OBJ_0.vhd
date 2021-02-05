-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ROM_OBJ_0 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ROM_OBJ_0 is

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
    attribute INIT_00 of inst : label is "00048591B1F1DD8C0045CD9D99B9F16100000141FDFD010100387C8581C17C38";
    attribute INIT_01 of inst : label is "00C0C08D9DB0E0C0003C7DD191919D0C00E4E5A1A1A1BD1C00183868C8FDFD08";
    attribute INIT_02 of inst : label is "00FDFD919191FD6C003D7DC888C87D3D0060F1919195FC78006CF1B199996D0C";
    attribute INIT_03 of inst : label is "000000000000FFFF00000000FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_04 of inst : label is "00387CC58181C54400FDFD919191FD6C003D7DC888C87D3D0000000000000000";
    attribute INIT_05 of inst : label is "00387CC581919D9D00FDFD90909090800000FDFD9191918100FDFD8181C57C38";
    attribute INIT_06 of inst : label is "00FDFD183C6DC581000405010101FDFC00008181FDFD818100FDFD101010FDFD";
    attribute INIT_07 of inst : label is "007CFD818181FD7C00FDFD70381CFDFD00FDFD703870FDFD0000FDFD01010101";
    attribute INIT_08 of inst : label is "0064F59191D15D0C00FDFD888C9DF571007CFD81898DFC7900FDFD888888F870";
    attribute INIT_09 of inst : label is "00F8FD1C381CFDF800F0F81C0D1CF8F000FCFD010101FDFC00008080FDFD8080";
    attribute INIT_0A of inst : label is "001010101010101000858D9DB9F1E1C10000C0F01D1DF0C000C5ED7C387CEDC5";
    attribute INIT_0B of inst : label is "0000008080C04070000000000002020778381808008000000F0D0C0800000000";
    attribute INIT_0C of inst : label is "00E0B0F0F0F0F0F000070E0F0F0F0F0FE0E0F0F0F0F0F02007070F0F0F0F0F04";
    attribute INIT_0D of inst : label is "0080C01018201010000002040C000000102058100080000000000C0400000000";
    attribute INIT_0E of inst : label is "80C0C80C1820101000020A180C0000001020580C0880000000000C1808000200";
    attribute INIT_0F of inst : label is "80C0C000182C1810000202000C1808001020580C0880400000000C1808000000";
    attribute INIT_10 of inst : label is "F8DCC858F8B89CB8000010F8BC98B8E8000041FFBF9BDAFBF8D8CC5FF7B3D77E";
    attribute INIT_11 of inst : label is "7FEEE7EFFEBCFE77E8B898BDF8100000BD97B3F7FF41000076DFF7B397DCF878";
    attribute INIT_12 of inst : label is "103812840D0480C800103A130200103AAC080020702000001701070110381000";
    attribute INIT_13 of inst : label is "FF828282828282FF3C419AA6A682413C00673C3C7C3C3C6700001C3D1D3D1C00";
    attribute INIT_14 of inst : label is "80C0E0E0F0E0E0E0020307070F070707E060E060F060C040070507050F050301";
    attribute INIT_15 of inst : label is "00000000008090000000000000000404181818D0383838380000080000000202";
    attribute INIT_16 of inst : label is "3838B83038383838080000000001000038185850581818380004040000000100";
    attribute INIT_17 of inst : label is "383878783078F878000000000800020D00C81870C00000001818180D03000000";
    attribute INIT_18 of inst : label is "0020E02000C0202000040F000007080820C000C0202020C00807000708080807";
    attribute INIT_19 of inst : label is "002060A0202000C0000408080A0500072020C000C02020C00808070007080807";
    attribute INIT_1A of inst : label is "2042020202064140000003030000000022262120202020000000000000000000";
    attribute INIT_1B of inst : label is "E0FAFBFFFDFFE4E402036290977F3B3EE4FCFFFDFFFBFAE03E3B7F9790620302";
    attribute INIT_1C of inst : label is "0000041D30E0E0E00000103C01071F1FE0E0E0301D0400001F1F07013C100000";
    attribute INIT_1D of inst : label is "0000001038ECE3E0000000103D071F1FE0E3EC38100000001F1F073D10000000";
    attribute INIT_1E of inst : label is "000020F080C0E0E00000081D01071F1FE0E0C080F02000001F1F07011D080000";
    attribute INIT_1F of inst : label is "000008CCC8E8F0E00000103313170F07E0E0F018080C080007070F1810301000";
    attribute INIT_20 of inst : label is "000010D8D0F0F0E00000081B0B0F0F07E0E0F0183060400007070F180C050100";
    attribute INIT_21 of inst : label is "000000C8CCE8F8E00000001333171F07F8E8CC08000000001F17331000000000";
    attribute INIT_22 of inst : label is "0000401088E0E4F0000001081207270FF0E4E088104000000F27071208010000";
    attribute INIT_23 of inst : label is "0080280480A1C0F1000214200246034FF1C0A180042880004F03460220140200";
    attribute INIT_24 of inst : label is "4000040040001280010020000100880280120040000400400288000100200001";
    attribute INIT_25 of inst : label is "0000001088C0E0E00000000812030707E0E0C088100000000707030A04000000";
    attribute INIT_26 of inst : label is "008000002090C0C10002000001040222C1902000000080002204010000000200";
    attribute INIT_27 of inst : label is "080A020604040008000000000000000048482921011408000000000101000002";
    attribute INIT_28 of inst : label is "40E060F060E060E00105050F05050507E0E0E0F0E0E0C0800707070F07070302";
    attribute INIT_29 of inst : label is "00CCF0ECE0ECF0EC00033F0737073F07E0F01010FC545400070F08083F292900";
    attribute INIT_2A of inst : label is "00000000E0F0F8F800000000070F1F1FF800F0F8F8F8F0F01F000F1F1F1F1F0F";
    attribute INIT_2B of inst : label is "F0F0F0F0F0F0F0F00F0F0F0F0F0F0F0FF0F0F8F8F8F000000F0F1F1F1F0F0000";
    attribute INIT_2C of inst : label is "0000408000000000000000000221000000004000100008200001000000000000";
    attribute INIT_2D of inst : label is "0010004000004000000000000000000010000008000010000000000000000000";
    attribute INIT_2E of inst : label is "0000808080000080000000000800000000200010000020000000000000000000";
    attribute INIT_2F of inst : label is "0820000040000080000000000000000000400000002000000000000000000000";
    attribute INIT_30 of inst : label is "0000000000002000000000020000000008001000002000800000000000000000";
    attribute INIT_31 of inst : label is "0020001000000800000000000000000000400000800000000000000000000000";
    attribute INIT_32 of inst : label is "1010080949098121000000000000000000104404066602020000000000000000";
    attribute INIT_33 of inst : label is "141444400A0A0286000000000000000002462100048402020000000000010000";
    attribute INIT_34 of inst : label is "2082C2020206016000000505000000030246012000200000000C001800000000";
    attribute INIT_35 of inst : label is "0001FDFDFDFC80800000FFFFFFFFE3E38080808080000000E3E3E3E3E3E3E0C0";
    attribute INIT_36 of inst : label is "0001FDFDFDFCF8F80000FFFFFFFFE0E0F8F1FDFDBDBD8D0CE0E0E3C3FFFF7F7F";
    attribute INIT_37 of inst : label is "0008F8F1FDFD0D0D00003F3FFFFFE0E00D0D0D0DFDFCF8F0E0E0E0C0FFFF3F3F";
    attribute INIT_38 of inst : label is "200414141416022A02020000000000000A284929310408000000004840080000";
    attribute INIT_39 of inst : label is "00000008DCFDFCF80000103B7F33131FF8F8FCFDDC0800001F13337F3B100000";
    attribute INIT_3A of inst : label is "0018D8FCFCF8F8F80030777F33377F7FF8F8F8FCFCD818007F7F37337F773000";
    attribute INIT_3B of inst : label is "00CCFFFFFEFDFDFD3063FFF8BC7F7F7FFDFDFDFEFFFFCC0C7F7F7FBCF8FF6330";
    attribute INIT_3C of inst : label is "0000000003834428000C0C013A68DCFD1028448303000000FDFDDC683A010C0C";
    attribute INIT_3D of inst : label is "0020E0C8F8F13D3D00000F0F3F3FF8F00D8D8D0DFDFDFDFCE0E0E3E3E3E3E3C3";
    attribute INIT_3E of inst : label is "00000001FDFDFDFD00000000FFFFFFFF8D8D8D8D8D0D0D0CE3E3E3E3E3E3E0C0";
    attribute INIT_3F of inst : label is "E0FAFBFFFDFFE4E402036290977F3A38E4FCFFFDFFFBFAE0383A7F9790620302";
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
