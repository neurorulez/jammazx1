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
    attribute INIT_00 of inst : label is "0105BDBA18D03FC960A51ED092C961A52010082A2C0F008D03D030A5D8488A48";
    attribute INIT_01 of inst : label is "7FA2D87860853FA9618592A94068AA680CB018C9109010C9089040C90CB020C9";
    attribute INIT_02 of inst : label is "36FA2038522028A238522010A238522000A2180020304E4C03F0AAC91800AD9A";
    attribute INIT_03 of inst : label is "38252051A600A937B1203632203868200C018D358500A930604C310720306920";
    attribute INIT_04 of inst : label is "00A907D035A538252000A90AA238252001A926A2F8D004E0E8042E9D00A220A9";
    attribute INIT_05 of inst : label is "20035008302C30704C358500A907D00CC935A535E617D030A530E638252018A2";
    attribute INIT_06 of inst : label is "8D00148D00168D00A9F8D004E0E834E72000A23B4D203B624C0330082A2C3868";
    attribute INIT_07 of inst : label is "36A539AB20AAF020A504D036A537B1200C808DFB500C002C0C208D0C108D0015";
    attribute INIT_08 of inst : label is "202A8500A938252051A600A938522010A2386820358500A9EA609FF020A504D0";
    attribute INIT_09 of inst : label is "25200EA2208500A90C318DF6F020A50C808D37B1200AD004C951A53B4D203632";
    attribute INIT_0A of inst : label is "082D2C11D006C951A50C808D39E2200C418D03D006C951A53825200CA200A938";
    attribute INIT_0B of inst : label is "D130082D2C0C418D0C308DEDF020A537B120171001A90C408DEA30082C2C1E10";
    attribute INIT_0C of inst : label is "8D03F030C93AA538252014A200A915F040C93AA53852200EA25C8502A90C308D";
    attribute INIT_0D of inst : label is "D05CE4E8376E2000A230E63B4D203868200C008D38522004A207758D3BA50774";
    attribute INIT_0E of inst : label is "00A900A20C208D0C108D3AA82001A205D001C95CA5F8D004E0E834E7205CA6F8";
    attribute INIT_0F of inst : label is "9500A9093022B1321C4C3DD605F03DB5093022B100A0238514A9021010A92285";
    attribute INIT_10 of inst : label is "0AF016A53D9510A916850FA9549500955CA50AD054B5339500A9321C4C54953D";
    attribute INIT_11 of inst : label is "A9A80A8A33D60C118D03D00C218D05F000E02BF033B516C602904A05904A30A5";
    attribute INIT_12 of inst : label is "04102A22B100A000199900197918FEA9027008802C324E4C08C02C06F000E002";
    attribute INIT_13 of inst : label is "10F9C92485370D2020904A23904A30A50D008D03D00D808D05F000E0339520A9";
    attribute INIT_14 of inst : label is "B422854A4A4A00B5009501A902D000751824A50C118D03D00C218D05F000E00C";
    attribute INIT_15 of inst : label is "023010C900A9021024E5384A4A4AFAD08822651800A9A83DE4B924850A5AB55A";
    attribute INIT_16 of inst : label is "F8290019B9228503691806294A4A4A4A4A4AFF4900B5376E20A80A8A14950FA9";
    attribute INIT_17 of inst : label is "3800A90C118D03D00C218D05F000E00C3010C91A3033F024E538F82904B52485";
    attribute INIT_18 of inst : label is "7220049504751822A50C118D03D00C218D05F000E00C10F8C933174C228522E5";
    attribute INIT_19 of inst : label is "A233464C2AA6F8D00DE0E804299D20A90FF0202930A51CF031A52A863AA82035";
    attribute INIT_1A of inst : label is "5CAD07D000E022303AC50442AD03103F29045BAD07D000E02AA638252000A912";
    attribute INIT_1B of inst : label is "39D000E032E602D032A506D031A50A303BC50443AD11F001C95CA509103F2904";
    attribute INIT_1C of inst : label is "C90450AD33B24C04508D3AA9044F8D39A9044E8D20A950E614D050A535D03CC6";
    attribute INIT_1D of inst : label is "1DF032A534D14C3C853FA50450CE04508D3AA9044FCE12F030C9044FAD0FD030";
    attribute INIT_1E of inst : label is "0C018D34D14C3C853FA52AA638252012A22A8600A9044F8D33A931E6328500A9";
    attribute INIT_1F of inst : label is "85208500A90C408D0C308D38252010A201A915851485168500A90C208D0C108D";
    attribute INIT_20 of inst : label is "8D22050F29045CAD22850A0A0A0A0F29045BAD38252008A201A938522008A236";
    attribute INIT_21 of inst : label is "F001C95CA538252001A916A202101AA2043059C50A101CA2043058C522A50022";
    attribute INIT_22 of inst : label is "C50A1024A2043058C522A5228522050F290443AD22850A0A0A0A0F290442AD2D";
    attribute INIT_23 of inst : label is "D036A537B1202A84288626857FA07FA208A938252000A91EA2021022A2043059";
    attribute INIT_24 of inst : label is "522010A208F0202930A530E62B862A85E4D0882AA428A626A500F045D020A549";
    attribute INIT_25 of inst : label is "A9029009C97FA27FA0BDD0CA7FA00C808D2BA62AA538252010A201A934AB4C38";
    attribute INIT_26 of inst : label is "500C002C3A1820F5D05CE4E8376E2031E64C31084C602A8501A9AE1001E93805";
    attribute INIT_27 of inst : label is "F0F8292CF53804B503A022850169184A4A4A4A4A00B5352B2031B24C0C808DFB";
    attribute INIT_28 of inst : label is "3DF5DD22651800B52285FFA900199926A426062686049504751898FDA0023017";
    attribute INIT_29 of inst : label is "2265181F494A4A4A04691840B5238504A9228500A96035722000953DF5BD0390";
    attribute INIT_2A of inst : label is "24A5228522651824260A24260AFF49070904691844B523852365248500A92285";
    attribute INIT_2B of inst : label is "854A4A4A72F000B5528500A92286602C950A0A0A0A0A071022B100A023852365";
    attribute INIT_2C of inst : label is "407529A5089508751828A522A635FF20AA0A2DF02F06BD2686AA4A4A4A04B524";
    attribute INIT_2D of inst : label is "2F26BD26A64095F7A900528D01A90730F7C90BF000A9528501A90830FCC91710";
    attribute INIT_2E of inst : label is "E8A9528501A91230E8C90C10447529A50C950C751828A522A635FF20AA0A2CF0";
    attribute INIT_2F of inst : label is "86600495204904B506F052A50A305CE422A6449520A9528501A9061020C90A30";
    attribute INIT_30 of inst : label is "F0D0CA2985296500A9288524651828A52985288500A9AA016918FF4906108A25";
    attribute INIT_31 of inst : label is "E0E80C940894409500A020A900A260298529E500A9288528E53800A90D1025A5";
    attribute INIT_32 of inst : label is "F4D004E0E8C8C80019990495C0A900A000A2F9D004E0E8009501A900A2F5D004";
    attribute INIT_33 of inst : label is "853DF1B9A803292A2A2A18FF490833AD448550A9458544A9468538A947852CA9";
    attribute INIT_34 of inst : label is "108D3185328557853085378500A9F5D002E0E854953D95339500A200A93F853C";
    attribute INIT_35 of inst : label is "A95C8501A90E808D0E008D0D808D0D008D00168D50853885158514850C208D0C";
    attribute INIT_36 of inst : label is "5B8D045C8D045D8DB0A916D02AA538252000A200A9F8D00AE0E8044B9D00A220";
    attribute INIT_37 of inst : label is "3685208500A960044E8D31A904508D044F8D30A904428D04438D04448D30A904";
    attribute INIT_38 of inst : label is "F60910081ABD5AF610100818BD5A9500A9268660518502A92A850C408D0C308D";
    attribute INIT_39 of inst : label is "BD28A608100828BD28E602F002295AB528854A4AF82900B55AF60210081CBD5A";
    attribute INIT_3A of inst : label is "2408A95A3624850F294A4A4A4AF02906B05A561826A62F86BD28A6374A4C2F46";
    attribute INIT_3B of inst : label is "2C37824C08C02C06F000E03BD033B5A80A8A6026A624A52485F00924A506F024";
    attribute INIT_3C of inst : label is "65180019B92285FDA9047008802C37954C08C02C06F000E0228503A92C300880";
    attribute INIT_3D of inst : label is "A91E70111008312C518506A937E220600E008D03D00E808D05F000E000199922";
    attribute INIT_3E of inst : label is "C620E620E602506001D036A5518502A904700F1036C66001F002C936A5518504";
    attribute INIT_3F of inst : label is "850FA9065008402CFDD088FAA00C808D600150031008402C248522850FA96036";
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
