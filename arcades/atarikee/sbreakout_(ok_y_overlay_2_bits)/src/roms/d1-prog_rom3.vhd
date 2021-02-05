-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity prog_rom3 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prog_rom3 is

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
    attribute INIT_00 of inst : label is "B02AB504C9072910B500A059B00CC95D9006C90F2918B5F6F0012919B5603082";
    attribute INIT_01 of inst : label is "21E93838A5336920A8600998483A012068099009C90F2918B54802A03A0B2005";
    attribute INIT_02 of inst : label is "F01F2938B1A801096029983A842F9040C94330684ED01F2938B139C602B03885";
    attribute INIT_03 of inst : label is "80C92AB50E9004C9072910B50ED002C906A52DD01F2938B1A8200902293AA531";
    attribute INIT_04 of inst : label is "8069182AB568602A953A01202AB5F0B0F99080C92AB5602A953A0B202AB507B0";
    attribute INIT_05 of inst : label is "2040092A2A0A09F0C0290831AD10B004C90EA516F0402900A51BD003A5602A95";
    attribute INIT_06 of inst : label is "85B0A939853BA538853AA537492040A918F0221527B506A6374920C1A9603749";
    attribute INIT_07 of inst : label is "493A14203E86482AB538852BB55A3019B562F005A504A26035F220E8E806A63A";
    attribute INIT_08 of inst : label is "109500A902302AB40690F0C910753BA530953075183AA53EA639B520016918FF";
    attribute INIT_09 of inst : label is "C918753BA531953175183AA53EA639B520016918FF493A11203E866838852BB5";
    attribute INIT_0A of inst : label is "11A507904A09904A00A50EF003A5609E10CACA189519A902B019C9E8A90290E8";
    attribute INIT_0B of inst : label is "85010907C604F007A6020908C604F008A6040909C604F009A600A96011850329";
    attribute INIT_0C of inst : label is "21F001C90BF006A540F602A62D5320118500A91D851B85198580A90C808D6011";
    attribute INIT_0D of inst : label is "AC4C16A235B0203E851BA91EA2388573A9398539A90D8568A93C8D4C24F002C9";
    attribute INIT_0E of inst : label is "A918A2388590A9398539A91D851B8501A935A2200D8560A935A24C0D8568A935";
    attribute INIT_0F of inst : label is "2D8504A9148512853CA91C85A0A91A8558A92E8529A92C85D7A935B0203E8517";
    attribute INIT_10 of inst : label is "C91F293AA53AE638E600A03A9100A938913AB120A03A9100A938913AB1602F85";
    attribute INIT_11 of inst : label is "19B504A2061019B502A234D001C905A528D002C93EF006A542D00DA560E0D01F";
    attribute INIT_12 of inst : label is "2AB5083019B504A22A852AB52B852BB5188518B5108510B5199580A919851630";
    attribute INIT_13 of inst : label is "15D0E02901A520D003A531944CF7B003C940B502A660F010CACA053010B50430";
    attribute INIT_14 of inst : label is "06A5FB3019B560058500A9429030C937A52A953A0B200F102AB51390E0C910B5";
    attribute INIT_15 of inst : label is "9018D50469181EA5E1B0E7C9E590DDC910B50A90BFC90490B5C910B50AD001C9";
    attribute INIT_16 of inst : label is "E6378580A904D037E6C29080C92AB5C8B018D51E65183E85016918FF4916A5D8";
    attribute INIT_17 of inst : label is "A514F000A904D003A52B953365B905B008C92BB5A803A9029004C94A4A37A507";
    attribute INIT_18 of inst : label is "A51DD002A9049008C92BB53E8500A902B001A93C8518F5381E650169186A383E";
    attribute INIT_19 of inst : label is "B9A83E053D0502A902B000A903C939AD203CA53D8511F000A904900CC9FC2937";
    attribute INIT_1A of inst : label is "3058285828641C2E384C368580A91995802919B505E602F0012919B52A953359";
    attribute INIT_1B of inst : label is "1818B53A8500A9398504A938851F494A4A4A08691810B5070606057010701050";
    attribute INIT_1C of inst : label is "04A938853A8502A960398539653AA538853865183A260A3A260AFF4907090F69";
    attribute INIT_1D of inst : label is "852069183AA53C8405A002D001C906A500A01AA207678D07628DBDA939853B85";
    attribute INIT_1E of inst : label is "A5CACAAA4A4A4AFF491EA579F016A5E9D0CA3A913CA43A91A800A93BE602903A";
    attribute INIT_1F of inst : label is "38913CA4389100A0B069183B85FF4907291EA5F2D0CA39E60290388520691838";
    attribute INIT_20 of inst : label is "A03891A8A93B8508E9381A9009C93CF03B651816A539E60290388520691838A5";
    attribute INIT_21 of inst : label is "05D007C939A50B9060C938A5AAA0691839E602903BA5388520691838A5389100";
    attribute INIT_22 of inst : label is "8516854185408500A948854785198580A96038913CA4389100A08AAA1A69188A";
    attribute INIT_23 of inst : label is "31824C068502A9041006C60BD00BC604F00BA514D00EA5018504850285058503";
    attribute INIT_24 of inst : label is "A510F00C408D0C308D08D0102900A52D742036C92017850A0A17A516850EA960";
    attribute INIT_25 of inst : label is "A90E8504E938D19004C90EA5223008802C0C418D039004C90C318D0A9002C90E";
    attribute INIT_26 of inst : label is "0EC6AD9002C90EA5B37031824C4085268525852185208500A90B8502A9038502";
    attribute INIT_27 of inst : label is "A50CA60D8500A96001B002C903A5D1D0178504A9D7F0082917A5038501A90EC6";
    attribute INIT_28 of inst : label is "3A8549A93B8400A031E62048861D8548A51DA647861B8547A51BA60C85468646";
    attribute INIT_29 of inst : label is "38E63C661801B03803D0BEC938B13D853AB13C8500A907A2398504A9388527A9";
    attribute INIT_2A of inst : label is "A93891BEA90DE60CD0389120A0389100A90AB03D2638C607A23A913CA5EF10CA";
    attribute INIT_2B of inst : label is "1838A5ABD01FC91F2939E60290388508691838A53AE6DF10CA00A0389120A0BF";
    attribute INIT_2C of inst : label is "824C03D002C507D001C904A5949060C938A59A9007C939A539E6029038852869";
    attribute INIT_2D of inst : label is "CAAA6837492060A9483A858A3B8504A93E8513A91AA2388573A9398539A96031";
    attribute INIT_2E of inst : label is "0AD0AA3A848A00A002D0102900A508F003A5AA0ED002C5B0A060EAB03EE40430";
    attribute INIT_2F of inst : label is "16F025B5389100A0389120A000A93885A0A9398506A908D0398504A9388560A9";
    attribute INIT_30 of inst : label is "3A054A4A4A4AF02920B5389120A03A050F2925B538913A054A4A4A4A08F0F029";
    attribute INIT_31 of inst : label is "2036C920374920C1A916850EA922F003A560389160A03A050F2920B5389140A0";
    attribute INIT_32 of inst : label is "4920C4A90C118D378500A9E7D00C108DECF00C118D102900A50E30082E2C2D74";
    attribute INIT_33 of inst : label is "D00FA536C9200085E129800900A53A9160A03A9140A03A9120A03A91A800A937";
    attribute INIT_34 of inst : label is "02B020C939E22005E609860886078600A20C8500A904D001C904A5F5D000A504";
    attribute INIT_35 of inst : label is "199502A9109580A92A95A06918F7F020C9382939E2201895E0A90290E0C920A9";
    attribute INIT_36 of inst : label is "0C808D01E602D000E6F990D8C90C00ADF9B0D8C90C00AD60368580A92B9504A9";
    attribute INIT_37 of inst : label is "AD20A81EE538AA14D0E7A20490E8C91C903EA604B03EC51FA53E8515691816A5";
    attribute INIT_38 of inst : label is "8DB0090F2904A506F003A533982030E9201E86E8E8021098CA06D00A9002C939";
    attribute INIT_39 of inst : label is "0C518D30A3202EC62039E22035C72003F003C504F003A601A935C72000A905A0";
    attribute INIT_3A of inst : label is "D1BD26D04029AA4A3D262A3C262A183D863C8600A000A2603CB14C033008C0AD";
    attribute INIT_3B of inst : label is "BD388537A9BDAA38054A4A4A4A4AC0290830AD38850A0A8A3B8537D2BD3A8537";
    attribute INIT_3C of inst : label is "852069183AA53A8100A2800902F03DA606F000A904F03CA620F038B1398537AA";
    attribute INIT_3D of inst : label is "9B388738723861384D383938243813380937F937E837DB60DC10C83BE602903A";
    attribute INIT_3E of inst : label is "4847494820048404A104A104A104A139293918390938FA38E738D338BE38AD38";
    attribute INIT_3F of inst : label is "55454C4C49454D00204C48415A544B4E5550204554534542002045524F435320";
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
