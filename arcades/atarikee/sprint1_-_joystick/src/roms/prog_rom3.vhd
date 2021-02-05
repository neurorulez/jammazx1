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
    attribute INIT_00 of inst : label is "0105BDBA18D03FC960A51ED092C961A52010082C2C0F008D03D030A5D8488A48";
    attribute INIT_01 of inst : label is "7FA2D87860853FA9618592A94068AA680CB018C9109010C9089040C90CB020C9";
    attribute INIT_02 of inst : label is "37032038B7200CA238B72004A238B72016A2180020304E4C03F0AAC91800AD9A";
    attribute INIT_03 of inst : label is "01A937FF2039EE2035DA2038CD200C018D3885358500A930604C30F720306920";
    attribute INIT_04 of inst : label is "D00030AD30E6388A2010A200A9388A200EA200A9388A2051A600A9388A201EA2";
    attribute INIT_05 of inst : label is "2000A23A3D203A524C0330082C2C30724C3885358500A909D00CC935A535E611";
    attribute INIT_06 of inst : label is "F1500C002C37FF200370021008402C0C108D00148D168500A9F8D004E0E83485";
    attribute INIT_07 of inst : label is "CD203886358600A2EA60A4F020A504D036A539BA20AFF020A504D036A50C808D";
    attribute INIT_08 of inst : label is "F020A50C808D37FF203A3D2035DA202A8500A9388A2000A200A938B72006A238";
    attribute INIT_09 of inst : label is "B72012A238B72014A238B72000A220C6E730082D2C388A2014A200A90C318DF6";
    attribute INIT_0A of inst : label is "200C008D07758D3BA507748D03F030C93AA5388A2012A200A915F040C93AA538";
    attribute INIT_0B of inst : label is "10002C00A20C108DF8D004E0E834852001A237D82030E638CD2003F038A53A3D";
    attribute INIT_0C of inst : label is "D03EA5338500A931AF4C3E853D8500A9093010002C31AF4C3DC605F03DA50930";
    attribute INIT_0D of inst : label is "F033A516C602904A05904A30A50AF016A53D8510A916850FA93E85009501A90A";
    attribute INIT_0E of inst : label is "20A9045010002C00199900197918FEA9027008802C02A9A80A8A33C60C118D18";
    attribute INIT_0F of inst : label is "02D000751824A50C118D0310F9C9248537822017904A1A904A30A50D008D3385";
    attribute INIT_10 of inst : label is "4A4AFAD08822651800A9A83CA1B924850A32A532A422854A4A4A00B5009501A9";
    attribute INIT_11 of inst : label is "4A4A4A4A4A4AFF4900B537D820A80A8A14850FA9023010C900A9021024E5384A";
    attribute INIT_12 of inst : label is "0C118D033010C9113021F024E538F82904B52485F8290019B922850369182685";
    attribute INIT_13 of inst : label is "BDAA0A35A5351020049504751822A50C118D0310F8C932714C228522E53800A9";
    attribute INIT_14 of inst : label is "F02944B522A6298524B1C8288524B1A80A07294A042AAD25852DCBBD24852DCA";
    attribute INIT_15 of inst : label is "2AAD330A4CF5D004C0C808F02AC528B100A02A852A050F294A4A4A4A40B52A85";
    attribute INIT_16 of inst : label is "04298DB0A904288D0169180428AD0BD0BAC90169180429AD1AD0BAC902691804";
    attribute INIT_17 of inst : label is "C935A535E6378500A9330A4C37E605D037A5097008302C21D0B0C9042A8DB0A9";
    attribute INIT_18 of inst : label is "00A902A233234C38B72002A208F0202930A515F031A538CD20358506A904D00C";
    attribute INIT_19 of inst : label is "C634E602D034A506D031A50A303BC53F290429AD13303AC53F290428AD388A20";
    attribute INIT_1A of inst : label is "B0C9043CAD33714C043C8DBAA9043B8DB9A9043A8D20A950E614D050A535D03C";
    attribute INIT_1B of inst : label is "A919F034A5346A4C3C853FA5043CCE043C8DBAA9043BCE12F0B0C9043BAD0FD0";
    attribute INIT_1C of inst : label is "00A90C108D0C018D346A4C3C853FA5388A2002A200A9043B8DB3A931E6348500";
    attribute INIT_1D of inst : label is "290428AD388A2016A200A9388A200CA200A938B7200CA238B72002A214851685";
    attribute INIT_1E of inst : label is "1AA2043055C50A1018A2043054C522A5228522050F290429AD22850A0A0A0A0F";
    attribute INIT_1F of inst : label is "202A84288626857FA07FA208A939EE200C308D03D020A5388A2001A91CA20210";
    attribute INIT_20 of inst : label is "E62B862A85DED0882AA428A626A54310082D2C0C318D08F020A54FD036A537FF";
    attribute INIT_21 of inst : label is "CA7FA00C808D2BA62AA5388A2016A201A934364C38B72016A208F0202930A530";
    attribute INIT_22 of inst : label is "A538B7200CA238B72016A22A8501A9A81001E93805A9029009C97FA27FA0B7D0";
    attribute INIT_23 of inst : label is "8D371B20F1500C002C37FF200370021008402C37D82030F84C600C308D04D020";
    attribute INIT_24 of inst : label is "3017F0F8292CF53804B503A022850169184A4A4A4A4A00B534C920315F4C0C80";
    attribute INIT_25 of inst : label is "03903CA9DD22651800B52285FFA900199926A426062686049504751898FDA002";
    attribute INIT_26 of inst : label is "22852265181F494A4A4A04691840B5238504A9228500A96035102000953CA9BD";
    attribute INIT_27 of inst : label is "236524A5228522651824260A24260AFF49070904691844B523852365248500A9";
    attribute INIT_28 of inst : label is "B524854A4A4A72F000B5528500A92286602C950A0A0A0A0A071022B100A02385";
    attribute INIT_29 of inst : label is "1710407529A5089508751828A522A635A720AA0A2DF02F06BD2686AA4A4A4A04";
    attribute INIT_2A of inst : label is "2CF02F26BD26A64095F7A900528D01A90730F7C90BF000A9528501A90830FCC9";
    attribute INIT_2B of inst : label is "0A30E8A9528501A91230E8C90C10447529A50C950C751828A522A635A720AA0A";
    attribute INIT_2C of inst : label is "C0A9449550A9409520A910F052A514F000E022A6449520A9528501A9061020C9";
    attribute INIT_2D of inst : label is "A9288524651828A52985288500A9AA016918FF4906108A258660009501A90495";
    attribute INIT_2E of inst : label is "00A020A900A260298529E500A9288528E53800A90D1025A5F0D0CA2985296500";
    attribute INIT_2F of inst : label is "19990495C0A900A000A2F9D004E0E8009501A900A2F5D004E0E80C9408944095";
    attribute INIT_30 of inst : label is "2A2A18FF490833AD47852CA9468538A9458544A9448550A9F4D004E0E8C8C800";
    attribute INIT_31 of inst : label is "2A2A2A18FF490833AD568503A9558502A9548504A93F853C853CA5B9A803292A";
    attribute INIT_32 of inst : label is "28A5268555651826A52485546518F824A528862686248600A222850269180329";
    attribute INIT_33 of inst : label is "3A8540A90D100832AD568528A5558526A5548524A5E4D022E4E8D82885566518";
    attribute INIT_34 of inst : label is "8500A93B8530090F2956A53A8530094A4A4A4AF02956A5369D4C548556A53B85";
    attribute INIT_35 of inst : label is "008D0D008D00168D50853185348538853E853D853385158514850C108D308537";
    attribute INIT_36 of inst : label is "298D27A5042A8D26A5388A2004A201A92B850428AD27850429AD2685042AAD0E";
    attribute INIT_37 of inst : label is "8DB1A9043C8D043B8DB0A904288D04298D042A8DB0A90BD02AA504288D2BA504";
    attribute INIT_38 of inst : label is "3F29042AAD60518506A959855885578530A92A850C308D3685208500A960043A";
    attribute INIT_39 of inst : label is "0428AD04298DB0A905F022A53771203F290429AD042A8DB0A905F022A5377120";
    attribute INIT_3A of inst : label is "AD043B8DB9A905F022A53771203F29043BAD04288DB0A905F022A53771203F29";
    attribute INIT_3B of inst : label is "8501A902F000A904B03AC9089030C960043C8DB9A905F022A53771203F29043C";
    attribute INIT_3C of inst : label is "2900B532E60210082A2C32E6091008292C32E6101008282C328500A926866022";
    attribute INIT_3D of inst : label is "4A4A4AF02906B03246182F86BD0330082B2C2F46BDE801F0322402A9AA4A4AF8";
    attribute INIT_3E of inst : label is "1ED033A500A000A26026A624A52485F00924A506F0242408A9322624850F294A";
    attribute INIT_3F of inst : label is "20600E008D0019992265180019B92285FDA9047008802C228503A9193008802C";
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
