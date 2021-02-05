-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ROM_SND_1 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ROM_SND_1 is

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
    attribute INIT_00 of inst : label is "8066327E0909332100064E0366DD026EDD23180572DD0473DD806453ED56235E";
    attribute INIT_01 of inst : label is "C30374DD0275DD230366DD026EDD0777DD0677DD7E0366DD026EDD0D180177DD";
    attribute INIT_02 of inst : label is "18013E47070707E0E6783718043CCD000E0856CDC9FF0036DD043CCD000E07B5";
    attribute INIT_03 of inst : label is "EB56235E090566DD046EDD00064F073D1FE678C10856CDC5C90077DDFD100701";
    attribute INIT_04 of inst : label is "C308BF08BBC90374DD0275DD230366DD026EDD043CCD0777DD79064EDD045CCD";
    attribute INIT_05 of inst : label is "8007F2086B08C108F308EF08EB08E708E308DF08DB08D708D308CF08CB08C708";
    attribute INIT_06 of inst : label is "FA03270357038A03C003F90436047604B90501054E059E05F3064E06AE071407";
    attribute INIT_07 of inst : label is "2E014001530168017D019401AC01C501E001FD021B023B025D028102A702CF02";
    attribute INIT_08 of inst : label is "78007F0087008F009700A000AA00B400BE00CA00D600E300F000FE010D011D01";
    attribute INIT_09 of inst : label is "08090A0B0C1A1D21252C3442570047004C00500055005A005F0065006B007100";
    attribute INIT_0A of inst : label is "80461109130D210900064F81874F8780673AB0ED001801804411097621050607";
    attribute INIT_0B of inst : label is "01010000000000000101C91323127E0973CD127E805611096CCD804E11096CCD";
    attribute INIT_0C of inst : label is "0201080911120D0B070F10040C0E0A0506000000000000000101000000000000";
    attribute INIT_0D of inst : label is "0A7402E5131C25141D26151E27161F2817202918212A19222B1A232C1B242D03";
    attribute INIT_0E of inst : label is "111B10EB108310170F4F0F190E940E1C0DDD0D860D2F0CA90C230B880B180AC4";
    attribute INIT_0F of inst : label is "11751175121D1175117511F81175117511D31175117511AE117511751138111B";
    attribute INIT_10 of inst : label is "0B380AE50A9500001273127312E81273127312C312731273129E127312731242";
    attribute INIT_11 of inst : label is "115D1131112A111410A310370F6F0F320EB30E3C0DFB0DA80D510CCF0C430BB4";
    attribute INIT_12 of inst : label is "1290126711A01192115D11A01192115D11A71199116411A01192115D11A01192";
    attribute INIT_13 of inst : label is "7132807032103E0492CD013E1297129012671297129012671297129012671297";
    attribute INIT_14 of inst : label is "70210D18022800FE80723AC9AF045CCD005521043CCD040E037FCD807232AF80";
    attribute INIT_15 of inst : label is "AF043CCD4F062809FE3C044DCD1036C035AF807121C9AF807232013EC035AF80";
    attribute INIT_16 of inst : label is "010021043CCD040E037FCD807632AF807532807432103E0492CD013EC9FF3EC9";
    attribute INIT_17 of inst : label is "35AF807521C9AF807632013EC035AF8074210D18022800FE80763AC9AF045CCD";
    attribute INIT_18 of inst : label is "04018078110B142100191906C9FF3EC9AF043CCD4F062809FE3C044DCD1036C0";
    attribute INIT_19 of inst : label is "807821FD0B1421DDC9AF045CCD005021043CCD0C0E0492CD013E037FCDB0ED00";
    attribute INIT_1A of inst : label is "36FD0077FD007EDD0A200035FD045CCD190009110476CD1B18022800FE037EFD";
    attribute INIT_1B of inst : label is "C9FF3EC9AF02280235FD045CCD230476CD0177FD017EDDF9200135FDC9AF0103";
    attribute INIT_1C of inst : label is "808032063E807F32043E807E32063E807D32173E0492CDAF0C110BF80BD70BBC";
    attribute INIT_1D of inst : label is "AF807D21C9EF0B802180813AC9AF045CCD008021043CCD0B0E037FCD808132AF";
    attribute INIT_1E of inst : label is "CD0636C035AF807E21C9AF808132013E045CCD52EDB70010110476CD1736C035";
    attribute INIT_1F of inst : label is "0636C035AF807E21C9AF808132023E0436C035AF807F21045CCD190010110476";
    attribute INIT_20 of inst : label is "10C9FF3EC9808132AF052835808021808132033E045CCD52EDB70010110476CD";
    attribute INIT_21 of inst : label is "5CCD010021043CCD0C0E0492CD013E037FCDB0ED0004018083110C1F21001010";
    attribute INIT_22 of inst : label is "0046FD0F280035FD3A18222801FE062800FE037EFD808321FD0C1F21DDC9AF04";
    attribute INIT_23 of inst : label is "0146FD0F280135FDC9AF045CCD010021010336FDC9AF045CCD0080210C2840CB";
    attribute INIT_24 of inst : label is "4021D22840CB0246FD0F280235FDDE18020336FDC9AF045CCD006021EC2840CB";
    attribute INIT_25 of inst : label is "CD77AF2377023E2377083E2377808821023E0492CD013EC9FF3EC9AF045CCD00";
    attribute INIT_26 of inst : label is "3A045CCD2B0476CD2818022800FE808B3AC9AF045CCD010021043CCD090E037F";
    attribute INIT_27 of inst : label is "C9AF808B32013EC9AF043CCD4F06283D044DCD808832033E0F208088323D8088";
    attribute INIT_28 of inst : label is "3CCD090E1028808A323D808A3A808932083EE9208089323D80893A043CCD000E";
    attribute INIT_29 of inst : label is "8F32AF808E32053E808D32143E0492CDAFC9FF3EC9808B32AF045CCD00602104";
    attribute INIT_2A of inst : label is "C035AF808D211B18022800FE808F3AC9AF045CCD008021043CCD0B0E037FCD80";
    attribute INIT_2B of inst : label is "8F32AF1436C035AF808D21C9AF808F32013E152835808E21045CCD0086211436";
    attribute INIT_2C of inst : label is "043CCD0B0E037FCD809332AF809232053E809132143E0492CDAFC9FF3EC61880";
    attribute INIT_2D of inst : label is "21045CCD0043211436C035AF8091211B18022800FE80933AC9AF045CCD004021";
    attribute INIT_2E of inst : label is "92CDAFC9FF3EC618809332AF1436C035AF809121C9AF809332013E1528358092";
    attribute INIT_2F of inst : label is "35AF809521C9AF045CCD020021043CCD090E037FCD809632063E809532133E04";
    attribute INIT_30 of inst : label is "110E1921001B1BC9FF3EC9AF045CCD52ED0050110476CD0D28358096211336C0";
    attribute INIT_31 of inst : label is "0E1921DDC9AF045CCD020021043CCD0B0E0492CD013E037FCDB0ED0003018098";
    attribute INIT_32 of inst : label is "CD045CCD0800210077FD007EDD18200035FD0E6DC3032800FE027EFD809821FD";
    attribute INIT_33 of inst : label is "4DCD045CCD0200210177FD017EDDF9200135FDC9AF010236FD043CCD4F3C044D";
    attribute INIT_34 of inst : label is "5CCD040021037FCD0492CDAFC9FF3EDA18000236FD043CCD4F0A2803FE3D3D04";
    attribute INIT_35 of inst : label is "C035809E21C9AF0EBBCD0EEBCDC9AF1436230236230036809C21043CCD0F0E04";
    attribute INIT_36 of inst : label is "3E4F043CCD4F02D6044DCD3218023E043CCD4F3C044DCD0C284FCB809C3A1436";
    attribute INIT_37 of inst : label is "B70038110476CD142047CB809C3A0236C035809D21C9FF3EE1C0B7790F07CD02";
    attribute INIT_38 of inst : label is "80A0210492CDAFEE18045CCD190038110476CDC977AE809C21013E045CCD52ED";
    attribute INIT_39 of inst : label is "284F3D044DCD0336C035AF80A021C9AF045CCD009421043CCD090E037FCD0336";
    attribute INIT_3A of inst : label is "CD013E037FCDB0ED00060180A2110F4921001A040A1908C9FF3EC9AF043CCD05";
    attribute INIT_3B of inst : label is "01FE0A2800FE057EFD80A221FD0F4921DDC9AF045CCD00E021043CCD0C0E0492";
    attribute INIT_3C of inst : label is "FD06200135FD045CCD2B0476CD0077FD007EDD16200035FD6D18422802FE2928";
    attribute INIT_3D of inst : label is "CD0C0EC9AF000536FD043CCD080E0B2047CB017EFDC9AF010536FDC9AF020536";
    attribute INIT_3E of inst : label is "043CCD0C0EC9AF043CCD080E072047CB027EFD15280235FDC9AF000536FD043C";
    attribute INIT_3F of inst : label is "0477FD047EDDDF200435FDC9AF043CCD000E030536FDC9FF3E03200335FDC9AF";
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
