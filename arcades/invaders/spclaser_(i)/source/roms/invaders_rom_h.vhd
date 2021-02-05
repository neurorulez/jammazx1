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
    attribute INIT_00 of inst : label is "554F4520414B414E4320300080C306D3483835353120C9FB4520414B410040C3";
    attribute INIT_01 of inst : label is "3239010D483835353120554F4520414B414E432030383239010D483835353120";
    attribute INIT_02 of inst : label is "32205032AF1C40CD0400CD016FCD015ACD22C0310043C240FE7C230036200021";
    attribute INIT_03 of inst : label is "010D483835353120554F450070C3FB00205832205932093E205232205A322051";
    attribute INIT_04 of inst : label is "D2CD00D7CD00E1CD009EC300E1CD00D7CD0098DA0F7E34201E2100BCC30F99CD";
    attribute INIT_05 of inst : label is "7E204721C9FB0780CD0759CD0A34CCA720503A0AF8CD017FCD0309CD0BEECD06";
    attribute INIT_06 of inst : label is "0665CD0614CD0411CD1400C303D377EFE67E204E211400C300CBCA351400CAA7";
    attribute INIT_07 of inst : label is "02C802606002A002305802B002485002E0027848C90009D9CD0988CD07A7CDC9";
    attribute INIT_08 of inst : label is "909802B8025890028802408802B802A880027802207802E80248700298022868";
    attribute INIT_09 of inst : label is "18181800007E183C66663C187E0002900230B002E00250A802B80270A002E802";
    attribute INIT_0A of inst : label is "00EC11210021000000000000000000000000925428C62854920000187E7E243C";
    attribute INIT_0B of inst : label is "3AC9218B32AF218A32073E218122210021C921C032AF0160C247FE7D2313771A";
    attribute INIT_0C of inst : label is "812A204E3203D3F7E6204E3A21C032AF019EC321C0320190CA3D019ECAA721C0";
    attribute INIT_0D of inst : label is "01E0C2A721833A34218B212189327E218722232186327E218422232183327E21";
    attribute INIT_0E of inst : label is "C977AF019EC2BE218B21218A3A21812221002101D0C246FE7D1921812A000511";
    attribute INIT_0F of inst : label is "FE7E34218C2134218D21022FC2A721863A218D32218C32AF218E320FE621833A";
    attribute INIT_10 of inst : label is "2184222186327E232321842A01C0C377AF21812A0211C202FE218D3A0214C202";
    attribute INIT_11 of inst : label is "014621025EC30255DA023DCA01FE21893A01EFC32187222189327E232321872A";
    attribute INIT_12 of inst : label is "8E3A0274C3218F220150210274C321C0320A3E204E3203D308F6204E3A218F22";
    attribute INIT_13 of inst : label is "CD0285C2A7218E3A219132AF218F22013C210274C3218F22013221026EC2A721";
    attribute INIT_14 of inst : label is "2929292900266F21863A20064F1FE60F0F0F21833A02EAC3028BCD02BBC3028B";
    attribute INIT_15 of inst : label is "01FE21893AC902AAC20AFE2191323C21913A0913771A002001EB218F2AEB0929";
    attribute INIT_16 of inst : label is "C377AF21872A01FAC3773C01FAC377183E02D5C2FFFE7E21842A02E2DA02DACA";
    attribute INIT_17 of inst : label is "FF3E0304C216FE7E21842A02E2DA02DACA01FE21893A01FAC377AF21842A01FA";
    attribute INIT_18 of inst : label is "072121A022200621C9032FC2A7202C3A0318C2A7200D3A01FAC3773D01FAC377";
    attribute INIT_19 of inst : label is "A02A0324C321A222202A2121A022202921C9202C32200D32AF033ECD21A22220";
    attribute INIT_1A of inst : label is "A422021401C9034EC2A77919035BCAB87E0D0E0E00051121002147F8E63C7E21";
    attribute INIT_1B of inst : label is "23013EC90367C20D3C0206036BC2052323037DCABE2321A42A0AD67E21A22A21";
    attribute INIT_1C of inst : label is "2929292900266F21863A20064F1FE60F0F0F21833A02EAC3028BCD02BBC3C977";
    attribute INIT_1D of inst : label is "01FE21893AC902AAC20AFE2191323C21913A0913771A002001EB218F2AEB0929";
    attribute INIT_1E of inst : label is "C377AF21872A01FAC3773C01FAC377183E02D5C2FFFE7E21842A02E2DA02DACA";
    attribute INIT_1F of inst : label is "FF3E0304C216FE7E21842A02E2DA02DACA01FE21893A01FAC377AF21842A01FA";
    attribute INIT_20 of inst : label is "20023A0565C2A720003AC0A7200C3AC90408C2052313771A0E70112000215006";
    attribute INIT_21 of inst : label is "3B3A0503CA10E601DBC0A720143A04D9CAA720503A0470C2A720013A0507C2A7";
    attribute INIT_22 of inst : label is "06FFCD200132013E0507DA05FE20083A0C04CD203832AF203B322F0507C2A720";
    attribute INIT_23 of inst : label is "20062A055ACD0A20CD2005323C20053A203332200532003E20073207C6200A3A";
    attribute INIT_24 of inst : label is "0549C2A67A04F6DABB263E04F6DABB20083A5F20053A0F164F20303A06ADCDEB";
    attribute INIT_25 of inst : label is "0A20CD055ACA0D77B67AE1C104CFC2A77E09FFC00104CFC2A77E09002001C5E5";
    attribute INIT_26 of inst : label is "3821203632013E048AC3F0160549C3E1C10488C32304D4D20F2005323C20053A";
    attribute INIT_27 of inst : label is "0A2ACD2005323D20053A0519C3053AD2052BCA0001FE7E2039210449C2A77E20";
    attribute INIT_28 of inst : label is "06ADCDEB20092A053ADA07052BDA070701DB04E6CAA720503A203B32AF054FC3";
    attribute INIT_29 of inst : label is "CA30FE200A3A0519C3200A323C0519CAE0FE200A3AC906C4CD0F06EB20152AEB";
    attribute INIT_2A of inst : label is "C6878720053A20193220323A200C32013E200B3277B67A0519C3200A323D0519";
    attribute INIT_2B of inst : label is "A0CAA72004323D20043A0743CD200332053EC0A72003323D20033AC920063237";
    attribute INIT_2C of inst : label is "0525C3D106ADCDE5EB20092AEB6F8520152A0707070720103201E63C20103A05";
    attribute INIT_2D of inst : label is "05E1CAA720503A05CFCAF11107CDF5201A323D201A3A074ECD05E1CAA720503A";
    attribute INIT_2E of inst : label is "83CD0AB6CD205832123E205732201D322F0070C322C0311558CD015ACD0A74CD";
    attribute INIT_2F of inst : label is "278520243A20202AC8A720503A05C0C3220132AF074ECD003623003620502113";
    attribute INIT_30 of inst : label is "41DA25FE20053AC8A7200B3AC91055CD20202200002120242267278C20253A6F";
    attribute INIT_31 of inst : label is "5EC3202132201032013E2017220E3021200432163E2003320A3E201432013E06";
    attribute INIT_32 of inst : label is "32AF2020327E064DC20D0404040423065ADAB820053A0E5021090701200D3206";
    attribute INIT_33 of inst : label is "1F4720053AAF06ADCDEB20062AC0A72019323D20193AC8A7200C3A05F3C3200B";
    attribute INIT_34 of inst : label is "20333A200F32AF2008329020083A0738CD200132200C320682C23D2B003600CE";
    attribute INIT_35 of inst : label is "061FE60F0F0F7B0920000129292929296A0026C9200E322780200E3A479BC62F";
    attribute INIT_36 of inst : label is "202D3220313AC0202D323D202D3AC906C4C205C109002001C513771AC9094F00";
    attribute INIT_37 of inst : label is "3A070FC3200F32AF070ADA200E322701C6200E3A2008323C0712CA64FE20083A";
    attribute INIT_38 of inst : label is "C6202E3A202B323CC864FE202B3A0FBFCD200F32013EC903D3204E3201F6204E";
    attribute INIT_39 of inst : label is "204E32FEE6204E3AC9000000202F32013E0734C3202F32AF072FDA202E322701";
    attribute INIT_3A of inst : label is "253AC0A720453AC903D3204E32FBE6204E3AC903D3204E3204F6204E3AC903D3";
    attribute INIT_3B of inst : label is "C9204532013E204732803E03D3204E3210F6204E3A1107CD34201A21D805FE20";
    attribute INIT_3C of inst : label is "4732803E03D3204E3210F6204E3A111ACD34201B21D805FE20273AC0A720463A";
    attribute INIT_3D of inst : label is "03C2A720023A0894C2A720013A0905C2A720143AC0A720283AC9204632013E20";
    attribute INIT_3E of inst : label is "AF203C322F0894C2A7203C3A0890CA10E602DB0879C2A720363AC0A720003A08";
    attribute INIT_3F of inst : label is "200532003E202A3207C620133A06FFCD200232013E0894DA05FE202B3A224B32";
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
