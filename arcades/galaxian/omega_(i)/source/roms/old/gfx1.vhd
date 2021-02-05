-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity GFX1 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of GFX1 is

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

  component RAMB16_S4
    --pragma translate_off
    generic (
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
      DO    : out std_logic_vector (3 downto 0);
      ADDR  : in  std_logic_vector (11 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (3 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(11 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(11 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_01 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_02 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_03 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_04 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_05 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "06D88E1001E88D6000217C021F8213689BEC8E1001E8CEB9863128F120C71200";
    attribute INIT_07 of inst : label is "0000000000000010000000001000000000000000000000010000000000000000";
    attribute INIT_08 of inst : label is "0000800800001521000000003400000000000000000002070000000010000000";
    attribute INIT_09 of inst : label is "088C6312896001E00E1006982136C88000800008000973C30000000068880000";
    attribute INIT_0A of inst : label is "0002FC6100087937FD2CF200F739780055DD555DD555DD550008C62399555555";
    attribute INIT_0B of inst : label is "5A7E7A50EEEEEEE000000000F111111F04648C61084A1137FD2C8464F7311A48";
    attribute INIT_0C of inst : label is "8EB223208EB223208EB223208EB2232002348C6100869137FD2C8432F7319680";
    attribute INIT_0D of inst : label is "023200008EB223208EB223208EB223200000232002322320023223208EB22320";
    attribute INIT_0E of inst : label is "00000000000000110000000011000000008800080010E11080008800011E0100";
    attribute INIT_0F of inst : label is "0000000000000013000000003100000000000000000000010000000010000000";
    attribute INIT_10 of inst : label is "0012488C00007DB3C88421003BF700000000788C00007DB3C88700003BF70000";
    attribute INIT_11 of inst : label is "0008888C00007DB3C88880003BF700000044888C00007DB3C88844003BF70000";
    attribute INIT_12 of inst : label is "0000008000230E3088440000633F70000088000800007DB3800088003BF70000";
    attribute INIT_13 of inst : label is "0000086000C01E0FC000000000FB100000000008011861D3600000000FF74300";
    attribute INIT_14 of inst : label is "0000788C00007880C887000008870000000C000C000173C30000000068BC6000";
    attribute INIT_15 of inst : label is "0044888C00007880C8884400088700000012488C00000788C884210088700000";
    attribute INIT_16 of inst : label is "0088000800000E118000880011E000000008888C00000788C888800088700000";
    attribute INIT_17 of inst : label is "00000008011861D360000000000043000000008000230E308844000000087000";
    attribute INIT_18 of inst : label is "000C000C0001F3C300000000688860000000086000C01E0FC000000000081000";
    attribute INIT_19 of inst : label is "02A444A208888888C295512C05656765FFFFFFFF6D577760000000006D577760";
    attribute INIT_1A of inst : label is "00000000FFEC8432000000000B000000E731968324031010C000000000000000";
    attribute INIT_1B of inst : label is "000000000000000B0000000002348CEF0000000000000000C386913700101304";
    attribute INIT_1C of inst : label is "0000000006EC040080000000910000005A039480120000000000000000000000";
    attribute INIT_1D of inst : label is "00000000000000010000000090240CE600000000000000000084930A00000002";
    attribute INIT_1E of inst : label is "00000000020080800040000100000000F130C308000000000000000000000004";
    attribute INIT_1F of inst : label is "0400000000000000000000000020854E00000000000000004901011700000000";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "00008E5FF5E80000000000000000000000008E1001E800000000000000000000";
    attribute INIT_27 of inst : label is "0000000000000010000000000000000000000000000000000000000000000000";
    attribute INIT_28 of inst : label is "0000800800001431E00000000000000000000000000002110000000010000000";
    attribute INIT_29 of inst : label is "0000000000000000000000000000000000800008000840F30000000000000000";
    attribute INIT_2A of inst : label is "00000CEF00000136FFEC0000D631000002000200002000200000080040028028";
    attribute INIT_2B of inst : label is "01202100EEEEEEE000000000F111111F00000CEF00000136FFEC0000D6310000";
    attribute INIT_2C of inst : label is "8C802BE88C802BE88C802BE88C802BE800000CEF00000136FFEC0000D6310000";
    attribute INIT_2D of inst : label is "000000008C8023208C802BE88C802BE8000023200000232000002BE88C802BE8";
    attribute INIT_2E of inst : label is "00000846000258C8648000008C852000421122012C00000010221124000000C2";
    attribute INIT_2F of inst : label is "02080828002050411408002014020A0108822512B6200020215228800200026B";
    attribute INIT_30 of inst : label is "0012480000000777008421007770000000007800000007770087000077700000";
    attribute INIT_31 of inst : label is "0008880000000777008880007770000000448800000007770088440077700000";
    attribute INIT_32 of inst : label is "00000000002300DE88440000EF77000000880000000007EE00008800EE700000";
    attribute INIT_33 of inst : label is "0000086000C30F11C0000000EF930000000000080118611D60000000F7313000";
    attribute INIT_34 of inst : label is "00007800000000000087000000000000000C000C0000C0F30000000007770000";
    attribute INIT_35 of inst : label is "0044880000000000008844000000000000124800000000000084210000000000";
    attribute INIT_36 of inst : label is "0088000000000000000088000000000000088800000000000088800000000000";
    attribute INIT_37 of inst : label is "0000000801186111600000000000000000000000002300108844000000000000";
    attribute INIT_38 of inst : label is "000C000C0000C0F300000000000000000000086000C30F11C000000000000000";
    attribute INIT_39 of inst : label is "02A888A207000000C295512C00EFFFE0FFFFFFFF6FFFFF60000000006FFFFF60";
    attribute INIT_3A of inst : label is "44800844FFEC0000880000000B0C3000D631000324039414C060000042100000";
    attribute INIT_3B of inst : label is "0000000800003C0B8448008400000CEF0000006000000012C300013644149304";
    attribute INIT_3C of inst : label is "0848804406EC000088000000000D06001803101212882192C168300014200000";
    attribute INIT_3D of inst : label is "0000000800060D008440884800000CE60000386100000024C210130812912882";
    attribute INIT_3E of inst : label is "04222480080120800000000000320000D8D20061002300021000831031000000";
    attribute INIT_3F of inst : label is "000008000000840002113110088000080016008C000340004005768504880091";
  begin
  inst : RAMB16_S4
      --pragma translate_off
      generic map (
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
        DO   => DATA(3 downto 0),
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "0000",
        EN   => ENA,
        SSR  => '0',
        WE   => '0'
        );
  end generate;
  rom1 : if true generate
    attribute INIT_00 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_01 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_02 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_03 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_04 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_05 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "377FFFBFFBFFF77300000364C8BEC623137FFFFFFFFFF731326CEB8C46300000";
    attribute INIT_07 of inst : label is "0000000400000000040000000000000000000084000000008000000000000000";
    attribute INIT_08 of inst : label is "00080DE100000000E224000000000000000008C6000000008A80000000000000";
    attribute INIT_09 of inst : label is "31000000126469C66C964621000000130009EC3C001000016111000000000000";
    attribute INIT_0A of inst : label is "02644747000303087777446278030300D73297F99F79237D00E30E11C2229555";
    attribute INIT_0B of inst : label is "000000005A7E7A5000000000F888888F02324747030300087777423278000303";
    attribute INIT_0C of inst : label is "000023200000232000002BE88C802BE802324747003030087777423278003030";
    attribute INIT_0D of inst : label is "0000000000000000000000008C80232000000000000000000000000000000000";
    attribute INIT_0E of inst : label is "0000008E00000000E800000000000000000855FF00000110FF55800001100000";
    attribute INIT_0F of inst : label is "0000008C00000000C80000000000000000000008000000008000000000000000";
    attribute INIT_10 of inst : label is "00422AD5000000005DA224000000000000112AD5000000005DA2110000000000";
    attribute INIT_11 of inst : label is "00942AD5000000005DA249000000000000842AD5000000005DA2480000000000";
    attribute INIT_12 of inst : label is "0222A7BB00000012BAAA200010000000008855BB00000000BB55880000000000";
    attribute INIT_13 of inst : label is "0004EF6F00000100462248001110000000087F7200000001E955800023100000";
    attribute INIT_14 of inst : label is "00112AD5000000005DA21100000000000008FC3C000300036113600000000000";
    attribute INIT_15 of inst : label is "00842AD5000000005DA248000000000000422AD5000000005DA2240000000000";
    attribute INIT_16 of inst : label is "008855BB00000011BB5588001100000000942AD5000000005DA2490000000000";
    attribute INIT_17 of inst : label is "00087F7200000001E9558000221000000222A7BB00000012BAAA200010000000";
    attribute INIT_18 of inst : label is "0008FC3C0003000361116000000000000004EF6F000001004622480011100000";
    attribute INIT_19 of inst : label is "0169D9610F5BFFFF349AA843031B7B13FFFFFFFF000000006D5777606D577760";
    attribute INIT_1A of inst : label is "22488420777742B2480000000300000078303838000000006000000000000000";
    attribute INIT_1B of inst : label is "00000008000000034024884202B2477700000000000000006838303800000000";
    attribute INIT_1C of inst : label is "88000000302604200000000011000000B0006006000000000000000000000000";
    attribute INIT_1D of inst : label is "0000000000000001800000081024062000000000000000000600600000000000";
    attribute INIT_1E of inst : label is "00000000FA48EC00000000000010000043200100000000000000000000004000";
    attribute INIT_1F of inst : label is "00000000100000000000000000C084AC00000200000100000019003200000000";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "006FFFFFFFFFF6000000000000000000006FFFDFFDFFF6000000000000000000";
    attribute INIT_27 of inst : label is "0000000800000000840000000000000000000088000000008000000000000000";
    attribute INIT_28 of inst : label is "0008010F0000000000000000000000000000080A00000000C200000000000000";
    attribute INIT_29 of inst : label is "00000000000000000000000000000000000120FC001000010000000000000000";
    attribute INIT_2A of inst : label is "00000FFF00000008FFFF0000780000000022918EE81922000004404424540020";
    attribute INIT_2B of inst : label is "000000000120210000000000F888888F00000FFF00000008FFFF000078000000";
    attribute INIT_2C of inst : label is "0000000002320000023208C8023208C800000FFF00000008FFFF000078000000";
    attribute INIT_2D of inst : label is "0000000000000000023200000232000000000000000000000000000000000000";
    attribute INIT_2E of inst : label is "0004D20000000001002D40001000000034000006001248846000004348842100";
    attribute INIT_2F of inst : label is "804020210401014182040A00820100405B81004803224268840018B586242230";
    attribute INIT_30 of inst : label is "0042226600000000662224000000000000112266000000006622110000000000";
    attribute INIT_31 of inst : label is "0094226600000000662249000000000000842266000000006622480000000000";
    attribute INIT_32 of inst : label is "0222A8CC00000001C222200000000000008855CC00000000CC55880000000000";
    attribute INIT_33 of inst : label is "0000018B0000010048CC8000000000000008008C00000000E199000011000000";
    attribute INIT_34 of inst : label is "00112266000000006622110000000000000030FC000300030EEE000000000000";
    attribute INIT_35 of inst : label is "0084226600000000662248000000000000422266000000006622240000000000";
    attribute INIT_36 of inst : label is "008855CC00000000CC5588000000000000942266000000006622490000000000";
    attribute INIT_37 of inst : label is "0008008C00000000E1110000000000000222A8CC00000000C222200000000000";
    attribute INIT_38 of inst : label is "000030FC0003000300000000000000000000018B000001004000000000000000";
    attribute INIT_39 of inst : label is "0100C0010FFF5555349AA843001B6B10FFFFFFFF000000006FFFFF606FFFFF60";
    attribute INIT_3A of inst : label is "22499420FFFF00804816800003843000783008081211000060B0000000000000";
    attribute INIT_3B of inst : label is "00008618000034834024994200800FFF000000B0000000006808003800000112";
    attribute INIT_3C of inst : label is "8826C910B82600082248000044043000B0400000504221000D06000000000000";
    attribute INIT_3D of inst : label is "00000842000034042019C628480006280000060D000000000000004000012240";
    attribute INIT_3E of inst : label is "08C80004B21F856C488000000000480011AC6300044221300C60843000000000";
    attribute INIT_3F of inst : label is "0004304200C700006310C2108100E71800C8000308000026640048904C881110";
  begin
  inst : RAMB16_S4
      --pragma translate_off
      generic map (
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
        DO   => DATA(7 downto 4),
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "0000",
        EN   => ENA,
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
