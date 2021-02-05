-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_D is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_D is

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
    attribute INIT_00 of inst : label is "0303030303030303030301010101010101010101010101010101010101010101";
    attribute INIT_01 of inst : label is "0101030303010101010101010101010101010101030303030303030303030303";
    attribute INIT_02 of inst : label is "0101010101010301050505050505050505050505050003030003030005050101";
    attribute INIT_03 of inst : label is "0505050003070707000500030503000500070101000303030303000101010301";
    attribute INIT_04 of inst : label is "0303000505050103030300010003030301010101010101010101010107070300";
    attribute INIT_05 of inst : label is "0303030101010103030303030303010107070707070707070707070505050003";
    attribute INIT_06 of inst : label is "1126172105050505030303050505050503030303030303030305010103030303";
    attribute INIT_07 of inst : label is "41E411260D210C9DCD4148CD06100141EC112617210C9DCD41CDCD08180141E4";
    attribute INIT_08 of inst : label is "0201427C112E06210C9DCD4148CD060801424C11260D210C9DCD41CDCD041801";
    attribute INIT_09 of inst : label is "2001E14135C20D1323771AE5C50BA3C30C9DCD0DD2CD1719CD0C9DCD4133CD38";
    attribute INIT_0A of inst : label is "F1C14159C20D19002011040EC541A4D2F50F1A080ED5C5E5C94133C205C10900";
    attribute INIT_0B of inst : label is "C20DE1C1417EC32BE1C10036417CCA02E67E3420B021414AC20513D1414EC20D";
    attribute INIT_0C of inst : label is "2E0236241F262DEC2EC036FE76E61F49CDC8A77E2D24E42E1F2620B032AF4148";
    attribute INIT_0D of inst : label is "0250011941B1C20D1900201177A046E03E41C8C201FE20B03A030EC5C90236CC";
    attribute INIT_0E of inst : label is "052BE1C141CFC20DD11183CD080606D3D5C5E541B1C30E3E415EC306D30EC9CD";
    attribute INIT_0F of inst : label is "FCFFFE7F8FE7FCFFFE3F07C3FC7FFE1E07C1FC1E00EEEEEE00EEEEEEC941CDC2";
    attribute INIT_10 of inst : label is "DFF3F8FC1F039D77FC3E07039D771C0E07739FF71CE707739FF71CE3FE7F8FE7";
    attribute INIT_11 of inst : label is "0FDFDC7039F801DDDC703998019DCEE039980181CEE039C01F81C7C1F9F01F81";
    attribute INIT_12 of inst : label is "9BF60DB0DB6D9B766DB0DB399B3638F7CF399B360FC70EE038E00FCF8EE039F0";
    attribute INIT_13 of inst : label is "FFFFFFFF39B7CF6C63366DB0DB6C633661B0DB6CF3B638F3DB7CF3F60DB0DB6D";
    attribute INIT_14 of inst : label is "0FFF3FFFFFFFF1C0F1C0FFFF3FFF0FFF000000003F007F80FFC0F1C0F1C0FFFF";
    attribute INIT_15 of inst : label is "FFFFF000F000F000000000003F1F7FBFFFFFF1E0F1C0FFFFFFFFFFFF00000000";
    attribute INIT_16 of inst : label is "FFFFFFFFFFFFF0070000000000000000000000000000F000F000F000FFFFFFFF";
    attribute INIT_17 of inst : label is "A720AD3AC0A720B83A42FCD204FED802FE07F9CDF007FFFFFFFFFFFFF007F007";
    attribute INIT_18 of inst : label is "10C64323CA05200A3A470FE620A03AC880E67E2B435EC2A77E20A12143BBCDC0";
    attribute INIT_19 of inst : label is "20063A20A93240C620093AC0B8FEE67E208A2147FEE608DE20A53204C6431AC3";
    attribute INIT_1A of inst : label is "A42120A132013E20A5328020A53AFE064352C2A7200D3A02064359D2BE20AA21";
    attribute INIT_1B of inst : label is "E10291CD20202120B732013E43A3CD053620AA2A4379DABD20A93AEB17BBCD20";
    attribute INIT_1C of inst : label is "458C1143AED22FFE7DEB17BBCD20A421021FCD4E20A221C8A77E20A1210094C3";
    attribute INIT_1D of inst : label is "CAA720843A1396C345941143B8CAA720AD3A17B2C31BA01120A0210E061396CD";
    attribute INIT_1E of inst : label is "052343F1CAA77E2C2E43E4C20B066720673A7902FE208C3A4FC0A720A13A43FF";
    attribute INIT_1F of inst : label is "3AC920A03280F60FE605C67D20AA22C943E6C2052B43F1CAA77E362EC943D9C2";
    attribute INIT_20 of inst : label is "013E20F2224653CD1758CDC8A720AE3AC97723C8A77E20B72120A0327FE620A0";
    attribute INIT_21 of inst : label is "49C209C611A70A20B4010AD9CD110E45081129042120C032023E0B58CD20F132";
    attribute INIT_22 of inst : label is "3E200B2A17B2CD04064504112310210AD9CD020E2F042113134451CAA70A0B44";
    attribute INIT_23 of inst : label is "23102144B9CDE144A3CDE544CFCD44EBD2C8FE7D44E3CD4489CD231222678407";
    attribute INIT_24 of inst : label is "20C032003E163AC320C032023E449BCAA720C03A44CFCD446CC344E0CD342334";
    attribute INIT_25 of inst : label is "23113A4F23103AC944A7C20D44CFCDD838FE67907C4723113A4F23103A07BAC3";
    attribute INIT_26 of inst : label is "C9C10EC9CD032001C5E1770F3E17C7CDE5C944BDC20D44CFCDD0E8FE67807C47";
    attribute INIT_27 of inst : label is "BACD0036442BC30BA3CD44FCDABE20B53A3420BE21C92312226F85083E23122A";
    attribute INIT_28 of inst : label is "C2A77E1E2E202612130D080E0F1B1C1C211B1B12140D0E01000002010CA2C307";
    attribute INIT_29 of inst : label is "0A0E781E0D161B2E2C26C034FE76E61F49CD201E323CC052D676E61F49CD452E";
    attribute INIT_2A of inst : label is "C0BC1A13C0D6FE1A174C11C8DB01DBD021C94541C20D1BD10AE5CDD53FC61A0C";
    attribute INIT_2B of inst : label is "C61A0C120E1716511E032E2826C900362026E22EC0B91A13C0B81A13C0BD1A13";
    attribute INIT_2C of inst : label is "0AE600DB985CB65F5FB65C98A55A24FFDB7E3C18C9457EC20D1BD10AE5CDD538";
    attribute INIT_2D of inst : label is "0E45AE112D152104030E0C1B13041204110FC9003620E321C000A70000CA0AFE";
    attribute INIT_2E of inst : label is "D34631CC40FE45FFCC02FE45F9CC20FE45E4CC04FEC810FE76E601DB0C85CD0B";
    attribute INIT_2F of inst : label is "DBC9013620E4210B58C320F132013E20F22201002145E4C204E601DB45C4C306";
    attribute INIT_30 of inst : label is "CD0259CD0036461CC20AFE7E34FA2E3409364610DA12FE07F9CD45FFC202E601";
    attribute INIT_31 of inst : label is "250121F57E340B17CDC9003620E4210C21C37EFE2E13F9CD16C2CD01DECD0997";
    attribute INIT_32 of inst : label is "6EC2A77E234665C2A77E20B321180BC33CF11183CD1C811110064640C23D2424";
    attribute INIT_33 of inst : label is "B432C920AE3220B332C920B532033E008021C920B532043E010021C900502146";
    attribute INIT_34 of inst : label is "060EC9CD0000010B3CCD463CCDD007FE7E340B17CDD038FE7EF82E13F9CDC920";
    attribute INIT_35 of inst : label is "352C4838352C484332094244090A0D483042302C483042302C483042175CC3EF";
    attribute INIT_36 of inst : label is "43202A2A2A2A2A093B0A0D3B0A0D3B0A0D483438094244090A0D4834382C4838";
    attribute INIT_37 of inst : label is "44093A4D4F5248430A0D3B0A0D2A2A2A2A2A2041544144205245544341524148";
    attribute INIT_38 of inst : label is "44090A0D3E30303C2020204120203B202020094834342C4834322C4846310942";
    attribute INIT_39 of inst : label is "203B202020094839342C4839342C484637094244090A0D4846312C4834320942";
    attribute INIT_3A of inst : label is "2C484533094244090A0D4836332C483934094244090A0D3E31303C2020204220";
    attribute INIT_3B of inst : label is "2C483134094244090A0D3E32303C2020204320203B202020094831342C483134";
    attribute INIT_3C of inst : label is "3C2020204420203B202020094831342C4831342C484637094244090A0D483232";
    attribute INIT_3D of inst : label is "39342C4839342C484637094244090A0D4845332C483134094244090A0D3E3330";
    attribute INIT_3E of inst : label is "090A0D4831342C483934094244090A0D3E34303C2020204520203B2020200948";
    attribute INIT_3F of inst : label is "090A0D3E35303C2020204620203B202020094838342C4838342C484637094244";
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
