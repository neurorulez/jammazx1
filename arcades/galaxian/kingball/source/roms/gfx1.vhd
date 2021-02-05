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
    attribute INIT_06 of inst : label is "00000CEFF1111111EC000000F0000000000000001111111FCEC000000000000F";
    attribute INIT_07 of inst : label is "000000000000C22700000000F7F722C000000000006223F300000000F3226000";
    attribute INIT_08 of inst : label is "000000000003113F000000003F3113000000008E00000000FE80000000000000";
    attribute INIT_09 of inst : label is "00000000000008F700000000FF7A010000000000000C427700000000F7F11100";
    attribute INIT_0A of inst : label is "000000000000013700880000F775100000000000000000BF00000000FFB74000";
    attribute INIT_0B of inst : label is "0000000000000113C4000000F3110000000000000000001300088000BF725100";
    attribute INIT_0C of inst : label is "000088CE0000006C8EC88000FC600000000C000C000008070C000C00F7080000";
    attribute INIT_0D of inst : label is "333FFE003300EFF3000000000FFF7722000000000FF0F877000000008FFFF772";
    attribute INIT_0E of inst : label is "0000000000008227000000003140000008C800881773FFFF00088800FF737310";
    attribute INIT_0F of inst : label is "800480000129DD77C0008400F7F402000000000000080537840100007E444000";
    attribute INIT_10 of inst : label is "000000000488960700000000887078870000000004F00EAA00000000A9078887";
    attribute INIT_11 of inst : label is "0000000006999607000000008870788700000000089BD8070000000088707887";
    attribute INIT_12 of inst : label is "0007F8000EF999F6023111FE0CC44FF4023999F6037FDD910011FF110CE311EC";
    attribute INIT_13 of inst : label is "0EFF3333FF00FFF000FFF00FFBBBBFFF0FFF00FF00FFF00000999BEC0699DD76";
    attribute INIT_14 of inst : label is "00000000000F3113C000000003113F000006600040000000E0002AAAE8880000";
    attribute INIT_15 of inst : label is "0000C808002FF7328000000011000100000000C0007F73300000000031113600";
    attribute INIT_16 of inst : label is "000008880001FFF38C8800003000000000080088000FFF738888000021000000";
    attribute INIT_17 of inst : label is "0000008C000026EFCC440000F900000000000088000026FFCCC88000F1000000";
    attribute INIT_18 of inst : label is "008844880C00EFE0000000000010C300F7081710848C00080010843043000000";
    attribute INIT_19 of inst : label is "00000000008429100000000000EFE00C00000344000000008017180700349008";
    attribute INIT_1A of inst : label is "0000000045612142000000003100000008C260722110000042D8000000000000";
    attribute INIT_1B of inst : label is "0004C000000003F3000000802C8000000000001200000861AC00000011101245";
    attribute INIT_1C of inst : label is "00000000FF7184FC88000000FFF00000917127F7D5FF9773FFFC000031100000";
    attribute INIT_1D of inst : label is "0000000000088CEE00000000EFFFFFFF0033337F00000001EBF46FFF1137B77E";
    attribute INIT_1E of inst : label is "000000008E77F9840000000054200000FD36A8EA023000103740000000100000";
    attribute INIT_1F of inst : label is "000000000000880000000000AC9EA8FF0000112600000010C2379EB700101001";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "000000000000000000000000000000000000000006EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "00EC8000F1111111008CE000F000000000008CC81111111F0008CC800000000F";
    attribute INIT_27 of inst : label is "0000000000001000000000002020001000000000000000100000000010000000";
    attribute INIT_28 of inst : label is "0000000000000001000000000100000000037640000000000046730000000000";
    attribute INIT_29 of inst : label is "0000000000133200000800002100000000000000000000020000800001000000";
    attribute INIT_2A of inst : label is "000000CC00008CC0000000002000000000000000002666000C80000040100000";
    attribute INIT_2B of inst : label is "0000CC8000008CE00000000010000000000008CC00088C400000000020000000";
    attribute INIT_2C of inst : label is "000EC8CE000000000EC8CE000000000000EFE00C001710070C00EFE007001710";
    attribute INIT_2D of inst : label is "333FFE003300EFF3F0000000F0000000F0000000F00F07880000000070000000";
    attribute INIT_2E of inst : label is "00000008000021900000000004A2000000000004003413A388800000C3052000";
    attribute INIT_2F of inst : label is "120201021810013708004021F7EC2048004800C200420080008C400013011120";
    attribute INIT_30 of inst : label is "000000000488960700000000887078870000000004F00EAA00000000A9078887";
    attribute INIT_31 of inst : label is "0000000006999607000000008870788700000000089BD8070000000088707887";
    attribute INIT_32 of inst : label is "0007F8000EF999F6023111FE0CC44FF4023999F6037FDD910011FF110CE311EC";
    attribute INIT_33 of inst : label is "0EFF3333FF00FFF000FFF00FFBBBBFFF0FFF00FF00FFF00000999BEC0699DD76";
    attribute INIT_34 of inst : label is "000000000000337FC0000000FF7330000006600040000000E0002AAAE8880000";
    attribute INIT_35 of inst : label is "0000C8000000777700000000FF300000000000C0000277FF00000000FF310000";
    attribute INIT_36 of inst : label is "00000000000007F700000000773300000008000000007F770000000077700000";
    attribute INIT_37 of inst : label is "000000000000002788000000FF310000000000000000003F08000000F7331000";
    attribute INIT_38 of inst : label is "0000000000000000000000000071000000000000000C4CE708F3000000000000";
    attribute INIT_39 of inst : label is "0000000000008C62000000000000000000000011000000003000000000013640";
    attribute INIT_3A of inst : label is "00000000446121000000884021000000000260000000000100CC880024800000";
    attribute INIT_3B of inst : label is "024CC00000000013000000E83FA000000000000000088C610800000011000081";
    attribute INIT_3C of inst : label is "F0000008C844B763C808C62194600000917FFE88AB4463111E0C000037580000";
    attribute INIT_3D of inst : label is "0001248000000844800000085B1489EF0842012400008C62575827FF20126025";
    attribute INIT_3E of inst : label is "F00008400737FFFF00008420DC6210000017BBFFF73013D0FFC80000137C0000";
    attribute INIT_3F of inst : label is "004800000226CC8800C80000BF7EB00F0000113700008431FFDC800008F31001";
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
    attribute INIT_06 of inst : label is "006223F3F0000000F3226000F88888880000C2270000000FF7F722C08888888F";
    attribute INIT_07 of inst : label is "0000000000000000CEC000000000000000000CEF00000000EC00000000000000";
    attribute INIT_08 of inst : label is "0000008E00000000FE800000000000000003113F000000003F31130000000000";
    attribute INIT_09 of inst : label is "0000008C00001000CC88880001000000000000CE00000000EC80080010000000";
    attribute INIT_0A of inst : label is "000008CC00000000CED0000032000000000000CC00000130CC8C640000100000";
    attribute INIT_0B of inst : label is "00008CCE00000000FE440000110000000000088C00000000CCFC800032000000";
    attribute INIT_0C of inst : label is "0000101F00000000FF10100070000000000F27EF0000037FFFE72F00FF730000";
    attribute INIT_0D of inst : label is "CCCFF700CC007FFC0C880000010000000FF7EE6407773331CC88800011000000";
    attribute INIT_0E of inst : label is "00001A8C00000000940000000000000007FFEFFF00000111FFFFFD8830000000";
    attribute INIT_0F of inst : label is "01248BAC00421000ED88C4203E0024000052A92C00000200CA81420024020000";
    attribute INIT_10 of inst : label is "026A220C0000000022C0C22C0000000002E20422000000002C0C222C00000000";
    attribute INIT_11 of inst : label is "0C222C0C0000000022C0C22C0000000002222C0C0000000022C0C22C00000000";
    attribute INIT_12 of inst : label is "0664457601364440077555500013677000445764026445730002770001344631";
    attribute INIT_13 of inst : label is "07FFCCCCFFCCFF7000FFFCCFDDDDDFF7CFF7001D00FFFCCC0374447303754430";
    attribute INIT_14 of inst : label is "0008CEF800000000F8FEC8000000000000066000200000003220122232221022";
    attribute INIT_15 of inst : label is "000EC9E400001200FFF7E80000000000000CEC9F00010000CFECC00000000000";
    attribute INIT_16 of inst : label is "001B24D7000001137F31120020000000000C9AC700001320FF73360000000000";
    attribute INIT_17 of inst : label is "0088ABBF0000000174000000111100000044C9BF000000117710000013200000";
    attribute INIT_18 of inst : label is "21421100FFE7FFF01124800000112C00FF7300AC000121108221000000000000";
    attribute INIT_19 of inst : label is "000000080012C1208440004400FFF7EF00000000000000000D16837F00000110";
    attribute INIT_1A of inst : label is "84422A2C00335F010000000016C000002609E126000000000001000000000000";
    attribute INIT_1B of inst : label is "000001D700000E01221122700000000000000007000000008FCC444C00000000";
    attribute INIT_1C of inst : label is "ECCEEF67C0AFF7297B400000F9000000FE808C8300000000DFF7100000000000";
    attribute INIT_1D of inst : label is "00000000003FFD3618EEFFDE739827EE0000027D000000008887FE7F00000000";
    attribute INIT_1E of inst : label is "02880000FC7DD4220840000031000000F73DFC81000000003F90000000000000";
    attribute INIT_1F of inst : label is "00000000000005740800048C4D7AEFFF0000008600000000946F18F800000000";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "00000000000000000000000000000000011111110889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "00000010F000000010000000F8888888000010000000000F202000108888888F";
    attribute INIT_27 of inst : label is "00008CC8000000000008CC800000000000EC800000000000008CE00000000000";
    attribute INIT_28 of inst : label is "0003764000000000004673000000000000000001000000000100000000000000";
    attribute INIT_29 of inst : label is "0000000000000000007300000000000000CCC800000000000067300000000000";
    attribute INIT_2A of inst : label is "0000001300011100080000000000000000000000000000000330000000000000";
    attribute INIT_2B of inst : label is "0000013000001100400000000000000000000013000110000800000000000000";
    attribute INIT_2C of inst : label is "0007301F000000000F1037000000000000FFF7EF000000000FE7FFF000000000";
    attribute INIT_2D of inst : label is "CCCFF700CC007FFCF000000010000000F0080088700000000000000000000000";
    attribute INIT_2E of inst : label is "000240130000000020A500000000000000247CAF00000000C865100000000000";
    attribute INIT_2F of inst : label is "0002008C84280200ECC0001000080000008910C8000000009810000001400000";
    attribute INIT_30 of inst : label is "026A220C0000000022C0C22C0000000002E20422000000002C0C222C00000000";
    attribute INIT_31 of inst : label is "0C222C0C0000000022C0C22C0000000002222C0C0000000022C0C22C00000000";
    attribute INIT_32 of inst : label is "0664457601364440077555500013677000445764026445730002770001344631";
    attribute INIT_33 of inst : label is "07FFCCCCFFCCFF7000FFFCCFDDDDDFF7CFF7001D00FFFCCC0374447303754430";
    attribute INIT_34 of inst : label is "000008C800000000F8C800001000000000066000200000003220122232221022";
    attribute INIT_35 of inst : label is "0000C9EC00000000EEE400000000000000008C9F00000000CC88000010000000";
    attribute INIT_36 of inst : label is "001324DF00000000FFF000000000000000009ACF00000000FFF2000000000000";
    attribute INIT_37 of inst : label is "008888AF00000000FFEC8000000000000044C9BF00000000FFFC000000000000";
    attribute INIT_38 of inst : label is "C4633311000000000C8800000088000000000088000000000000000000000000";
    attribute INIT_39 of inst : label is "00000000000017E000000888000000000000000000000000006E800000000000";
    attribute INIT_3A of inst : label is "70000800001117004E23100000000000260007EE000000000001001000012480";
    attribute INIT_3B of inst : label is "0000133B000000008000001300000000000000000210000007C4000C00000003";
    attribute INIT_3C of inst : label is "C08841DCC0AF68CDA573000000000000D0001034310000002096124800003480";
    attribute INIT_3D of inst : label is "000000070003D2C9F40C2239109827EE1000002704231000FC1000830000000C";
    attribute INIT_3E of inst : label is "FE8C2108000CFFFF8C621000FD444400EFEFFFFFF0000001FF90112200001680";
    attribute INIT_3F of inst : label is "0000126C88888DFF8803C40CFF0000000000008E04210000F77FFFF861000000";
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
