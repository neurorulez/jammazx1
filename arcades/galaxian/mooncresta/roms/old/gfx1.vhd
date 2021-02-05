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
    attribute INIT_02 of inst : label is "0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE08C622EE";
    attribute INIT_03 of inst : label is "008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE888800CE222EC";
    attribute INIT_04 of inst : label is "0000000000000000000000000000000006EEA2220000EE0006EC8CE608EC8CE8";
    attribute INIT_05 of inst : label is "00000000008888800066000000660000008888801248842100000000003B0000";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_08 of inst : label is "EEEC8C6200000000F100000000000000007A880000000000E0088A7000000000";
    attribute INIT_09 of inst : label is "FEC80000FFF7133100000000100111000000000100000000F26C8CEE00000000";
    attribute INIT_0A of inst : label is "000000000000000000000000840000000000000000011100000008CE113317FF";
    attribute INIT_0B of inst : label is "00000048000200A402400400ADA0400000000000000008F4000000008DB00000";
    attribute INIT_0C of inst : label is "6EC80000FF060001000EF1DD1A6C80030069FE10336E800600000000F9100000";
    attribute INIT_0D of inst : label is "0FF8C6000FF36480008092C07E08EF3088EF88030CCCCC06336E8013FB910060";
    attribute INIT_0E of inst : label is "000000480014314E0080000004219200000084000038933348800000733BC720";
    attribute INIT_0F of inst : label is "248164801110DBB73084A525334690000080106004221659000842007A520440";
    attribute INIT_10 of inst : label is "0000000040800137000000007310080408240120408001370210428073100804";
    attribute INIT_11 of inst : label is "0000000000000127000000007310089100000000800001370000000073100049";
    attribute INIT_12 of inst : label is "0000000000000027000004087310004400000000000001270000008073100891";
    attribute INIT_13 of inst : label is "0000000000000105001428407310002400000000000000060000284073100024";
    attribute INIT_14 of inst : label is "0000000028400013000000003100048200000000408001370000000073100804";
    attribute INIT_15 of inst : label is "0000000000284813000000003184820000000000028400130000000031004820";
    attribute INIT_16 of inst : label is "0000000000000249000000009420000000000000000248030000000030842000";
    attribute INIT_17 of inst : label is "0000000000000002000000005200000000000000000000250000000052000000";
    attribute INIT_18 of inst : label is "000000110000000033FF3FF700013662EEEC07FF111E4DF7BBF3000000000000";
    attribute INIT_19 of inst : label is "00C3000000088C610B48880111000081000A60000000122100CC880034800000";
    attribute INIT_1A of inst : label is "2CC2C92400008F7E575827FFEE526025917FFE88AB4463111E03000017580000";
    attribute INIT_1B of inst : label is "000069700000040182010238204010C200030BC8A00003412508840020028000";
    attribute INIT_1C of inst : label is "0000000000008CEE00088000EFFFE82300000000F3FF37FE0000000089710000";
    attribute INIT_1D of inst : label is "024CC00000084013008480E83FA0021008800000446121000000884021000000";
    attribute INIT_1E of inst : label is "0001248000000844800000085B1489EFF0000000C804B7638CC8C621946012C0";
    attribute INIT_1F of inst : label is "00000480001028008000000028002148200000009661DD020000000004042010";
    attribute INIT_20 of inst : label is "000600C00000000500C00600F50000000000000000000000000000000D000010";
    attribute INIT_21 of inst : label is "0000000C00000001030000001A4A000000800800000000010C003000BF500000";
    attribute INIT_22 of inst : label is "0000812022000133000000001A4A80000000481200000013000000001A4A0000";
    attribute INIT_23 of inst : label is "0880000000440033000000003131111000044000002200330000000073632440";
    attribute INIT_24 of inst : label is "00030280000000080082030008000000000600C00000000400C0060004000002";
    attribute INIT_25 of inst : label is "0600020000002000000200060000200000101040000000000040101000000000";
    attribute INIT_26 of inst : label is "0002000000000000000002000000000008090000008000000000090800000080";
    attribute INIT_27 of inst : label is "0000080000000100000800000001000000004000000010010000400001001000";
    attribute INIT_28 of inst : label is "080A520522411000001100000000000080296F51000000000000000000000000";
    attribute INIT_29 of inst : label is "0000000000240800040C10100000000000000020A920A800610C110000000000";
    attribute INIT_2A of inst : label is "000000000000100000020009000001800000000000000000002008D000120010";
    attribute INIT_2B of inst : label is "0000000000000008800000040000000000000000000002000000040000000010";
    attribute INIT_2C of inst : label is "0008C8CE02F03ED17E864000CFF89400004E8C662F05FCB336C864009E3F0910";
    attribute INIT_2D of inst : label is "0000000000017C6CC0800000EC17000000008084002F06D8EC8C0000EF015000";
    attribute INIT_2E of inst : label is "00000000000000130000000063000000000000000000114680000000E4700000";
    attribute INIT_2F of inst : label is "0000000000000000000000001200000000000000000000000000000031000000";
    attribute INIT_30 of inst : label is "00000000000E26F700000000F62E000000000000000000000000000000000000";
    attribute INIT_31 of inst : label is "0000000000000CDF00000000F3705200000000000000C5FF000000007F697000";
    attribute INIT_32 of inst : label is "00000000000003B700000000751000000000000000000097000000007B120100";
    attribute INIT_33 of inst : label is "0000000000000113088800001FB94000000000000000001D08880000BB500000";
    attribute INIT_34 of inst : label is "000000000006A6F700000000F6A6000000000000000E26F700000000F62E3000";
    attribute INIT_35 of inst : label is "00000000000026370000000036200000000000000004A6F700000000F6A40000";
    attribute INIT_36 of inst : label is "0000000000000263000000006200000000000000000006330000000036000000";
    attribute INIT_37 of inst : label is "0000000000000001000000001000000000000000000000230000000020000000";
    attribute INIT_38 of inst : label is "0000000F0000068FF0000000F86000000EE666660F000000666666EE0000000F";
    attribute INIT_39 of inst : label is "0000000F0000000DF0000000D00000000000000F00000127F000000072100000";
    attribute INIT_3A of inst : label is "0000000F00000000F0000000000000000000000F00000003F000000030000000";
    attribute INIT_3B of inst : label is "0000004F00000000F4000000000000000000008F00000000F800000000000000";
    attribute INIT_3C of inst : label is "0000000000000EEE00000000EEE0000000C0C08400000000480C480000000000";
    attribute INIT_3D of inst : label is "000000000000088800000000888000000000000000000CCC00000000CCC00000";
    attribute INIT_3E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_3F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
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
    attribute INIT_02 of inst : label is "0FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF037C8999";
    attribute INIT_03 of inst : label is "0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F707F888F7";
    attribute INIT_04 of inst : label is "000000000000000000000000000000000889BFEC00CF11FC0CE737EC0FF131FF";
    attribute INIT_05 of inst : label is "00000000002222200066000000000000001111108421124800DE0000000FFE00";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_08 of inst : label is "DB3310000000000000000000000000000000001200000000F210000000000000";
    attribute INIT_09 of inst : label is "FFFFF68EF3000000A6CAEEC00000000000000000000000000000133B00000000";
    attribute INIT_0A of inst : label is "000000000000000600000000D520000000CEEAC600000000AE86FFFF00000003";
    attribute INIT_0B of inst : label is "002010120000001740284000E73000000000000100000037E8000000E7310000";
    attribute INIT_0C of inst : label is "6633142877152841401331333663310310007722300010110000000011142840";
    attribute INIT_0D of inst : label is "0771021407700000200000000103142822772203400000003000101303000011";
    attribute INIT_0E of inst : label is "000124060000001023401000000000000C2CECEF00000102ECC8022010000000";
    attribute INIT_0F of inst : label is "02408DEE842501C7C9C4290500481249040168C902102000C620884001600000";
    attribute INIT_10 of inst : label is "0000080A01420840A080000004802410201008CE01420840EC80010204802410";
    attribute INIT_11 of inst : label is "0000004820840C008C800004C00220000000080A002940840C80000000240120";
    attribute INIT_12 of inst : label is "000000480000800CAC800094004812000000004800040C00AC800022C0060000";
    attribute INIT_13 of inst : label is "0000080A00000000EC800042008241200000000000000000EC80005508048120";
    attribute INIT_14 of inst : label is "0000008800210420880000000240120000000808014208408080000004802410";
    attribute INIT_15 of inst : label is "0000000000001030000000000301000000000088000214208800000002412000";
    attribute INIT_16 of inst : label is "0000000000000000000000000000000000000000000000100000000001000000";
    attribute INIT_17 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_18 of inst : label is "0000000000000000017FFF7F00000000FF77609B000000000000000000000000";
    attribute INIT_19 of inst : label is "000122100210000007C4012C00000003261007FE000000002C01001000012480";
    attribute INIT_1A of inst : label is "10000DA704231000FC1000830000000CD0001034300000002096124800003480";
    attribute INIT_1B of inst : label is "080210100401000000821385410000008C802401A00000013680000000000200";
    attribute INIT_1C of inst : label is "00000000000017FF00B64DA8F99801A8CC63B3330010CEFF6C880000EEC80000";
    attribute INIT_1D of inst : label is "0000133B0012A042C100019700C2422410016800801117004E23100000000000";
    attribute INIT_1E of inst : label is "000CC6270C33D2C9F40C2239109827EEC08841CCC0AF68CDA533000000004300";
    attribute INIT_1F of inst : label is "00000000804080010028140000102083B006168110C011520800010068204000";
    attribute INIT_20 of inst : label is "0000000C00000000CC0000007000000000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "2401208C00000000EC000000000120000010010800000000CC00000001600000";
    attribute INIT_22 of inst : label is "0088018C0000000080000000000001004812000800000000C800000000011000";
    attribute INIT_23 of inst : label is "0044008802200000808000000000000000022008110000008000000000000000";
    attribute INIT_24 of inst : label is "0000002000000000002000000000000000000000000000000000000000000000";
    attribute INIT_25 of inst : label is "0000000000000200000000000002000000000080000000100080000000100000";
    attribute INIT_26 of inst : label is "0002020002080000000202000000080200000000000040000000000000004000";
    attribute INIT_27 of inst : label is "000000000200000000000000000000020000000000C0000000000000000000C0";
    attribute INIT_28 of inst : label is "55822713000000000000000000000000EE733100000000000000000000000000";
    attribute INIT_29 of inst : label is "0040100011402220881068004000000002410441010111008064100000000000";
    attribute INIT_2A of inst : label is "000000000048000000000801288000000080200002A000140080160040800000";
    attribute INIT_2B of inst : label is "0000000000000000000004000000000000000010000800000000008000800002";
    attribute INIT_2C of inst : label is "000296DE0008203EE882FEC06230100088296DFC0032177EB4C2EF90D4613000";
    attribute INIT_2D of inst : label is "000880DB00000000C1FD80001000000000881DBD00001113193FEC0031000000";
    attribute INIT_2E of inst : label is "0000080A0000000076E40000000000000000808A00000000E5BD400000000000";
    attribute INIT_2F of inst : label is "00000000000000000C800000000000000000000C0000000068C0000000000000";
    attribute INIT_30 of inst : label is "000008EF00001000E80000000010000000000000000000000000000000000000";
    attribute INIT_31 of inst : label is "000007EE00000120CC08800000000000000000EF00001201EC00000000000000";
    attribute INIT_32 of inst : label is "0002EECC000000118EE2400021000000000016EC00000012C884480020000000";
    attribute INIT_33 of inst : label is "00008CCE00000000CFE41000000000000004EEEE00000000CF64100000000000";
    attribute INIT_34 of inst : label is "000008EF00000000E800000000000000000008EF00001000E800000000100000";
    attribute INIT_35 of inst : label is "000000CE00000000C000000000000000000000CE00000000C000000000000000";
    attribute INIT_36 of inst : label is "0000000C0000000000000000000000000000008C000000008000000000000000";
    attribute INIT_37 of inst : label is "0000000800000000800000000000000000000008000000000000000000000000";
    attribute INIT_38 of inst : label is "0000000F0000000DF0000000D00000000F1000000FFCCCCC0000001FCCCCCCFF";
    attribute INIT_39 of inst : label is "0000048F00000000F8400000000000000000000F00000003F000000030000000";
    attribute INIT_3A of inst : label is "0000011D00000000D11000000000000000000227000000007220000000000000";
    attribute INIT_3B of inst : label is "0000000000000000000000000000000000000002000000002000000000000000";
    attribute INIT_3C of inst : label is "000000000000013F00000000F310000000756070000000000707520000000000";
    attribute INIT_3D of inst : label is "000000000000037F00000000F7300000000000000000013F00000000F3100000";
    attribute INIT_3E of inst : label is "000000000000026E00000000E6200000000000000000037F00000000F7300000";
    attribute INIT_3F of inst : label is "000000000000004C00000000C4000000000000000000004C00000000C4000000";
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
