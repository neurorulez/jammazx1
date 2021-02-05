-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity rom_sprite_u is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of rom_sprite_u is

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
    attribute INIT_00 of inst : label is "0000080A06060A0A0000A0A0A2AAAAA20A0A0B0B0B080000AAAAAAA2A0A00000";
    attribute INIT_01 of inst : label is "00000A0A0A0A0A0A0000A0A0AAAAAAAA0A0A0A0A0A0A0000AAAAE2A2A0A00000";
    attribute INIT_02 of inst : label is "0000000000000408000042A6B556A6B50C070F0F0F030C0056A6B552A0000000";
    attribute INIT_03 of inst : label is "00000008080A06060000A0E2A2AAABEA05060A0808000000AAAABAA2A2A00000";
    attribute INIT_04 of inst : label is "0000000000080A0E000002A2AAAAAAAA0E0A0A0A0A0A0A00AAAAA2A2A0A00000";
    attribute INIT_05 of inst : label is "00000000080A020A000000A28AAAAA880B0B0F0C0C000000AAA2A220A0000000";
    attribute INIT_06 of inst : label is "0000000008060A0A0000A0A25A9A956A06060A08080000009656A96A5AA00000";
    attribute INIT_07 of inst : label is "0000080A0A0A0A0C0000002020202A0A0C0C0303000F00000A0A0ACA30000000";
    attribute INIT_08 of inst : label is "00000000000F0E0F000000F37FFFFFFF0F0F000000000000FFFFFFFFC3000000";
    attribute INIT_09 of inst : label is "000000000A0A060A0000020A2AA2AA6A0A0A0A0F0B08000092A0A09020200000";
    attribute INIT_0A of inst : label is "0000000505050505000050525A5A595A050505050500000053FA5A5252500000";
    attribute INIT_0B of inst : label is "000000000000000000C080A3A32FAE8E0008080A0A0B0F00AE8FA3A3A0F03000";
    attribute INIT_0C of inst : label is "000000080B0B0F0C0000A06262AAAAAA0C0F0F0B08080000AAAAAAAAA2A2A000";
    attribute INIT_0D of inst : label is "0000000000000808000000A0A2ABABAA0A0A090A00000000AAAAAAA2A0000000";
    attribute INIT_0E of inst : label is "00040A0A090109090010A0A020A0A363070F0FCF0000000043D3F3F0F0000000";
    attribute INIT_0F of inst : label is "00000000080A0A09000000A2EAAAAAAA0A0A0A0800000000AAAAAAAAAA820000";
    attribute INIT_10 of inst : label is "000000000C0F0F0F0000F0F0E2F2F2F20F0F0F0C00000000F2F2F2F2F0F00000";
    attribute INIT_11 of inst : label is "00000008080A0A020000A0A3A38F1F9F0A020A0A0A0800002FAF83A3F0300000";
    attribute INIT_12 of inst : label is "0000000000000000000F0FCFCFFCFFFF0000000000000000FFFFFCCFCF0F0F00";
    attribute INIT_13 of inst : label is "0000000C0F030F0F0000F3FFBFBEBEB20F0F030F0C000000B2BEBBBFFFF30000";
    attribute INIT_14 of inst : label is "0000000F0F0FCCCB0000F0EFAFAFAFA3CBCC0F0F0F000000A3AFAFAFEFF00000";
    attribute INIT_15 of inst : label is "0000000F0B0A0A0A0000F3AFAFAFAEAE0A0A0A0B0F000000AEAEAFAFAFF30000";
    attribute INIT_16 of inst : label is "0000000F0B0A0A0A0000F3AFAFAFAEAE0A0A0A0B0F000000AEAEAFAFAFF30000";
    attribute INIT_17 of inst : label is "000000000C030F0F00C3FFBFBFBEAEAE0F0F030C00000000AEAEBEBFBFFFC300";
    attribute INIT_18 of inst : label is "000000000C0F030F00C3FFFFFFFFFFF30F030F0C00000000F3FFFFFFFFFFC300";
    attribute INIT_19 of inst : label is "00000000000000000003CEFFFECE0ECF0000000000000000CF0ECEFEFFCE0300";
    attribute INIT_1A of inst : label is "0000000000000000000B0ACECAFB3AFE0000000000000000FE3AFBCA8E0A0B00";
    attribute INIT_1B of inst : label is "0000000000080B0300000000C2CECC0C00000C0C000000000030E2A2B2800000";
    attribute INIT_1C of inst : label is "0000000008080A0E00000030300002CE0B03030C0C000000FEFF2C2020200000";
    attribute INIT_1D of inst : label is "000000000C0C08080000000038CA8283080F0C080A020200A32FCCCC00000000";
    attribute INIT_1E of inst : label is "0000000000080B0B00000020888BB8BC0C0F0E0202080800FC3B3BCC03030000";
    attribute INIT_1F of inst : label is "000000000000080B0000003CBCEFEBEB0B0F0E0E0F0F0F03FBFFFFFFF3300000";
    attribute INIT_20 of inst : label is "0000000C0F0F0F0E0000030FCFEFEEBE0F0F0F0E0E0E0C00FBFFFFFBEEEFB030";
    attribute INIT_21 of inst : label is "000000000C0C0C0E00000000CABEBFFF0E0F0F0E0A0C0000FFFFFFEEACC00000";
    attribute INIT_22 of inst : label is "0000000000000000000000000FFFFBBF00000C0C0C000000FFFEEFFFFFFCC000";
    attribute INIT_23 of inst : label is "00000000000000000000000FFFFFFFFB0000000000000000FFFFFFBECF0C0000";
    attribute INIT_24 of inst : label is "00000000F0F3FF0C00080A0A0A0A0A0A5DDFDFDFFD7D5F5F0A3AFAFAFAFAFAFA";
    attribute INIT_25 of inst : label is "080A0A8A8A8AFAFEA0A2AAAAAAAABABAFFFFFFFFFFFFFFCFFAFAFEFFFFFFFFFF";
    attribute INIT_26 of inst : label is "000A8A8AAAAAAA8A000000A0A0A2AAAA8A0A0A0A0A0A080CAFAFEFFFFFFFF3F3";
    attribute INIT_27 of inst : label is "7DFDFF5D5DFDFDFFFAFAFA30303000007F5DDDDD7FFF7F5D0000303030FAFAFA";
    attribute INIT_28 of inst : label is "CF0F0F0F3FFFFFFFDF5F7F7F7FFFFFFFFFFFFF0F0F0F0FCFFFFFFF7F7F7F5FDF";
    attribute INIT_29 of inst : label is "0C0C0C0F0F0F0F0FF3FFFFFFFFFFFFFF0F0F0F0F0F0C0C0CFFFFFFFFFFFFFFF3";
    attribute INIT_2A of inst : label is "DD5D7FFF5D5D7FFFFAFAFAFAFAFA3A0A5DFFF3F0000000000A0A0A0A0A0A0800";
    attribute INIT_2B of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFEFAFAFEFA8A8A8A0A0A08BABAAAAAAAAAA2A0";
    attribute INIT_2C of inst : label is "0C080A0A0A0A0A8AF3F3FFFFFFEFAFAF8AAAAAAA8A8A0A00AAAAA2A0A0000000";
    attribute INIT_2D of inst : label is "080A0A0A0A0AFA5800000020A0A0A0A0FAFAFAFA5B5BDFDFA0A2AAAAAAAAAAAA";
    attribute INIT_2E of inst : label is "088AAAAAAAAAAFAFA0A2A2A0FFFFFFF7FFFFFFFFF7F5F5F5F7F7F7F7DFDF5757";
    attribute INIT_2F of inst : label is "00080A0A0A0A0A0AA0A0A0A0A0A0A8A80A0A0A0A0A0A0A0CAFAFEFFFFFFFF0F0";
    attribute INIT_30 of inst : label is "5F5FFF5F5F7F7FFFA0A03030F0F0F0F0DF5F7F7FDFFFDF5FF0F0F0F03030A0A0";
    attribute INIT_31 of inst : label is "F5F7F70F0FFFFFFF5F5F5F57575F5F5FFFFFFF0F0FF7F7F55F5757575F5F5F57";
    attribute INIT_32 of inst : label is "0C0C0C0F0F0F0F0FF3F3FFFFFFFFFFFF0F0F0F0F0F0C0C0CFFFFFFFFFFFFF3F3";
    attribute INIT_33 of inst : label is "7F5FDBFB5A5AFADAAAAAAAAAAAAAA2A058FAFA0A0A0A0A08A0A0A0A020000000";
    attribute INIT_34 of inst : label is "F5F5F5F7FFFFFFFF5757DFDFF7F7FFFFAFAFAAAAAAAA8A08F7FFFFFFA0A2A2A0";
    attribute INIT_35 of inst : label is "0C0A0A0A0A0A0A0AF0F0FFFFFFEFAFAF0A0A0A0A0A0A0800A8A8A0A0A0A0A0A0";
    attribute INIT_36 of inst : label is "AAAAAAA2AAAAA2A00000000000000000A0A0A0A0200000000000000000000000";
    attribute INIT_37 of inst : label is "57575FDFF7F7FFFF7F5FDBFB5A5AFADAF7FFFFFF0000000058FAFA0A0A0A0A08";
    attribute INIT_38 of inst : label is "0F0F3FFFFFFFFABAF5F5F5F5F5F7FFAFAAAA8A0A0A000000AFAAAAAAAAAAAA0A";
    attribute INIT_39 of inst : label is "0000000000000000CF5F5F5F5F5D555500000000000000005555555555450500";
    attribute INIT_3A of inst : label is "0F0F3FFFFFFFFABAF5F5F5F5F5F7FFAFAAAA8A0A0A000000AFAAAAAAAAAAAA0A";
    attribute INIT_3B of inst : label is "0000000000000000CF5F5F5F5F5D555500000000000000005555555555450500";
    attribute INIT_3C of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
    attribute INIT_00 of inst : label is "00000A0585898A0A000000A0A0A0A0A0EACACACA0A0A0000A0A0A0A0A0000000";
    attribute INIT_01 of inst : label is "00000003030E0E0E000000303030B0B00E0B0A0A2AAA8000B0B0A0A0A0000000";
    attribute INIT_02 of inst : label is "0000000406070506000090D05293D15206F5C6F70FCF0C0C93D0509010000000";
    attribute INIT_03 of inst : label is "0000080A0A0A0A090000A0A0E0A0A0A00A0A0A0A0A080000A0E0A0A0B0A00000";
    attribute INIT_04 of inst : label is "000000000A0A0B0A000080A0A0A0A0A08A8A8A8A8A0A0200A0A0A0A0A0000000";
    attribute INIT_05 of inst : label is "000000080A0A8A8A000000A0A020A0A0BACA0BCA3B030000A080A0A020000000";
    attribute INIT_06 of inst : label is "0000000A0A0609090000209050A0625226AA29250A08000092A2526090A00000";
    attribute INIT_07 of inst : label is "00000A0A0A0A0A0A00000000000080A200000000CCF30000A2A2A2B000000000";
    attribute INIT_08 of inst : label is "000000000F2FAFCF000000F0D073F3F3CF0F0F0000000000F3F3F3F0F0000000";
    attribute INIT_09 of inst : label is "00000000088A8A69000080A0A090A0A0AA8A063AFACACA0060A0A02000000000";
    attribute INIT_0A of inst : label is "0000050505454545000090A0905050504D4545050505000050F0905090200000";
    attribute INIT_0B of inst : label is "000000000008080A0030F0E0A0A0A0A00A0A080A08CA0F0080A0A0E0F0300000";
    attribute INIT_0C of inst : label is "00000A0A0E0B0B0B0000A0905050A0A00F0B0B0B0E0A0A00A0A0A0A0A0A0A000";
    attribute INIT_0D of inst : label is "00000000080A0A0A000000A0A0E0A0A00A0A4A5A1A000000A0A0A0A020000000";
    attribute INIT_0E of inst : label is "000A08467AF9F2FA000010D0D0D0D0F0FAC5C7FFFFC00000F0F0F0F000000000";
    attribute INIT_0F of inst : label is "000000000A0A1A5A000000A0B0E2A2A28A8A0A0A08000000A2A2A2A2A0A00000";
    attribute INIT_10 of inst : label is "0000000F0B0E0FCF0000F0B0A0A0A0A0CF0F0F0F0F000000A0A0A0A0B0F00000";
    attribute INIT_11 of inst : label is "0000080A0A080686000030E0A0A0A0A08585880A0A0E0000A0E0E0F0F0000000";
    attribute INIT_12 of inst : label is "000000000000000000C3F3F3330333F00000000000000000F0330333F3F3C000";
    attribute INIT_13 of inst : label is "00000C0F0C00CCCF0000F0E3A3A3A0A0CFCC000C0F0C0000A0A0A7A3E3F00000";
    attribute INIT_14 of inst : label is "00000F0BFA3A0A3A0000F0F0E3A3A0A03A0A3AFA0B0F0000A0A0A3E3F0F00000";
    attribute INIT_15 of inst : label is "00000F0ACA3A3AFA0000F0E3A3A3A0A0FA3A3ACA0A0F0000A0A0A3A3E3F00000";
    attribute INIT_16 of inst : label is "00000F0ACA3A3AFA0000F0E3A3A3A0A0FA3A3ACA0A0F0000A0A0A3A3E3F00000";
    attribute INIT_17 of inst : label is "00000C0F0C000C0F00F0F0E3A3A3A0A00F0C000C0F0C0000A0A0A3A3E3F0F000";
    attribute INIT_18 of inst : label is "00000C0F0F0C000C00F0B0E3A3B3A0E00C000C0F0F0C0000E0A0B3A3E3B0F000";
    attribute INIT_19 of inst : label is "000000000C0F030F00F0B0B3B3F3B0B00F030F0C00000000B0B0F3B3B3B0F000";
    attribute INIT_1A of inst : label is "000000000000000000C0F3F3F3C300C00000000000000000C000C3F3F3F3C000";
    attribute INIT_1B of inst : label is "0000000000000202000000000000C0C0CCCC0C0C00000000F030303000000000";
    attribute INIT_1C of inst : label is "000000000003030F00000000C00030300808C8CCC00000000000C3C3F3330000";
    attribute INIT_1D of inst : label is "00000002020E0C0C000000303030C3C3C0C3CACA080C0C00C3C0808030300000";
    attribute INIT_1E of inst : label is "0000000C0F0C0C00000000020C3CFFEC838A3EFEC3030000EC3333B0B0B0C000";
    attribute INIT_1F of inst : label is "000000080B0F0F0E00000000023EFEFE0ECECEFFBFBF8CC0FFAFA3A2E2F03000";
    attribute INIT_20 of inst : label is "000000030F0F8F8F0000C0F0F0F3FFFFFBFEFEFFFF0F0F0FFFFFF2E3B3F00000";
    attribute INIT_21 of inst : label is "000000000A0F0F0F000000F0F3F3F3EA0ACECFCF0F0F0000FBFFBFB3F0300000";
    attribute INIT_22 of inst : label is "0000000000000C0C0000000000C3EEFE0C0B0B0F0E0E0000FFFFFEE3A3F3F000";
    attribute INIT_23 of inst : label is "000000000000080800000000C3F3AFEF0F0F0C0C00000000FFFFBBBFEFF30000";
    attribute INIT_24 of inst : label is "0000000030F0F30F000A0A8A8AAAAAAA5FDFDFFF5F5F7F7F8A0AAAAAAAAAAAAA";
    attribute INIT_25 of inst : label is "0A8AAAAAAAAAAEBF00A0A2AAAAAAAEAEFFFFFFFFFDFDF5F7AEAFBFFFFFFFFFFF";
    attribute INIT_26 of inst : label is "0080AAAAAAAAAAAA00000000A0A0A0AFAAAAAA8A8E0F0F0FAFEFFFFFFFF0F0F0";
    attribute INIT_27 of inst : label is "5F5FFF5F5FFFFFFFAAAAAA00000000005F5FFFFF7FFF5F5F0000000000AAAAAA";
    attribute INIT_28 of inst : label is "FFFFFFCFCFFFFFFFFFFFFFDFDF5F5F5FFFFFFFCFCFFFFFFF5F5F5FDFDFFFFFFF";
    attribute INIT_29 of inst : label is "0F0F0F0F0F0F0F0FF0F0F0F3FFFFFFFF0F0F0F0F0F0F0F0FFFFFFFFFF3F0F0F0";
    attribute INIT_2A of inst : label is "FF5F5FFF5F5FDF5FAAAAAAAAAAAA0A8A5FF3F03000000000AAAAAA8A8A0A0A00";
    attribute INIT_2B of inst : label is "F7F5FDFDFFFFFFFFFFFFFFFFFFBFAFAEBFAEAAAAAAAA8A0AAEAEAAAAAAA2A000";
    attribute INIT_2C of inst : label is "0F0F0F8E8AAAAAAAF0F0F0FFFFFFEFAFAAAAAAAAAAAA8000AFA0A0A000000000";
    attribute INIT_2D of inst : label is "020A8A8A8A0A0A3A00000000000020A03ABABAFAFAFAFAFBA0A0A0A0A2AAAAA0";
    attribute INIT_2E of inst : label is "0AAAAAAAAAAFAFFFA0A0A0A0F0FFFFF5FFFFFFF5F5F5F5F5F5F7F7FFF7F5FDFD";
    attribute INIT_2F of inst : label is "080A0A8A8A8AAAAA20A0A0A8AA2A2A2AAAAAAA8A8E8F0F0F2AEFFFFFFFFFFFFF";
    attribute INIT_30 of inst : label is "FBFFFFFFFFFFFFFFA000000000000000FFFFFFFFFFFFFFFB00000000000000A0";
    attribute INIT_31 of inst : label is "F5F5F5F5F5F7F7F7D5D7DFD5555F5F5FF7F7F7F5F5F5F5F555555F5FDDDFD5D5";
    attribute INIT_32 of inst : label is "0F0F0F0F0F0F0F0FFFFCF0F0FFFFFFFF0F0F0F0F0F0F0F0FFFFFFFFFF0F0FCFF";
    attribute INIT_33 of inst : label is "FBFAFAFAFABABA3AA0AAAAA2A0A0A0A03A3A0A8A8A8A0A02A020000000000000";
    attribute INIT_34 of inst : label is "F5F5F5F5F5FFFFFFFFF5F5FFF5F5F5F7FFAFAFAAAAAAAA0AF5FFFFF0A0A0A0A0";
    attribute INIT_35 of inst : label is "0F0F8F8E8AAAAAAAFFFFFFFFFFFFEF2AAAAA8A8A8A0A0A082A2A2AAAA8A0A020";
    attribute INIT_36 of inst : label is "A0AAAAA0A0A0A0A00000000000000000A0200000000000000000000000000000";
    attribute INIT_37 of inst : label is "DFF5F5FFF5F5F5F7FBFAFAFAFABABA3AF5FFFFF0000000003A3A0A8A8A8A0A02";
    attribute INIT_38 of inst : label is "CFFFFFFFFFFFBEAA75757575F5FDFFFFAAAAAAAA0A0A0000AFAFAEAAAAAAAA82";
    attribute INIT_39 of inst : label is "0000000404050505FFFFFFDF5F5F5D5105040400000000005151555555515000";
    attribute INIT_3A of inst : label is "CFFFFFFFFFFFBEAA75757575F5FDFFFFAAAAAAAA0A0A0000AFAFAEAAAAAAAA82";
    attribute INIT_3B of inst : label is "0000000404050505FFFFFFDF5F5F5D5105040400000000005151555555515000";
    attribute INIT_3C of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
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
