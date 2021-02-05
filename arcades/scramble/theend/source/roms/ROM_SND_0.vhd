-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ROM_SND_0 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ROM_SND_0 is

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
    attribute INIT_00 of inst : label is "B90100D00100DC0100F70100D00100DC0100F70101150100DC0100F70101CEC3";
    attribute INIT_01 of inst : label is "80DB40D30E3ED908FFFFFFFFFFFFFFFFFFFFFF00680100000100D00100DC0100";
    attribute INIT_02 of inst : label is "2860FE522850FE4D2840FE482830FE432820FE3E2810FE7A3B200FE6573228B7";
    attribute INIT_03 of inst : label is "D9FB200523778000210606C9FB08D96B28A0FE662890FE612880FE5C2870FE57";
    attribute INIT_04 of inst : label is "CD123EC9FB08D900E5CD113EC9FB08D90101CD113EC9FB08D90101CD7AC9FB08";
    attribute INIT_05 of inst : label is "FB08D900E5CD133EC9FB08D90101CD133EC9FB08D900E5CD123EC9FB08D90101";
    attribute INIT_06 of inst : label is "E5CD153EC9FB08D90101CD153EC9FB08D900E5CD143EC9FB08D90101CD143EC9";
    attribute INIT_07 of inst : label is "800232AFC9800032AFC9800432AF0A2802FE092801FEC8B70199CDC9FB08D900";
    attribute INIT_08 of inst : label is "3201BCCD80023A80073201BCCD80003A4120B70199CDAFC0B70199CD800632C9";
    attribute INIT_09 of inst : label is "093A016EFABE80082180073A800A3201BCCD80063A80093201BCCD80043A8008";
    attribute INIT_0A of inst : label is "C980043280063A0E2802FE0B2801FEC901C5CD800221F8BE800A3A018DFABE80";
    attribute INIT_0B of inst : label is "01C5CD800421F8BE800A3A0181FABE800921C980023280063AC980003280063A";
    attribute INIT_0C of inst : label is "28BE8000210006C901C5CD800421F0BE800A21C901C5CD800021F0BE800A21C9";
    attribute INIT_0D of inst : label is "5F04A121C9033E7023C9023E7023C9013E7023C9AF0C28BE23230C28BE23230C";
    attribute INIT_0E of inst : label is "3E56ED840031F92084FE7C23708000210006C97723003E7780063AC97E190016";
    attribute INIT_0F of inst : label is "0F3EF62080E680DB40D30F3EFB040ACD0402CD03FACD80D3800C323F3E40D307";
    attribute INIT_10 of inst : label is "3EF3000000FB032BCD80003A3428B780013A800B32013EF3F62880E680DB40D3";
    attribute INIT_11 of inst : label is "1828B780053A800B32033EF3000000FB032BCD80023A2628B780033A800B3202";
    attribute INIT_12 of inst : label is "93180260CD80043AD8180260CD80023ACA180260CD80003AAB18032BCD80043A";
    attribute INIT_13 of inst : label is "632808FE622807FE612806FE602805FE5F2804FE5E2803FE5D2802FE5C2801FE";
    attribute INIT_14 of inst : label is "6B2812FE6A2811FE69280EFE68280DFE67280CFE66280BFE65280AFE642809FE";
    attribute INIT_15 of inst : label is "C9800532013E6B2802FE692801FE800B3A04B7CD6E2815FE6D2814FE6C2813FE";
    attribute INIT_16 of inst : label is "53CDD1180968CDD61808F7CDDB18063ACDE01805D8CDE5180590CDEA18052ACD";
    attribute INIT_17 of inst : label is "180C05CDB3180BA3CDB8180B78CDBD180B0FCDC2180A38CDC71809AECDCC180F";
    attribute INIT_18 of inst : label is "3E90180F24CD95180EF5CD9A180E32CD9F180CCECDA4180C6ECDA91807BACDAE";
    attribute INIT_19 of inst : label is "FE4D2805FE4C2804FE4B2803FE4A2802FE492801FEC9800332013EC980013201";
    attribute INIT_1A of inst : label is "FE50280DFE4F280CFE4E280BFE4D280AFE6A2809FE502808FE4F2807FE4E2806";
    attribute INIT_1B of inst : label is "05A4CD5818054DCDC95B2815FE5A2814FE592813FE582812FE572811FE51280E";
    attribute INIT_1C of inst : label is "351809D0CD3A180F76CD3F18097CCD44180921CD49180667CD4E1805EFCD5318";
    attribute INIT_1D of inst : label is "8CCD17180A5ECD1C1807E0CD21180C22CD26180BBACD2B180B8CCD30180B2CCD";
    attribute INIT_1E of inst : label is "02FE0C2801FE800B3AC8B70F50CD03180F21CD08180E5ECD0D180CE3CD12180C";
    attribute INIT_1F of inst : label is "D3AF40D3083EC9800332800232AFC9800132800032AFC9800532800432AF1028";
    attribute INIT_20 of inst : label is "780406142802FE142801FE800B3AC980D3AF40D30A3EC980D3AF40D3093EC980";
    attribute INIT_21 of inst : label is "142802FE142801FE800B3AEA180206EE180006C980D37C40D3780480D37D40D3";
    attribute INIT_22 of inst : label is "FE0C2801FE800B3AEA180206EE180006C96780DB40D378046F80DB40D3780406";
    attribute INIT_23 of inst : label is "B3A0800C3A40D3073EF018101EFD06F618081EFE06C90477CD201EFB060E2802";
    attribute INIT_24 of inst : label is "18093EF618083EC980D37840D30A3E0C2802FE0C2801FE800B3AC980D3800C32";
    attribute INIT_25 of inst : label is "02FE0D2801FE800B3A1514131211100F0E0D0203050A070904080C01060B00F2";
    attribute INIT_26 of inst : label is "D3073EC90402CD04DDCD1206C903FACD04DDCD0906C9040ACD04DDCD24061228";
    attribute INIT_27 of inst : label is "F706C90477CD041EDF060E2802FE0C2801FE800B3AC980D3800C32B0800C3A40";
    attribute INIT_28 of inst : label is "DB40D30A3E0B2802FE0B2801FE800B3AC980D37840D3F018021EEF06F618011E";
    attribute INIT_29 of inst : label is "C021801432AF801332013E801122010021801032023EF318093EF718083EC980";
    attribute INIT_2A of inst : label is "80143A0412CD2B0435CD77023E0A2035801021C90486CD0F060458CD0412CD00";
    attribute INIT_2B of inst : label is "28B57C2B80112AC9AF0486CD471A283D0510CD77013E0D2035801321152800FE";
    attribute INIT_2C of inst : label is "0F060458CD0412CD008021801632103EC9FF3EEA18801432013EF11880112205";
    attribute INIT_2D of inst : label is "CD0080210320BB7D0720BA7C010011190004110435CD1A2835801621C90486CD";
    attribute INIT_2E of inst : label is "32083E801832013EC9FF3ED5180486CD4706283D0510CD801632103EC9AF0412";
    attribute INIT_2F of inst : label is "0040010435CD312801FE242800FE801A3AC90486CD00060458CD801A32AF8019";
    attribute INIT_30 of inst : label is "0412CD040021C9AF0486CD4723283D0510CD08360C20358019210412CD42EDB7";
    attribute INIT_31 of inst : label is "32801C320B3EC9FF3EE11834801A21E72035801821ED1834801A210486CD0F06";
    attribute INIT_32 of inst : label is "320E3E0486CD0F060458CD0412CD008A21802132802032AF801E22071821801D";
    attribute INIT_33 of inst : label is "06F0CD492001E63E2844FE80213A242802FE142801FE80203AC9800532AF8004";
    attribute INIT_34 of inst : label is "802021052005D60510CDEA180486CD47003680202105200FFE05C60510CDC9AF";
    attribute INIT_35 of inst : label is "21C1180220B70704CDC9FF3ECC2044FE80213AD32000FE80203A0486CD470036";
    attribute INIT_36 of inst : label is "ED13671A136F1A13801D321A801E5BEDC8B70704CDB51806CBCDBA1802368020";
    attribute INIT_37 of inst : label is "202134802121801D32013EC8B70704CDC90136802021348021210412CD801E53";
    attribute INIT_38 of inst : label is "8A0B008A01008A01C9AFC9FF3E032035801D21770B3E0C2035801C21C9023680";
    attribute INIT_39 of inst : label is "03006803008A0300A503008A0300A50300D00300A503008A03008A01008A0100";
    attribute INIT_3A of inst : label is "008A01008A01008A0B006803008A0300A503008A0300A50300D00300A503008A";
    attribute INIT_3B of inst : label is "8A01008A20008A01008A01008A0B008A01008A01008A0B008A01008A01008A0B";
    attribute INIT_3C of inst : label is "01008A01008A03008A03008A03008A01008A01008A03008A03008A03008A0100";
    attribute INIT_3D of inst : label is "3E8022320B3E008A20008A03008A03008A01008A01008A03008A03008A03008A";
    attribute INIT_3E of inst : label is "C90486CD0F060458CD0412CD011521802732802632AF8024220891218023320D";
    attribute INIT_3F of inst : label is "05C60510CDC9AF0869CD492001E63E2844FE80273A242802FE142801FE80263A";
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
