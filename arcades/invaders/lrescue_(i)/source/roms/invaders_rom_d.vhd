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
    attribute INIT_00 of inst : label is "2396A83E201D21204832FD3E4027D290FE201E3A204032013E1036C035403DC3";
    attribute INIT_01 of inst : label is "20403A4260C3FD3E204A3290D686201E3A201D21204832023E4038C3204A3286";
    attribute INIT_02 of inst : label is "7E20442140EACD4091C2A77E230236407CC2352042214003C3204121404AC2A7";
    attribute INIT_03 of inst : label is "7E2043214936407CC255FE7E23407CC30136204421407CC24DFE7E234073C2A7";
    attribute INIT_04 of inst : label is "8AC225FE7D20452219FFFC1120452AC94103CD40BACD051CCD204721408AC2A7";
    attribute INIT_05 of inst : label is "46234E20452AC9D03623C0362049212536230036230036204321003620402140";
    attribute INIT_06 of inst : label is "A720433A40E6C202FE20423A40DCC3204232013E40D4CAA720443A2356235E23";
    attribute INIT_07 of inst : label is "204321D02AFE40FDD2E0FE204A3A40FDDA48FE20493AC920492A20452240E6C2";
    attribute INIT_08 of inst : label is "C109002001E17703DB04D3AF4108C20D13237703DB04D31AE5C50A2CCDC90136";
    attribute INIT_09 of inst : label is "7F0E0141740B01416A0A0141620801415A08014155050141550501C94106C205";
    attribute INIT_0A of inst : label is "00040400000000000000004225180241F5180241CD170241AD1202418D100241";
    attribute INIT_0B of inst : label is "000000000E1E1E1E0C000000000000081C1C080000000000000C0C0000000000";
    attribute INIT_0C of inst : label is "3E007E00FF00FF007E003C008D000000000000000000200C1C3E3F3E1C4C0000";
    attribute INIT_0D of inst : label is "FE01FF03FE01FC007C05790435000000000000000000000000000100C0000C00";
    attribute INIT_0E of inst : label is "FF07FF0FEC07FE03FC08F80862000000000000000000000000043A00FC04FE01";
    attribute INIT_0F of inst : label is "E804C8201200000000000000000000040402A808F201F803FD07FD0FBC07BE0F";
    attribute INIT_10 of inst : label is "000020012824B217FC05FC0FE80FFC17F80EFE17FF277A0F7807FC0FFC03F403";
    attribute INIT_11 of inst : label is "FD0FFE07FE1FFC0EED2EFE07FE0FFC07FC30FB01E10000000000000000000000";
    attribute INIT_12 of inst : label is "FFFFFFFFFFFFFFFFFFFFFF0000000000000000108113F403F807FC0FBC1FF80F";
    attribute INIT_13 of inst : label is "0000C9C930360000C9D03600404AC3427ADC30FE4275D4D0FE7E204A21204732";
    attribute INIT_14 of inst : label is "2ACD150E44101128192105D5CD4042CFC31A05D5CD103E4296C34632CD0ABDCD";
    attribute INIT_15 of inst : label is "16214686CD05D5CD403E4322CD013E4315CD070E2B90214369CD05D5CD503E05";
    attribute INIT_16 of inst : label is "C305D5CD053E1343A4CDD10536CDD53FE642E2CA5BFE42E8CAFFFE1A4515112E";
    attribute INIT_17 of inst : label is "0D0A00CD45331110062B9021070E05D5CD503E4322CD013E4289C32F142142C4";
    attribute INIT_18 of inst : label is "15C20D0A00CD100644B511C905D5CD603E0C1BCD10020145431131102142F7C2";
    attribute INIT_19 of inst : label is "3DF10A00CD100644E511339021F5C83DF10C1BCD10020144C511311021F5C943";
    attribute INIT_1A of inst : label is "1BFEF14315CD010E2D2D31264358C23DFE7CF5C83DF10A00CD100644F511F5C8";
    attribute INIT_1B of inst : label is "0E8036E500062E122170160C1BCD0804012D1321446D11434AC3F51B3E4365DA";
    attribute INIT_1C of inst : label is "080632122144AD110C1BCD0804013C1321448D11437CC21509200EE101360905";
    attribute INIT_1D of inst : label is "E1D10A00CD0806319021450D1143B6C345051143B3CA80E61AD5E5C5C90A00CD";
    attribute INIT_1E of inst : label is "442511301521090E05D5CD103E46A0CD4369CD4322CD043E4632CD0B34CDC9C1";
    attribute INIT_1F of inst : label is "281130152105D5CD603E4322CD013E43E0C20D05D5CD053E0A00CD43A4CD0806";
    attribute INIT_20 of inst : label is "14021204111B1B11000D140B1B29292918000B0FC905D5CD403E052ACD090E45";
    attribute INIT_21 of inst : label is "3844380092442892284492000010107E101000008052387E3852802929291B04";
    attribute INIT_22 of inst : label is "521800000018527E521800000000000000000000FE1038543810FE0038443810";
    attribute INIT_23 of inst : label is "0000024000000220000004100000080FFFFFF0000018527E521800000018527E";
    attribute INIT_24 of inst : label is "0000044000000240000002800000018000000180000001800000018000000140";
    attribute INIT_25 of inst : label is "000000307ADDF4F4DD7A30F00804324D83808003FFFFC00C0000301000000820";
    attribute INIT_26 of inst : label is "E70FFF0F790F781F6C1FEC1FEC1F6C0F780F790FFF03E703E603E00000000000";
    attribute INIT_27 of inst : label is "000000193A6DFAFA6D3A1900000000000E18BE6D3D3C3D6DBE180E03E003E603";
    attribute INIT_28 of inst : label is "04920D885B049200840B8F797878F8F8787870797C6EE6E66E7C790000000000";
    attribute INIT_29 of inst : label is "0000000C3460F8E5B7FEEC7C38FF1B3030301B1307060805FF8D088E021B1391";
    attribute INIT_2A of inst : label is "FC1FC43FC07FE03BF019983CC81FFD0FBF1F9F1FCC0FFC05FC00B80010000000";
    attribute INIT_2B of inst : label is "198E112918210C1BCD130101197B1125182105D5CD303E4632CD0ABDCD00380D";
    attribute INIT_2C of inst : label is "0F210C1BCD100101183911270C210C1BCD13010119A1112515210C1BCD130101";
    attribute INIT_2D of inst : label is "CD1A3E2C26182E4686CD0C1BCD2801011869112512210C1BCD20010118491126";
    attribute INIT_2E of inst : label is "15FE4602C3461C1145DEC218FE7D030E45BDDA33FE6784013E05D5CD0A3E0536";
    attribute INIT_2F of inst : label is "114602C346251145FFC20FFE4602C346221145F4C212FE4602C3461F1145E9C2";
    attribute INIT_30 of inst : label is "1B1C1F1BC905D5C3603E45BBC209FE6F03D67D052ACD462B11070E052ACD4628";
    attribute INIT_31 of inst : label is "D10536CD3C1AD54669113B26072E12130D080E0F1B1C211D1C1C1D1C211B1C21";
    attribute INIT_32 of inst : label is "072E29264639C22FFE7C4639C33326092E4639C22AFE7C4656CA09FE7D252513";
    attribute INIT_33 of inst : label is "423C1C24222412FF07120D1A010D100E0D10FF12070D0CC90A00CD0806467E11";
    attribute INIT_34 of inst : label is "C920ED32AFC07FD67EC044D60AC040D61A2E27112C47012B47213C4281A5A599";
    attribute INIT_35 of inst : label is "CBCD4563CD0000004280CDC920EDC90362C23FFE861986197E020011472E2B26";
    attribute INIT_36 of inst : label is "A9CD02F2CD013621BF210279CD0261CD1F78CD01CACD0ABDCD02D4CD02DFCD05";
    attribute INIT_37 of inst : label is "0046F2C3472FDA06D370FE202E3A46EAC206D301FE7E2346E1CAA77E20272101";
    attribute INIT_38 of inst : label is "000885CD0000004B76CD20C63220E33A0ABDCD05CBCDC920E33220C63A0AB7CD";
    attribute INIT_39 of inst : label is "C4140001FEFE202C3A202D2A00362029210060C30EAAC2A721BF3A0657C30000";
    attribute INIT_3A of inst : label is "47A1C2A77E20142106D3000000000047ECCD01362013210D6DCD201D22090185";
    attribute INIT_3B of inst : label is "0D58D4B0FE201D3A027FDCB0FE201D3A06D30C77CD4792C2A77E205D2147D8CD";
    attribute INIT_3C of inst : label is "73C305CBCD02D4CD02DFCD0329CD474EC3487BCD4C05CD06D30D9DCCA720163A";
    attribute INIT_3D of inst : label is "36C8A77EB02E1722CD0598CD4760C320102209AC214792C2A720AE3A0467CD16";
    attribute INIT_3E of inst : label is "C054FE76E6037CCD0598C34DB9CD43C2CD0598C34A3BCD47CFCC03FE7EAB2E00";
    attribute INIT_3F of inst : label is "000000000000000000C90136200021C8A720163AC903362B2BC8A77E2026ED2E";
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
