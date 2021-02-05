-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity rom_char_l is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of rom_char_l is

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
    attribute INIT_00 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_01 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_02 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_03 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_04 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_05 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "FFFFFFFFFFFFFFFF000000004EE22C4000000000000000000000000000000000";
    attribute INIT_08 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_09 of inst : label is "00000000000000000000000000000000FFFFFFFF000000000000000000000000";
    attribute INIT_0A of inst : label is "00000000F310013F07555570000FF0000000000008ABBBA80FE6E6EF0CEFFF6C";
    attribute INIT_0B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_0C of inst : label is "F3D4000080000000800000003000000031000000CCBB77F0EE5BFF4080000000";
    attribute INIT_0D of inst : label is "800C0000CCCCEC80C7100000C0000000D900000011171000CCCFC00000000000";
    attribute INIT_0E of inst : label is "33333FFC11111000767F562ED1DDDDDD9557B9DDF7308CCCC61CFF310000860C";
    attribute INIT_0F of inst : label is "15DCFC4CCCCCCCCC000000BBBBBBB7FF46AABBBD1E111111CCCCCCCCD1111110";
    attribute INIT_10 of inst : label is "233B311305566223001D3C6309DDDDDDCDDDDDDD937FFFFF28EF7310C66ECC80";
    attribute INIT_11 of inst : label is "1BA9EC881CFFECCCE978000008EEF7770CB9DFC40DD59BB9ECCCCCCC35EEDDB6";
    attribute INIT_12 of inst : label is "00000073000000FF00000010000000FF000000FF00137FEC000000040000008C";
    attribute INIT_13 of inst : label is "000000000000008E0000007F00000018000000C8000000C9377EEDB7800CFFF7";
    attribute INIT_14 of inst : label is "F0000000F0000000F0000000F000000000000000000000000000000000000000";
    attribute INIT_15 of inst : label is "FF000000FFFF0000FFFFFF00FFFFFFFFFFFFFFF0FFFFF800FFF00000F0000000";
    attribute INIT_16 of inst : label is "FFFFFFFCFFFFFFC0FFFFFC00FFFFC000FFFC0000FFC00000FC000000F0000000";
    attribute INIT_17 of inst : label is "F0000000FF000000FFF00000FFFF0000FFFFF000FFFFFF00FFFFFFF0FFFFFFFF";
    attribute INIT_18 of inst : label is "FFFFFF00FFFFC000FF80000000000000FFFFFFE8FFFF0000FF000000F0000000";
    attribute INIT_19 of inst : label is "FFFFF10070000000FFFFFFFFFFF30000FFFFF100FFFFFFF0FFFFFFFFFFFFFFF8";
    attribute INIT_1A of inst : label is "FFFFE800E8000000FFFFFFFFFFFFE800FF800000F0000000F1000000FFF00000";
    attribute INIT_1B of inst : label is "FF710000FFFFFFFFFFFFFF00FFFFFFF7FFFFFFF0FFFFE000F8000000FFFFFFFF";
    attribute INIT_1C of inst : label is "FFFC0000F0000000F7000000FFF30000FFFFFF71FF710000FFFFFFFFFFFFFF71";
    attribute INIT_1D of inst : label is "FFFFC000E8000000FFFFFFFFFFFC000000000000FFFFFC8080000000FFFFFFFC";
    attribute INIT_1E of inst : label is "31000000FFFFFFFFFFFFF730FF700000FFFFFFFFFFFFFF10FFFFFFFFFFFFFFF8";
    attribute INIT_1F of inst : label is "F0330F00FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFF300FF310000FFFFFFFF";
    attribute INIT_20 of inst : label is "EC800000FFFFFFFFC8000000FFFFFFFEEC800000FFFFFFFFFFE80000F0000000";
    attribute INIT_21 of inst : label is "00000000FFFFFC0010000000FFFFFFF3FFFF7100FFFFFFFEFEC80000FFFFFFFF";
    attribute INIT_22 of inst : label is "FFFFFFF731000000FFFFFFF731000000FFFFFFF7FFFFFFF3FFE00000FFFFFFFF";
    attribute INIT_23 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF300000031000000";
    attribute INIT_24 of inst : label is "F1000000FFFFFFFF80000000FFFFFFFFF1000000FFFFFFFF80000000FFFFFFFF";
    attribute INIT_25 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_26 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_27 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_28 of inst : label is "FFFFFFFE80000000FFFFFEC800000000FFFEC80000000000FFFFEC80F8000000";
    attribute INIT_29 of inst : label is "FEC80000FFFFFFFFC8800000FFFFFFEC00000000FFFECC0000000000EC880000";
    attribute INIT_2A of inst : label is "FFFFF733FFFFFFFFF7310000FFFFFFFFFFFF7331FFFFFFFFFFFF0000FFFFFFFF";
    attribute INIT_2B of inst : label is "FF10000031000000FFFFFFF731100000FFFFFFF7FF733100FFFFFFFF10000000";
    attribute INIT_2C of inst : label is "0000000000000000FFFFFFFFCCCCEEEE0000888800000000000000000000008F";
    attribute INIT_2D of inst : label is "7FFFFFFF113337770000000117FFFFFF008CEFFFFFFFFFFFCEEEEFFF08888CCC";
    attribute INIT_2E of inst : label is "001137FFFFFFFFFFFFFFFFFFFFFFFFFF3337777F00001113FFFFFFFFFFFFFFFF";
    attribute INIT_2F of inst : label is "FFFFFFFF1337FFFFEFFFFFFF000888CEFFFFFFFF08CCEEFF00000000000008CF";
    attribute INIT_30 of inst : label is "0000008F13377FFF00000001FFFFFFFF0113377FEFFFFFFF0000008C0000117F";
    attribute INIT_31 of inst : label is "FFFFFFFF00137FFF8CEFFFFF0000001FEFFFFFFF0000008CEFFFFFFF0000008C";
    attribute INIT_32 of inst : label is "000088CC0888CCEF000000000000000000000000000017FFFFFFFFFF000137FF";
    attribute INIT_33 of inst : label is "77777FFF1333333700111111FFFFFFFFFFDDFFFF37FFFFFFFFFFFFFFCEEEEEFF";
    attribute INIT_34 of inst : label is "FFFFFFFF37FFFFFFFFFFFFFFCCEEEEEF000088CC000000CF00000000FFFFFFFF";
    attribute INIT_35 of inst : label is "FFFFFC00FC000000FFFFFFFFFFFFFC00FC0000003337FFFF00011111FFFFFFFF";
    attribute INIT_36 of inst : label is "77777777FFFFFFFFFFFFFC00FC000000FFFFFFFFFFFFFC00FC000000FFFFFFFF";
    attribute INIT_37 of inst : label is "00000001000000003333FFFFB3333333FFFFFFFF0133377777777FFF77777777";
    attribute INIT_38 of inst : label is "0000000000000000FC88FFFF000007FF00000000000000001111FFFF37FFFFD9";
    attribute INIT_39 of inst : label is "0088CEFF00000000FFFFFFFF000CFFFF0000000000000000FFCCFFFF000000CF";
    attribute INIT_3A of inst : label is "FFFFFFFFFFFFFFF33333FFFF33333333F7333333FFFFFFFF7777FFFFFF777777";
    attribute INIT_3B of inst : label is "FFFFFFF3FFF30000FFFFFFFFFFFFFFF3FFF30000FFFFFFFFFFFFFFF3FFF30000";
    attribute INIT_3C of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30000";
    attribute INIT_3D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3E of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3F of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
  rom1 : if true generate
    attribute INIT_00 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_01 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_02 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_03 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_04 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_05 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_06 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_07 of inst : label is "FFFFFFFFFFFFFFFF000000004FF0000000000000000000000000000000000000";
    attribute INIT_08 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_09 of inst : label is "00000000000000000000000000000000FFFFFFFF000000000000000000000000";
    attribute INIT_0A of inst : label is "02222230364004630EAEEAE0111FF1110000100006F909F600F101F00F2AAA2F";
    attribute INIT_0B of inst : label is "0444757007557570044444700755717007447170047551100744747007174570";
    attribute INIT_0C of inst : label is "91000000FE800000D9000000100000000000000099CD5B0069EFF000FFEC8000";
    attribute INIT_0D of inst : label is "D3BD10006666E610100000003EC800000000000080000000BBBBB70000000000";
    attribute INIT_0E of inst : label is "BAAAAAAA6666667F06AABBBD8F000011AB99889D888888999EFF300000868CFF";
    attribute INIT_0F of inst : label is "111137FEED35A66622666EED11137FED999998807677771E7BBBBBBB00000000";
    attribute INIT_10 of inst : label is "CCCBB66D0766666608B9DFC48EEACC81088ADFCA1DBAAAAAFFF100023F70FFF3";
    attribute INIT_11 of inst : label is "FEDB5222FC39666E37A800000FF12311855662AB113B3D43E9BBBBBB00005762";
    attribute INIT_12 of inst : label is "0000008C000000FF000000C8000000FF000000800000009B0008844FC6021113";
    attribute INIT_13 of inst : label is "000000270000003F00000001000000EF000000FF000000310000137FB07FFF90";
    attribute INIT_14 of inst : label is "F0000000F0000000F0000000F000000000000000000000000000000000000000";
    attribute INIT_15 of inst : label is "F0000000FFF00000FFFFF000FFFFFFF3FFFFFFFFFFFFFF00FFFF0000FF000000";
    attribute INIT_16 of inst : label is "FFFFFFFFFFFFFFF0FFFFFF00FFFFF000FFFF0000FFF00000FF000000F0000000";
    attribute INIT_17 of inst : label is "F0000000F3000000FF300000FFF30000FFFF3000FFFFF100FFFFFF30FFFFFFF3";
    attribute INIT_18 of inst : label is "FFFFFFF0FFFFF800FFFC0000E0000000FFFFFFFFFFFFF800FFF00000F8000000";
    attribute INIT_19 of inst : label is "FFFF000000000000FFFFFF71FF100000FFFF1000FFFFFF00FFFFFFF1FFFFFFFF";
    attribute INIT_1A of inst : label is "FFFFFFE8FFE80000FFFFFFFFFFFFFFE8FFFC0000FE000000F0000000FF000000";
    attribute INIT_1B of inst : label is "71000000FFFFFFFFFFFF7000FFFFFFF0FFFFFFFFFFFFFF00FFE80000FFFFFFFF";
    attribute INIT_1C of inst : label is "FFFFFC00FF000000F0000000FF100000FFFF710071000000FFFFFFFFFFFF7100";
    attribute INIT_1D of inst : label is "FFFFFF80FFE00000FFFFFFFFFFFFFEC0C8000000FFFFFFFFFFC80000FFFFFFFF";
    attribute INIT_1E of inst : label is "00000000FFFFF310FFF3000071000000FFFFFFFFFFFF3000FFFFFFF1FFFFFFFF";
    attribute INIT_1F of inst : label is "F0330F00FFFFFFFFFFFFFFFFFFFFFFFFF0000000FFF3000010000000FFFFFFF3";
    attribute INIT_20 of inst : label is "FFFFEC88FFFFFFFFFFFEEC80FFFFFFFFFFFFE800FFFFFFFFFFFFFEC0FC000000";
    attribute INIT_21 of inst : label is "80000000FFFFFFFE00000000FFFFF300FF300000FFFFFFF3FFFFFE80FFFFFFFF";
    attribute INIT_22 of inst : label is "FFF7310000000000FFF7310000000000FFF73100FFF73100F7100000FFFFFFFF";
    attribute INIT_23 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000";
    attribute INIT_24 of inst : label is "10000000FFFFFFFFF8000000FFFFFFFF10000000FFFFFFFFF8000000FFFFFFFF";
    attribute INIT_25 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_26 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_27 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_28 of inst : label is "FFFFFFFFFFECC800FFFFFFFFC8800000FFFFFFFEC8000000FFFFFFFEFFC80000";
    attribute INIT_29 of inst : label is "FFFF0000FFFFFFFFFFFFECC8FFFFFFFFFEC88000FFFFFFFF80000000FFFFFECC";
    attribute INIT_2A of inst : label is "73110000FFFFFFF700000000FFF7331031000000FFFFFF73F7310000FFFFFFFF";
    attribute INIT_2B of inst : label is "F100000000000000FFF7310000000000FFF7310010000000FFFFF73100000000";
    attribute INIT_2C of inst : label is "CCCEEEFF00000088FFFFFFFFFFFFFFFFFFFFFFFFCCEEEEFF008888CC0088CEFF";
    attribute INIT_2D of inst : label is "00000111000000000000000000137FFFCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_2E of inst : label is "0000001FFFFFFFFF33337777000011110000000000000000FFFFFFFF13333777";
    attribute INIT_2F of inst : label is "377FFFFF00000011FFFFFFFFCEFFFFFFFFFFFFFFFFFFFFFF0088CCEF8CCEFFFF";
    attribute INIT_30 of inst : label is "008CEFFF0000001F0000000011337FFF00000000FFFFFFFF00000037008CCEFF";
    attribute INIT_31 of inst : label is "37FFFFFF000000137FFFFFFF00008CFFFFFFFFFF000007FFFFFFFFFF008CEFFF";
    attribute INIT_32 of inst : label is "CEFFFFFFFFFFFFFFEEEEEFFF8CCCCCCE008888880000001F337FFFFF00000001";
    attribute INIT_33 of inst : label is "000000000000000000000000FFFFFFFF337777FF00001113FFFFFFFFFFFFFFFF";
    attribute INIT_34 of inst : label is "3377777F00001133FFFFFFFFFFFFFFFFCEFFFFFFCCCEFFFF000888880111337F";
    attribute INIT_35 of inst : label is "FFFFFFFCFFFC0000FFFFFFFFFFFFFFFCFFFC00000000003F00000000FFFFFFFF";
    attribute INIT_36 of inst : label is "FECCCCCCFFFFFFFFFFFFFFFCFFFC0000FFFFFFFFFFFFFFFCFFFC0000FFFFFFFF";
    attribute INIT_37 of inst : label is "0000000000000000EEEEFFFFFFEEEEEE001137FF00000000CCCCCFFFCCCCCCCC";
    attribute INIT_38 of inst : label is "0000000000000000FF33FFFF0000003F0000000000000000FFFFFFFF0003FFFF";
    attribute INIT_39 of inst : label is "FFFFFFFF88CCCEEE8888FFFFCEFFFFB90000000800000000F311FFFF00000EFF";
    attribute INIT_3A of inst : label is "FFFFFFFFFFFFF300EEEEFFFFEEEEEEEEEEEEEEEEFFFFFFFFCCCCFFFFDCCCCCCC";
    attribute INIT_3B of inst : label is "FFFFF300F3000000FFFFFFFFFFFFF300F3000000FFFFFFFFFFFFF300F3000000";
    attribute INIT_3C of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3000000";
    attribute INIT_3D of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3E of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_3F of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
