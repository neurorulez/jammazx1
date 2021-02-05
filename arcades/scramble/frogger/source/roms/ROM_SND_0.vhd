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
    attribute INIT_00 of inst : label is "FFFFFFFFFF017CC3FFFFFFFFFF01B7C3FFFFCA40D37880D3020BC34000220005";
    attribute INIT_01 of inst : label is "0D3DE6006E22DA08FFFFCAFF3D0160C3FFFFFFFFFF013CC3FFFFFFFFFF01C7C3";
    attribute INIT_02 of inst : label is "7938200FE5793E18790328B77A0728AA794F0FE5C70220FFFD572B28B701C2CE";
    attribute INIT_03 of inst : label is "CACF3F05073DFC1023774040220505CAFB08DA1318BFCB2D287FCB07070711C5";
    attribute INIT_04 of inst : label is "E5CED800E5CE404531CAFE101A000112403D2247CA772377AF008CCED000E5CE";
    attribute INIT_05 of inst : label is "0201CE404539404A310201CE4044394F0201CE404139470201CE404039383800";
    attribute INIT_06 of inst : label is "4539008CCE7B1C0228BA1C0628B8021DD0BB790238B97A0238BA7855404A225F";
    attribute INIT_07 of inst : label is "7A003523CAAF0128BD23230C0828BD23230C0D28BD404022020DCA0035237740";
    attribute INIT_08 of inst : label is "3D016ECE003F1255EE4180313EFAFA2044D57C2370CA7D1A00155F018322CA37";
    attribute INIT_09 of inst : label is "01C2CE0F3D34403F22FB77404D21600022CF3F05073DCF093DCF0A3DCF000508";
    attribute INIT_0A of inst : label is "FB02E8CE7D3028B72B7D404222404B31023DF3F72808E501C2CE0F3DF72008E5";
    attribute INIT_0B of inst : label is "40462234404B22F3000000FB02E8CE7D2228B72B7D40432234404B22F3000000";
    attribute INIT_0C of inst : label is "155F879A1802DACE7DDE1802DACE7DCD1802DACE7DAB1802E8CE7D1128B72B7D";
    attribute INIT_0D of inst : label is "B0078D078B077F0B67048E0B9E14661481045E03BE030F019CEAEB55235D1A00";
    attribute INIT_0E of inst : label is "39029ECE02A722053E06C31023060600000B5E0B530B3B05EB10160B8C09C409";
    attribute INIT_0F of inst : label is "A71471148C047603D103330033A91802F322E6012622C8B7CA7723008CCE404B";
    attribute INIT_10 of inst : label is "2E061C00000B600B550B4C070D10250B9509C709BE079E079707920B8F04A90B";
    attribute INIT_11 of inst : label is "3E404B39CACF000507C5C803E5404B390084C3404B39019CCEC8B7056206E610";
    attribute INIT_12 of inst : label is "CA6740DB80D378046F40DB80D347873E404B39CA40D37C80D37804030ACE4787";
    attribute INIT_13 of inst : label is "C5404B39CA40D3404C31B3A1404C3980D3073DF91003CB01CB47404B397F0412";
    attribute INIT_14 of inst : label is "47404B39171502080A0112110315040F10131416050C0D07180E090600CACF07";
    attribute INIT_15 of inst : label is "1807C5C803E5404B39CACFAD18FB801217180130CE016ECEFF155FFE1007843D";
    attribute INIT_16 of inst : label is "3F120B1800CB00CBF3150838162801FD404B39FCFF12000002CA4740DB80D300";
    attribute INIT_17 of inst : label is "0201C9C3030002CA77404D216FB2A37E67B0A17C404D291ACB38CB1ACB38CBFF";
    attribute INIT_18 of inst : label is "023D7723143D7723033D77406022203DE7CA40D37E80D3C218010002C5180200";
    attribute INIT_19 of inst : label is "3803FD1F2802FD0E28A7406439CADF0A05F7EF202D4066210010227723AF7723";
    attribute INIT_1A of inst : label is "21030022F518344064226618DF4704283ED720356F20364060220572C34A282B";
    attribute INIT_1B of inst : label is "6122EF51EE000812B7014ECE03354A20364062224F1834406422DF0805EF4067";
    attribute INIT_1C of inst : label is "40672151EE002012406729B702351E20364063222F1834406422143537203640";
    attribute INIT_1D of inst : label is "31803DCAAF36406422406621EC184067290C18344064220B20B47E2B406629EF";
    attribute INIT_1E of inst : label is "FD3928FFFD2628405E313E405E39CA0304CEF7013CCE007022017CCE0D05405E";
    attribute INIT_1F of inst : label is "CAAF017CCE0B05013CCE003C22CA017CCE0005CAAF013870FD0C3830FD093820";
    attribute INIT_20 of inst : label is "405D313E405D39CA405E31AFF7013CCE00FC22017CCE0905405D31803D0304CE";
    attribute INIT_21 of inst : label is "405E31AFEF2C2C014ECE1228B70D2840FDCA405E31AFEF2E2E014ECE0B3842FD";
    attribute INIT_22 of inst : label is "01C7CECAFF3D041AC3405D31803D013CCE000022DF0F2806D70433C3DF06D7CA";
    attribute INIT_23 of inst : label is "FF3DB67C4230212B423029CA423021019022017CCE0905013CCE0200220160CE";
    attribute INIT_24 of inst : label is "7331AF427131103D4272310C3D427031083DE7CAAF013CCE1A000312014ECEC8";
    attribute INIT_25 of inst : label is "FF3D364271222C28213803FD222802FD1728A7427339CADF0005F7EF00502242";
    attribute INIT_26 of inst : label is "732204203ED7EB1804EBCEF018DF473442732204200EFD3CD7CAAF427331AFC8";
    attribute INIT_27 of inst : label is "770C3DC036427222CA3442732277083DC036427022D91804F8CEDF18DF473442";
    attribute INIT_28 of inst : label is "FD427839CA427831AF427631083DDF0505F74275210200220304CECA34427322";
    attribute INIT_29 of inst : label is "75211A427529FFF0120835152036427622752804FD6A2803FD482801FD342802";
    attribute INIT_2A of inst : label is "3D0635ED20364276221118023D44427631203DCAAFEF033838FD7E0620A77C42";
    attribute INIT_2B of inst : label is "75211A427529FFFC120535D52036427622CAAFDF427831427521010500602203";
    attribute INIT_2C of inst : label is "6022043D0435B22036427622D618033D44427631303DC03030FD7EC620A77C42";
    attribute INIT_2D of inst : label is "893880FD7E8F28A77C4275211A4275290010120435A02036427622C218040500";
    attribute INIT_2E of inst : label is "7CCE0405CF1805053D01B0CE68352304352304352304352377421022AF0606C3";
    attribute INIT_2F of inst : label is "017CCE00050435C036421122102847CB421039CAAF06EECE051CCECA01C7CE01";
    attribute INIT_30 of inst : label is "36421422CA421031AA421039020D017CCE474213390435C0364212221018020D";
    attribute INIT_31 of inst : label is "203DE7CA3EE2C03C7D36CADF28010DBD073D340A204FCB4210394213226835C0";
    attribute INIT_32 of inst : label is "DF0A05F7EF202D42E6210010220035237723023D7723143D7723033D7742E022";
    attribute INIT_33 of inst : label is "47CA3E41A631AFCAAFDF4704283ED74A282B3803FD1F2802FD1C28A742E439CA";
    attribute INIT_34 of inst : label is "4A203642E2224F183442E422DF0805EF42E721030022F618AF3442E4226518DF";
    attribute INIT_35 of inst : label is "1E203642E3222F183442E422143537203642E122EF51EE000812B7014ECE0335";
    attribute INIT_36 of inst : label is "42E7290C183442E4220B20B47E2B42E629EF42E72151EE00201242E729B70235";
    attribute INIT_37 of inst : label is "7CCE0E05428431003D4281210A2422428021005022CAAF3642E42242E621EC18";
    attribute INIT_38 of inst : label is "47CB4284394728003DB67C4280212B428029CA01C7CE0160CE013CCE00502201";
    attribute INIT_39 of inst : label is "AF04284FCB428439000912014ECE2618017CCE0E052435C0364281220D28003D";
    attribute INIT_3A of inst : label is "428431AA428439020D017CCE470A35C036428322075ACE010D013CCE1A3D51EE";
    attribute INIT_3B of inst : label is "E7CAFF3D017CCE0005CAD5CB428422017CCE000505EBCE0D2055CB428422CAAF";
    attribute INIT_3C of inst : label is "9022DE0418418822DE0918418022DECAF7E7CAF7E70A62C3F741A33141C831AF";
    attribute INIT_3D of inst : label is "77DE41A139C00236DECAFF3D41A53141A631AFCAAF07B7CE0628FFFD007DDE41";
    attribute INIT_3E of inst : label is "7D0365DE016DDEC00036DEDF470777DE07D6F902D5077DDE07D6C14500CBDE02";
    attribute INIT_3F of inst : label is "0A08062200054F0F0F0F0FE0E5780374DE0176DE230884C11FFD0869C91FE547";
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
