-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ROM_SND_2 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ROM_SND_2 is

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
    attribute INIT_00 of inst : label is "00040180A811101321000F0F040F62C3000536FD0277FD027EDD0177FD017EDD";
    attribute INIT_01 of inst : label is "FD80A821FD101321DDC9AF045CCD005021043CCD0C0E0492CD013E037FCDB0ED";
    attribute INIT_02 of inst : label is "0336FD0077FD007EDD0A200035FD045CCD190009110476CD1B18022800FE037E";
    attribute INIT_03 of inst : label is "03C9FF3EC9AF02280235FD045CCD230476CD0177FD017EDDF9200135FDC9AF01";
    attribute INIT_04 of inst : label is "5CCD005021043CCD0C0E0492CD013E037FCDB0ED00040180B011107F21000A0A";
    attribute INIT_05 of inst : label is "35FD045CCD190009110476CD1B18022800FE037EFD80B021FD107F21DDC9AF04";
    attribute INIT_06 of inst : label is "5CCD230476CD0177FD017EDDF9200135FDC9AF010336FD0077FD007EDD0A2000";
    attribute INIT_07 of inst : label is "0943CD806732003E037FCD0492CDAF2020B780B63AC9FF3EC9AF02280235FD04";
    attribute INIT_08 of inst : label is "20B780B63A0786C3804421DDC9FF3EC9AF003623773C2300362377800221113E";
    attribute INIT_09 of inst : label is "CD103E80B632013E0786C3805421DD0786C3804C21DDC9AF037FCD0492CDAFF0";
    attribute INIT_0A of inst : label is "2021DDC9AF073BCD804332013E037FCD0492CDAF006DCD123E006DCD113E006D";
    attribute INIT_0B of inst : label is "3E006DCD103E80B632013EC9FF3E80B632AFC0FFFE057ECD802021DD057EC380";
    attribute INIT_0C of inst : label is "1168C3802821DD057EC3802821DDC9AF037FCD0492CDAF006DCD123E006DCD11";
    attribute INIT_0D of inst : label is "CD123E006DCD113E006DCD103E80B632013E1168C3803021DD057EC3803021DD";
    attribute INIT_0E of inst : label is "CD113E006DCD103E80B632013EC9AF073BCD804332023E037FCD0492CDAF006D";
    attribute INIT_0F of inst : label is "CD103E80B632013EC9AF073BCD804332033E037FCD0492CDAF006DCD123E006D";
    attribute INIT_10 of inst : label is "32013EC9AF073BCD804332043E037FCD0492CDAF006DCD123E006DCD113E006D";
    attribute INIT_11 of inst : label is "073BCD804332053E037FCD0492CDAF006DCD123E006DCD113E006DCD103E80B6";
    attribute INIT_12 of inst : label is "32063E037FCD0492CDAF006DCD123E006DCD113E006DCD103E80B632013EC9AF";
    attribute INIT_13 of inst : label is "CD113E006DCD103E80B632013EC9013EC8B7057ECD802021DDC9AF073BCD8043";
    attribute INIT_14 of inst : label is "013E126BC3803021DD126BC3802821DDC9AF037FCD0492CDAF006DCD123E006D";
    attribute INIT_15 of inst : label is "3BCD804332073E037FCD0492CDAF006DCD123E006DCD113E006DCD103E80B632";
    attribute INIT_16 of inst : label is "083E037FCD0492CDAF006DCD123E006DCD113E006DCD103E80B632013EC9AF07";
    attribute INIT_17 of inst : label is "0492CDAF006DCD123E006DCD113E006DCD103E80B632013EC9AF073BCD804332";
    attribute INIT_18 of inst : label is "9F1464142913EE13D213B9139D138113651349C9AF073BCD804332093E037FCD";
    attribute INIT_19 of inst : label is "B7176F172716DA16821657162C160115D615AB15801548151014D814C714B614";
    attribute INIT_1A of inst : label is "045F2F055F2F065F2F075F2F085F2F2F4D095F063F0D1F18B51888185B180917";
    attribute INIT_1B of inst : label is "2B035F2B045F2B055F2B065F2B075F2B085F2B2B4A095F063F0D1FFF2F035F2F";
    attribute INIT_1C of inst : label is "3F0C1FFF26035F26045F26055F26065F26075F26085F262646095F063F0D1FFF";
    attribute INIT_1D of inst : label is "79085F0B3F061FFFB0B08E8D8E70706E6D6E707290706E6D6E70729070095F0B";
    attribute INIT_1E of inst : label is "706E6D6E70729070085F0B3F061FFFA0A0A0B0777577797A9979777577797A99";
    attribute INIT_1F of inst : label is "319360717571956070737093095F0C3F0E1FFFB0B08E8D8E70706E6D6E707290";
    attribute INIT_20 of inst : label is "306091313131319360717571956070737093B030303030303030306091313131";
    attribute INIT_21 of inst : label is "608E2E2E2E2E91606E716E91606C706C90085F0C3F0E1FFFB030303030303030";
    attribute INIT_22 of inst : label is "2C2C2C2C2C2C608E2E2E2E2E91606E716E91606C706C90AC2C2C2C2C2C2C2C2C";
    attribute INIT_23 of inst : label is "8C90AE90B13131313131313131B03030303030303030085F0C3F081FFFAC2C2C";
    attribute INIT_24 of inst : label is "1FFFB03030303030303030AE90B13131313131313131B030303030303030308E";
    attribute INIT_25 of inst : label is "A4A9A9A2095F0F3F081FFFAEB0AD8B898B8D8E90929380928092AE095F0F3F0E";
    attribute INIT_26 of inst : label is "2929095F0C3F0E1FFFB2B3ADA0B0B0A0AEAEAE095F0F3F081FFFA2A4A9A1ABAB";
    attribute INIT_27 of inst : label is "3232202E2E2E2E2029292929202E2E2E2E2E2029292929202626262620292929";
    attribute INIT_28 of inst : label is "22222222202626262626095F0C3F0E1FFFB52032323232202E2E2E2E20323232";
    attribute INIT_29 of inst : label is "29292929202E2E2E2E2E20292929292026262626202929292929202626262620";
    attribute INIT_2A of inst : label is "2E2E20292929292026262626202929292929075F0C3F081FFFB2202E2E2E2E20";
    attribute INIT_2B of inst : label is "FFB52032323232202E2E2E2E203232323232202E2E2E2E2029292929202E2E2E";
    attribute INIT_2C of inst : label is "232425262728292A2B2C2D2E2F303132333435363738393A9795095F0C3F0E1F";
    attribute INIT_2D of inst : label is "3132333435363738393A3B3C3D9D9B095F0C3F0B1FFFA0A22222222222222222";
    attribute INIT_2E of inst : label is "38399D9B095F0C3F0B1FFFA0A52525252525252525262728292A2B2C2D2E2F30";
    attribute INIT_2F of inst : label is "A0A1212121212121212122232425262728292A2B2C2D2E2F3031323334353637";
    attribute INIT_30 of inst : label is "1F8F8F8E8E8D8D898984848B8B8D8D898990908E8E8D8D8989075F0B3F0E1FFF";
    attribute INIT_31 of inst : label is "91858F878F838F8A8F888F878F83075F0B3F051FFFB092909290B0929092900B";
    attribute INIT_32 of inst : label is "809383075F0B3F051FFFB092909290B092909290081F8F8A8F888F878F83918A";
    attribute INIT_33 of inst : label is "92909290B092909290021F938093809380938094809480938093809380938093";
    attribute INIT_34 of inst : label is "ABA884ABA8A4ADA984ADA984ADADA9ABA884ABA884ABA8A4075F0E3F0E1FFFB0";
    attribute INIT_35 of inst : label is "A98B8B8D8BABA6A9ABA9ABADAEADC0A0A92929292929292929A989A9A9ABA884";
    attribute INIT_36 of inst : label is "065F0E3F051FFFA0A486868888A98B8B8D8B8B8BA6A9ABA9ABADAEADA0A4A6A8";
    attribute INIT_37 of inst : label is "83A888A3A3B1B18AB1B18AB1B1AAAFAF83AFAF83AFAFA3B1B18AB1B18AB1B1AA";
    attribute INIT_38 of inst : label is "AFA5AFACAFA7B1ABB1A7B1A5B1AAAFACAFA5AFACAFA7B1ABB1A7A685858383A3";
    attribute INIT_39 of inst : label is "A4ADAD80ADAD80ADADA0AEAE80AEAE80AEAEA4065F0E3F081FFFB1A5B1AAAFAC";
    attribute INIT_3A of inst : label is "ADA0AEA0AEA0AFA0AFA0ADA0ADA0ADA0ADA0E08DAE8EADADAEAE80AEAE80AEAE";
    attribute INIT_3B of inst : label is "8D8B8B8DB2919091929190065F0B3F0E1FFFAEA0AEA0AFA0AFA0ADA0ADA0ADA0";
    attribute INIT_3C of inst : label is "908D8BA0AD8D8B8B8DB2919091929190A0A98D8C8C8C8B8B908D8B908D8BA0AB";
    attribute INIT_3D of inst : label is "878F83055F0B3F051FFF86646066648929292929606B6B606C606C8B8B908D8B";
    attribute INIT_3E of inst : label is "878F838F878F83928C92888785918A9185918A8F8C8F858F8C8F858F878F838F";
    attribute INIT_3F of inst : label is "2929606B6B606C606C081F8785918A9185918A8F8C8F858F8C8F858F878F838F";
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
