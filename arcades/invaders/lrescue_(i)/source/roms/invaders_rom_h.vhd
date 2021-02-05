-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_H is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_H is

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
    attribute INIT_00 of inst : label is "0A4BCD3520C02120BE32803EE5D5C5F50005E7C3E5D5C5F50000164BC3000000";
    attribute INIT_01 of inst : label is "32AF0AACCD20EB322701C6003ED209FE20EB3A0042CAA720EA3A0066DA0F01DB";
    attribute INIT_02 of inst : label is "00000EE6C2A721BF3A006BC2A720EB3A0EE6C2A720EF3A0060C2A720E93A20EA";
    attribute INIT_03 of inst : label is "BDCD01A4CDFB24003108DCCD013E0060C2A720583A003FC3013EC9FBF1C1D1E1";
    attribute INIT_04 of inst : label is "052ACD0B6A110189C2140E4A97CD3D20EB3A06D3052ACD040E1D50113013210A";
    attribute INIT_05 of inst : label is "FC2220F8224C18CD0AACCD20EB32278020EB3A20EE32AF9906008ECA04E601DB";
    attribute INIT_06 of inst : label is "E5220101214CACCD0598CD01A4CD4900CD200648C5CD02EACD02DFCD02D4CD20";
    attribute INIT_07 of inst : label is "79CD0261CD01CACD02F2CD000000000002D4CD49E3CD028FCD4C4CCD47B4CD20";
    attribute INIT_08 of inst : label is "06D302FE20283A0123C21012CD010ACA06D3A720273A1F78CD01A9CD0246CD02";
    attribute INIT_09 of inst : label is "201D22090185C4140001FEFE202C3A202D2A0000000430CD00362029210113C2";
    attribute INIT_0A of inst : label is "0362C2A77E205D2104AAC2A77E2014214C30C2A77E205E2101362013210D6DCD";
    attribute INIT_0B of inst : label is "CD4C05CD0D9DCCA720163A0D58D4B0FE201D3A027FDCB0FE201D3A06D30C77CD";
    attribute INIT_0C of inst : label is "3E9806008EC300A7DA0F019DDA0F0F01DB052ACD0B5511C91000010148C3487B";
    attribute INIT_0D of inst : label is "E101B7C20D1B2B771AE5C5C9000000000000C920E932AF01AAC3013E00AAC301";
    attribute INIT_0E of inst : label is "210C1BCD0A03012405210C1BCD180301189111240221C901B5C205C109002001";
    attribute INIT_0F of inst : label is "D5183111170E27022101B5CD0A030118F6113EC72101B5CD18030118D8113D04";
    attribute INIT_10 of inst : label is "0E002E1722CD020CC20DC10A00CD0806C519EB111D5BC30DD1C10A00CD0806C5";
    attribute INIT_11 of inst : label is "69677E234E2356235E23477FE67EC5E5C90221C20D190005110230C480E67E06";
    attribute INIT_12 of inst : label is "0252C20DC10A00CD1006C5181711270121004BCAC3AC2E1722CDC9E1C10A00CD";
    attribute INIT_13 of inst : label is "3A0DA9C31A1311C90266C20DC12424E10A00CD0506E5C519F3110E0E251C21C9";
    attribute INIT_14 of inst : label is "E51A0B11C53B1B21C8A7794EAE2E1722CD0D6DC30136C0A77E202621C8A72013";
    attribute INIT_15 of inst : label is "1BBE1A20F51123058CCDC9000000C9000000C9029BC20DC12525E10A00CD0806";
    attribute INIT_16 of inst : label is "060B04C32000211AA311C0064700C3127E2313127ED0BE02CBC3D002C9CA1A2B";
    attribute INIT_17 of inst : label is "562E70402E1722CD70202921010602E4C3220021C0060B04C31BA311210021C0";
    attribute INIT_18 of inst : label is "70882E707C2E7020702170902E70702E1722CD70202921010602F4C30006C970";
    attribute INIT_19 of inst : label is "100301201D2A4914CD4A9DCD00362013210302CD0321CD01A4CD0309C30006C9";
    attribute INIT_1A of inst : label is "C34919CD0348C20DC105D5CD083E0C18CD100201201D2AC51A2311040E0C30CD";
    attribute INIT_1B of inst : label is "C320C63AC8A720EF3A1EC6C34B42CD04B0CA0035AC2E4AA5C300000326CD05CB";
    attribute INIT_1C of inst : label is "7EA02EE1028FCDE534AE2E1722CD1FB9C30321CD4F22CD4C74CD003600000A44";
    attribute INIT_1D of inst : label is "CBCD4CA4CD4F0ACDEB56235EA22E1722CD05CBCD040ECC06FE7EAE2E03D4CAA7";
    attribute INIT_1E of inst : label is "C8A7793D1B210000C905CBCD02E4CDAA06002E34AF2E34AB2E1722CD4CB5CD05";
    attribute INIT_1F of inst : label is "D5CD103E4F0ACD49F5CDE50000004942CD0A34CD1006C503E1C206D33D252500";
    attribute INIT_20 of inst : label is "0000004D00CD05B3CD100E1EAD112A1421C5C903E9C20DC1000000000000E105";
    attribute INIT_21 of inst : label is "4A110446D425062104FE7E2D2E1722CDC9C10000004F0ACD0050210000000000";
    attribute INIT_22 of inst : label is "00000000000000000010283E00023E002A3E003E083EC93D06210A00C30D0604";
    attribute INIT_23 of inst : label is "A0220101210629C2A720AE3A0DD2CD00362013210302CD003600000000000000";
    attribute INIT_24 of inst : label is "2A01362016210307CD0136201B2101362013211683CD0481C206D3A720A13A20";
    attribute INIT_25 of inst : label is "CD01A4CD20EE32AF000002D4CD02B6CD0158C30467CD000A34C347209D3A209E";
    attribute INIT_26 of inst : label is "4CF8CD4CC0CD470AC4A720E33A4B97CD05B3CD0A0E4B63112D13210321CD0302";
    attribute INIT_27 of inst : label is "0002CBC3D002C9CA1A2B1BBE1A20F51123058CCD1673C301A9CD05CBCD4B86CD";
    attribute INIT_28 of inst : label is "2346234EC9FB0510C2050512C20D000E0A0605D378F300000000000000000000";
    attribute INIT_29 of inst : label is "0A00CD06D305060B9BCDC9052AC20D13D10536CDD51A020EC977867823778679";
    attribute INIT_2A of inst : label is "7EE1EB20F22AE520F132AFC8A720F13A058CCDC9C1097709770900200177AFC5";
    attribute INIT_2B of inst : label is "F10587CD0FE60F0F0F0FF5D57B0574CD7A6F66237E235777278A7E235F772783";
    attribute INIT_2C of inst : label is "E5DF061C0E240121C920FC21D820F8210F20C63A0536C31CC6C9D10587CD0FE6";
    attribute INIT_2D of inst : label is "C03A20C032073ED10536CD1AD5C9059DC20D23E1C105A1C205190020110036C5";
    attribute INIT_2E of inst : label is "D8C206D3A720C03A20C03205D5C3803E05D5C3403EC905B3C20D1305BEC23D20";
    attribute INIT_2F of inst : label is "C220CB21010610E6037CCD0616C406E601DB0E8CCAA720DC3A0000000000C905";
    attribute INIT_30 of inst : label is "22000021C920E132013E0060C320D9222320D92A7000062B060BC223A77E060B";
    attribute INIT_31 of inst : label is "D5C3053E05D5C3203E00000000000362C3E1C8A720EF3A06A0C30842CDC920CB";
    attribute INIT_32 of inst : label is "CD1A0608C21120CB21C9E1C90644C2050644C20D0655CA60E6037CCD06500105";
    attribute INIT_33 of inst : label is "CD2710210704CD1C5B11271221052ACD170E271721089A110000000000000B04";
    attribute INIT_34 of inst : label is "052ACD2A0621100E08B1110A00CD2806094311330E210706CD050E270E210704";
    attribute INIT_35 of inst : label is "85CC20FE072FCC40FE60E6037CCD0716CD0878D220FE20DA3A0878CAA720DC3A";
    attribute INIT_36 of inst : label is "06A0C21DFE20DA3A071ECD0726CD01300107CFC2A720CC3A0878C2A720E13A07";
    attribute INIT_37 of inst : label is "E2C205C1063CCD052ACD040E2A062108B111063CCD09EBCD20062A0621C50506";
    attribute INIT_38 of inst : label is "DD2A0536C32A3E20DD2AC90706C20DC109016001C50A00CD05060B0E06A0C306";
    attribute INIT_39 of inst : label is "0FFE0760CA11FE7D20DD2A071ECD0641CDC90726C2050726C20D0536C31B3E20";
    attribute INIT_3A of inst : label is "0716C320DD22360D21071ECD075AC30754D235FE7C24240774CA33FE7C0769CA";
    attribute INIT_3B of inst : label is "21075AC3270F210749C33426075AC32424077FD23BFE7C076FC30779D23BFE7C";
    attribute INIT_3C of inst : label is "FE07C3DA28FE7C07BACA0FFE07A9CA11FE7D20DD2A071ECD0641CD075AC3270D";
    attribute INIT_3D of inst : label is "07C9DA28FE7C075AC3271121075AC3252507B4DA28FE7C07AFC3332607AFC234";
    attribute INIT_3E of inst : label is "20DD3A085DD20AFE20DB3A0726CD20FF01075AC33B1121075AC33B0F2107AFC3";
    attribute INIT_3F of inst : label is "083BCD06A0C30842CD16C6083BCD080BD232FE20DE3A0803CA0FFE07FDCA11FE";
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
