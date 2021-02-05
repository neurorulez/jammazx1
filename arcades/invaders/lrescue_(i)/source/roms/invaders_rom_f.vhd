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
    attribute INIT_00 of inst : label is "4967C3A77E201721C910E60A41CDC918271109C8C3050620232A100ECC182C11";
    attribute INIT_01 of inst : label is "73CD01361041C2A77E2017210FF6C30FFDCD201A210C55C3182C11050620232A";
    attribute INIT_02 of inst : label is "00001048CD105EC2A77E201721C92023220903F801201D2AC930FE7D20232A4F";
    attribute INIT_03 of inst : label is "36201B21E51095CA1012CD20982100000000000000001048CD1020CD00000000";
    attribute INIT_04 of inst : label is "ABC2201B2101E67E3423E5009800000000000000000000000000000FFCC3E102";
    attribute INIT_05 of inst : label is "20A72210C1C4A719FB217EAD2E1722CD10A3C300361000C304E67E34E1013610";
    attribute INIT_06 of inst : label is "A77EAD2E1722CD10FBCD10FBCD10B0CD1D8BCD10D6C2A77E20A221C91A0321C9";
    attribute INIT_07 of inst : label is "0DCD20A521051CCD20A321110BDABE20A63A201E211104DC19FE20A53A1129C2";
    attribute INIT_08 of inst : label is "002110F5C3111ED2BE20A53A201D2120A322000121C920A322FF002109C8C30B";
    attribute INIT_09 of inst : label is "0021013610F5C3113CDA19FE20A53A113CC2A77E20AD21C920A232AF20A02200";
    attribute INIT_0A of inst : label is "64D2BE20A53A201D2120A32200012110F5C31151D2BE20A63A201E2120A32201";
    attribute INIT_0B of inst : label is "37CD00361232CD232B2B2BE54E2D2E1722CD111EC30036AD2E1722CD10F5C311";
    attribute INIT_0C of inst : label is "17CCA720163AC90136AD2EC91195DA03FE7E35C8A77EE109E8CD080620A5220D";
    attribute INIT_0D of inst : label is "208A2A01361200C2A77E23C8A77E20882100000048EBCD1246C4A77E20292116";
    attribute INIT_0E of inst : label is "2E1722CD208A2223208A2A11EDC2123BCD722E1722CD208A221221D437FE7D4E";
    attribute INIT_0F of inst : label is "208E22090900010D37CDE1208A2223208A2AE51E6FC3000021122CC204FE7E8C";
    attribute INIT_10 of inst : label is "C8C30B0DCD208E21051CCD208C211224DA40FE7E208E210C55CD0B0DCD208E21";
    attribute INIT_11 of inst : label is "1243CAA779C91235C20D19000311C900362089211779CD0306208E2AC9272E09";
    attribute INIT_12 of inst : label is "C8FE129CDC28FE202E3A0C18CD0B0DCD202D21D80AD8CD202E11C9A77E1232CD";
    attribute INIT_13 of inst : label is "17F71109100001202D2AC90136202721051CCD202B211276CCA720163A12A2D4";
    attribute INIT_14 of inst : label is "36202C21C91286C205C109002001E11288C20D132377B61AE5C50A2CCD100201";
    attribute INIT_15 of inst : label is "200D2112CCC21012CDD0B8FE201D3AC8A720163AC934202821FE36202C21C902";
    attribute INIT_16 of inst : label is "200021C9013620002100362B0036C8A77E200E21C9013623C9013612C8C2A77E";
    attribute INIT_17 of inst : label is "CD200621D00AD8CD20071120062209050801201D2A013612F5C2A77E23C8A77E";
    attribute INIT_18 of inst : label is "DB04D31AE5C50A2CCD1D90CD051CCD200421134DD2B8FE7E2006211757CD0B0D";
    attribute INIT_19 of inst : label is "03DB200C32013E133ECAA603DB04D3AF132377AE03DB200C32013E132ACAA603";
    attribute INIT_1A of inst : label is "A720163AC92000220000211779CD030620062AC9131AC205C109002001E177AE";
    attribute INIT_1B of inst : label is "F5F113BDCA80E6F57EE5C51F27C3C8A77E702E145DC2A77E402E1722CD1633CC";
    attribute INIT_1C of inst : label is "2038220D37CD20342A0000000000000000F1203A221449DC197B212034220707";
    attribute INIT_1D of inst : label is "23E1F1F5EB20382A051CCD203621144DD4E0FE7E20392109FDCD0B0DCD203821";
    attribute INIT_1E of inst : label is "5AD456FE7D4E20722A0136141AC2A77E23C8A77E2070211375C20DC123722373";
    attribute INIT_1F of inst : label is "43C204FE7E8A2E1722CD2072222320722A1407C2123BCD7E2E1722CD20722214";
    attribute INIT_20 of inst : label is "0B0DCD207621207622090900010D37CDE12072222320722AE51E73C300002114";
    attribute INIT_21 of inst : label is "030620762A09C8C30B0DCD207621051CCD207421143BDA40FE7E2076210C55CD";
    attribute INIT_22 of inst : label is "14A5CDC9472EC92836E109E8CD130620382AE5C9198E21C900362071211779CD";
    attribute INIT_23 of inst : label is "682109FDCD1D9BCD2067220D38CDE5C5234E412E1722CD20692218F721206522";
    attribute INIT_24 of inst : label is "E8CD0B0620672AE5C91470C21DA1C3EB20672A051CCD2065211498D4EAFE7E20";
    attribute INIT_25 of inst : label is "002372237300C91E7BC3C801002101FEC8010021A77EAB2E1722CDC92836E109";
    attribute INIT_26 of inst : label is "212036221559CDE5C8A77E902E15B7C2A77E562E1722CD163FCCA720163AC900";
    attribute INIT_27 of inst : label is "2109FDCD0B0DCD2038212038220D37CD1512CAA77EE5C5234E23E1203A2219A1";
    attribute INIT_28 of inst : label is "7E23C8A77E207C2114E9C21DB3C3EB20382A051CCD203621156EDC28FE7E2039";
    attribute INIT_29 of inst : label is "7E2A1589C2123BCD922E1722CD207E221556D447FE7D4E207E2A01361597C2A7";
    attribute INIT_2A of inst : label is "A77EAB2E1722CDC9372E1E77C30000211583C204FE7E8B2E1722CD207E222320";
    attribute INIT_2B of inst : label is "030620822AC9E036E109E8CD130620382AE5C91F62C3C8FE002101FEC8FF0021";
    attribute INIT_2C of inst : label is "0C55CD0B0DCD208221208222090900011DBEC3207E2AE5C90036207D211779CD";
    attribute INIT_2D of inst : label is "1939212065221602CD09C8C30B0DCD208221051CCD208021157BDA40FE20823A";
    attribute INIT_2E of inst : label is "FE7E20682109FDCD0B0DCD2067212067220D38CDE5C5234E572E1722CD206922";
    attribute INIT_2F of inst : label is "36E109E8CD0B0620672AE5C915CAC21DAAC3EB20672A051CCD20652115F5DC28";
    attribute INIT_30 of inst : label is "209421E5050E271121C91E91C3C8FE002101FEC8FF0021A77EAB2E1722CDC9ED";
    attribute INIT_31 of inst : label is "211620C3209521E5010E3B0F210A34C3E10A00C319DF11E1162FC20306A17E34";
    attribute INIT_32 of inst : label is "00210B04CD00061AA31120002104D303D3AF2400311620C3209621E5040E3608";
    attribute INIT_33 of inst : label is "FB0000000001A9CD05D303D3AF0B04CDC006D12200210B04CDD5C0061BA31121";
    attribute INIT_34 of inst : label is "E5C5234E412E1722CD060620612219392100000020632218F72105CBCD46B5C3";
    attribute INIT_35 of inst : label is "1722CD0C47CDC520632219000B1120632A169EC21DCBC320632A2067220D38CD";
    attribute INIT_36 of inst : label is "C120612219000B1120612A16C4C21DD6C320612A2067220D38CDE5C5234E572E";
    attribute INIT_37 of inst : label is "CD3416FFD20BFE7E572E3416F6D20AFE7E412E1722CD1EF1CD4FD6CD1697C205";
    attribute INIT_38 of inst : label is "0000000009FDC30B0620672AEB0A34C303063B0F21170ECD360821170ECD1DF6";
    attribute INIT_39 of inst : label is "00030201000302010003020100030201000302010003020100C96720C63A0000";
    attribute INIT_3A of inst : label is "DB04D31AE5C50A2CCD0302010003020100030201000302010003020101030201";
    attribute INIT_3B of inst : label is "D3AFE5C50A2CCDC9175AC205C109002001E177A62F03DB04D3AF132377A62F03";
    attribute INIT_3C of inst : label is "E003C0018000000000C9177CC205C109002001E17703DB04D3AF00237703DB04";
    attribute INIT_3D of inst : label is "017001380118011C010FFF0FFF5DFF5DFE5FFC7FFC5DF85DF84FF04FF047E047";
    attribute INIT_3E of inst : label is "FC5DFE5DFF0FFF0FFF1C0138013001700170017001F001F001F001F001700170";
    attribute INIT_3F of inst : label is "E2039E01020000000000000000018003C047E047E04FF04FF05DF85DF87FFC5F";
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
