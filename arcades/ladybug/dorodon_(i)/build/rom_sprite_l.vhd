-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity rom_sprite_l is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of rom_sprite_l is

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
    attribute INIT_00 of inst : label is "00000000000C0C030003FFFFFFFFFFBF03070F0303040000B3BFBFBFBFBFF300";
    attribute INIT_01 of inst : label is "0000000000000C040000F0F3FFFFFFBF07070F0704040000B3BFBFBFBFB3F000";
    attribute INIT_02 of inst : label is "0000000000000C04000FCFFFFFFFFFB703030F0303040000B3B3BFBFBFBFFF00";
    attribute INIT_03 of inst : label is "0000000C0703030F0000F0F0B3B3B3B30F0303070C000000B3BFBFBFFFF30000";
    attribute INIT_04 of inst : label is "000000000407070F00C3FFFFFFFFFFF30F07070400000000F3FFFFFFFFFFC300";
    attribute INIT_05 of inst : label is "00000000040404000003FFFFFFFFFFFF0004040400000000FFFFF3F3F3F0C000";
    attribute INIT_06 of inst : label is "000000000C4F4F0C000000C0E3EBFBDB000F0F000C4C400053535353D2F28200";
    attribute INIT_07 of inst : label is "000000404C0F0F03000020E0F3FBFB7B030F0F03034C400053535B5B7BF0E000";
    attribute INIT_08 of inst : label is "000008484C0F0F03000082F2F2F37373030F0F43434C0000535B5B5B53F02000";
    attribute INIT_09 of inst : label is "0000404C0F03030F202AFAFAB3B393A30F03434F0C00000093ABBBABE3F00000";
    attribute INIT_0A of inst : label is "0000404C0F03030F0020E0F3BBABEBE30F03030F4C400000E3EBABBBF3E02000";
    attribute INIT_0B of inst : label is "0000000C4F43030F0000F0E3EB7BAB930F03030F4C400000A39373F3FAFA2A20";
    attribute INIT_0C of inst : label is "000A0A0F0F8F83000000F0F0F3D35F7F030F4F5F5F050501FFCF0BCBF8F08000";
    attribute INIT_0D of inst : label is "000A0A0F070F070F0002F0F437033FFF0F070F070F0A0A00FF3F0337F4F00200";
    attribute INIT_0E of inst : label is "0105055F5F4F0F030080F0F8CB0BCFFF00838F0F0F0A0A007F5FD3F3F0F00000";
    attribute INIT_0F of inst : label is "000A0A0F0F8F83000000F0F0F3D35F7F030F4F5F5F050501FFCF0BCBF8F08000";
    attribute INIT_10 of inst : label is "000A0A0F070F070F0002F0F437033FFF0F070F070F0A0A00FF3F0337F4F00200";
    attribute INIT_11 of inst : label is "0105055F5F4F0F030080F0F8CB0BCFFF00838F0F0F0A0A007F5FD3F3F0F00000";
    attribute INIT_12 of inst : label is "000005050505054600105050525A5A5A46050500000000005A52501000000000";
    attribute INIT_13 of inst : label is "00000000080906460000005060626A5A06050504000000005A5A525010000000";
    attribute INIT_14 of inst : label is "0000000000050546000000001050525A46050505050500005A5A5A5250501000";
    attribute INIT_15 of inst : label is "00000004050606450000405050525A5A45060604000000005A5A525050400000";
    attribute INIT_16 of inst : label is "00000000080906460000005060626A5A06050504000000005A5A525010000000";
    attribute INIT_17 of inst : label is "00000000050506460000001050526A6A46460505000000006A6A525010000000";
    attribute INIT_18 of inst : label is "0F0F0C0F4F5F5F5F5F5F5F535353FAFA0F0C000000000000B2E0200000000000";
    attribute INIT_19 of inst : label is "0F0F000C4C5F5F5FFFFFFFDBDBDBF3F30F0C000000000000F0E0200000000000";
    attribute INIT_1A of inst : label is "0F0F000C4C4F4F0F5F5F5F5B7BFBF3F30F08080000000000F0F0000000000000";
    attribute INIT_1B of inst : label is "000000000008080F000000000000F0F00F4F4F4F0F0C0F0FF3F35B5B5B5F5F5F";
    attribute INIT_1C of inst : label is "0000000000000C0F000000000020E0F05F5F5F4C0C000F0FF3F3DBDBDBFFFFFF";
    attribute INIT_1D of inst : label is "0000000000000C0F00000000002020B25F5F5F4C0C000F0FFAFAF373535F5F5F";
    attribute INIT_1E of inst : label is "0F40430F08000000D3DBFBF0F000000000000000000000000000000000000000";
    attribute INIT_1F of inst : label is "0F505F0F00000000D3FBFBF0F000000000000000000000000000000000000000";
    attribute INIT_20 of inst : label is "0F030F0C00000000D353E2F2F200000000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "00000000000000000000000000000000000000080F43400F000000F0F0FBDBD3";
    attribute INIT_22 of inst : label is "00000000000000000000000000000000000000000F5F500F000000F2F2F2F3D3";
    attribute INIT_23 of inst : label is "00000000000000000000000000000000000000000C0F030F000000F0F0EB5BD3";
    attribute INIT_24 of inst : label is "000000000C0C0F0F00C3FFFFFF5F0E0E0F0F0C0C00000000FEFE5E0E0FFFC300";
    attribute INIT_25 of inst : label is "000000000C0C0C0F00C3FFFFFFDFDFDF0F0F0F0F0C000000FFDFDFDF3F0F0F00";
    attribute INIT_26 of inst : label is "00000000000000000003FFFFFFFF4F4E0C0C0C0C0C0000005EFEFE4E4F53F000";
    attribute INIT_27 of inst : label is "AAAAAAEAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAABAAAAAAAAA";
    attribute INIT_28 of inst : label is "AAAAEAEAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAEAEAAAAAAAAAAAAABAAAAAAAAA";
    attribute INIT_29 of inst : label is "AAAAEAEAAAAAAAAAAAAAAABABABAFAFAAAAAAAAAEAEAAAAAFAFABABABAAAAAAA";
    attribute INIT_2A of inst : label is "AAAAAAAAAAAAAAAAAAAAAAAAAABABAFAAAAAAAAAAAAAAAAAFABABAAAAAAAAAAA";
    attribute INIT_2B of inst : label is "AAAAAAAAAAAAAAAAAAAAAAAAAABABAFAAAAAAAAAAAAAAAAAFABABAAAAAAAAAAA";
    attribute INIT_2C of inst : label is "AAAAAAAAAAAAAAAAAAAAAAAAAABABABAAAAAAAAAAAAAAAAABABABAAAAAAAAAAA";
    attribute INIT_2D of inst : label is "AAAAAAAAAAAAAAAAAAAAAAAAAABABAFAAAAAAAAAAAAAAAAAFABABAAAAAAAAAAA";
    attribute INIT_2E of inst : label is "AAAAAAAAAAAAAAAAAAAAAAAAAABABAFAAAAAAAAAAAAAAAAAFABABAAAAAAAAAAA";
    attribute INIT_2F of inst : label is "AAAAAAAAAAAAAAAAAAAAAAAAAABABABAAAAAAAAAAAAAAAAABABABAAAAAAAAAAA";
    attribute INIT_30 of inst : label is "AAAAEBEBABABAAAAAAAAAAEAEAEAFABAAAAAEBEBABABAAAABAFAEAEAEAAAAAAA";
    attribute INIT_31 of inst : label is "AAAAEBEBEBEBAAAAAAAAAAAAEAEAFAFAAAAAEBEBEBEBAAAAFAFAEAEAAAAAAAAA";
    attribute INIT_32 of inst : label is "AAAAEAEAEBEBAAAAAAAAAAEAFAFAFAFAAAAAEAEAEBEBAAAAFAFAFAFAEAAAAAAA";
    attribute INIT_33 of inst : label is "AAAAEBEBABABAAAAAAAAAAEAEAEAFABAAAAAEBEBABABAAAABAFAEAEAEAAAAAAA";
    attribute INIT_34 of inst : label is "AAAAEBEBEBEBAAAAAAAAAAAAEAEAFAFAAAAAEBEBEBEBAAAAFAFAEAEAAAAAAAAA";
    attribute INIT_35 of inst : label is "AAAAEAEAEBEBAAAAAAAAAAEAFAFAFAFAAAAAEAEAEBEBAAAAFAFAFAFAEAAAAAAA";
    attribute INIT_36 of inst : label is "000000000C00000000000000F00000F00C0000000C00000000F000F000F00000";
    attribute INIT_37 of inst : label is "0000000C0C0C0000000000C000F000F00C0000000C00000000F000F000F00000";
    attribute INIT_38 of inst : label is "000000000C000000000000F000F000F00C0000000C00000000F000F000F00000";
    attribute INIT_39 of inst : label is "0000050505050546001050505A5A5A5A46050500000000005A5A5A1A00000000";
    attribute INIT_3A of inst : label is "000000000C09064600000010606A6A5A06050504000000005A5A5A5010000000";
    attribute INIT_3B of inst : label is "0000000000050546000000000F0F0F0F46050505050500005A5A5A5A50501000";
    attribute INIT_3C of inst : label is "000000040506060500004050505A5A5A45060604000000005A5A5A5A5A400000";
    attribute INIT_3D of inst : label is "0000040501000107000080A4755571F107010001050400005B5B5F5504000000";
    attribute INIT_3E of inst : label is "00000000050506460000001A5A5A6A6A46460505000000006A6A5A5010000000";
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
    attribute INIT_00 of inst : label is "0000000C0F0F0F0400F0F0F3F3F3F3F004050F0404050000E0A0A3A3A3E0F000";
    attribute INIT_01 of inst : label is "0000000C0F0F0F000000F0F0F0F3F3F300050F0000050C00E0E3E3E3E0F03000";
    attribute INIT_02 of inst : label is "000000000C0F0F050042F3F3F1F0F0F004040F0404050000E0E0E0E0E3F3F300";
    attribute INIT_03 of inst : label is "00000C0F0504C4CF000030F0A0A0A0A0CFC404050F0C0000A0A0A3E3F0F00000";
    attribute INIT_04 of inst : label is "00000C0F0000050F00F0F0F3E3A3A0A00F0000050F0C0000A0A0A3E3F3F0F000";
    attribute INIT_05 of inst : label is "0000000C0500000F00F0F0F3E3A3A0A00F0000050C000000A0A0A0E0F0F03000";
    attribute INIT_06 of inst : label is "0000000A5A5BDFCF000000F0F0F2F2F2C7C5C5C5575F1A00F2F0F0F0A0A0A000";
    attribute INIT_07 of inst : label is "0000081A5A5FCFCF000000F0F0F2F2F2CCCFCFCC5F5F1A00F2F0F2F2F2F23000";
    attribute INIT_08 of inst : label is "0000021A5A5FCFCF0000A0A0A0F0F0F0CCC7C7D75C1F0A00F0F2F2F2F2F00000";
    attribute INIT_09 of inst : label is "080A1A5F5FCCCFCF00A0B0B0F0E0D0E0CFCCDF5B5A0A0000D0E2D2F2F2F00000";
    attribute INIT_0A of inst : label is "00081A5A5FCFCCCF0000F0F2F2F2F2F0CFCCCF5F5A1A0800F0F2F2F2F2F00000";
    attribute INIT_0B of inst : label is "00000A5A5BDFCCCF0000F0F2E2D2E2D0CFCFCC5F5F1A0A08E0D0E0D0B0B0A000";
    attribute INIT_0C of inst : label is "00A08F0FE7E7FFFC000000F0F0F0F0D0FFFFD3DF0F0F404050F0F2F2F2A22000";
    attribute INIT_0D of inst : label is "00828F0FCFCDFFFD0080A5F5F1C0F0F0FDFFCDCF0F8F8200F0F0C0F1F5A58000";
    attribute INIT_0E of inst : label is "40400F0FDFD3FFFF0020A2F2F2F2F050FCFFE7E70F8FA000D0F0F0F0F0000000";
    attribute INIT_0F of inst : label is "00A08F0FE7E7FFFC000000F0F0F0F0D0FFFFD3DF0F0F404000F0F2F2F2A22000";
    attribute INIT_10 of inst : label is "00828F0FCFCDFFFD0080A5F5F1C0F0F0FDFFCDCF0F8F8200F0F0C0F1F5A58000";
    attribute INIT_11 of inst : label is "40400F0FDFD3FFFF0020A2F2F2F2F050FCFFE7E70F8FA000D0F0F0F0F0000000";
    attribute INIT_12 of inst : label is "000406494999995900000020A0A2A2A25996060400000000A2A0200000000000";
    attribute INIT_13 of inst : label is "00000005054555590000000020A0A2A25999860604000000A2A2A02000000000";
    attribute INIT_14 of inst : label is "0000000004069A59000000000020A0A25999994946060400A2A2A2A020000000";
    attribute INIT_15 of inst : label is "00000001095956960000001020A0A2A29656490900000000A2A2A02010000000";
    attribute INIT_16 of inst : label is "00000005054555590000000020A0A2A25999860604000000A2A2A02000000000";
    attribute INIT_17 of inst : label is "00000004068995550000000020A0929255959906050000009292A02000000000";
    attribute INIT_18 of inst : label is "F5F5353517DFCF0FD0D0D0F0F0F0F0B00A0A080000000000A000000000000000";
    attribute INIT_19 of inst : label is "F7F7F7F7DFDFCF0FF0F0F0F2F2F2F2F20A0A080000000000F000000000000000";
    attribute INIT_1A of inst : label is "F7F7F7FFDFDF5F5FF0F0F0F2F2F2F2F20A0A020000000000F000000000000000";
    attribute INIT_1B of inst : label is "0000000000020A0A00000000000000F05F5FDF173535F5F5F2F2F2F2F2D0D0D0";
    attribute INIT_1C of inst : label is "0000000000080A0A00000000000000F00FCFDFDFF7F7F7F7F2F2F2F2F2F0F0F0";
    attribute INIT_1D of inst : label is "0000000000080A0A00000000000000A00FCFDFDFFFF7F7F7B0F0F0F0F0F0F0F0";
    attribute INIT_1E of inst : label is "F7DFDF5A5E000000F0F2F2F20000000000000000000000000000000000000000";
    attribute INIT_1F of inst : label is "F3DFDB0A0E000000F0F2F2F20000000000000000000000000000000000000000";
    attribute INIT_20 of inst : label is "CF5C5B5A0E000000F0F0B0B0A000000000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "000000000000000000000000000000000000005E5ADFDFF700000000F2F2F2F0";
    attribute INIT_22 of inst : label is "000000000000000000000000000000000000000E0ADBDFF7000000A0B0B0F0F0";
    attribute INIT_23 of inst : label is "000000000000000000000000000000000000000E5A5B5CCF00000000F2F2F2F0";
    attribute INIT_24 of inst : label is "00000C0F0F07070700F0F0F3F3B3B0F00F0F0707070C0000F0F0F3F3B3F0F000";
    attribute INIT_25 of inst : label is "00000C0F0F05000000F0F0F0F3B3A3A30F0500000F000000A0A0A3B3F3C30000";
    attribute INIT_26 of inst : label is "0000000C0C0F030300F0F3F3F3F3B0B0070F0F0303070C00F3F3F3F3B0F03000";
    attribute INIT_27 of inst : label is "AAAABAFAFABEAFAFAAAAAAAAAAAAAAAAAFAFBEFAFABAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_28 of inst : label is "AABAEAFABAAEABABAAAAAAAAAAAAAAAAABABBEEAFABAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_29 of inst : label is "AABABAFABEAEAFAFAAAAAAAAAAAAAAAAAFAFAEBEBAFABAAAAAAAAAAAAAAAAAAA";
    attribute INIT_2A of inst : label is "AAAAAAAAAEAEAEAEAAAAAAAAAAAAAAAAAEAEAEAEAAAAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_2B of inst : label is "AAAAAAAAAEAFAFAFAAAAAAAAAAAAAAAAAFAFAFAEAAAAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_2C of inst : label is "AAAAAAAAAEAEAAAAAAAAAAAAAAAAAAAAAAAAAEAEAAAAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_2D of inst : label is "AAAAAAAAAEAEAEAEAAAAAAAAAAAAAAAAAEAEAEAEAAAAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_2E of inst : label is "AAAAAAAAAEAFAFAFAAAAAAAAAAAAAAAAAFAFAFAEAAAAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_2F of inst : label is "AAAAAAAAAEAEAAAAAAAAAAAAAAAAAAAAAAAAAEAEAAAAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_30 of inst : label is "AAAAFAFAEAEAAAAAAAAAAAAAAAAAAAAAAAAAFAFAEAEAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_31 of inst : label is "AAAAFAAAAAFAAAAAAAAAAAAAAAAAAAAAAAAAFAAAAAFAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_32 of inst : label is "AAAABABAFAFAAEAEAAAAAAAAAAAABABAAEAEBABAFAFAAAAABABAAAAAAAAAAAAA";
    attribute INIT_33 of inst : label is "AAAAFAFAEAEAAAAAAAAAAAAAAAAAAAAAAAAAFAFAEAEAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_34 of inst : label is "AAAAFAAAAAFAAAAAAAAAAAAAAAAAAAAAAAAAFAAAAAFAAAAAAAAAAAAAAAAAAAAA";
    attribute INIT_35 of inst : label is "AAAABABAFAFAAEAEAAAAAAAAAAAABABAAEAEBABAFAFAAAAABABAAAAAAAAAAAAA";
    attribute INIT_36 of inst : label is "000000030F00000F0000003030300000000F000F000F00003000000030000000";
    attribute INIT_37 of inst : label is "000000000C03000F0000000030000000000F000F000F00003000000030000000";
    attribute INIT_38 of inst : label is "000000030C03000F0000000030000000000F000F000F00003000000030000000";
    attribute INIT_39 of inst : label is "000406494999995900000022A2A2A0A05996060400000000A0A0208000000000";
    attribute INIT_3A of inst : label is "00000005014555590000000022A2A2A059C9860604000000A0A2A22200000000";
    attribute INIT_3B of inst : label is "0000000004069A5900000000C030F0F05999994946060400A0A0A2A222000000";
    attribute INIT_3C of inst : label is "00000001095956D60000101022A2A2A09656490900000000A0A0A02090100000";
    attribute INIT_3D of inst : label is "0000090545445D5D00002101515050505DDDC64705010000F0F2F27301010000";
    attribute INIT_3E of inst : label is "00000004068995550000008020A0909055959924050000009092A22200000000";
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
