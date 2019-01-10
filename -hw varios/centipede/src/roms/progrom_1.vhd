-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity progrom_1 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of progrom_1 is

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
    attribute INIT_00 of inst : label is "00A938242085A938242088A92ED0BEF001A51A9501A90185F4A98EA68EE660C0";
    attribute INIT_01 of inst : label is "9191A800A938242080A9C7F0CA018689A62D602026A42005C98D05A98D05898D";
    attribute INIT_02 of inst : label is "F4458A169004C0A8387C209801A20710B985B9A400A9FFA22BD0072900A5BBF0";
    attribute INIT_03 of inst : label is "859B850CA910088D20A96000A91A951AA902F000A906901BC908301A75188EA6";
    attribute INIT_04 of inst : label is "CAA89505A2FB10CAB295100F8D00A906A29E859D8502A9838553858885FFA59C";
    attribute INIT_05 of inst : label is "21C720A385A285A085C0A9231F20100F8D03A9C885C86518100A4D100AADFB10";
    attribute INIT_06 of inst : label is "009D06009D05009D04009D8A00A2265A20AAC29500A988A614048D0FA920E820";
    attribute INIT_07 of inst : label is "8E8504090329100AAD8D858B05E029100AAD2DA28B861BA2D79588A6F1D0E807";
    attribute INIT_08 of inst : label is "3FA9D7F688A604D08DB108B00CC904B00E9014C906F0EFA61F298DA500A08F86";
    attribute INIT_09 of inst : label is "638580A94385F24510A9B810CA8FA68B851BA902B002C901E9388BA58D91EF45";
    attribute INIT_0A of inst : label is "0F2900A50BA26001F087A5604285F24511A97285F1450CA97385F04508A96285";
    attribute INIT_0B of inst : label is "64B501A03495F72901691834B509D0012900A52ACB4C031034B5B38507A904D0";
    attribute INIT_0C of inst : label is "44B402A914D00094D988A49873D0072964B5978402B010C934B50AB009C9F045";
    attribute INIT_0D of inst : label is "08C9387A2064F53863B50FF0402934B57495FEA9021074B402A94495FEA90210";
    attribute INIT_0E of inst : label is "B40BB010C90F302E1044B40EF074B40A90F0C954B53CD0202934B52A964C45B0";
    attribute INIT_0F of inst : label is "3495200934B50DB03CC9119038C910F02C2F202310201D3044B42AAA4C03D074";
    attribute INIT_10 of inst : label is "B030C968B06390C9C9F04508F0EFA41210D4F074B4F04564B5BB902C6F200590";
    attribute INIT_11 of inst : label is "293F300034B9C8A88A47F00BE03495DF2934B551D0402934B55EB009C962905D";
    attribute INIT_12 of inst : label is "349907290034B925B009C9F0450064B929D0402904300035B909F00BC03BF040";
    attribute INIT_13 of inst : label is "74B5C5900CC0C805F000749900A9006499F8290064B9004499387C200044B900";
    attribute INIT_14 of inst : label is "2C9A20549554751844B5649574F5382A944C74751806F0EFA464B57495387C20";
    attribute INIT_15 of inst : label is "04A97495387C200330000916D074B44495387C2044B521D004C9072964B52F90";
    attribute INIT_16 of inst : label is "8573A5F9D0AF2943A560011086A56029664C0330CA5495547518FCA9021044B4";
    attribute INIT_17 of inst : label is "F4C98A11D02C2F2073A500A08B85AA63659884858465324F20B984B9A5FEA48D";
    attribute INIT_18 of inst : label is "387C20BB84BBA500A060011086A4638563A502D00BA906B00BC90AD0F4A90490";
    attribute INIT_19 of inst : label is "C914B0F1C91C9008C98A25D02C2F2000A08B8463A4AA73659885858565324F20";
    attribute INIT_1A of inst : label is "A4738573A502D008A906D0F0A90AD030A90E9031C912D0C8A916B0C8C9089080";
    attribute INIT_1B of inst : label is "4504A90DB005C9387A2007908DE53805900EB08DE53807F0EFA672A560011086";
    attribute INIT_1C of inst : label is "9014C906F0EFA61F2932A560428528A904F0AF2943A5628563A57285736518F0";
    attribute INIT_1D of inst : label is "0AF0EFA620F01FC924F01F2932A52AD032B100A060D7D688A604B00CC904B00A";
    attribute INIT_1E of inst : label is "F097A5603291EF453FA9D7F688A604B00CC90EF001C908B00E9014C918F01EC9";
    attribute INIT_1F of inst : label is "40A900349900A960F8108804300034B90BA088A660A0C603F0A0A549D087A54D";
    attribute INIT_20 of inst : label is "0229100AADA085A19508E9049060C9A1B500749902A9005499FCA9006499F045";
    attribute INIT_21 of inst : label is "65180A0A0A98338501A9328500694A4A4A6094F6004499FEA900549904A907D0";
    attribute INIT_22 of inst : label is "0490C0C908D007C033A4320533260A33260AF82900A902B08BE538F7A98B858B";
    attribute INIT_23 of inst : label is "34B917D064D50064B90CA08CE68C868B8660EF4502F032B100A03285A0091F29";
    attribute INIT_24 of inst : label is "2063E53854B56018DF108804B0F4C944550054F93854B50CF08BC410B0F4C900";
    attribute INIT_25 of inst : label is "8D6518EDB007C9387A2073E53864B58D85FBB007C96005900AC905D00DE0387A";
    attribute INIT_26 of inst : label is "B78513A9043086A5428528A93495FFA9438520A9878530A9E2B00CC92AF00DE0";
    attribute INIT_27 of inst : label is "A510D0B7A514D0072900A500A02CC64C0EC96018B885B585B485B385B28500A9";
    attribute INIT_28 of inst : label is "EF453FA93CB03FC9409038C93F29DAB160DB840390C0C9DAA509D007C90CF0DB";
    attribute INIT_29 of inst : label is "6F858B260A8B260A8B260ADAA58B85DBA53F85FFA92DBA2005A98B8500A9DA91";
    attribute INIT_2A of inst : label is "B0D0DBE6A3D0DAE660B28513A9DBE602D0DAE65F8503E90A0A0A1F491F298BA5";
    attribute INIT_2B of inst : label is "389E200003B98DA4389E20388D840004B9928505A991865CA200A038242007A9";
    attribute INIT_2C of inst : label is "82208DA48DE63882208DA48DE63882208DA438852000A9389E20180002B98DA4";
    attribute INIT_2D of inst : label is "8D865D3086A48DA694D688A68D86C960B99018C0C88DA4CAAA40091F2991A538";
    attribute INIT_2E of inst : label is "88A6D8AB95016918ABB5A19502E9A1B50D90A9958B65A9B5A795A7751888A6F8";
    attribute INIT_2F of inst : label is "1C290801ADD8AF95AF7521C0B9AD95AD7518F821B3202F90AFF5ABB5ADD5A9B5";
    attribute INIT_30 of inst : label is "EF4540A5608DA626BC20B68511A9A4F6FEB00BF006C9A4B511F0AB05ADA506F0";
    attribute INIT_31 of inst : label is "0BC99AB588A62ED64C03F000A50490F8C9F04570A55DB030C92EA54C039034C9";
    attribute INIT_32 of inst : label is "0BF00329100AAD129002C9ABB54085EF4530A9B88514A9EED00329100AADF5B0";
    attribute INIT_33 of inst : label is "29100AAD8085608500A95085FFA90210100A2C01A909D0FEA90D10100A2C02A9";
    attribute INIT_34 of inst : label is "8560855065182E9D4C50E53806F0EFA460A51DD0AF2943A57085F04570691878";
    attribute INIT_35 of inst : label is "85EF453009032901691840A50DD0032900A520E84C2BB0FAC9EF4506F00BD08B";
    attribute INIT_36 of inst : label is "07691805F0EFA472A5603291EF45FB2906903CC90AB040C92C2F2070A500A040";
    attribute INIT_37 of inst : label is "0AAD031086A60C01AD18D0AF2943A525D072C5736518F04504A975B0F3C9FF49";
    attribute INIT_38 of inst : label is "72A4F44507A98B8562A5B4850BA9305A4C03F0042904D009F0082906D0C0C010";
    attribute INIT_39 of inst : label is "F03BC901E9209038C93F2929F02C2F2000A08D6518F34501A98D847285726518";
    attribute INIT_3A of inst : label is "0DA230574C2B952003D03291EF45EFA500A02DBA2001A98B8500A90DD037C904";
    attribute INIT_3B of inst : label is "E0A8387A2072E538F0455DB0F8C9F04564B565B0F8C96990B9C9089076C934B5";
    attribute INIT_3C of inst : label is "3854B536B005C004903CB007C0069004C9F04580A50EB020C9EF4534B516D00C";
    attribute INIT_3D of inst : label is "80C504A902A019B006C010B020C9EF4534B560900CE025F00DE0A8387A2062E5";
    attribute INIT_3E of inst : label is "E53871A503A0D784B6A030424C03900AC030484C10A009B00AC095D080850AF0";
    attribute INIT_3F of inst : label is "F0A9B58500A9A1859F8580A906A0D7E6049016C909A0D7E60CB040C9387A2073";
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
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
