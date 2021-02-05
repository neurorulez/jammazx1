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
    ADDR        : in    std_logic_vector(10 downto 0);
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
    attribute INIT_00 of inst : label is "1F0F07030303070FFEFCF8F0E0C080000080C0E0F0F8FCFEFFFFFFFFFFFFFFFF";
    attribute INIT_01 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F07030303070F1F";
    attribute INIT_02 of inst : label is "F8F8F0E0E1E3FFFF808183878F9FFFFF989183878F9FFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_03 of inst : label is "F8F8F0E0E1E3FFFF808183878F9FFFFFFFC3810000183878FF8F8F8F8E8C8880";
    attribute INIT_04 of inst : label is "38F8F8F0F1F3FFFF8E8F8F87C7E7FFFFFFC3810000183878FF8F8F8F8E8C8880";
    attribute INIT_05 of inst : label is "38F8F8F0F1F3FFFF8E8F8F87C7E7FFFFF8F8808080F8F9031F1F0101011F9FC0";
    attribute INIT_06 of inst : label is "870F1F3F7FFFFFFFF1F1F0F0F0F0F1FF1818989898F8F80018181919191F1F00";
    attribute INIT_07 of inst : label is "870F1F3F7FFFFFFFF1F1F0F0F0F0F1FFFFFFFF000000E1C3FF91918080809191";
    attribute INIT_08 of inst : label is "383838000000FFFF8E8E8686C6E7FFFFFFFFFF000000E1C3FF91918080809191";
    attribute INIT_09 of inst : label is "383838000000FFFF8E8E8686C6E7FFFFFFFF78383838383800181818181F1F00";
    attribute INIT_0A of inst : label is "383810000103FFFF8E8E8480C0E0FFFFFFFF7838383838380000000000F8F800";
    attribute INIT_0B of inst : label is "383810000103FFFF8E8E8480C0E0FFFFFFF371303838383803E1F0381818F8F8";
    attribute INIT_0C of inst : label is "F8F8F8E0E0E0FFFF81879FFFFFFFFFFFFFF3713038383838C0870F1C18181F1F";
    attribute INIT_0D of inst : label is "F8F8F8E0E0E0FFFF81879FFFFFFFFFFFFFFFE08000001878FFFFFFFFFEF8E080";
    attribute INIT_0E of inst : label is "3838100001C3FFFF8E8E8480C0E1FFFFFFFFE08000001878FFFFFFFFFEF8E080";
    attribute INIT_0F of inst : label is "3838100001C3FFFF8E8E8480C0E1FFFFFFC3010010383838FFE1C080848E8E8E";
    attribute INIT_10 of inst : label is "383810000183FFFF8E8E8E86C7E7FFFFFFC3010010383838FFE1C080848E8E8E";
    attribute INIT_11 of inst : label is "383810000183FFFF8E8E8E86C7E7FFFFFF03010010383838FFE0C080878E8E8E";
    attribute INIT_12 of inst : label is "0001FFFF000000FFC0E0FFFFC0C0C0FFFF03010010383838FFE0C080878E8E8E";
    attribute INIT_13 of inst : label is "0001FFFF000000FFC0E0FFFFC0C0C0FFFF010000F8F8F800FFE0C0C0C7C7C7C0";
    attribute INIT_14 of inst : label is "F8F8F8F8F8FFFFFFC7C7C7C7C3E3F3FFFF010000F8F8F800FFE0C0C0C7C7C7C0";
    attribute INIT_15 of inst : label is "F8F8F8F8F8FFFFFFC7C7C7C7C3E3F3FFFFFFF8F8000000F8FFFFFFFFF0E0C0C3";
    attribute INIT_16 of inst : label is "18F8F0000001FFFF8F8F878080C0FFFFFFFFF8F8000000F8FFFFFFFFF0E0C0C3";
    attribute INIT_17 of inst : label is "18F8F0000001FFFF8F8F878080C0FFFFFFFFFF0100003018C7C3E1C08080848E";
    attribute INIT_18 of inst : label is "0F1F3C000000FCFFFCFE9C8080809FFFFFFFFF0100003018C7C3E1C08080848E";
    attribute INIT_19 of inst : label is "0F1F3C000000FCFFFCFE9C8080809FFFFFFFFCF8F0E0C004FF9F8F87838190F8";
    attribute INIT_1A of inst : label is "E0C0030F3FFFFFFFF9F9F8988080839FFFFFFCF8F0E0C004FF9F8F87838190F8";
    attribute INIT_1B of inst : label is "E0C0030F3FFFFFFFF9F9F8988080839FFFFFFF3F0F03C0E09F83808098F8F9F9";
    attribute INIT_1C of inst : label is "0103070F1F3F7FFF003860C0C0C0E0F0FFFFFF3F0F03C0E09F83808098F8F9F9";
    attribute INIT_1D of inst : label is "0103874F3F3F7FFF00383060E0E0F0F8FF7F3F1F0F070301F0E0C0C0C0603800";
    attribute INIT_1E of inst : label is "0103070F1F3F7FFF0080C0E0F0F8FCFEFF7F3F3F4F870301F8F0E0E060303800";
    attribute INIT_1F of inst : label is "67BDDB6666DBBD6666BDDB6666DBBD67FF7F3F1F0F070301FEFCF8F0E0C08000";
    attribute INIT_20 of inst : label is "7A7A7E0066DBBD6666BDDB6666DBBD66E6BDDB6666DBBD6666BDDB6666DBBDE6";
    attribute INIT_21 of inst : label is "E0E0FEFEFEE0E0FF66BDDB66007E5E7E427E7E5E7E4E666A6A664E7E7E5A7A42";
    attribute INIT_22 of inst : label is "FFE7E7E7E7E0E0FF0F07E7E7E7070FFFF0E0E7E7E7E0F0FF07077F7F7F0707FF";
    attribute INIT_23 of inst : label is "F3E3E7E7E7E0F0FFFF1F0FC7E7E70707FFF8F0E3E7E7E0E0FFFFFFFFFF0707FF";
    attribute INIT_24 of inst : label is "E0E0F8FCFFE0E0FF0F07676767070FFFE0E0FEFEFEE0E0FFCFC7E7E7E7070FFF";
    attribute INIT_25 of inst : label is "E7E7E6E6E6E0E0FFCFC7E7E7E7070FFFF3E3E7E7E7E0F0FF0707FF3F1F0707FF";
    attribute INIT_26 of inst : label is "F0E0E6E6E6E3E3FFFFFFFFFFFF0707FFFFE7E7E7E7E0E0FFE7E76767670707FF";
    attribute INIT_27 of inst : label is "FFE0E0FEFEFEE0E0FFE7E70707E7E7FFFFFFFFE0E0FFFFFFCFC7676767070FFF";
    attribute INIT_28 of inst : label is "F8F0E3E7E7E0E0FFFF0707FF3F1F0707FFE0E0F8FCFFE0E0FF0F07676767070F";
    attribute INIT_29 of inst : label is "FFFFFFE0E0FFFFFF8F076767670707FFF1E0E6E6E6E0E0FF1F0FC7E7E70707FF";
    attribute INIT_2A of inst : label is "FFF3E3E7E7E7E0F0FFFFFFFFFF0707FFE7E7E7E7E7E0E0FFFFE7E70707E7E7FF";
    attribute INIT_2B of inst : label is "FEFEFEE0E0FFF0E0E7E7E7E7070FFFFFE4E7E7E7E0F0FFFFFFCFC7E7E7E7070F";
    attribute INIT_2C of inst : label is "E6E0E0FFE0E0FFFF3F1F8F0707FF0F07FEFFFFE0E0FFE0E0676767070FFFCFC7";
    attribute INIT_2D of inst : label is "E6E6E0E0FFE7E7E7FF0707FF8F076767E7E0E0FFF1E0E6E6670707FF07078F1F";
    attribute INIT_2E of inst : label is "FFE7E3F1F9FCE0E0FFFFFFFFFFE7E767FFFFFFFFFFE7E7E667670707FFFFFFFF";
    attribute INIT_2F of inst : label is "E7E7E6E6E6E0E0FFFF0F07E7E7E70707FFE7E2F0F8FCE0E0FFE7C78F1F3F0707";
    attribute INIT_30 of inst : label is "C399BDBDBD99C3FF1F0FC7E7E70707FFF8F0E3E7E7E0E0FFE7E76767670707FF";
    attribute INIT_31 of inst : label is "DF81DDD9D3C7CFFFC981B5B5B59DDDFFB3A1ADADAD899BFFFFFFBF81BBFFFFFF";
    attribute INIT_32 of inst : label is "CB81B5B5B581CBFFF9F1E5CD9DBDFDFFCF85B5B5B591C3FFCF85B5B5B595D1FF";
    attribute INIT_33 of inst : label is "DB99BDBDBD99C3FFCB81B5B5B5B581FF87D3D9DDD9D387FFC389ADADADA1F3FF";
    attribute INIT_34 of inst : label is "8BA9ADBDBD99C3FFFDFDF5F5F5F581FFBDBDB5B5B5B581FFC399BDBDBDBD81FF";
    attribute INIT_35 of inst : label is "BD99D3E7CF9F81FFC19FBFBFBF9FCFFFFFFFBD81BDFFFFFF81F7F7F7F7F781FF";
    attribute INIT_36 of inst : label is "C399BDBDBD99C3FF819FCFE7F3F981FF81F3E7CFE7F381FFBFBFBFBFBFBF81FF";
    attribute INIT_37 of inst : label is "DB89ADA5B591DBFFB3A18DEDEDED81FFA399CDADBD99C3FFF3E1EDEDEDED81FF";
    attribute INIT_38 of inst : label is "C19FCFE7CF9FC1FFF1C79FBF9FC7F1FFC19FBFBFBF9FC1FFFDFDFD81FDFDFDFF";
    attribute INIT_39 of inst : label is "FFFFFFFFFFFFFFFFBDB9B1A58D9DBDFFF9F3E78FE7F3F9FFBD99D3E7CB99BDFF";
    attribute INIT_3A of inst : label is "0100000000000000800000000000000000000000000000010000000000000080";
    attribute INIT_3B of inst : label is "70F8989898F8F9030E1F1919191F9FC0C3BD7E7E7E7EBDC30000000000000000";
    attribute INIT_3C of inst : label is "C080001F1F0000001818989898F8F80018181919191F1F00FFFFFFFFFFFFFFFF";
    attribute INIT_3D of inst : label is "1F1F0101011F1F00E0F0381818F8F903070F1C18181F9FC0031918F8F8181800";
    attribute INIT_3E of inst : label is "00000000000000000301000000F8F800C0981818181F1F00F0F8989898F8F000";
    attribute INIT_3F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
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
