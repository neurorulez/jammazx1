-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_E is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_E is

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
    attribute INIT_00 of inst : label is "301C21009E101C21FEB8FF00000B92C30FE6250121F11766CD773DF5C8A70B17";
    attribute INIT_01 of inst : label is "0B0F1E1B110E1B1D271B26110418000B0F1B1B1104150E1B040C000607080B10";
    attribute INIT_02 of inst : label is "0E131314011B1B110418000B0F1D1B180B0D0E1B0D0E131314011B1211041800";
    attribute INIT_03 of inst : label is "00001B1E2B04110E02121B1B1B1B1B1B1B1B1B1B1B1B1D2B04110E02121B1B0D";
    attribute INIT_04 of inst : label is "111C01210BA3CD1758CD00000000000C141C163E76DEF6DE763E161C140C0000";
    attribute INIT_05 of inst : label is "1BD11120D12120DD221918B7CA05FE1918B7CA03FE1918B7CA01FE20DB3A0010";
    attribute INIT_06 of inst : label is "06D3190ED2D0FE20D43A20D032013E20D22201012120D422200B2A17B2CD0C06";
    attribute INIT_07 of inst : label is "0C85CD1A16110E0E2810210C9DCD20D032AF18D6CAA720D13A18D6C2A720D93A";
    attribute INIT_08 of inst : label is "7E3520DF210C9DC30BA3CD20D032AF07BACD18D6C320D93220D032013E0C9DCD";
    attribute INIT_09 of inst : label is "FE1A40C320D511C8A720D03A1F53CCA720EF3A2D1B120E12163AC307BACA02E6";
    attribute INIT_0A of inst : label is "A4D4B0FE20D53A191BCD19BCC2A720BB3AD81786CD194FC3D01786CD194BC222";
    attribute INIT_0B of inst : label is "211AA0CD100609E1070801EB20DD2A1396CDE5EB17BBCD20D421199BDC50FE19";
    attribute INIT_0C of inst : label is "20D332013E198DC320D232AF021FC34E20D22120D2323C1994C201E67E3520DA";
    attribute INIT_0D of inst : label is "FE20D43AC9F10AD9CD17C7CD050E192811D02620D42A20D332FF3EF519AAC3F5";
    attribute INIT_0E of inst : label is "D82120D62220DD2A20D4220907080120D42A19E9C2A720D13A1956C319C7D298";
    attribute INIT_0F of inst : label is "BBCD20D42120D132013E198DCD19F6C201E67E3520DF2120D222000121103620";
    attribute INIT_10 of inst : label is "0E11131B040D08060D04C95F83403E1396C3E11A11CC04E67E3520DC21E5EB17";
    attribute INIT_11 of inst : label is "5011240021C9E1C1EB191A2EC23D09000501C5000021E5C8A71E2111040B0114";
    attribute INIT_12 of inst : label is "1602C324003120983205D303D320D032424409193FC320673A1944C202E602DB";
    attribute INIT_13 of inst : label is "4430094244090A0D484344302C48303700000000000000000000000000000000";
    attribute INIT_14 of inst : label is "030A060A080706040502050A07040B020802090B01010306010B040101010701";
    attribute INIT_15 of inst : label is "01C91AA3C205C109002001E17703DB04D3AF132377B603DB04D31AE5C511B9CD";
    attribute INIT_16 of inst : label is "29040B0100131B04020D001503001B04110E0212290001020001020001000001";
    attribute INIT_17 of inst : label is "000000000000000000317ADCF4F4DC7A313A4C3A317ADCF4F4DC7A3100000000";
    attribute INIT_18 of inst : label is "0000011030201C810C05FF02D400800000F80038783878020000000010000001";
    attribute INIT_19 of inst : label is "0300001CF004000000000004C3020000FFFF00040130281CB110000400000000";
    attribute INIT_1A of inst : label is "0300001CD2041A8601000006D90000000300001CE4041A800100000503000000";
    attribute INIT_1B of inst : label is "00FC271D26110418000B0F1B18000B0F0000001200300001211000001CC200FF";
    attribute INIT_1C of inst : label is "1C21009E100000010040010000060008001D50021829D01D6020000000FFFF01";
    attribute INIT_1D of inst : label is "0000000000000000000002000000000001000000000000081C2500C800FE0000";
    attribute INIT_1E of inst : label is "000000000000001D1CFC00000000000000000000000000000000000000001000";
    attribute INIT_1F of inst : label is "391C0000261C00002F1C050000000078001ABF0100000100000000000101FF00";
    attribute INIT_20 of inst : label is "00781DBE6C3C3C3C6CBE1D78000000000039797A6EECFAFAEC6E7A7939000000";
    attribute INIT_21 of inst : label is "000000307ADDF4F4DD7A300000000000000000193A6DFAFA6D3A190000000000";
    attribute INIT_22 of inst : label is "000E18BE6D3D3C3D6DBE180E0000000000387A7F6DECFAFAEC6D7F7A38000000";
    attribute INIT_23 of inst : label is "00000000102A7C7C2A100000000000000000001A3D68FCFC683D1A0000000000";
    attribute INIT_24 of inst : label is "000304492F032F0FB3070313010400000F1F1F1F1F7FFF7F1F1F1F1F0F000000";
    attribute INIT_25 of inst : label is "081330201002997C3EBC3D7E3C990F481184404B0B27270F5B030AA305084001";
    attribute INIT_26 of inst : label is "154A88542244AA1022548810AA4400000849221481420042811422490800130B";
    attribute INIT_27 of inst : label is "0400000090FE4800FE0012FE2400FE0080FC8020FC2010FC1004FC04255E3FBE";
    attribute INIT_28 of inst : label is "1FFF0FFF0000000000040C0C1E3E2E6E7EFCECECFCFCECECFC7E6E2E3E1E0C0C";
    attribute INIT_29 of inst : label is "FFFFFFFFFFFCFFF8FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFF8FFFCFFFF7FFF3FFF";
    attribute INIT_2A of inst : label is "0510150510101030051010151005051099969390301510050FFF1FFF3FFF7FFF";
    attribute INIT_2B of inst : label is "3D980840A500220000000000040C1E373E7C747E7E747C3E371E0C0400000000";
    attribute INIT_2C of inst : label is "050302011C1C1F1C211D1C1C1D1C211B000008904208981DB66248101D363CB6";
    attribute INIT_2D of inst : label is "061C512C081C212C0A1C312A0A1D642C0C18822C0E1C1C214040404848485060";
    attribute INIT_2E of inst : label is "0E0F1B1C1C2128FF1E052E061DFA2E081DEF2E0A1DE42E0C1DD92E0EFF1C012C";
    attribute INIT_2F of inst : label is "0F1B1C1E1B2812130D080E0F1B1C1F1B281811041312180C1B2C1B2812130D08";
    attribute INIT_30 of inst : label is "8458582CB0B0B0585884842C2C00000012130D080E0F1B1C1D1B2812130D080E";
    attribute INIT_31 of inst : label is "3E404848487F414949497F3E4141417F224141413E364949497F1F2444241F84";
    attribute INIT_32 of inst : label is "18207F010101017F412214087F7E0101010200417F41007F0808087F47454141";
    attribute INIT_33 of inst : label is "2649494932314A4C487F3D4245413E304848487F3E4141413E7F0408107F7F20";
    attribute INIT_34 of inst : label is "454360100F106063140814637F020C027F7C0201027C7E0101017E40407F4040";
    attribute INIT_35 of inst : label is "59494142314949452300017F21003E5149453E00000000000003030000615149";
    attribute INIT_36 of inst : label is "083C4A49493136494949366050484740464949291E4E51515172047F24140C66";
    attribute INIT_37 of inst : label is "4D40200808080808181818181822147F14221414141414081422410000412214";
    attribute INIT_38 of inst : label is "1E01011E000916141F0000000000C04040404040C00000000079007900002050";
    attribute INIT_39 of inst : label is "140F000E11111F001F04081F001115151F000000000000000000000A15151F00";
    attribute INIT_3A of inst : label is "095A4E4A090A0D454FC3459CCDC9E91526EF2EE51F52211B1308030411020712";
    attribute INIT_3B of inst : label is "303809494E41090A0D4D2C4109564F4D090A0D4809584344090A0D344E495845";
    attribute INIT_3C of inst : label is "494E41090A0D483041302B55500941444C093A314E4958450A0D5A52090A0D48";
    attribute INIT_3D of inst : label is "4958450A0D4841302B55500941444C090A0D412C4209564F4D090A0D48463009";
    attribute INIT_3E of inst : label is "0A0D48303109494441090A0D334E495845095A4A090A0D4209524344093A324E";
    attribute INIT_3F of inst : label is "09FFFF48343009494441093A334E4958450A0D3B0A0D324E49584509504D4A09";
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
