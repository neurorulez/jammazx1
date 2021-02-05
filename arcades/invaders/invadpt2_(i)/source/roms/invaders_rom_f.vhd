-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_F is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_F is

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
    attribute INIT_00 of inst : label is "CD234D32AF0FB3C3101BD236FE101BC31013D232FE234F3A101BC20DFE234E3A";
    attribute INIT_01 of inst : label is "2B08070AD9C34F234C3A234011233E2A1171C32D1E2150060BA3C31030CD1097";
    attribute INIT_02 of inst : label is "2F2F2F2F2F2F2E1B040C000D0D0E081300111312080604111B1B1104110E0212";
    attribute INIT_03 of inst : label is "19040011D5E500000030072711FF0000001B1B1B1B1B1B1B1B1B1B302F2F2F2F";
    attribute INIT_04 of inst : label is "3E4710AECAA7234C3AC97C292929296F66237E0B97CD0B7AC3E1D10AE5CD1C3E";
    attribute INIT_05 of inst : label is "E432AF4573CDC9234C320A3E233E222D1E21C9233E221E2E672DC61F3F37900A";
    attribute INIT_06 of inst : label is "C10DDACD1030CD1097CD1028CD0DDACD0AD9CD2D1E210A0E0D7911C50506FB20";
    attribute INIT_07 of inst : label is "110418000B0F1B1D291B1B2712110418000B0F1B1E1B110E1B1D26C910C4C205";
    attribute INIT_08 of inst : label is "021B1B131104120D08000000001B1B1B0E130800131B1B1B0D080E021B1D1B1B";
    attribute INIT_09 of inst : label is "0F1B1E29C917B2CD2340211109110E06FF113C2A0710F72A0A10E52A0D0D080E";
    attribute INIT_0A of inst : label is "DB04D3AF132377B603DB04D31AE5C511B9CD120D080E021B1E1B12110418000B";
    attribute INIT_0B of inst : label is "C205C109002001E123772377AFE5C511B9CDC91151C205C109002001E177B603";
    attribute INIT_0C of inst : label is "DB04D31AE5C511B9CD153FC3108ACDC91183C205C10900200113771AC5C91171";
    attribute INIT_0D of inst : label is "C7C302D307E67DC9119AC205C109002001E177A62F03DB04D3AF132377A62F03";
    attribute INIT_0E of inst : label is "1AE5C5206132AF11B9CDC911C1C205C109002001E111C3C20D2313127EE5C517";
    attribute INIT_0F of inst : label is "32013E1202CAA6F503DB04D3AF132377B6F1206132013E11EECAA6F503DB04D3";
    attribute INIT_10 of inst : label is "20253AC91211C205C10900200177C5AFC911DDC205C109002001E177B6F12061";
    attribute INIT_11 of inst : label is "20093A4706C612D0D2CEFE78C8A720023A1282D247D8FE20293AC002FEC805FE";
    attribute INIT_12 of inst : label is "0CFE7912C0CD67202A3A12B3CD12CADCBD50C620093A681282D2B81249D290FE";
    attribute INIT_13 of inst : label is "0332103E1396CD17BBCD12D8CD1282CAA77E1345CD202532053E2064221282D2";
    attribute INIT_14 of inst : label is "200232AF202532043E1330CD120620642AC035200321129CC3202532033EC920";
    attribute INIT_15 of inst : label is "C96F10DE054112A5CD6520093A12ABC30C10C6D0BC1354D4BC000E175CC3F706";
    attribute INIT_16 of inst : label is "0036050620DB327E1297C3208532013EC920AD32013EC96710DE12A5CD200A3A";
    attribute INIT_17 of inst : label is "64C31304CC07FE1307CC03FE1301CC01FEE110362323231C3623C236206221E5";
    attribute INIT_18 of inst : label is "3623E036206221073623C90306E1F11327D203FE07F9CDF5E5C90706C901060C";
    attribute INIT_19 of inst : label is "D11396CDD51C3111116ECAC2FE20623A1316C303060736E1F1C920362323231A";
    attribute INIT_1A of inst : label is "C2A7200D3AC91354FA10C60CC96720673A6F3D81808080070707781399C31006";
    attribute INIT_1B of inst : label is "89CD252421C9200732200E3A20083278200D32013EFE06D01389CD3EA421137B";
    attribute INIT_1C of inst : label is "DB04D31AE5C50011B9CDC9138BC205231451C2A77E1706136DC3AF16AFCDD013";
    attribute INIT_1D of inst : label is "13C1CAA77E37000113F7CDC9139AC205C109002001E17703DB04D3AF13237703";
    attribute INIT_1E of inst : label is "E7C2A77E16064677C2A77E13F7CD0136206B21C001FE2082327913BBC205230C";
    attribute INIT_1F of inst : label is "153AC96720673A002EC920AE32013E467EC4A77E052EC001FEC913DCC2052313";
    attribute INIT_20 of inst : label is "CD142EC2A7202D3A1438CAA720EF3AC0A720253AC0B046237E201021C0FFFE20";
    attribute INIT_21 of inst : label is "20ED2A0136202521C9202D32C010E615E8CDC9202D32202532013EC810E615E8";
    attribute INIT_22 of inst : label is "230B97CD003616CECD180BCDAFC937C9201D327E20ED22BF2E1449DACAFE7D23";
    attribute INIT_23 of inst : label is "B2CD1710CD127E2313127E1481D2BE1475C31481D21471CA1A2B1BBE1A20F511";
    attribute INIT_24 of inst : label is "1E0614A0DA0F20673A1D0625250C85CD140E18241128032114F2CAA720CE3A14";
    attribute INIT_25 of inst : label is "C221FE20673A013620E02114E4CD0336C314F2CAA77E16A5CD0C9DCD0AE5CD78";
    attribute INIT_26 of inst : label is "0600362BFF36E10DFACD00FDCD46E523C8A77E20E021C9203623C900362314C6";
    attribute INIT_27 of inst : label is "0CA2CD0C85CD0A0E1824112D182117B2C32340211065110A061028CD00FDC300";
    attribute INIT_28 of inst : label is "CD0406121DCD201532AFFB2400310D32C31752CD05D320EF32AF0BA3CD14CACD";
    attribute INIT_29 of inst : label is "117E230B97CD1731C3FB06180BCDAF177ACD2701211758CD151AC20C5ECD16B8";
    attribute INIT_2A of inst : label is "061564C2A720253AC920CF327E1548C20D13231553D2B81A47040E181F211CBA";
    attribute INIT_2B of inst : label is "7E209821C0352096211596CAA720683A1596CC35209B2116B8C30206175CC3FD";
    attribute INIT_2C of inst : label is "953AC905D330E620983AC9209B32043E01362B772B7E2B1596CAA720823A05D3";
    attribute INIT_2D of inst : label is "E67E2098212097321A15AEC3132315B7D2BE20823A17A11117912115D3CAA720";
    attribute INIT_2E of inst : label is "21EF06175CC3EF06C035209921209532AF77B0013E15CDC210FE070FE67E4730";
    attribute INIT_2F of inst : label is "C3C0A7209A3AC804E602DBC902DBC901DB15F2D20F20673AC905D377A07E2098";
    attribute INIT_30 of inst : label is "85CD040E3016211CBE11FB1758CD209A32013E1604C205C10BA3CDC504061A50";
    attribute INIT_31 of inst : label is "2116B8C30106C0A77E2307BACAA77E20842114F2C3209332209A32AF0C9DCD0C";
    attribute INIT_32 of inst : label is "C4011652C3166BCD165EDA167DCD1DAB01206C320B3E0AD9CD150E1ACB112812";
    attribute INIT_33 of inst : label is "FFFE0AC9C10C85CD4F206C3AC5C9C11183CD1006C51661C31673CDD8167DCD1D";
    attribute INIT_34 of inst : label is "32083E1716CD1130CD022CCD0006240031C9A703570A035F0A03670A036FC837";
    attribute INIT_35 of inst : label is "D3209432B020943AC904C03D20823A0206C923D00F20E72120673A0CD8C320CF";
    attribute INIT_36 of inst : label is "186211241E211C0EC923D80F20673A20E721135BC3121DCD01E1C3220021C903";
    attribute INIT_37 of inst : label is "11350121070E107AC36F66237E2356235E16EFC320FC2116EFC320F8210AD9C3";
    attribute INIT_38 of inst : label is "CD16E3CD16D8CD17DCCD16EFC320F4210AE5C31CC63C012120EB3A0AD9C31F42";
    attribute INIT_39 of inst : label is "F11512C3206D32013E1457C3175CCD1705C316FACD1030CD1097CD1710CD16E9";
    attribute INIT_3A of inst : label is "A020943A1754C3AFC920E932013EF1DBC8D0DBD6E3CAD6D9D7D6D9C8DBD0D6D5";
    attribute INIT_3B of inst : label is "7C1210CD1006176CC23D791183CD4F10061C8111177ACA270121C903D3209432";
    attribute INIT_3C of inst : label is "020304050607080A0D11161C242B32C937C0A880E61A46207221C9177AC235FE";
    attribute INIT_3D of inst : label is "7E2356235EC917B2C2051323771AFF0507090B0C0D0E101315181C22272E3401";
    attribute INIT_3E of inst : label is "36240021C9C16720F63FE67C17CAC2056F1F7D671F7C0306C5C96F6146234E23";
    attribute INIT_3F of inst : label is "CDC917E9C205C109002001E117EBC20D231377B61AE5C5C917DFC240FE7C2300";
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
