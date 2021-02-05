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
    attribute INIT_00 of inst : label is "FFFFC980D379CF78FFFFFFC920DB10D3FFFFFFC980DB40D301B3C30006800021";
    attribute INIT_01 of inst : label is "FBD9080041CD08D9FFFFFFFFE96F66237E6700CE7C6F8587FFFFC920D379D778";
    attribute INIT_02 of inst : label is "0606800021C9FC102377AF0C06800021C9006DCDBFCB007AF20928B7CF0E3EC9";
    attribute INIT_03 of inst : label is "005BCD801A3200000000C9772377AFC8005BCDC9907941F91023230528BE070E";
    attribute INIT_04 of inst : label is "005BCDAFFA10232128BE0206FA10231928BE0206007621801A3AC90036230428";
    attribute INIT_05 of inst : label is "0528005BCDAF58180138CD00CAFA04FE0528005BCDAFC900362377801A3A3A28";
    attribute INIT_06 of inst : label is "CD0138CDC971237019515F873D800021000E46801A2140180163CD00CAF204FE";
    attribute INIT_07 of inst : label is "27CD80002180173A57012FCD0127CD80062180183A1F28B780173A2D28B70163";
    attribute INIT_08 of inst : label is "0900064F873DC8B780002180173A061880062180183A0818010AF2BA012FCD01";
    attribute INIT_09 of inst : label is "1232012FCD80003AC97E094F0006098E21C97E0900064F873DC9702377801A3A";
    attribute INIT_0A of inst : label is "32018ECD801532012FCD801A3A801432012FCD80043A801332012FCD80023A80";
    attribute INIT_0B of inst : label is "1A3A801432012FCD800A3A801332012FCD80083A801232012FCD80063AC98017";
    attribute INIT_0C of inst : label is "F710234F019DF2B97E4F030680153A801221C9801832018ECD801532012FCD80";
    attribute INIT_0D of inst : label is "90002156EDF9F92084FE7C2370C979000EF910230C0628BE801221010E030679";
    attribute INIT_0E of inst : label is "DFCD02DBCD02D7CD02D1CD02CDCD02C9CD800F32800E32E7DF073F0177800C22";
    attribute INIT_0F of inst : label is "0205CA80003AB780013A801032013EF3F92880E6CF0F3EF92080E6CF0F3EFB02";
    attribute INIT_10 of inst : label is "031802ADCD0220CA80023AB780033A801032023EF30000FB0293CD031802ADCD";
    attribute INIT_11 of inst : label is "00FB0293CD031802ADCD023BCA80043AB780053A801032033EF30000FB0293CD";
    attribute INIT_12 of inst : label is "32053EF30000FB0293CD031802ADCD0256CA80063AB780073A801032043EF300";
    attribute INIT_13 of inst : label is "800B3A801032063EF30000FB0293CD031802ADCD0271CA80083AB780093A8010";
    attribute INIT_14 of inst : label is "103A800121E51920B7EF09BC2101E1C30293CD01E1C302ADCD028DCA800A3AB7";
    attribute INIT_15 of inst : label is "00064F3D80103A80002157C8B7EF0A1821C8B7C9E10136D11900165FD5873D80";
    attribute INIT_16 of inst : label is "060218090606180806C9DF000E0A060218090606180806C97023700128150909";
    attribute INIT_17 of inst : label is "090E02C9CD0328031F0316030D030402FBC9AFEF02EF213D80103AC9E7000E0A";
    attribute INIT_18 of inst : label is "CDC9033DCD090E02D7CDC90331CD240E02D1CDC90331CD120E02CDCDC90331CD";
    attribute INIT_19 of inst : label is "800F3AC9DF4F0706800E32B1800E3AC9033DCD240E02DFCDC9033DCD120E02DB";
    attribute INIT_1A of inst : label is "4FD7780361FA04FE80103AC9DFC9E70353FA04FE80103AC9E74F0706800F32B1";
    attribute INIT_1B of inst : label is "3AC9E707064F800F32B1A0800F3AC9DF07064F800E32B1A0800E3AC94FCF78C9";
    attribute INIT_1C of inst : label is "65CDFD1001C90365CDFE080103B703B003A903A2039B0394C9EF0388213D8010";
    attribute INIT_1D of inst : label is "103AC90372CDFB2001C90372CDFD1001C90372CDFE0801C90365CDFB2001C903";
    attribute INIT_1E of inst : label is "0365CDEF0201C90365CDF7010103F603EF03E803E103DA03D3C9EF03C7213D80";
    attribute INIT_1F of inst : label is "80103AC90372CDDF0401C90372CDEF0201C90372CDF70101C90365CDDF0401C9";
    attribute INIT_20 of inst : label is "C90365CDED0001C90365CDF600010435042E0427042004190412C9EF0406213D";
    attribute INIT_21 of inst : label is "FE80103AC90372CDDB0001C90372CDED0001C90372CDF60001C90365CDDB0001";
    attribute INIT_22 of inst : label is "FE80103AC9D704C6C9CF07C6043004FE80103AC9E74704C6C9DF4707C6053004";
    attribute INIT_23 of inst : label is "67873D0A3004FE80103AC9E7044CE74D478704D6C9DF044CDF4D47873D093004";
    attribute INIT_24 of inst : label is "21C9770220B7F104E2CDF5D004FEC967D77C6FD724678704D6C967CF7C6FCF24";
    attribute INIT_25 of inst : label is "0523051E05190514050F050A0505C977EF3D80103A0900064F81874F878704B2";
    attribute INIT_26 of inst : label is "0573056E05690564055F055A05550550054B05460541053C05370532052D0528";
    attribute INIT_27 of inst : label is "B47A6FB57B800C2AC9800C2267A47A6FA57B800C2AC9EF3D80103A04B2210578";
    attribute INIT_28 of inst : label is "CF11CD18FFF311D218FFFC11D718F3FF11DC18FCFF11E118FF3F11C9800C2267";
    attribute INIT_29 of inst : label is "18002011BC18000811C118000211C618080011CB18020011D018008011C818FF";
    attribute INIT_2A of inst : label is "1199180010119E18000411A318000111A818040011AD18010011B218004011B7";
    attribute INIT_2B of inst : label is "7EDD04F8C30030118018000C1185180003118A180C00118F18030011941800C0";
    attribute INIT_2C of inst : label is "FA01D6077EDD05A9C24600CBDD0177DD80423AC00135DDC9AF0589CDC8FFFE00";
    attribute INIT_2D of inst : label is "230660C21FFE0644CA1FE6477E0366DD026EDDC00035DD043CCD4F0777DD05A9";
    attribute INIT_2E of inst : label is "3A061D060705E9E9EB56235E0905D92100064F0F0F0F0FE0E6780374DD0275DD";
    attribute INIT_2F of inst : label is "DD804053ED56235E09069321000621CB4E0366DD026EDD063A063A063A063A06";
    attribute INIT_30 of inst : label is "026EDD0D180177DD8042327E09072B2100064E0366DD026EDD23180572DD0473";
    attribute INIT_31 of inst : label is "DD043CCD000E05ADC30374DD0275DD230366DD026EDD0777DD0677DD7E0366DD";
    attribute INIT_32 of inst : label is "C90077DDFD10070118013E47070707E0E6783718043CCD000E064ECDC9FF0036";
    attribute INIT_33 of inst : label is "DD79064EDD045CCDEB56235E090566DD046EDD00064F073D1FE678C1064ECDC5";
    attribute INIT_34 of inst : label is "CB06C706C306BF06BB06B706B3C90374DD0275DD230366DD026EDD043CCD0777";
    attribute INIT_35 of inst : label is "F3064E06AE0714078007F2086B06EF06EB06E706E306DF06DB06D706D306CF06";
    attribute INIT_36 of inst : label is "5D028102A702CF02FA03270357038A03C003F90436047604B90501054E059E05";
    attribute INIT_37 of inst : label is "F000FE010D011D012E014001530168017D019401AC01C501E001FD021B023B02";
    attribute INIT_38 of inst : label is "5F0065006B00710078007F0087008F009700A000AA00B400BE00CA00D600E300";
    attribute INIT_39 of inst : label is "2011076E2105060708090A0B0C1A1D21252C3442570047004C00500055005A00";
    attribute INIT_3A of inst : label is "64CD802A110764CD80221109130D210900064F81874F8780433AB0ED00180180";
    attribute INIT_3B of inst : label is "010100000000000001010000000000000101C91323127E076BCD127E80321107";
    attribute INIT_3C of inst : label is "C24600CBDD0177DD80663AC00135DDC9AF0791CDC8FFFE007EDD000000000000";
    attribute INIT_3D of inst : label is "CA1FE6477E0366DD026EDDC00035DD043CCD4F0777DD07B1FA01D6077EDD07B1";
    attribute INIT_3E of inst : label is "EB56235E0907E12100064F0F0F0F0FE0E6780374DD0275DD230868C21FFE084C";
    attribute INIT_3F of inst : label is "09089B21000621CB4E0366DD026EDD084208420842084208420825080F07F1E9";
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
