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
    attribute INIT_00 of inst : label is "005051F7FDFFFF7F00000000107070F07F7FD3D3DFDFDFDFF0C0511656FAFAAA";
    attribute INIT_01 of inst : label is "0A040000000020A0A05AAAA655A5AD6D80800002020A050F5D575FDF577DFFFF";
    attribute INIT_02 of inst : label is "DFDBDAD594106ADBA55554100115AAAA7F7FFFFFDF450000F1F0F05000000000";
    attribute INIT_03 of inst : label is "050A0202008080AAFF7F5DD5DFD5DD6D2A080400000000009DADA56690A0A040";
    attribute INIT_04 of inst : label is "0050D5FFFF3F0D0D0000005072BAAAAA0C3FFBFBFAFAFAF6A5A5A56450504000";
    attribute INIT_05 of inst : label is "000000058A0A0500008AA655A55FAF6F0020A080020A050F5F5DD7DF557FFFFF";
    attribute INIT_06 of inst : label is "F4B0A0202061A19200000000001011117A7BFFFFFF55400011A1A2A090000000";
    attribute INIT_07 of inst : label is "050A0280A0200A0AFF7F5DD5DFD5DDDD0A050A08040800005DADA556A4A00000";
    attribute INIT_08 of inst : label is "FF5D5565A58506060000B0D25050505A55555555D77555555B7B5353F35B5B7B";
    attribute INIT_09 of inst : label is "00000F07050505050FF555555555555505050505050F07075555555FF5D55555";
    attribute INIT_0A of inst : label is "75F5B5B7D7D7D5555A5250D0D2BAB0F0555575C5E5A505AFF0F27A7A52535D55";
    attribute INIT_0B of inst : label is "0C00F05050FF5575FF050FC57F575D5DD57FF00000000000FB0B0B000A0A000A";
    attribute INIT_0C of inst : label is "FF555559595151510030F0505060A3A3555555555555FF55A353D3D3D3735350";
    attribute INIT_0D of inst : label is "00000000000C0C0C0FC575565694A4A4070707070F0C0000A55555555575DF55";
    attribute INIT_0E of inst : label is "75F5A5A5E57555555050D0F0B0B0B0D05D5755F5A5A707AED0525A5A52535D55";
    attribute INIT_0F of inst : label is "0000000C0CCCC3CDFFD050705C57577DCDC5C5050F000000C505C5755F5350F0";
    attribute INIT_10 of inst : label is "FF555545050505A5F05F5505455555FF655F58DAD2DF55550000822800FF5DF3";
    attribute INIT_11 of inst : label is "00000A0A0E0C0C0E0FC7755555595A5A0E0E0C00000000005A55575D575D77E5";
    attribute INIT_12 of inst : label is "55F5A505A7A707A7300000A0A0A0A030F5555555F5E505A730D05A5A5A5F5555";
    attribute INIT_13 of inst : label is "00F05050F35D7DD5AF0A0C00000000FF55F5CD0300000000555575C50F0A000A";
    attribute INIT_14 of inst : label is "6699CCCCAA9696966699CCCCAE5E9E9E969695AACCCC66999E9E5EAECCCC6699";
    attribute INIT_15 of inst : label is "46894C8C4A8646866699CCCCAA9A9A99468A4A8A4C8C4689999696AACCCC6699";
    attribute INIT_16 of inst : label is "0005050180A0A0A00000080A05058555800000080000000055062AAA2A0A20A0";
    attribute INIT_17 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_18 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_19 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1A of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1B of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1C of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1D of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1E of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_20 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_21 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_22 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_23 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_24 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_25 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_26 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_27 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_28 of inst : label is "0202010102020101020201010202010102020101020201010202010102020101";
    attribute INIT_29 of inst : label is "000000000000000000A0A0A2A0A0A0A00000000000080A00A0A0A0A0A0A0A200";
    attribute INIT_2A of inst : label is "00080A0A0A0A0A0A00A0A2820A0A0000080000000A0A0A00A0A08002AAAAAA00";
    attribute INIT_2B of inst : label is "000005000A00404800104000A18184A440000A00050000008481A10040100000";
    attribute INIT_2C of inst : label is "000005000A0840400010400081A1240440080A000500000024A1810040100000";
    attribute INIT_2D of inst : label is "000005000A0A404000104000A1A1040440000000050000000401010040100000";
    attribute INIT_2E of inst : label is "000005000802424800104000A18184A440080A00050000008481810040100000";
    attribute INIT_2F of inst : label is "000005000008484A0010400021A184844A0A0A0005000000A481810040100000";
    attribute INIT_30 of inst : label is "000000050551555500000000505050505F5EFF5FFDFBFABA5175E5F5F5E7E7A7";
    attribute INIT_31 of inst : label is "000000000000000000000000000000050000000401000045550445154555055E";
    attribute INIT_32 of inst : label is "AAFAFAFADB7E5F53A7A5E5F5B5F5F15155551505050000005050505000000000";
    attribute INIT_33 of inst : label is "01040000000000005F4F55154F55005500000000000000000004000000000000";
    attribute INIT_34 of inst : label is "0000000000005505000000000000001055F55FFBFFDAFAAA50515175E5F5A7A7";
    attribute INIT_35 of inst : label is "00000000000000000000000000000405000004010004010500055555451F555E";
    attribute INIT_36 of inst : label is "AABAFAFEC7FF5FF5A7A7E5F5F575555155055505000000005150000000000000";
    attribute INIT_37 of inst : label is "5D05000401000000FBDF5F4D554F054100000000000000000555000000000000";
    attribute INIT_38 of inst : label is "00080A0202020455A20A08F0F0C0555545455555410504006A484855F0F5F551";
    attribute INIT_39 of inst : label is "0000000000000000FFFFFFFF414141610080ABAEAE9ADDCD69AAAABABAAEDDD1";
    attribute INIT_3A of inst : label is "47474747474545455555DFDCDFDCDF55658505090A000000AAAAEAE3E0C0F3F3";
    attribute INIT_3B of inst : label is "000004050D0D080510505858585AAA5105454545454505055555555555555551";
    attribute INIT_3C of inst : label is "0040599995909059303959559510585959555551404546005696090806969515";
    attribute INIT_3D of inst : label is "04080055555545404020A05565A5A5A545050D0D0505000055F5C5C1F1505000";
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
    attribute INIT_00 of inst : label is "001050F1F75FDFFF0000000000000010F3F0F0F4F4F3FFFF7070F0F0F0F2AAAA";
    attribute INIT_01 of inst : label is "8A050A0A050A080820A09565AD5F5F5F28A8A0A0A48D4DCFDFFFFDF5FFFF5F7F";
    attribute INIT_02 of inst : label is "FAFAB4A00004AAFA211000000040A0A0FFFFDFDF55500000F070100000000000";
    attribute INIT_03 of inst : label is "4D8DA5A4A4A0200A5F7FFFFFF5FFFFFF0A050A0A08040000DF6F6FADA4A02020";
    attribute INIT_04 of inst : label is "005071F5FF0F4F5F0000000090A2A2A05B4ACAFAFAF2B1B1A061010101000000";
    attribute INIT_05 of inst : label is "00000A45AAAA050A00A5A555655D5D5D000024A4A48D4DCF7DFDFDFDFD7D5D7D";
    attribute INIT_06 of inst : label is "A1611000000054A50000000000000040F6DAD5DB555550005050A0A020000000";
    attribute INIT_07 of inst : label is "4D8DA4A42404000A5D75F5F5F5F7F7FF06090A050A0A0A00FFDF5FAF25040000";
    attribute INIT_08 of inst : label is "F0535D5565A5A5A50000A0A0B030D0D055555DF75D575D55525050505050525A";
    attribute INIT_09 of inst : label is "000C07C5C5C0C1C50FF5565A50505051C5C5C5CDC705050555555555D77D5555";
    attribute INIT_0A of inst : label is "5575E5A5A5E5E5F5D2D030B0A0A0A000D55555555D7DC7A500A0B0D0D050505F";
    attribute INIT_0B of inst : label is "0F003030DF557555FFC5F5D5575555577F50F00000000000F70E0AC0CACAC0CA";
    attribute INIT_0C of inst : label is "F05F55565A58505000000030D0D05050500515555555FF5560505050505050D0";
    attribute INIT_0D of inst : label is "00000C0707050505FF755595A525050509050D0D0D050707055054555555FF55";
    attribute INIT_0E of inst : label is "5575E57555555557D0F00020A020000055D5F575E5A505A500A090D0D0505053";
    attribute INIT_0F of inst : label is "0C070F070DF5577CFF003C3FDD5D5F5550F35DF505070C00557575D55FDBF33A";
    attribute INIT_10 of inst : label is "FF55555555555555F0505353535D5DFF5F50D288A0FF555500A0080200F350F0";
    attribute INIT_11 of inst : label is "00008E07050505050FF555515050509A85050707070C0E0A5AD55555F55555D5";
    attribute INIT_12 of inst : label is "555D7DCDADAD0DF500000000A00000007555555555F505A50030B0B0D050535D";
    attribute INIT_13 of inst : label is "0A0030D05070507FF70E0A030C0C0CFA55555FF0000000005F5555F5CFCAC0CA";
    attribute INIT_14 of inst : label is "6699CCCCAA969A9A6699C6C9A6A9A6A99A9A5AAACCCC6699666956A9C6C96699";
    attribute INIT_15 of inst : label is "6699ECDCEAD5EADA6699CCCCAA565699E5DAEADAECDC6699999A9AAACCCC6699";
    attribute INIT_16 of inst : label is "0000415165A5A52500080A058565555504200A08080A0A08458585AAA2800020";
    attribute INIT_17 of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_18 of inst : label is "0800000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_19 of inst : label is "0808000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1A of inst : label is "0808040000000000000000000000000000000000000000000000000000000000";
    attribute INIT_1B of inst : label is "0808040400000000000000000000000000000000000000000000000000000000";
    attribute INIT_1C of inst : label is "0808040408000000000000000000000000000000000000000000000000000000";
    attribute INIT_1D of inst : label is "0808040408080000000000000000000000000000000000000000000000000000";
    attribute INIT_1E of inst : label is "0808040408080400000000000000000000000000000000000000000000000000";
    attribute INIT_1F of inst : label is "0808040408080404000000000000000000000000000000000000000000000000";
    attribute INIT_20 of inst : label is "0808040408080404000000000000000008000000000000000000000000000000";
    attribute INIT_21 of inst : label is "0808040408080404000000000000000008080000000000000000000000000000";
    attribute INIT_22 of inst : label is "0808040408080404000000000000000008080400000000000000000000000000";
    attribute INIT_23 of inst : label is "0808040408080404000000000000000008080404000000000000000000000000";
    attribute INIT_24 of inst : label is "0808040408080404000000000000000008080404080000000000000000000000";
    attribute INIT_25 of inst : label is "0808040408080404000000000000000008080404080800000000000000000000";
    attribute INIT_26 of inst : label is "0808040408080404000000000000000008080404080804000000000000000000";
    attribute INIT_27 of inst : label is "0808040408080404000000000000000008080404080804040000000000000000";
    attribute INIT_28 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_29 of inst : label is "000A0A0A0A0A0A0A0020A0A0000000000A0A0A0A0A0A0A00000000000020A000";
    attribute INIT_2A of inst : label is "000A8AA0A0A0A08A00A0A0A0A0A000000A080000AAAAAA0000A0A0A0A0A0A000";
    attribute INIT_2B of inst : label is "000500401A10000A000010402020202000101A40000500002020204010000000";
    attribute INIT_2C of inst : label is "0005004010120208000010402000000002121040000500000000204010000000";
    attribute INIT_2D of inst : label is "000500401A1A0808000010402020000008181848000500000000004010000000";
    attribute INIT_2E of inst : label is "000500401A10000A00001040202020200A121040000500002020204010000000";
    attribute INIT_2F of inst : label is "000500481A12000000001040000000200A101040000500002020204010000000";
    attribute INIT_30 of inst : label is "00000005555555550000000000105050D7DFFFFFEAFABAAA50505071F1F1F1F1";
    attribute INIT_31 of inst : label is "000000000000000000000000000005500000000500000555050555455D554F5F";
    attribute INIT_32 of inst : label is "AABAFAFAFAFFFFD7F1F1F1717050505055554555450000005050100000000000";
    attribute INIT_33 of inst : label is "0500040000000005FA9F5F05545F450500000000000000005505040000000000";
    attribute INIT_34 of inst : label is "000000000000505500000000000000005575F7FFFF29BAAA1050505070F1F1E5";
    attribute INIT_35 of inst : label is "000000000000000000000000000005410000050000054555055545575D435FFF";
    attribute INIT_36 of inst : label is "AAAAAAF2BFFFD775E5F5F1F17150505055555541000000005010000000000000";
    attribute INIT_37 of inst : label is "5F44050145000000EAFFFFDF7F55055400040000000000004540000000000000";
    attribute INIT_38 of inst : label is "0A02000000000505A0000232320250510A425255501505059515155535717050";
    attribute INIT_39 of inst : label is "0C0C0C0C00000008F3F3F3F35050505008ABAEAAAAAADDDD5040A2A2AEADD1D0";
    attribute INIT_3A of inst : label is "F5F5F5B5F55555555151F1C1F1C1F15155596A8A0A000000AAA2F0C0F0F0F0F0";
    attribute INIT_3B of inst : label is "0405050505050A450A0212505052AA5855D5757575D555455051515151515050";
    attribute INIT_3C of inst : label is "0C6C655556042525000164665606052595966060909656546555550541519100";
    attribute INIT_3D of inst : label is "01080A55595A5A5A1020005555555101555F5F4F4F0505005150707050500000";
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
