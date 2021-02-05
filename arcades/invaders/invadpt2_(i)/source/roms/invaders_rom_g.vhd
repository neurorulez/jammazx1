-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_G is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_G is

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
    attribute INIT_00 of inst : label is "17C7C317BBCD2087211183C30817CDC920F132AFC920F222080CCAA720EF3AC9";
    attribute INIT_01 of inst : label is "11C91D7821C00753CD1D78210811C32087220834CD1599CD77B07E2098211006";
    attribute INIT_02 of inst : label is "1F3E113013211716CD16FACD1705CD1758CDFB240031209332013E17B2C31B83";
    attribute INIT_03 of inst : label is "99060865CA04E601DB0AD9CD184D110973C2140E2810213D20EB3A0AD9CD040E";
    attribute INIT_04 of inst : label is "20FC2220F8220000211705CD20CC32278020CC3A20EB32278020EB3A20CE32AF";
    attribute INIT_05 of inst : label is "2220E72220EF327C0101211758CD1030CD1097CD16E9CD16E3CD22F82221F822";
    attribute INIT_06 of inst : label is "E43222FE3221FE32AF00F2CD22FF3221FF320AB7CD023BCD0235CD1716CD20E5";
    attribute INIT_07 of inst : label is "E602DB17FFCD022ACD22FC2221FC2238782116C2CD01DECD22FA3221FA323C20";
    attribute INIT_08 of inst : label is "15CD0997CD0259CD098EDA0F20673A0215CD20C132AF0BA3CD0A73CD45B9C408";
    attribute INIT_09 of inst : label is "FECD16B8CD20061752CD20B932003E09CACD16B8CD200620B932013E00CCCD02";
    attribute INIT_0A of inst : label is "0C5ECD1558CD0ABECD0B1ECD1191CD0BCACAA720823A0B58CD13B5CD16C8CD13";
    attribute INIT_0B of inst : label is "DA0F0F01DB98060AD9CD183811093EC3162ECD06D3159ECD16B8CD04060968CA";
    attribute INIT_0C of inst : label is "5720673A040E292721091EC30997CD0260CD0881C3013E0865C3087EDA0F0989";
    attribute INIT_0D of inst : label is "C10905000109ACC205C1090020011377AEA61AC505061A24CDC5F51CC61AFA1E";
    attribute INIT_0E of inst : label is "23A83623003620082117B2CD1006D5E52000112300211C1D241BC909A5C20DF1";
    attribute INIT_0F of inst : label is "010FCD015FCDFF36E10A66D20AFE0A60D21AFE20823A13B5CDE5232323A83623";
    attribute INIT_10 of inst : label is "23093A4720093A20093AC10EC9CD035001C50A16D205FE20823A200732200E3A";
    attribute INIT_11 of inst : label is "4AC256FE76E61F49CD0A4ACAA77E2CE12E2026F506D3B8F1C115B8CD0A3EC5F5";
    attribute INIT_12 of inst : label is "0ACAC3C8A720E73A1719CD17B2CD1006D1E109FAC2F10236CC2E02362CEA2E0A";
    attribute INIT_13 of inst : label is "673A0AD9CD0E0E1B70112B1121C9FC2E6720673A09FAC3FE36E109FAC3FC36E1";
    attribute INIT_14 of inst : label is "C316EFCD0B97CD0AA2C204E6C8A720C03A20C032B03E0AE5D43711211E3E0F20";
    attribute INIT_15 of inst : label is "823AC903C601E602DB0A8FC31210CD391C210AB1DA0F20673A261C2128060A8F";
    attribute INIT_16 of inst : label is "13D10AE5CDD51A030E1210C32806391C21C0A720CE3AC9207E32FB3ED009FE20";
    attribute INIT_17 of inst : label is "FE20093AC9C1097709770900200177AFC51183CD06D305061A24CDC90AD9C20D";
    attribute INIT_18 of inst : label is "CECDC97EFF2E13F7CDC92091222B208332013E0600210B12C2B47D20912AD078";
    attribute INIT_19 of inst : label is "B8C31006209932FF3E00362B2B16CECD4637CDD8B8108ACD1506C8A77E2B2B16";
    attribute INIT_1A of inst : label is "C8A720F13A0B97CDC9F1C923D804FE23D802FEF11D9C210B56CAA720AF3AF516";
    attribute INIT_1B of inst : label is "D57B0B7FCD7A6F66237E235777278A7E235F7727837EE1EB20F22AE520F132AF";
    attribute INIT_1C of inst : label is "21D820F8210F20673A0AE5C31CC6C9D10B92CD0FE6F10B92CD0FE60F0F0F0FF5";
    attribute INIT_1D of inst : label is "BA3AC90BA8C20D23E1C10BACC205190020110036C5E5DF061A0E240221C920FC";
    attribute INIT_1E of inst : label is "1896CD0BBECD0036F82E13F9CD4682CD4410CD0C41CDC920BB32013EC002FE20";
    attribute INIT_1F of inst : label is "F92EE57E34FA2EE5FE2E6720673A206732F1022ACDF520673A0BA3CD20E932AF";
    attribute INIT_20 of inst : label is "0EC316C2CD023BCD209832213E0C38DA0F7C0C21CD7EE100360C09C20AFEE134";
    attribute INIT_21 of inst : label is "0EC301DECD0235CDC938362370FC2E13F9CD460C28C23D231D9F21773C07E609";
    attribute INIT_22 of inst : label is "153AC90C57C20C5ECD0C4CCA0C5ECDC8A720C03A20C032303E0C57C20C5ECD09";
    attribute INIT_23 of inst : label is "362B772B003620F3217E0B41CD784116B8CD0806480C81CAA720EF3AC9FFFE20";
    attribute INIT_24 of inst : label is "C3403EC90C85C20D130C90C23D20C03A20C032073ED10AE5CD1AD5C920622101";
    attribute INIT_25 of inst : label is "0CB9C2A720C03A20C032C90CA7DA0F20C13A007BC34383CDE10CB6C3803E0CB6";
    attribute INIT_26 of inst : label is "17DCCD05D303D3AF0CCBC3033E003601DEC321F93201360CD1C2A77E20EC21C9";
    attribute INIT_27 of inst : label is "21FF320AB7CD0D03C2A721FF3A0BA3CD0C9DCD163FCD0C9DCD40DCCD0C9DCDFB";
    attribute INIT_28 of inst : label is "0D68CD13FECD20C132013E09CACD0215CD0260CD0235CD0CC1CD022ACD17FFCD";
    attribute INIT_29 of inst : label is "11210C0E0BA3CD0C9DCD20C132AF0D2CC20C5ECD202532AF0D1ACA0C5ECD06D3";
    attribute INIT_2A of inst : label is "CD1661CD1127010D5FDA0702DB1673CD167DCD1123010DD2CD0AD9CD1117112C";
    attribute INIT_2B of inst : label is "0E02122B08071BD4C1C9D4CFDCC3CFD2D0DB4519C316C8CD169DC30BA3CD0CA2";
    attribute INIT_2C of inst : label is "21010610E60DB9CD0DC3C406E601DB00A4CAA7234D3A0DC9CC40E600DB1B0411";
    attribute INIT_2D of inst : label is "15F2C2A720E13A0094C3234A2223234A2A7000062B0DAEC223A77E0DAEC220B1";
    attribute INIT_2E of inst : label is "3E0CB6C3203EC9E1C110BACDC5E51030C31097CD1130CDC920BF32013EC901DB";
    attribute INIT_2F of inst : label is "1028CD0BA3CDC9E1C90DE7C2050DE7C20D0DF8CA60E60DB9CD0650010CB6C305";
    attribute INIT_30 of inst : label is "210EA7CD1E21112712210AD9CD170E271721103D1117B2CD2340211065111506";
    attribute INIT_31 of inst : label is "2A0621110E1054111183CD28061F1611330E210EA9CD050E270E210EA7CD2710";
    attribute INIT_32 of inst : label is "FE0ED2CC40FE76E60DB9CD0EB9CD101BD220FE234B3A101BCAA7234D3A0AD9CD";
    attribute INIT_33 of inst : label is "1DFE234B3A0EC1CD0EC9CD0130010F72C2A720B23A101BC2A720BF3A0F28CC20";
    attribute INIT_34 of inst : label is "C10DDFCD0AD9CD040E2A06211054110DDFCD1171CD20062A0621C505060E43C2";
    attribute INIT_35 of inst : label is "E5C32A3E234E2AC90EA9C20DC109016001C51183CD05060B0E0E43C30E85C205";
    attribute INIT_36 of inst : label is "03CA11FE7D234E2A0EC1CD0DE4CDC90EC9C2050EC9C20D0AE5C31B3E234E2A0A";
    attribute INIT_37 of inst : label is "234E22360D210EC1CD0EFDC30EF7D235FE7C24240F17CA33FE7C0F0CCA0FFE0F";
    attribute INIT_38 of inst : label is "C3270F210EECC334260EFDC324240F22D23BFE7C0F12C30F1CD23BFE7C0EB9C3";
    attribute INIT_39 of inst : label is "DA28FE7C0F5DCA0FFE0F4CCA11FE7D234E2A0EC1CD0DE4CD0EFDC3270D210EFD";
    attribute INIT_3A of inst : label is "28FE7C0EFDC32711210EFDC325250F57DA28FE7C0F52C333260F52C234FE0F66";
    attribute INIT_3B of inst : label is "1000D20AFE234C3A0EC9CD20FF010EFDC33B11210EFDC33B0F210F52C30F6CDA";
    attribute INIT_3C of inst : label is "0E43C30FE5CD16C60FDECD0FAED232FE234F3A0FA6CA0FFE0FA0CA11FE234E3A";
    attribute INIT_3D of inst : label is "50222523502A0FD4CAA7234C3A101BD235FE0FE5C30BC60FDECD0FE5C30FDECD";
    attribute INIT_3E of inst : label is "4F3A0E43C320B23220B132AF1B366F85234C3A23402135234C210AE5CD1B3E23";
    attribute INIT_3F of inst : label is "0FD4C334234C212350220AE5CD23502A77F16F85234C3AF5234021C90F27D623";
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
