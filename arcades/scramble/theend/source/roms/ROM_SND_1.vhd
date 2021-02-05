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
    attribute INIT_00 of inst : label is "3A0486CD470036802621052005D60510CDEA180486CD47003680262105200FFE";
    attribute INIT_01 of inst : label is "CDBA180236802621C1180220B7087DCDC9FF3ECC2044FE80273AD32000FE8026";
    attribute INIT_02 of inst : label is "210412CD802453ED13671A136F1A138023321A80245BEDC8B7087DCDB5180844";
    attribute INIT_03 of inst : label is "802221C9023680262134802721802332013EC8B7087DCDC90136802621348027";
    attribute INIT_04 of inst : label is "01150101150101150B011501011501C9AFC9FF3E032035802321770B3E0C2035";
    attribute INIT_05 of inst : label is "A003014A0301150300D003011503014A03011503014A0301A003014A03011503";
    attribute INIT_06 of inst : label is "0101150101150B01150101150101150B00D003011503014A03011503014A0301";
    attribute INIT_07 of inst : label is "2A32083E802932203E01152001150101150101150B01150101150101150B0115";
    attribute INIT_08 of inst : label is "0486CD100604EBCD050ACD20060C3E050ACD00060B3E802C32AF802B32FF3E80";
    attribute INIT_09 of inst : label is "CD09060D3EC9AF2C2835802B21162801FE0C2800FE802C3A050ACD1206063EC9";
    attribute INIT_0A of inst : label is "AFDA18802C32023E072035802A2177203EEA2035802921F018802C32013E050A";
    attribute INIT_0B of inst : label is "35802E21C90486CD0F060458CD0412CD00F021802E32103EC9FF3ED418802C32";
    attribute INIT_0C of inst : label is "7D0720BA7C00101152ED000811B70435CD0486CD4720283D0510CD77103E0D20";
    attribute INIT_0D of inst : label is "3332AF8032320C3E803132053E803032083EC9FF3EC9AF0412CD00F0210320BB";
    attribute INIT_0E of inst : label is "FE272802FE262801FE182800FE80333AC90486CD00060458CD0412CD00502180";
    attribute INIT_0F of inst : label is "180486CD473480332104200FFE3C0510CDC9AF803332AF322835803221332803";
    attribute INIT_10 of inst : label is "3021C9FF3ED2180A2BCDD7180486CD473480332104203D0510CDE7180A1ECDEC";
    attribute INIT_11 of inst : label is "32013E803532083EC93480332177053EC035803121C93480332177083EC03580";
    attribute INIT_12 of inst : label is "393AC90486CD0F060458CD0412CD011521803A32803932AF8037220003218036";
    attribute INIT_13 of inst : label is "0FFE05C60510CDC9AF0AE7CD492001E63E281CFE803A3A242802FE142801FE80";
    attribute INIT_14 of inst : label is "80393A0486CD470036803921052001D60510CDEA180486CD4700368039210520";
    attribute INIT_15 of inst : label is "0AC2CDBA180236803921C1180220B70AFBCDC9FF3ECC201CFE803A3AD32000FE";
    attribute INIT_16 of inst : label is "803A210412CD803753ED13671A136F1A138036321A80375BEDC8B70AFBCDB518";
    attribute INIT_17 of inst : label is "2035803521C9023680392134803A21803632013EC8B70AFBCDC9013680392134";
    attribute INIT_18 of inst : label is "080021803E32AF803D32203E803C32403EC9AFC9FF3E03203580362177083E0C";
    attribute INIT_19 of inst : label is "52ED002011B70435CD292801FE202800FE803E3AC90486CD0F060458CD0412CD";
    attribute INIT_1A of inst : label is "D718803E32013EDE2035803C21C9AF0412CD0800210320BB7D0720BA7C020011";
    attribute INIT_1B of inst : label is "005021804032053EC9FF3EC2180486CD4706283D0510CD77203ED12035803D21";
    attribute INIT_1C of inst : label is "C9AF0486CD4706283D0510CD05360C2035804021C90486CD0F060458CD0412CD";
    attribute INIT_1D of inst : label is "2800FE80443AC90486CD00060458CD804432AF804332033E804232043EC9FF3E";
    attribute INIT_1E of inst : label is "47232803D60510CD03360D20358043210412CD09B70020010435CD312801FE24";
    attribute INIT_1F of inst : label is "34804421E72035804221ED18348044210486CD0F060412CD001021C9AF0486CD";
    attribute INIT_20 of inst : label is "86CD00060458CD0412CD001021804832AF804732203E804632023EC9FF3EE118";
    attribute INIT_21 of inst : label is "358047211F2801FE112800FE80483A0412CD230435CD0236092035804621C904";
    attribute INIT_22 of inst : label is "203D0510CDEC180486CD473480482104200FFE3C0510CDC9AF00368048212928";
    attribute INIT_23 of inst : label is "020021804B32AF804C22040021804A32033EC9FF3EDC180486CD473480482104";
    attribute INIT_24 of inst : label is "7C804C5BED190020110435CD03362E2035804A21C90486CD0A060458CD0412CD";
    attribute INIT_25 of inst : label is "C9AF0412CD020021804B32FF3E804C220800211520B7804B3A1420BB7D1820BA";
    attribute INIT_26 of inst : label is "CD00060458CD805132805032AF804F32103EEA18804B32AF804C22040021C9AF";
    attribute INIT_27 of inst : label is "FE0D7ACA04FE0D6FCA03FE0D69CA02FE0D5ECA01FE0D51CA00FE80513AC90486";
    attribute INIT_28 of inst : label is "CA0BFE0DAFCA0AFE0DA9CA09FE0D9ECA08FE0D98CA07FE0D8DCA06FE0D80CA05";
    attribute INIT_29 of inst : label is "0DF6CA11FE0DEBCA10FE0DDECA0FFE0DD8CA0EFE0DCDCA0DFE0DC7CA0CFE0DBC";
    attribute INIT_2A of inst : label is "0DCD0D4FC3348051210412CD0BE721C9AF00368051210E07CA13FE0DFCCA12FE";
    attribute INIT_2B of inst : label is "0D4FC30E21CD0D4FC301368050210E17CD0D4FC30E21CD0D4FC305368050210E";
    attribute INIT_2C of inst : label is "17CD0D4FC30E21CD0D4FC305368050210E0DCD0D4FC3348051210412CD0A0021";
    attribute INIT_2D of inst : label is "210E0DCD0D4FC3348051210412CD0A99210D4FC30E21CD0D4FC301368050210E";
    attribute INIT_2E of inst : label is "3B210D4FC30E21CD0D4FC301368050210E17CD0D4FC30E21CD0D4FC305368050";
    attribute INIT_2F of inst : label is "210E17CD0D4FC30E21CD0D4FC305368050210E0DCD0D4FC3348051210412CD0B";
    attribute INIT_30 of inst : label is "348051210486CD0006C9348051210486CD0A060D4FC30E21CD0D4FC301368050";
    attribute INIT_31 of inst : label is "3E805553ED000111805322014021C934805121C0358050211036C035804F21C9";
    attribute INIT_32 of inst : label is "5B3AC90486CD00060458CD805B32AF805A32805932403E805832203E80573203";
    attribute INIT_33 of inst : label is "5932805A3A112035805921702804FE4F2803FE402802FE312801FE292800FE80";
    attribute INIT_34 of inst : label is "FE02C60510CDF21834805B210412CD80532AC9AF805B32AF805553ED00011180";
    attribute INIT_35 of inst : label is "CC1834805B210412CD52ED80555BEDB70435CDDF180486CD4734805B21042008";
    attribute INIT_36 of inst : label is "21AD1834805B212036082035805821805553ED1380555BED03360B2035805721";
    attribute INIT_37 of inst : label is "53ED00011180532201202197180486CD4734805B2104203D0510CDA71835805B";
    attribute INIT_38 of inst : label is "0486CD00060458CD805B32AF805A32805932303E805832203E805732033E8055";
    attribute INIT_39 of inst : label is "805932203E805832203E805732033E805553ED0001118053220100210E5EC3C9";
    attribute INIT_3A of inst : label is "5F32AF805E32033E805D32103E0E5EC3C90486CD00060458CD805B32AF805A32";
    attribute INIT_3B of inst : label is "0FAACD08200AFE805F3AC90486CD0F060458CD0412CD0115218060220FE32180";
    attribute INIT_3C of inst : label is "805E32013EC8B70FAACDC9FF3EF0180F96CDF5180FBECD052801E6C9AF1020B7";
    attribute INIT_3D of inst : label is "AACDC9AFC9FF3E032035805E2177103E0C2035805D21C90486CD000634805F21";
    attribute INIT_3E of inst : label is "CD0F0634805F210412CD806053ED13671A136F1A13805E321A80605BEDC8B70F";
    attribute INIT_3F of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFF00A50800D00101150300D008011501C90486";
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
