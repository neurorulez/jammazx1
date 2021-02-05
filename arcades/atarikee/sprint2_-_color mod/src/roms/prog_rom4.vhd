-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity prog_rom4 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prog_rom4 is

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
    attribute INIT_00 of inst : label is "C8D024C6CCF024A5D01024850FA9061008402C36E602D022C606F022A50A1022";
    attribute INIT_01 of inst : label is "AFBD24853DAEBD23853D87BD22853D86BD288480A002F000C900A037E84C36E6";
    attribute INIT_02 of inst : label is "00A020A923853DAFBD22853DAEBD6038454CC82491280508F022B100A025853D";
    attribute INIT_03 of inst : label is "6EBDAA0A35A5F7D036E0E8E83852202AA20DD035A50C808D60F9D020C0C82291";
    attribute INIT_04 of inst : label is "A0094A4A4A4AF02948B100A0F6D006C0C800489924B100A025853D6FBD24853D";
    attribute INIT_05 of inst : label is "00A9488501691848A54C91A0090F2948B14D854D6500A94C850169184CA54C91";
    attribute INIT_06 of inst : label is "2CB7D04AC548A5BDD002F04BC549A54D854D6500A94C850169184CA549854965";
    attribute INIT_07 of inst : label is "01A022913CA900A000A2F5D004E0E8C822952ED6B900A2A80A0A35A53C300830";
    attribute INIT_08 of inst : label is "38F84C238525A5228524A50BD001E0E822913FA921A022913EA920A022913DA9";
    attribute INIT_09 of inst : label is "EEBD59853DEBBD58853DE8BDE801F007C905F006C9093004C9E80EF035A500A2";
    attribute INIT_0A of inst : label is "6518F824A528862686248600A2228502691803292A2A2A18FF490833AD56853D";
    attribute INIT_0B of inst : label is "A5598526A5588524A5E4D022E4E8D8288556651828A5268559651826A5248558";
    attribute INIT_0C of inst : label is "30094A4A4A4AF02956A560588556A53B853A8540A90B100832AD0C808D568528";
    attribute INIT_0D of inst : label is "2C600130082F2C22D04BC93F55AD29D0CBC9044BAD603B8530090F2956A53A85";
    attribute INIT_0E of inst : label is "85208500A96001300C002CF6D001E938FDD0C800A00AA9FB300C002CFB100C00";
    attribute INIT_0F of inst : label is "600110082E2CFDD088FAA03885F0A96001F057A560578500A90510082E2C6036";
    attribute INIT_10 of inst : label is "3A97203F29045DAD60578501A9386820358500A902D00CC935A535E6F1D038E6";
    attribute INIT_11 of inst : label is "203F29045BAD045C8DB0A905F022A53A97203F29045CAD045D8DB0A905F022A5";
    attribute INIT_12 of inst : label is "3A97200443AD04448D30A905F022A53A97200444AD045B8DB0A905F022A53A97";
    attribute INIT_13 of inst : label is "22A53A9720044FAD04428D30A905F022A53A97200442AD04438D30A905F022A5";
    attribute INIT_14 of inst : label is "A904B03AC9089030C96004508D39A905F022A53A97200450AD044F8D39A905F0";
    attribute INIT_15 of inst : label is "AD03100444AD05F000E025852DCBB924852DCAB9A80A35A560228501A902F000";
    attribute INIT_16 of inst : label is "4A4A4A40B52A85F029046918F02944B5298524B1C8288524B1A80A07294A045D";
    attribute INIT_17 of inst : label is "6918045DAD2AD000E03B4C4CF5D004C0C808F02AC528B100A02A852A050F294A";
    attribute INIT_18 of inst : label is "8DB0A9045C8DB0A9045B8D016918045BAD0BD0BAC9016918045CAD1AD0BAC902";
    attribute INIT_19 of inst : label is "8D0169180442AD0BD03AC90169180443AD1AD03AC90269180444AD3B4C4C045D";
    attribute INIT_1A of inst : label is "D004E0C8C8E800189944B5109540B500A000A26004448D30A904438D30A90442";
    attribute INIT_1B of inst : label is "8D06009DF5D00500DD0C808D05009DF5D00400DD0C808D04009D01A900A260F0";
    attribute INIT_1C of inst : label is "168500A9CAD001C9016918D1D0E8F5D00700DD0C808D07009DF5D00600DD0C80";
    attribute INIT_1D of inst : label is "857E711822A52285268500A900A07F8520A97E8500A9258505A9248510A900A2";
    attribute INIT_1E of inst : label is "E6249130098A00A009F03D64DD22A5E9D004C926A526E67FE60C808DF6D0C822";
    attribute INIT_1F of inst : label is "2C04718DB0A9046D8DC5A9046C8DCDA9046B8DC9A9046A8DD4A9CCD008E0E824";
    attribute INIT_20 of inst : label is "00A23C2A4C04CE8DC5A904CD8DCCA904CB8DD9A904CC8D04CA8DC3A91A500830";
    attribute INIT_21 of inst : label is "70B2A9083008332CB6A9046F8DB1A9023008332C20A9F8D005E0E804CA9D20A9";
    attribute INIT_22 of inst : label is "A9248520A90B70183008312C238504A922858AA904708DB9A902700430B5A902";
    attribute INIT_23 of inst : label is "C4A93CA14C25853EA924853BA90B703CA14C25853EA9248559A93CA14C25853E";
    attribute INIT_24 of inst : label is "AE4CF8D013E0E8048E9D20A900A2048D8DCFA9048C8DCDA9048B8DC5A9048A8D";
    attribute INIT_25 of inst : label is "4CF8D00DE0E804AA9D20A900A20F1008322CF5D013C0C82291800924B100A03C";
    attribute INIT_26 of inst : label is "A9F5D00DC0C82291800924B100A025853EA92485F9A9238504A92285AAA93CDF";
    attribute INIT_27 of inst : label is "2C050A8D3EA9023008302C04EB8D3DA9023008302C04EA8D3CA9023008302C20";
    attribute INIT_28 of inst : label is "8D0818BD00A20C108D0C418D0C318D303C4C0310082A2C050B8D3FA902300830";
    attribute INIT_29 of inst : label is "3008402C0C118D03300829AD0C118D03300828ADF0D006E0E80C118D03300C80";
    attribute INIT_2A of inst : label is "118D0330082D2C0C118D0330082C2C0C118D0330082E2C0C118D03700C118D03";
    attribute INIT_2B of inst : label is "2930280A26E425BE24982372224C21262000005984270F36910951CC3BFF4C0C";
    attribute INIT_2C of inst : label is "3F2E3F273F073EF93EE13EC13EA23E813E6D3E503E343E193DF92CA22B7C2A56";
    attribute INIT_2D of inst : label is "0400076004C00760076004000400040004203F553F4F3F483F2E3F273F4F3F48";
    attribute INIT_2E of inst : label is "04C004A0048004600440044B07630763076307630778077804C0077807600429";
    attribute INIT_2F of inst : label is "204B43414C4220708090A05E4B38260203050102030304070506080C050004E0";
    attribute INIT_30 of inst : label is "2020202020202000C5D4C9C8D72020202020202020454D495420202020202020";
    attribute INIT_31 of inst : label is "494F43203220202020202020002020524559414C5020524550204E494F432031";
    attribute INIT_32 of inst : label is "4559414C50203220524F203120202020002020524559414C502052455020534E";
    attribute INIT_33 of inst : label is "474E495441522020202020202020202020202000204E494F4320524550205352";
    attribute INIT_34 of inst : label is "20594C4C41434954414D4F545541204556495244205352414320594552472000";
    attribute INIT_35 of inst : label is "534B434152542045474E414843204F54204E4F54545542204853555020200020";
    attribute INIT_36 of inst : label is "202020202020204E4F5454554220545241545320485355502020202020202000";
    attribute INIT_37 of inst : label is "45444E455458450020205245564F2020454D4147202020202020202020202000";
    attribute INIT_38 of inst : label is "502030202020524F462059414C50204445444E4554584520200059414C502044";
    attribute INIT_39 of inst : label is "544E4552454646494420323120202020202000594E4E415247002053544E494F";
    attribute INIT_3A of inst : label is "0053454D4147202045454B004F525020200045494B4F4F5200534B4341525420";
    attribute INIT_3B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3D of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3F of inst : label is "303C303C30000000000000000000000000000000000000000000000000000000";
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
