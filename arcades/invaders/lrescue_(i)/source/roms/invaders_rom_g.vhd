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
    attribute INIT_00 of inst : label is "1B3E20DF222520DF2A0831CAA720DB3A0878D235FE0623C30BC6083BCD0623C3";
    attribute INIT_01 of inst : label is "27D620DE3A06A0C300000000061CCD1B366F8520DB3A20CF213520DB210536CD";
    attribute INIT_02 of inst : label is "20DD3A061CC33420DB2120DF220536CD20DF2A77F16F8520DB3AF520CF21C90F";
    attribute INIT_03 of inst : label is "CD0920CD20DC32AF0810C30878D236FE0878C30870D232FE20EE3A0878C20DFE";
    attribute INIT_04 of inst : label is "0E02122B0807052AC34F20DB3A20CF1120CD2A09EBC32D1E2150060598C3088D";
    attribute INIT_05 of inst : label is "2F2F2F2F2F2F2F2F2F2E1B040C000D0D0E081300111312080604111B1B110411";
    attribute INIT_06 of inst : label is "AF2058320000000030072711010000001B1B1B1B1B1B1B1B1B1B000000002E2F";
    attribute INIT_07 of inst : label is "000000000000000362C34792CAA720EF3A0A44C320C63AC8A720EF3AC921BF32";
    attribute INIT_08 of inst : label is "C97C292929296F66237E058CCD056FC3E1D10536CD1C3E19040011D5E5000000";
    attribute INIT_09 of inst : label is "320A3E20CD222D1E21C920CD221E2E672DC61F3F37900A3E470937CAA720DB3A";
    attribute INIT_0A of inst : label is "1115151F000000000000000000000A15151F001E01011E000916141F00C920DB";
    attribute INIT_0B of inst : label is "2A0F38C30A41CD0F38C2A720183A097FCAA720EF3A000E11111F001F04081F00";
    attribute INIT_0C of inst : label is "1C32AF0FCBDA0F0FAADA0F7E2010222309A4D4B5FE7D0991C203E609C0CD2010";
    attribute INIT_0D of inst : label is "00000000000000000000020202020202020001010102000000C9A62E0F48C320";
    attribute INIT_0E of inst : label is "2001E177AE03DB04D3AF132377AE03DB04D31AE5C50A2CCDC92012323C20123A";
    attribute INIT_0F of inst : label is "0A2CCDC909EBC205C109002001E123772377AFE5C50A2CCDC909CBC205C10900";
    attribute INIT_10 of inst : label is "03DB04D3AF13237703DB04D31AE5C50A2CCDC90A00C205C10900200113771AC5";
    attribute INIT_11 of inst : label is "0A35C205C10900200177C5AF0B1FC302D307E67DC90A11C205C109002001E177";
    attribute INIT_12 of inst : label is "05C10598CDC50406240031C0A720593AC804E602DBC901DBD002DB0F0377C3C9";
    attribute INIT_13 of inst : label is "0E00004C0BC305CBCD05B3CD040E3016211C5711FB01A4CD205932013E0A5AC2";
    attribute INIT_14 of inst : label is "03C36F66237E2356235E0A96C320FC210A96C320F821052AC30B7F11241E211C";
    attribute INIT_15 of inst : label is "0B34CD0A96C320F4210536C31CC63C012120EB3A052AC31D5411350121070E09";
    attribute INIT_16 of inst : label is "A880E61A4620BE210AACC30AA1CD088DCD0920CD0AB7CD0A90CD0A8ACD0A7FCD";
    attribute INIT_17 of inst : label is "0B0C0D0E101315181C22272E3401020304050607080A0D11161C242B32C937C0";
    attribute INIT_18 of inst : label is "C5C9D1EB56235ED5E146234E2356235E2323E5C90B04C2051323771AFF050709";
    attribute INIT_19 of inst : label is "0B37C240FE7C230036240021C9C16720F63FE67C0B22C2056F1F7D671F7C0306";
    attribute INIT_1A of inst : label is "0418000B0F1E1B110E1B1D271B26110418000B0F1B1B1104150E1B040C0006C9";
    attribute INIT_1B of inst : label is "1B1B0D0E131314011B1B110418000B0F1D1B180B0D0E1B0D0E131314011B1211";
    attribute INIT_1C of inst : label is "C8A71C5B111B1E2B04110E02121B1B1B1B1B1B1B1B1B1B1B1B1D2B04110E0212";
    attribute INIT_1D of inst : label is "2377A62F03DB04D31AE5C50A2CCDC9E1C1EB190BA5C23D09000501C5000021E5";
    attribute INIT_1E of inst : label is "2CCDC90BB5C205C109002001E177A62F03DB04D3AF132377A62F03DB04D31A13";
    attribute INIT_1F of inst : label is "03DB04D3AF0BE3C20D132377AE03DB205032013E0BF1CAA603DB04D31AE5C50A";
    attribute INIT_20 of inst : label is "23771AE5C50A2CCDC90BE1C205C109002001E177AE03DB205032013E0C09CAA6";
    attribute INIT_21 of inst : label is "002001E10C35C20D2377AFE5C50A2CCDC90C1BC205C109002001E10C1DC20D13";
    attribute INIT_22 of inst : label is "2F03DB04D31AE5C50A2CCDC90C4AC2050C4AC20D06D3100001C90C33C205C109";
    attribute INIT_23 of inst : label is "210036C8A77E200C21C90C58C205C109002001E177A62F03DB04D3AF132377A6";
    attribute INIT_24 of inst : label is "0C8FC20D45CD0CD2D20D3DCD0C9ACAA77E080E205622722E1722CD2000220000";
    attribute INIT_25 of inst : label is "062A0000000CAAC20D45CD0CC9D20D3DCD0CB5CAA77E040E4CE7CD922E1722CD";
    attribute INIT_26 of inst : label is "BE2320073A0C9AC30CDBDA0D50CD0CB5C30CDBDA0D50CD001F21C309FAF80120";
    attribute INIT_27 of inst : label is "06491ECDE50D37CD001E4EC30CB5C3000CF4DAB8F14786183EF50CB5C30CE6D2";
    attribute INIT_28 of inst : label is "18066F08D67DE5E1001EE5C31DE1CD09FDCD1306E5E11DE1CD09FDCD19B71113";
    attribute INIT_29 of inst : label is "063A23C9EB56235E2300000000000000000000004F00C31779CD1806E11779CD";
    attribute INIT_2A of inst : label is "C8A720163A000000C9B8F14786083EF5C90D20562223232320562AC9BE08C620";
    attribute INIT_2B of inst : label is "2CCD1206090D99C4110001202D2AFEFE202C3A00362029210136C0A77E202521";
    attribute INIT_2C of inst : label is "209C21C90D0001C90D4F80C30D81C205C109002001481EC3000077AE013EC50A";
    attribute INIT_2D of inst : label is "C90DB3C20D2323230DC0C4A77E23C8A77E4E2D2E1722CD0279C41A0B1110E67E";
    attribute INIT_2E of inst : label is "0DF5D2D4FE0DF5DA3CFE7C201D2AC9E1C1D109FDCD0806D5D10D38CDD523C5E5";
    attribute INIT_2F of inst : label is "04D244FE7CC9013620AE210E76DA30FE0E4CDA28FE0DFBDA20FE0DF5DA1BFE7D";
    attribute INIT_30 of inst : label is "D4FE0DF5C30E1ED2C4FE0E47DA94FE0DF5C30E11D284FE0E42DA56FE0DF5C30E";
    attribute INIT_31 of inst : label is "0000000000209D3278209E220D37CD232300361722CD001E2FC30DF5C30E26DA";
    attribute INIT_32 of inst : label is "C30E62D27DFE0E71DA59FE0DF5C30E55D23CFE7C1E31C3052E1E31C3002EC900";
    attribute INIT_33 of inst : label is "FE0DF5C30E7FD273FE7C0E6CC30F2E1E3EC33006142E0DF5C30E6ADA96FE0DF5";
    attribute INIT_34 of inst : label is "A720E93A0EBFC4A77E20502134209C2120BE32AF1E45C3192E0DF5C30E87DA9C";
    attribute INIT_35 of inst : label is "360060C34FB6CD4CF0CD119ACC01FE7E20532112DDCD4725CAA720EF3A0060C2";
    attribute INIT_36 of inst : label is "0ECFD2D4FE0ECFDA3CFE7CC90136205D210ED5DA30FE1F0CD2B8FE7D201D2A00";
    attribute INIT_37 of inst : label is "3ACD49ABCD10C5C4A720A03A0F04CD12DDCD7703E67E34205321C90136201421";
    attribute INIT_38 of inst : label is "C8A720133AC914C2CA03FE135CCA02FE119ACA01FE0F1BCAA720533A0060C34E";
    attribute INIT_39 of inst : label is "070FAADA070760E6096BC30F48CAA720163A0F35DABAFE201D3A4C36CD12ACCD";
    attribute INIT_3A of inst : label is "1D3A0F8BC41012CD0F69C31053CD0F58CAA720163A0F9ACD0036201C210FCBDA";
    attribute INIT_3B of inst : label is "C3C1D1201D2A051CCD201B210BB2CDD5C50B0DCD201D210FE7CD0F82DA40FE20";
    attribute INIT_3C of inst : label is "1B21A720163AC9FF36C00036232301E67E344CCBC30F69C30FEDCD4982CD0BDE";
    attribute INIT_3D of inst : label is "48C302361D96C2A720163A0FC6D2E0FE201C21201E3AC90136C9FE360FA7C220";
    attribute INIT_3E of inst : label is "C3FE360FE2C2A720163A0FC6DA30FE201C21201E3A0F48C300360F48C303360F";
    attribute INIT_3F of inst : label is "01E67E34201A211048CD4EEDC3102BDA1034CD1018CA1012CD0F48C3FD360F48";
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
