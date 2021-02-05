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
    attribute INIT_00 of inst : label is "0000000000000005000000050405F5F55505000000000000559A0A0A00000000";
    attribute INIT_01 of inst : label is "0000000200848AAB000000125A58AAFF8A84000200000000AA585A1200000000";
    attribute INIT_02 of inst : label is "C0C0D0D0D0D0D0D01010505060605050D0D0D0E0AC9A65AAD8DAD6597AAA55AA";
    attribute INIT_03 of inst : label is "C0C0D0D070D0D0700000000000000000D0D0D0E0A09A69AA080A06090AAA55AA";
    attribute INIT_04 of inst : label is "0000000000000000000005050000C030020A0E8B080802000000000000000000";
    attribute INIT_05 of inst : label is "000000000C0C000000002020E0E0202000040404050505011050506060607000";
    attribute INIT_06 of inst : label is "000208088B0E0A020000000000000000000000000000000030C0000005050000";
    attribute INIT_07 of inst : label is "0000000000A20AEF00000000000005F50AA20000000000000500000000000000";
    attribute INIT_08 of inst : label is "30C0000106090900000C0C0C0C0C3CEC000070CA09CF8A55BCEFBDFDED7D5D5D";
    attribute INIT_09 of inst : label is "0000000000000000000C0C0C0C0C0C0C000070CA09CF8A550C0C0D0D277D5D5D";
    attribute INIT_0A of inst : label is "008000010D070C0C0000000000000090000000000000000060926AA3830C0000";
    attribute INIT_0B of inst : label is "00000000000C07A5000000000A8A5DAA070C0000000000005D8A0A0000000000";
    attribute INIT_0C of inst : label is "040400000000000010D0F030303070F00A090E8B2EA82280A0F2A8FAA89A581A";
    attribute INIT_0D of inst : label is "0801008A46C159C98410A6BE829966A6C6A9F686471A0E00868A9EBF610DC810";
    attribute INIT_0E of inst : label is "000000001445139F0000000000000080E0F9FDA8A89796EA0020E04000402020";
    attribute INIT_0F of inst : label is "000000000000000C00000000020A450100000004080F0302EA52AA87628B9E6A";
    attribute INIT_10 of inst : label is "A79AFAA26B63A1666060A00000A0E00094800A22000000004000000000000000";
    attribute INIT_11 of inst : label is "03000C000A080908B1B509DABD1F663C040000000000000032C43F2000000000";
    attribute INIT_12 of inst : label is "AAAAAAAAAFA7A0A025E53500008CACACA0C80A4040505A5AACECFCCE0EAE5EAE";
    attribute INIT_13 of inst : label is "040686856596CECE606155666665FFFFAA4DCDFFFF3F3F3FAADFDD55AA515000";
    attribute INIT_14 of inst : label is "0000000000000A0A0040A0A255F3AAAACF317030400A0A01FF11060200A8A811";
    attribute INIT_15 of inst : label is "0000000000000A0A0040A0A255F3AAAACF743070004A0A00FF00060200A8A844";
    attribute INIT_16 of inst : label is "0000000000000A0A000000000000AAAACF317030400A0A01FF11060200A8A811";
    attribute INIT_17 of inst : label is "0000000000000A0A000000000000AAAACF743070004A0A00FF00060200A8A844";
    attribute INIT_18 of inst : label is "00000000030C000B00000000302090E308000C030000000060B0200030000000";
    attribute INIT_19 of inst : label is "0008080800000000000080A0A0A0606000000C0C0000000030F0F0F0D0100000";
    attribute INIT_1A of inst : label is "0000000808F5875F000000000000F537AA5F0AFF000000003FFFE30000000000";
    attribute INIT_1B of inst : label is "01050B01010D0E0C00000002020000000000084F080000000000000A00000000";
    attribute INIT_1C of inst : label is "00000050C7500000000000070700000000030A8AFF8A050040025BAAC5A2D600";
    attribute INIT_1D of inst : label is "0000C208020F0C85000000101C5370F10D56000C0F00C800F5F0D05813901C40";
    attribute INIT_1E of inst : label is "00008004313078F2000000802000C230F2FCFFDFEFA79F5A428091C03030CFF0";
    attribute INIT_1F of inst : label is "00030C000100020B0008400081F0F0C00C0D0505C40F0F00CB8FADFFFBFDD5FA";
    attribute INIT_20 of inst : label is "5E5FEFEDEFBBF7FF148034F0F0032CB0CF3B3A1243030C10F0F0D0030CC00000";
    attribute INIT_21 of inst : label is "EF0FC00D0C0F0300A6F9F7F6FDFFEFCB08050000000C0000FEFC300480801400";
    attribute INIT_22 of inst : label is "00F0007451C11544000000004020208051D5F57AA6A5A5BF201140D115755551";
    attribute INIT_23 of inst : label is "000000000104010A00000145D557DE5804410D03040543047BFFDA5BD25E9A5A";
    attribute INIT_24 of inst : label is "000020200010105300000000000000005F635F2F6565EABF004080A0F030F1F0";
    attribute INIT_25 of inst : label is "000000000000000000000000000003C000000504000C00030C3FFCDB54557AA9";
    attribute INIT_26 of inst : label is "030C0C2C80034F0E00300CC0C4C1F0F8CB0B3FCA8B1A460DB260585EEFAFE3B2";
    attribute INIT_27 of inst : label is "000300000802C00C00000000008000002FA3E2E3BEAFBFAB00C03A0023D0F0FC";
    attribute INIT_28 of inst : label is "00020C00000002380400000002C80000004000010400000F1043A32D853D0EFA";
    attribute INIT_29 of inst : label is "B6A5A599595A499973F0C0733FA06052A5A66A09C5D6020AC37C700154002000";
    attribute INIT_2A of inst : label is "000300020A4A4B050000340130B06852D50AAACC070500005F9C5062ABAC2020";
    attribute INIT_2B of inst : label is "00000000404513100000000000000040F3F4F5EB6EAEA1C720C0F03000415000";
    attribute INIT_2C of inst : label is "010400040000030C000000F3DFDC5CCF00000C00000000043FFD3DC5DA7AF9AA";
    attribute INIT_2D of inst : label is "0000C000CCE3202000000000000000C06A579F50615599553030000080A01051";
    attribute INIT_2E of inst : label is "0000030C0004000000000000000FF0DA00000000000000005509A5063ACB0AAA";
    attribute INIT_2F of inst : label is "0000038C04C90C1320013088A220C1384ECF2B0F4E8C0008C370A2F02A130120";
    attribute INIT_30 of inst : label is "AFAFFFFFAFFF0000FFFFF0F03000000000500000000050000000000000000000";
    attribute INIT_31 of inst : label is "FF1FFFFCF0F0F8FA0A0A8AAAAAAFAA0000555501405555000051111111115100";
    attribute INIT_32 of inst : label is "A2AAAAFAAAFB0A00000C0C0C2CAFAFAF00554545454555000014555514141400";
    attribute INIT_33 of inst : label is "FF0F0F0000000000FAFFFFFFFFFF000000000000000000000004040000040400";
    attribute INIT_34 of inst : label is "00000AAA2A2A2A2A000080B2A2AAAAAAAAAAAAA2A2ACA0002A2AAA2A2A2AAB08";
    attribute INIT_35 of inst : label is "00000000A2BCACEC0000008AA2A2F2C2E0F0CCCCFC820000A2AAC2F2A2A20A00";
    attribute INIT_36 of inst : label is "000000AAAAAAAAAF00000000AAAAAAAAA0AAAAAAAAAA0000AAAAAAAAAA2A0000";
    attribute INIT_37 of inst : label is "000A8A8AAFA3A0A000002AEAEBE0E0EE8A0A0A0E0E0283A0EAEAE3EFEBEA2A00";
    attribute INIT_38 of inst : label is "00014400014E0B7A0000004C5190BCA30A564A0EC1044403579491E5F4A01100";
    attribute INIT_39 of inst : label is "000140032EC5057F03008060B13AF0AF01C69A198C0C030CEBA5F076558C4200";
    attribute INIT_3A of inst : label is "00C000080002E50400000C8320004810310D040108020CC07013704011840000";
    attribute INIT_3B of inst : label is "0C0000C800000F0CFAF6DA4AF9EA7A1A0003000400000000B7F5FD3F8CAB8220";
    attribute INIT_3C of inst : label is "0400002C0F4F03CB008030022000405CD07CFFEEEFA385AF0000441130008000";
    attribute INIT_3D of inst : label is "00000004000002402080030CCC04DC5000030C0000000400CE1CC1072D974F0F";
    attribute INIT_3E of inst : label is "00000F0A0F05058930A0F0A2F35156F6898999999F9F9BFBF6E6F6E6F6E7FFFE";
    attribute INIT_3F of inst : label is "55559A565A5A595555555A5A5695A5A555595A5A569A5555A5A595565A5A5555";
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
    attribute INIT_00 of inst : label is "0000000000000C0F000000550100F07D55450000000000005DA1A28A00000000";
    attribute INIT_01 of inst : label is "00000084A525AAFF000000800012A2EAAA25A58400000000A212008000000000";
    attribute INIT_02 of inst : label is "F04034F44636F44400000000202000003CFF4F37F7AA55AA02393A36F9A95AAA";
    attribute INIT_03 of inst : label is "F04030F04030F040000000000000000030F04030F0AA59AA02090A0609A95AAA";
    attribute INIT_04 of inst : label is "000000000000000000010000C03000000E8BA20AC20000000000000000000000";
    attribute INIT_05 of inst : label is "08080A0A0E0E0A0A00000000000000000909090A060607040000000010101010";
    attribute INIT_06 of inst : label is "000000C20AA28B0E00000000000000000000000000000000000030C000000100";
    attribute INIT_07 of inst : label is "0000000000A0A0FF0000000000004075A0A00000000000004000000000000000";
    attribute INIT_08 of inst : label is "0000A0A041020A0E04050405040504350B0C1C5A7AFFAA55F4E5545554555455";
    attribute INIT_09 of inst : label is "000000000000000004050405040504050000105A7AFFAA550405545554555455";
    attribute INIT_0A of inst : label is "00002040400F050500000000000000000408000000000000A0906092E0208000";
    attribute INIT_0B of inst : label is "0000000000034555000000008AA053AF450300000000000053A08A0000000000";
    attribute INIT_0C of inst : label is "04070F0C0C0C0D0F10100000000000000A8F2AAF2AA625A4A060B0E2B82A8802";
    attribute INIT_0D of inst : label is "0626190345EE9F8A00834040D3C3F54C3264A639CC4F2A1870D233B060A0B100";
    attribute INIT_0E of inst : label is "00000000012220A3000000000000000036BEDE7EEEE58A720000A0000010D040";
    attribute INIT_0F of inst : label is "000000000000090800000000008043A703080A0006040005AAD6D6E5EE9AA696";
    attribute INIT_10 of inst : label is "31F9A9E0D90950C2000020000000200000A10000000000000000000000000000";
    attribute INIT_11 of inst : label is "040D00040604090EBFBBB02AAE139BA71C000A00000000000183810A00000000";
    attribute INIT_12 of inst : label is "AAAAAEA3A0A0E13445456520232F2C0D3A0AA210101A169A3FFFFCFD8FAF5CAD";
    attribute INIT_13 of inst : label is "094959999959FFFF109092525996B3B3AAF77755AA450500AA7173FFFFFCFCFC";
    attribute INIT_14 of inst : label is "00000008050C0AAA0010A0A050F0A2AAFF11AAAA00104001FB1F8C8D04020611";
    attribute INIT_15 of inst : label is "00000008050C0AAA0010A0A050F0A2AAFF44AAAA00001045FB5F8C8D00060244";
    attribute INIT_16 of inst : label is "0000000000000AAA000000000000A2AAFF11AAAA00104001FB1F8C8D04020611";
    attribute INIT_17 of inst : label is "0000000000000AAA000000000000A2AAFF44AAAA00001045FB5F8C8D00060244";
    attribute INIT_18 of inst : label is "0000000C00080E0900000000C0300020CB06080C00000000E00030C000000000";
    attribute INIT_19 of inst : label is "0000020A0A0A090900202020000000000C0F0F0F070400000000303000000000";
    attribute INIT_1A of inst : label is "000000020071A5FF000000000000F031AAFFAAFF000000003FF3F00000000000";
    attribute INIT_1B of inst : label is "4050E0404070B0300000008080000000000002F0020000000000008000000000";
    attribute INIT_1C of inst : label is "00000003FD030000000000C0C000000000C0A0A2FFA250008C8113D16FC3E2B8";
    attribute INIT_1D of inst : label is "04040830C405270F00C023808002D0754B5F4F2708320000105032C080200000";
    attribute INIT_1E of inst : label is "80000C000802104C00000000000000805FBFEBF7F3FF7F9390A0F040000CF330";
    attribute INIT_1F of inst : label is "000000032FACC0000000104200003CFD021B4F0FFD470F0FDF77FFE7F777F7A5";
    attribute INIT_20 of inst : label is "FFDF5FFFFFFBFFED0081010030F00000B7FEF2C4C1000000A0B0F0C000030C00";
    attribute INIT_21 of inst : label is "F0CF004B1F0BFA0AF975D5F5B767D7F7000C4C1F03000000FFBF8FAF23030000";
    attribute INIT_22 of inst : label is "0000905074C150550000000000004000D57B165594A56FF51010405070C1C010";
    attribute INIT_23 of inst : label is "00000004050D008C00004C004B19551565551745015D55CDC5B6F6FAFEBAAB5F";
    attribute INIT_24 of inst : label is "00000000008001C000000000000000002CD31CD1155D5F230000A00000800010";
    attribute INIT_25 of inst : label is "00000000000000000000000000800CC00C03000507030F0CC437F4E551A55E5A";
    attribute INIT_26 of inst : label is "000038CBC7E7821BC0C03030300042104BFAC6BAF6E98EEF90AC639350E0B1F0";
    attribute INIT_27 of inst : label is "0000020000000303000000002000000020C0F0CFFF2BF6ED38020010C0F03200";
    attribute INIT_28 of inst : label is "0000000C0080030C0001800C00000208020A18000101C404C81158652DAFAFBC";
    attribute INIT_29 of inst : label is "FDA36F5E9A5A4E5F00F030E0002093F093AD9D965A8800005010501000000000";
    attribute INIT_2A of inst : label is "010121A4840A5A4B008020005310B0A0058DA50509C05800EA23B0D010400030";
    attribute INIT_2B of inst : label is "000000100100C0F00000000000000000F4317F5FDFB3A4E500F0000000100000";
    attribute INIT_2C of inst : label is "0000050C0500C0030000C0003033DFDF0F0C00030F0C030D5E7BFBA9B9DA7AB6";
    attribute INIT_2D of inst : label is "000000000000C802000000000000000001ACDF13206966A500000000A0000050";
    attribute INIT_2E of inst : label is "00000000030C0104000000F0C0C087F4000A000000000008D056665ACAF9B6A5";
    attribute INIT_2F of inst : label is "00C1000CAD40F9830030204000F002200FFE1CCF3B08C3001C13801070021000";
    attribute INIT_30 of inst : label is "AFFFFFFFFFFF0000FFF0F0000000000000505050505050000000000000000000";
    attribute INIT_31 of inst : label is "F0F0F03038FAFAFA8AAAAAAFAAEFA00000540444140454000055050000055500";
    attribute INIT_32 of inst : label is "A0A0A2AAAAFAAA000F030F0F0F0F2FAF00111111111111000001015151515100";
    attribute INIT_33 of inst : label is "FFFF0F0F0C000000FAFAFFFFFAFF000000000000000000000005010000010500";
    attribute INIT_34 of inst : label is "00000AC2C2CECECC00A0A0A0A0B0B0B0BBBBBBABABABAA00B0B2A2C2C20A0A0A";
    attribute INIT_35 of inst : label is "00000000AAAAAEA0000000A8ABABABABACABA0AEAAAA0000ABABACACACAC8000";
    attribute INIT_36 of inst : label is "0000000ABABBBF3300000000823FE3EB30BEB3B3BB0A0000EBEBEA0E0E820000";
    attribute INIT_37 of inst : label is "0080AAAAAAEAEAEA0000A2AAEAEBC808AA0A8A8AAAAAAAA00A0A088BAAAAA200";
    attribute INIT_38 of inst : label is "04042459455A1AAD00C010504053A060E59FED899E59C10460A5702060513000";
    attribute INIT_39 of inst : label is "30098095448EFA8900C0303401509380F68A9A6F7B862A08F2A0A1908C610030";
    attribute INIT_3A of inst : label is "000130001141078D08200000425010D205510406451188038030037CC000E080";
    attribute INIT_3B of inst : label is "0F0CC0000E3BCF078EFAB5F6FA7996A50C0C090E0F030000F5C97ADB3AE20000";
    attribute INIT_3C of inst : label is "004010130018F47C0000000080C003001FFBF3B2A0EDE3E00040000030200000";
    attribute INIT_3D of inst : label is "0000000000880000020828000333BF3F1200000A80040C001C7FFB7B8F3FFDD8";
    attribute INIT_3E of inst : label is "0C0A0F8ACF45959F0000F0A0F05050629F9B9F9B9FDBFFBF62626266F6F6E6EF";
    attribute INIT_3F of inst : label is "5555A5A595565A5A5555A695A5A565555A5A5695A5A555555565A5A595A65555";
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
