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
    attribute INIT_00 of inst : label is "15F5CD3520C021207232803EE5D5C5F5000D83C3E5D5C5F50000168FC3000000";
    attribute INIT_01 of inst : label is "01C620CC3A20EB322701C60047CA09FE20EB3A004BCAA720EA3A0070DA0F01DB";
    attribute INIT_02 of inst : label is "0066C2A720EB3A0075C2A720EF3A008ACAA720E93A20EA32AF1705CD20CC3227";
    attribute INIT_03 of inst : label is "803220323A4383CD1569CD0048C3013E0845C30094C2A720933A008AC30CAECD";
    attribute INIT_04 of inst : label is "D1E10003C2BECC2E7E20EB21192DCD1569C4A720B93A0AFCCD028ECD010FCD20";
    attribute INIT_05 of inst : label is "42ECCD0094D20F20C13A00BDC2A720EF3A008ACAA720E93A207232AFC9FBF1C1";
    attribute INIT_06 of inst : label is "C203FE7E2BE1200B222009226F66237EE50A6CCD0094C3015FCD0291CD202021";
    attribute INIT_07 of inst : label is "D378F30ACAC322FB3221FB32023EC9200D323C00EEC2003EFEFE2008323D00E3";
    attribute INIT_08 of inst : label is "6720673A6F20063AE5128AC2A77E200221C9FB0103C2050105C20D000E0A0605";
    attribute INIT_09 of inst : label is "49CD10060159C4A778EB191C012100165F070707F6E6462323230144CAE1A77E";
    attribute INIT_0A of inst : label is "3AC9EB19004021C91B2504D030FE7CC8A7206B3A200B2AC9200032AF1396CD01";
    attribute INIT_0B of inst : label is "320172CA7DA77E6F01BFCC37FE3C021620063A6720673AC0A720003AC8A72068";
    attribute INIT_0C of inst : label is "23462009217D0016C92000323C2004327A1737DA28FE7D200B22610198CD2006";
    attribute INIT_0D of inst : label is "1501B3C33D7B4F10C6795FC8A76801A1C3147B4710C6785F0BDE01B2FA0BFE4E";
    attribute INIT_0E of inst : label is "002121C966206721AF7701E63C7E200521021FCD00364E2300362006210213CA";
    attribute INIT_0F of inst : label is "C15F0A01F8C23D03020FD411FE01FDCAA71E10014016C507F9CDE506D32C0621";
    attribute INIT_10 of inst : label is "231211C3240221E006013EC9E1C97E0936C90208C2052377053E0B0617B2CDE1";
    attribute INIT_11 of inst : label is "040E224221023EC321422117B2C32000211B0011C006C9778678237786792346";
    attribute INIT_12 of inst : label is "0264C3224211AF025AC3013E0261C3013EC90243C20DD117B2CD2C06D51D1C11";
    attribute INIT_13 of inst : label is "D5C83DF1C117E9CD0288C2A720813AC5F5043E280621160201208132214211AF";
    attribute INIT_14 of inst : label is "C279B04F462302C7CAFEFEC8FFFE7E201021027BC311C1CD026FC3D11902E011";
    attribute INIT_15 of inst : label is "C204050291C319000C11E1E9D5E302B521E5EBE556235E2302CEC2A77E2302BD";
    attribute INIT_16 of inst : label is "47C035230388CAFFFE7E23E102C7C32B2B350291C319001011772B70053D02C3";
    attribute INIT_17 of inst : label is "211210CD11B9CD1006201A2A03EBC23523053678206A32303E206932206832AF";
    attribute INIT_18 of inst : label is "1758CDFB240031C8A720EF3AC0A7206D3A175CCD000617B2CD10061B10112010";
    attribute INIT_19 of inst : label is "54CD0382DA0FF520673A037CCAA720CE3A037CCAA77E16A5CD1453CAA70B17CD";
    attribute INIT_1A of inst : label is "20060362D20006213E0FF1022ACD702B2B7223730A6CCDEB20092A4720083A02";
    attribute INIT_1B of inst : label is "C317FFCD08FDC317FFCD0BA3CD2098323C00FDCD201132AF0CA2CD206732223E";
    attribute INIT_1C of inst : label is "3A47201B3A01362B039BC23523039BC2A77E2301362068210341C3024FCD0936";
    attribute INIT_1D of inst : label is "03DEDA0703D1DA070715E8CD03C0C303DEDA0F03D1DA0F201D3A03B4C2A720EF";
    attribute INIT_1E of inst : label is "FE7803C0C3201B323C03C0CAD8FE78C9201232AF1183CD17C7CD17BBCD201821";
    attribute INIT_1F of inst : label is "03C0C32018226F851C91210707070720153201E63C03C0C3201B323D03C0CA30";
    attribute INIT_20 of inst : label is "047BCA35046FC203FE23044FCA02FE043FCA01FEC8A77E23D0E11786CD202A11";
    attribute INIT_21 of inst : label is "3C114EC30475CD08362335353523353523233423E11197CD0475CDE5C00FFE7E";
    attribute INIT_22 of inst : label is "6F85202C3AD1E1C11197CDC5E5D50475CD114EC30475CD202A3208C6201B3A77";
    attribute INIT_23 of inst : label is "97CD0475CD17BBC3202721047BC3C805FEC9200232C8A720613A11D6CD202932";
    attribute INIT_24 of inst : label is "502E04A0DA5FFE7DE134F82E13F9CDE52C208D2A17B2CD07061B251120252111";
    attribute INIT_25 of inst : label is "2371208A21FEE00104BBC202290101E67EC0A720843A208F222C208F2A208D22";
    attribute INIT_26 of inst : label is "3A05A5CDFC3E203511C92038222B04D7C2B47D20382A2032321B323AE1C97023";
    attribute INIT_27 of inst : label is "10062030211B301105B0C2203521A720783A05B8CD20713220563A2070322046";
    attribute INIT_28 of inst : label is "3A05A5CDF03E204511C001FE20803AC0A7206E3A0558D2E104FE07F9CD17B2C3";
    attribute INIT_29 of inst : label is "A720783A2076321B483A053CDA90FE20763A05B8CD20713220563A2070322036";
    attribute INIT_2A of inst : label is "20762A206E32013E055DC23D20823A17B2CD10062040211B401105B0C2204521";
    attribute INIT_2B of inst : label is "95FE20763A05B8CD20713220363A20703220463A05A5CDDE3E205511E106D5C3";
    attribute INIT_2C of inst : label is "762A17B2CD10062050211B501105B0C2205521A720783A2076321B583A0589DA";
    attribute INIT_2D of inst : label is "207321C0A720E43A17B2C30B0620731117B2C30B06207321207F32C920582220";
    attribute INIT_2E of inst : label is "CF3A4705E3CAA720703A003623C8A70610CA20693A04FE20C13A061AC280E67E";
    attribute INIT_2F of inst : label is "87CD207622234E20762A0673CAA77E23D0B820CF3A4705F0CAA720713AD0B820";
    attribute INIT_30 of inst : label is "1786CD207C11C934237780F67E207321207B226F0AD67D6707C6790198CDD006";
    attribute INIT_31 of inst : label is "7B3A2079320CD6063BDABE207F2103C620793A06CCCD3423069BC201E67E23D0";
    attribute INIT_32 of inst : label is "6ADA1EFE207B3AC8A720613A066ADA15FE207B3A06C3CD207B3280207E3A4720";
    attribute INIT_33 of inst : label is "DA0CFE7912C0CD6708C6201B3AC920733201F620733A20153297066AD227FE06";
    attribute INIT_34 of inst : label is "7E35207821C9068EC2156F0BC67DC037A77E05166913F9CD0D05FEC30B0E05FE";
    attribute INIT_35 of inst : label is "C0A706C3C3207D32063E35352B3535207C212079221CDE2106CCCD06BEC203FE";
    attribute INIT_36 of inst : label is "C002FE20803AE1C92048221197C317BBCD20792111D6C317BBCD20792106CCC3";
    attribute INIT_37 of inst : label is "CD01360564DA08FE20823A0705C2A77E230564C2A720563A0564CAA77E208321";
    attribute INIT_38 of inst : label is "11C30721CA208A21A720A13A078CC2A77E208521D01786CD208A110811CD0759";
    attribute INIT_39 of inst : label is "0811C20753CDC907ACD2E1FE07ACDA28FE7E208A21073ACD208A328623237E08";
    attribute INIT_3A of inst : label is "02FE7E3420BC21C902FE20BC3A1210C30817CD0811C3074DC204E67E3420BD21";
    attribute INIT_3B of inst : label is "EDC3E150062087220781CD1DA821C00753CDC9208C32208C3A208722187E21C0";
    attribute INIT_3C of inst : label is "C0A707BFCA18FE0820CA1FFE7E3523175CCDFE06C920BB32013EC8A720BA3A07";
    attribute INIT_3D of inst : label is "3E175CC3FE06083FCD0A062083211210CD0817CD05D320E677A07E209821EF06";
    attribute INIT_3E of inst : label is "B81A1D48111D4C21040E46208D2A076ECD20BA3207CFC201FE20BC3A20F13201";
    attribute INIT_3F of inst : label is "7EF92E6720673A0AD7C30817CD0801CD6800262087327E07DEC20D132307E9CA";
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
