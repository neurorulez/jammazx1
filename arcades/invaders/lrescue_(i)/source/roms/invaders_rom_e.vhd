-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_E is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_E is

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
    attribute INIT_00 of inst : label is "DEDE785E7835270100000000000102039E07E206F807E00EFC0EFC07E006F807";
    attribute INIT_01 of inst : label is "C5FFFFC1FFCF837FFF3F7FFFFF7FFF305CCF5C30305088503000012734785E78";
    attribute INIT_02 of inst : label is "FFE0EEE0FFFFE0EEE0FFFFE0FFFFFFFFFFFFFEFEFAD8D0C1F3FFC1DDC1FFD1D5";
    attribute INIT_03 of inst : label is "E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAD8D0800080C8F8FAFEFEFFFF";
    attribute INIT_04 of inst : label is "EFFFFFBF33FFCCFFFFFFFFFFFFFFFFE4FDFFFFFFFFFFFFFFFFE0EEE0FFFFE8EA";
    attribute INIT_05 of inst : label is "E3FFFDFFFFCFFFFFFFFFFFFBFFFFFFFFFFDB1FFFDCEBFFE7E3FFF9FFFF8F3FFF";
    attribute INIT_06 of inst : label is "D91FEF7FFFFFFF0071FF00FBFF00FFFF00FFFF00FFFF00D3FF00EFFF03FBFF9F";
    attribute INIT_07 of inst : label is "442242221C1000000000000100000700003F0003FF001FFE007F9B01FF7F03F9";
    attribute INIT_08 of inst : label is "0C0800000000000000081C0C1C080000000000001C3E1E3E1C10000000001C22";
    attribute INIT_09 of inst : label is "0814122224140800000000000000000000000000000800000000000000000008";
    attribute INIT_0A of inst : label is "00081C1C08000000000000081C1C1C080000000000081C1E3C1C080000000000";
    attribute INIT_0B of inst : label is "0808000000000000000000000000000000000000000000000800000000000000";
    attribute INIT_0C of inst : label is "0008081C7E6C78EC786C7E1C08080000000008081C1E37BFBEF6F6BEBF371E1C";
    attribute INIT_0D of inst : label is "1D3E3A140E0400000040F04000000000000C1E96BCF4BC961E0C000000000000";
    attribute INIT_0E of inst : label is "0200001240012C8A0C34BE391D38BA144E042001880000000000040C2E1D3E3D";
    attribute INIT_0F of inst : label is "7C630100000000001028502810030100010F070100023F02FC00000000000207";
    attribute INIT_10 of inst : label is "1F242E0E0010096F7C6F091000C032DEF8DE32C000000001637C131800001813";
    attribute INIT_11 of inst : label is "0491E8C92827E017E01FF00FF01FF83EDC1FF80FF001800000000000001B0A07";
    attribute INIT_12 of inst : label is "803301320208048C884C482838121A01E23FEF1D24CF702888504400020108C1";
    attribute INIT_13 of inst : label is "0216E412B86EA26FC26FDE20D03FF83FB81F8A0F8017D8241B44438400004001";
    attribute INIT_14 of inst : label is "0000000000000000000000000000000000000000000000000000000000000030";
    attribute INIT_15 of inst : label is "00FE00000000000000000009A700000000030119B40000000400000000000000";
    attribute INIT_16 of inst : label is "010000000000000000003002179790C8FE0000000000000000000C0217FB0000";
    attribute INIT_17 of inst : label is "00000000000000000000000000000000706000C0000041250000020800000013";
    attribute INIT_18 of inst : label is "00010119E7000000FD174700000000000B010000000000000000000000000000";
    attribute INIT_19 of inst : label is "000000000000000000030119E8000000FD17270000030119E8000000FD173700";
    attribute INIT_1A of inst : label is "000000000000000000000000000000000000080119FB000000FF000000000000";
    attribute INIT_1B of inst : label is "000000001B1B1B0E130800131B1B000000000000000021000000000000000000";
    attribute INIT_1C of inst : label is "00261D00002F1D05000000000000000100000000000000000000000030072711";
    attribute INIT_1D of inst : label is "051869A830041849A028041849A0390318399031031839902903183990391D00";
    attribute INIT_1E of inst : label is "E82001E01801381801302001282801060D4838302C430949564D090A0D48312F";
    attribute INIT_1F of inst : label is "507838E0A00500B07038689850A8908840786068805040C05870B00500F02801";
    attribute INIT_20 of inst : label is "A881508881A08081B058810800604048406048C07898404858D84080889068B0";
    attribute INIT_21 of inst : label is "7801409801C0680170700104000000000000004060C1B090C170A0C1C0B0C140";
    attribute INIT_22 of inst : label is "1F2444241F130B081300000000000000030000000000000000008000000000B0";
    attribute INIT_23 of inst : label is "087F474541413E404848487F414949497F3E4141417F224141413E364949497F";
    attribute INIT_24 of inst : label is "0408107F7F2018207F010101017F412214087F7E0101010200417F41007F0808";
    attribute INIT_25 of inst : label is "7E40407F40402649494932314A4C487F3D4245413E304848487F3E4141413E7F";
    attribute INIT_26 of inst : label is "030000615149454360100F106063140814637F020C027F7C0201027C7E010101";
    attribute INIT_27 of inst : label is "047F24140C6659494142314949452300017F21003E5149453E00000000000003";
    attribute INIT_28 of inst : label is "410000412214083C4A49493136494949366050484740464949291E4E51515172";
    attribute INIT_29 of inst : label is "0079000020504D40200808080808181818181822147F14221414141414081422";
    attribute INIT_2A of inst : label is "032101FCC21B1308030411020712140F60783C1C014040404040C00000000079";
    attribute INIT_2B of inst : label is "205D211EC6C305CBCD052AC3099D110C0E2C1021C9013620EF21020CC3140E28";
    attribute INIT_2C of inst : label is "0DC32067210F48C303360B0DC3200621116EC30136C900362300362027210036";
    attribute INIT_2D of inst : label is "22231515C30DC12372237323E115F1C30DC114BACDE11494C30DC114BACDE10B";
    attribute INIT_2E of inst : label is "D2C30DC12323E11713CD16ACC30DC12323E11713CD1590C3EB56235E23E1207E";
    attribute INIT_2F of inst : label is "211E0ED406FE7E34AA2EC90136205E211DE7C3013EC9201B32AF05D5C3053E16";
    attribute INIT_30 of inst : label is "2E34AB2E02E4CDAA06002EC90136A02E0036C92711214F0ACD20542A00362053";
    attribute INIT_31 of inst : label is "21E50E2AC3E12054221006001521E50A2E00000000000000000000E1C30136B0";
    attribute INIT_32 of inst : label is "2B2BE1348C2E1E6AD27EFE1E65D292FE7DE51E37C3000521E530061E37C30010";
    attribute INIT_33 of inst : label is "02002102FEC9207C22C9207022C92088221E5CC38A2E1E5CC38B2E0CF8C30036";
    attribute INIT_34 of inst : label is "2104FEC8FD002103FEC8FE002102FEC9030021C802002104FEC802002103FEC8";
    attribute INIT_35 of inst : label is "00000012130D080E0F1B1C1C211B12140D0E01C9FD0021C8FD002105FEC8FE00";
    attribute INIT_36 of inst : label is "4F0ACDEB56235EA22EE50036AA2E003600E1CAA77EA02E1722CD000000000000";
    attribute INIT_37 of inst : label is "2E0036C91EFDD408FE7E8D2E1722CD4926C3348D2E1722CD1DEBCD001F14C3E1";
    attribute INIT_38 of inst : label is "15C3E103DACD00364EAE2EE51F98C30ECFD2CBFE0000000B04C330061C131170";
    attribute INIT_39 of inst : label is "C8010021A77EAB2E1722CD1375C3234E23E12036221F35CDE50C30C31003011E";
    attribute INIT_3A of inst : label is "0021C803002105FEC804FE030021C802002103FEC802002102FEC801002101FE";
    attribute INIT_3B of inst : label is "01C67EAB2E1722CDC9FD0021C8FE002104FEC8FD002103FEC8FE002102FEC903";
    attribute INIT_3C of inst : label is "7C4F1AC6F5202E3A000000000000000000000000000536C33E02211CC60FE627";
    attribute INIT_3D of inst : label is "C7C2A77E20C2211FE6C3013620C221F11DF0C31FB1DABA7C570BC6F11FB0D2B9";
    attribute INIT_3E of inst : label is "039DC34EC2C305B3CD1FE011060E0A2CCD6720C33AB02E00360392C305CBCD1F";
    attribute INIT_3F of inst : label is "C0FFFF000000000000C9C03E1DF0C320C3321FF4D4D0FE201E3A1A1A1A000000";
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
