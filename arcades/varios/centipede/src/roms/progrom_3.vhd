-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity progrom_3 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of progrom_3 is

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
    attribute INIT_00 of inst : label is "494D2053414745554A203206CF04F0CD554D494E494D205845554A203206CF04";
    attribute INIT_01 of inst : label is "A600A0948534BDBD938534BCBDAA0A8B050329FDA58B850AA88C660AB04D494E";
    attribute INIT_02 of inst : label is "02108CA604F020C93F2993B18BA48B8404A0928593B1C8918593B102A002F0EF";
    attribute INIT_03 of inst : label is "6918FF490510D6F08C8400A060DF1093B18BE68BA43885202F29029030C900A9";
    attribute INIT_04 of inst : label is "08486092859265F3A59185916518EF4520A9919100A0EF4502F0A8001AB96001";
    attribute INIT_05 of inst : label is "602838852029E902902AC90820091803F00F2904900F296838AB20284A4A4A4A";
    attribute INIT_06 of inst : label is "00E68AE639B44C03700C002C10038DAFA910028D10A90AF0D2A5D84898488A48";
    attribute INIT_07 of inst : label is "C9FEB025C9C8A5FEB008C98AA5D8FC850069FCA5FB85016918FBA5F801E611D0";
    attribute INIT_08 of inst : label is "01B9AC68B985B96518984801B88C3A312001B8AC88A60C03ADC88512A9049013";
    attribute INIT_09 of inst : label is "0369183F290B103F29159040C90830C2B5BB85BB6518387C209801B98C3A3120";
    attribute INIT_0A of inst : label is "18031044B407F00DE000A054B507E09D64B50FA2265A20AAC29500A902902AC9";
    attribute INIT_0B of inst : label is "30C93F291FB00CE034B5399D4C34B505D020290C00AD998580299807D09D0169";
    attribute INIT_0C of inst : label is "07C09D994598450CA9029003C006B006C008A9A80DF0072964B598850F2919B0";
    attribute INIT_0D of inst : label is "E63B30D5A51FD020290C00AD9A10CA07F09D39090CA902B00CE006F0402934B5";
    attribute INIT_0E of inst : label is "B502A233AD202030F810CA016914049D03A20A0AD5A5D58500A904500C002CD5";
    attribute INIT_0F of inst : label is "A80C00BD02A201049D03A9BA06F0AAFA10CA20035DF4A90AA2F810CA1C009DC5";
    attribute INIT_10 of inst : label is "18BA9598BAB402100C005D980810BA5514F0A8F009029008C90F29BD94BDF538";
    attribute INIT_11 of inst : label is "02B005F0FAC06000A00E900A06900A4068AA68A86818008DD410CACAB995B975";
    attribute INIT_12 of inst : label is "9801B58D01B5ACFA1088017859FFA93CA060C800A0029005F006C0600A8800A0";
    attribute INIT_13 of inst : label is "AD1ED0018A8D018ACD7C29FDA52BD03A4F20F810CA02953AB0BD2FA26001B54D";
    attribute INIT_14 of inst : label is "00A960E910CA1A950181BD09B00AC90F290FB09AC902950178BD08A21AF0017A";
    attribute INIT_15 of inst : label is "0501301001321001432001543201654360018A8D7C29FDA5FA10CA01789D3EA2";
    attribute INIT_16 of inst : label is "120A07170604170504000405020304040103140604040A050121020122010128";
    attribute INIT_17 of inst : label is "00A016808C8816808CC816808C08A016009D60F986F710CA01789D3AEE203FA2";
    attribute INIT_18 of inst : label is "8D0AA916808D02A90D90FA461030F9A616808D17D0032900A56016808C1700BD";
    attribute INIT_19 of inst : label is "0178BD16808D06A9F9865860F98658F510CA07D00178DD3AEE207860F9C61680";
    attribute INIT_1A of inst : label is "9D06009D05009D04009D01009D00958AE89AFFA2D860FAE616808D0EA916009D";
    attribute INIT_1B of inst : label is "8686CAFD850800AD19F020290C00AD1C078D24008D10088D100F8DECD0CA0700";
    attribute INIT_1C of inst : label is "10078E10058E10038E10018E14048E200E4C3A64203AE020FF8501A9C286C186";
    attribute INIT_1D of inst : label is "A8009511A943D000B500A2140F8E14078EE8140E8E14068EE8140D8E14058EE8";
    attribute INIT_1E of inst : label is "518B918A28D08BB111A200A08C852A8B858A20008DECD0E8F5900A983AD00055";
    attribute INIT_1F of inst : label is "10C95FB0D69008C904A902D002C98CA58CE620008DEBD0C8F490AA0A8A21D08B";
    attribute INIT_20 of inst : label is "8E03A210008D40A9A82A10E001694A4A4A4A302998AAF49004E08CA6121000A9";
    attribute INIT_21 of inst : label is "002C10A210018EF0D0CA20008DFB700C002CFB500C002C10018DAFA910A2100F";
    attribute INIT_22 of inst : label is "0C01ADFED0F6F020290C00AD20008DD11088F0D0CA20008DFB700C002CFB500C";
    attribute INIT_23 of inst : label is "08A22DA9BFA08C8507A9FB10CA6495F8A90FA2FBD0E80095AA3CDE4C03F01029";
    attribute INIT_24 of inst : label is "D020290C00AD58E3B004C98CA58CC6EBD0FFC0F1B02AC901E938FAD0CA888B91";
    attribute INIT_25 of inst : label is "009DF4D0E806009D05009D04009D781DA9EBF0E049E0290C01AD20008D8A46F9";
    attribute INIT_26 of inst : label is "00A2F2108A4620008DF9D020290C00AD14048E0FA214058E08A2F890C0E0E807";
    attribute INIT_27 of inst : label is "A21C048D1C038DE386D586CAECD0E806009D05009D04009D009500A907009D8A";
    attribute INIT_28 of inst : label is "8C8520A98B8600A2100F8D03A9E585100A4D100AADF610CA6495549580098A0F";
    attribute INIT_29 of inst : label is "A9E510CA8CE6FFA94803B09801C907298AA8FBD0C88B5120008E00A0FFA91FA2";
    attribute INIT_2A of inst : label is "10CA389E20186838852000A938852020098A4811F06891853F498A03A2928504";
    attribute INIT_2B of inst : label is "A51BF0C8C81FF0018D0D018C0D018BADF8F71088008E99018BB906A03AE020E4";
    attribute INIT_2C of inst : label is "8A46588D84D8E210948500E994A5938590E593A592858FE592A591858EE53891";
    attribute INIT_2D of inst : label is "026918AAE6A524D002C90329EAA5EA264A0C01AD20008DFED020290C00ADFC90";
    attribute INIT_2E of inst : label is "01ADE88614048EAA0F298AE8E8A6E7850F29016918E7A510019D00A9E6850629";
    attribute INIT_2F of inst : label is "C0C8140C991404990F2901691801A0E9A5E9E616D002C90329EBA5EB264A4A0C";
    attribute INIT_30 of inst : label is "38A9928505A9FB10CA34F60FA207D002490329ECA5EC264A4A4A0C01ADF09004";
    attribute INIT_31 of inst : label is "A9F0D0CA8BC638852000A902108B241FA905A28B8501694A4A0C290800AD9185";
    attribute INIT_32 of inst : label is "AD919140A09191A800A9918536A938852021A938852021A938852021A9918537";
    attribute INIT_33 of inst : label is "A902D003E021A938852000A93885203FD8BD16B006C9AA1BF04A4A4A4A4A0801";
    attribute INIT_34 of inst : label is "ADDF850C01AD387420918535A99385F2A9025008002CEEA994853FA938852022";
    attribute INIT_35 of inst : label is "48100AADE2850C03ADE1858F290C02ADE0858F290C00ADDE850801ADDD850800";
    attribute INIT_36 of inst : label is "8A1000990A0A0AE6A48AFAD00AE801B02A380C01AD00A2E485E40568E385E325";
    attribute INIT_37 of inst : label is "9A05A2D0A06495BB84BBE53864B55495547518B984B9A500A0E7A6100199A009";
    attribute INIT_38 of inst : label is "8504A9E210CABAA828E93898EE10CA040099C820A902B021A9AADD36BA8A07A2";
    attribute INIT_39 of inst : label is "4816F001B58C3A4F203B072038852025A902F0E505E305FF49E4A591853AA992";
    attribute INIT_3A of inst : label is "8DAD389185E9A9928504A93FD64C389E206838852000A938852024A991853BA9";
    attribute INIT_3B of inst : label is "928505A938742094853FA99385DEA9389E2018018BAD389E20018CAD389E2001";
    attribute INIT_3C of inst : label is "006918F80F298DA53885202EA9389E2038D8006918F84A4A4A4A8DA5918508A9";
    attribute INIT_3D of inst : label is "EAA538742094853FA99385E4A9389E201859A9029060C9D88E658E858E658E85";
    attribute INIT_3E of inst : label is "502023252424223D9E4CFA8500A9F9853DA901B58DFF4901B5AD10D0EC05EB05";
    attribute INIT_3F of inst : label is "38C03B4B3FF6133FF64CD9534145C4524148C54D495420454D414720D359414C";
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
