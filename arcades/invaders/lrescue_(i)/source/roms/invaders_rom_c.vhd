-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_C is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_C is

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
    attribute INIT_00 of inst : label is "5D3A0A34C30D063D06210A34CD0D062506210136C0A77E205C21D048FE201D3A";
    attribute INIT_01 of inst : label is "CDC8A720163A4800CD08EFC3205D21E10D8BC305D5CD013E0000004830C2A720";
    attribute INIT_02 of inst : label is "D804FE7EAA2ED807FE7E8D2E4BD1D201FE486FD203FE4866D205FE7EAB2E1722";
    attribute INIT_03 of inst : label is "3E3A4837CD0000004860C3D805FE7E8D2E4860C3D804FE7E8D2EC90136203E21";
    attribute INIT_04 of inst : label is "ACD2B8201D3A580648C0CA04FE48BBCA05FE48B6D206FE7EAB2E1722CDC8A720";
    attribute INIT_05 of inst : label is "489AC37806489AC38806C900362BC0A77E204021C900362029210136203F2148";
    attribute INIT_06 of inst : label is "C0A7205C3A0000000000C9778622AC21F17786F521AC2103E602DB489AC36806";
    attribute INIT_07 of inst : label is "00004903C320C43AC8A720EF3AC94000C2A7203F3A0430C3480ECA10E6209C3A";
    attribute INIT_08 of inst : label is "E6CD490AC320064900C32406C903D320C432A020C43AC903D320C432B048F3C3";
    attribute INIT_09 of inst : label is "D320C532A020C53AC905D320C532B020C53A0D18C3490ACDF7064900C328061D";
    attribute INIT_0A of inst : label is "C322064962CAA720003AC8A720163A4938C3FB0605D5CD053E492ECD0406C905";
    attribute INIT_0B of inst : label is "C34900CD0106C9490ACDFE061020C34900CD210600364974CA490AC3FD064900";
    attribute INIT_0C of inst : label is "EF0649A3C330FE201D3A4C1FC204E6209C3A4C1FC2A720163A490AC3FE061048";
    attribute INIT_0D of inst : label is "0649CECA08E6209C3A4938C3FC0649B7C2A720A03A492EC31006499EDA4938C3";
    attribute INIT_0E of inst : label is "4982CD49B2C3C801E634209B21492ECD020649B2C3C001E634209B21492ECD01";
    attribute INIT_0F of inst : label is "C8000521A77EAB2E1722CD000000000009EBC32806391C21C0A720EE3A1048C3";
    attribute INIT_10 of inst : label is "C30E0E4A2D112B12214A22DA0F20C63AC9003021C800152102FEC800102101FE";
    attribute INIT_11 of inst : label is "0B112C0F21271E26110418000B0F1B18000B0F0536C31D3E3712214A17CD052A";
    attribute INIT_12 of inst : label is "0F1B1C1B1B2805CBC30528CD2E0F214A65CD052ACD0B0E4A5A110A00CD08061A";
    attribute INIT_13 of inst : label is "C94A8611C84A841102FEC84A821101FEC84A8011A77EAB2E1722CD12130D080E";
    attribute INIT_14 of inst : label is "CD2006C906D32810210000000000000000C920C62105CBCD1C1F211D1C1D211B";
    attribute INIT_15 of inst : label is "2E1722CD22364AE5DA0F7E20C621036AC31722CD4C3CC2A720EE3A1D7DC34938";
    attribute INIT_16 of inst : label is "CAA77EAC2E1722CD21364A88CD02B6CD0536CD1E3E390F214B58CD4B28C235AC";
    attribute INIT_17 of inst : label is "2E1722CD223620C62105CBCD02B6CD4B58CD4B0EC235AC2E1722CD4B8BC304B3";
    attribute INIT_18 of inst : label is "4B8BC2A77EAC2E1722CD223620C6214B42CD4B8BC3223620C62104B3CAA77EAC";
    attribute INIT_19 of inst : label is "C3223620C6214B8BC2A77EAC2E1722CD213620C6214B42CD4B8BC3213620C621";
    attribute INIT_1A of inst : label is "130E4B6311280F2105CBC30A34CD10060B4AC23D24244B50CA2701213D7E00E1";
    attribute INIT_1B of inst : label is "2120064B86DA0F20C63A271D26110418000B0F1B1104150E1B040C000605B3C3";
    attribute INIT_1C of inst : label is "21000000490ACD00064BB4C34A10CD4B76CD0ABDCD4B7FC30006050AC37020C5";
    attribute INIT_1D of inst : label is "20C63A20E52100E1C34A3BCDC920EE2220E5220000210B04CD09061B651120C2";
    attribute INIT_1E of inst : label is "A77E4BBACD004860C3D806FE7E8D2E024FC34FC83D7E000000000000C923D80F";
    attribute INIT_1F of inst : label is "05D5CD203E4900CD100600364BBACD0246CD34AC2E1722CDD8B80913CD3006C8";
    attribute INIT_20 of inst : label is "21C90000211D66CD4C82C301A9CD4B97CD205932AF48DBC34BDBCD490AC3EF06";
    attribute INIT_21 of inst : label is "2E1722CD4E00C34951CD00E1C30384CD49A6C3499ECAA77E23499ECAA77E203F";
    attribute INIT_22 of inst : label is "052ACD4C6311040E261B2134A22E1722CD0ABDCD004C67C300364AB2CAA77EA0";
    attribute INIT_23 of inst : label is "C30036C0A77E20C22101A4CD4CE1C303A4CD4AB2CA3D7EAC2E0B0414054E15C3";
    attribute INIT_24 of inst : label is "000000000000000000000000000000000004B3C3003620E321003620DC214DAD";
    attribute INIT_25 of inst : label is "03DAC300364EAE2E1722CD05CBC34A3BCD4A10CDC90136B02E1722CD00000000";
    attribute INIT_26 of inst : label is "FE36201B210F8EC32019214CDBCAA77EA22E1722CD000000000000C920E332AF";
    attribute INIT_27 of inst : label is "0000C9213620C6214987C3C8A720EF3AC9205A32013E2056224AB2C34B76CDC9";
    attribute INIT_28 of inst : label is "CDE54D56DA075F4E23C8A77E21C02AC9FB4D11CDF30B04CD060621C0214DC011";
    attribute INIT_29 of inst : label is "A77C2B06D3492ECD08065321C22AC1D14D69CDD5C54D14C3234D1EC20DE14D2B";
    attribute INIT_2A of inst : label is "4D5AC2A77C2B21C42AE54D35C34D4BC215C8A77C2B4938CDF706534D3DC215C8";
    attribute INIT_2B of inst : label is "A8C309FE7E2BFF36C0A77EC900364D75DA0F20EC2101DB4D14C323E14D57C20D";
    attribute INIT_2C of inst : label is "220216021B0222021E02260233021E022602330222022802330222022802334D";
    attribute INIT_2D of inst : label is "004D03C34F6D1150FF0DFF4DC64D03C34DB3110AACC334D00006190216021B02";
    attribute INIT_2E of inst : label is "011E012201260128012D0133012D012801260122011E011B011950FF0DFF4D81";
    attribute INIT_2F of inst : label is "000000000000000000000000000000000000000000000000000000000319011B";
    attribute INIT_30 of inst : label is "3921EBC8A77EA22E1722CD0036D802FE7E3421A421C810E60A41CDC0A720163A";
    attribute INIT_31 of inst : label is "C2BEAF4ED7C3010536C31C3E2D1B210574CD2B1B21772786EB9600CE993E374E";
    attribute INIT_32 of inst : label is "080620B82AEB20B62A4E83C3183620B42120B6224EAA2120B82221A82A344E57";
    attribute INIT_33 of inst : label is "354E83CABE234E95CA354E7ACABEAF20B42100004EE1DA40FE7D20B82A09C8CD";
    attribute INIT_34 of inst : label is "86C320B6224EB22110362309C8C3080620B822002B2B20B82AEB20B62A4EA1CA";
    attribute INIT_35 of inst : label is "7B3F7B9890100CE43C1C3E2A5D5DC031DFFCDF31C0004E86C320B6224EBA214E";
    attribute INIT_36 of inst : label is "3EC323C8BEAF20B221039DC31722CD4ECAC206D3A77E01A9CDFF364EE6CD8688";
    attribute INIT_37 of inst : label is "0000000FF6C31020CD1020CAA77EA22E1722CDC920B2210637CDC920B232AF4E";
    attribute INIT_38 of inst : label is "0521205A32AF054DC2013620F12120F222C8A720EF3A4F1AC4000321A7205A3A";
    attribute INIT_39 of inst : label is "1722CD4F36C2A706D37E01362B01A9CD013620B32102D4C321A822201D2AC900";
    attribute INIT_3A of inst : label is "0626011E01220400000006120319031E03260228011E0322021E0416021E0419";
    attribute INIT_3B of inst : label is "497AC349DDCAA77EA22E1722CD50FF11FF4F4000000000000000000000000000";
    attribute INIT_3C of inst : label is "090020017709016001AF0A2CCD6704C67C4F93F2A7202C3A202D2AC8A720163A";
    attribute INIT_3D of inst : label is "2AEB201D2AC8A720163AC9770900200177090020017709022001770900200177";
    attribute INIT_3E of inst : label is "FED802FE7EAB2E1722CDC9201832013ED8BA12C6D0BA0CC67CD0BB0AD67D202D";
    attribute INIT_3F of inst : label is "00000000000000004FE6C3FB16C972208C217220802172207421FC164FF3D206";
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
