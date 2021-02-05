-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity prog_rom2 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prog_rom2 is

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
    attribute INIT_00 of inst : label is "95CCCCCCCCCCCCCCFC53C9CCCCCCCC3F0460293028104E44B4CCCCCCCCCCCCCC";
    attribute INIT_01 of inst : label is "5E4444332222222222EB4444343322A2D944443323222222B29F4D44343323FB";
    attribute INIT_02 of inst : label is "5E5544121121222222E24444342222A25E4544232222222222E24444342322A2";
    attribute INIT_03 of inst : label is "6E555544FB110A1011E14444A40711A15E55458888881F1111E14444A41011A1";
    attribute INIT_04 of inst : label is "6E66554434EB770010E14444A30700A16E565544B49F0D0011E14444A40710A1";
    attribute INIT_05 of inst : label is "B76F663433E3770790ED4433A30700A0FB66564433E3770710E94434A30700A0";
    attribute INIT_06 of inst : label is "D944443333E2070010222222A20700A095CC3C3333E37700B0D83333A30700A0";
    attribute INIT_07 of inst : label is "4E44442322E9000010112222A20700A04E44443323E2000010212222A20700A0";
    attribute INIT_08 of inst : label is "4E444522D955FB0010111111D90700A04E44442292BD0F0010112122A20700A0";
    attribute INIT_09 of inst : label is "CCCCCCCCCCCCCCCCCC3F04602A5629364E4455CCCCCCCCCCCCCCCCCC7D0700A0";
    attribute INIT_0A of inst : label is "453423222222222222A2D9443433B2D8443433232222222222FB95CCCCCCFC93";
    attribute INIT_0B of inst : label is "558588888888F81111A14E443422225A553422222222222222A24E443423225A";
    attribute INIT_0C of inst : label is "66666656554444FB11A14E44E410116A666656554544B41F11A14E44F411115A";
    attribute INIT_0D of inst : label is "7F776666564444E310A14E44E40010FA66666666554444E310A14E44E400116A";
    attribute INIT_0E of inst : label is "44333323FB4434E300A04E44E400009ACCCCCCCC5F4444E300A04E44E40000BA";
    attribute INIT_0F of inst : label is "33332322E23433E300A04E44E400004A34333322E24433E300A04E44E40000DA";
    attribute INIT_10 of inst : label is "22220E11112222E200A04E44E400002122321F11212222E200A04E44E400004A";
    attribute INIT_11 of inst : label is "11D9FB001111917D00A04E44E400001121920E10112122D900A04E44E4000011";
    attribute INIT_12 of inst : label is "CCCCCC3F04602B7C2A5C4E4455CBCCCCCCCCCCCCCCCCDC7700A04E44B50F0011";
    attribute INIT_13 of inst : label is "564544A4D94434332322B24FD9666666554544FB95CCCCCCCCCCFC4395CCCCCC";
    attribute INIT_14 of inst : label is "884F34A34E4434232222224A6E666666664544A34E4434332222224A6E666666";
    attribute INIT_15 of inst : label is "CC3D33A34E44939D0D11114A7E77E077334A33A34E4433C91F11114A7E779788";
    attribute INIT_16 of inst : label is "232222A24E44A47D0710D93423003333333333A34E44A4D9071091CC7D07C0CC";
    attribute INIT_17 of inst : label is "8888883E4E44A47700D9443422022222222222D94E44A47707904D3422012223";
    attribute INIT_18 of inst : label is "333322A24E44A407005A34E37E07E0933D3333FB4E44A477005A44937F078188";
    attribute INIT_19 of inst : label is "222222A24E44A407003133337E071022222222A24E44A407004A33B37E07B0D8";
    attribute INIT_1A of inst : label is "D9E111A14E44B50F101122227E071011921811A14E44A407102122227E071021";
    attribute INIT_1B of inst : label is "2CA22B824E4455B5CCCCCCCCCCCCCCCCCC7C10A14E4455FB10111191FC071011";
    attribute INIT_1C of inst : label is "3433FBD9443433332222222222FB95CCCCCC3F95CCCCCCCCCCCCCCCCCC3F0460";
    attribute INIT_1D of inst : label is "3422224E443433222222222222A24E443423B24E443433232222222222A2D944";
    attribute INIT_1E of inst : label is "E411224E4434D9555555650610A14E442422224E443493888888880811A14E44";
    attribute INIT_1F of inst : label is "E400114E44E366666666760700A14E44E410214E44945D555555660710A14E44";
    attribute INIT_20 of inst : label is "E400004E44E3777777898888881D4E44E400104E44E366666666770700D94E44";
    attribute INIT_21 of inst : label is "E400004E33E37707E044332222FB4E44E400004E34E37777974D3433B33F4E44";
    attribute INIT_22 of inst : label is "E400002122E207002133332222A24E44E400003D33E37700E034232222A24E44";
    attribute INIT_23 of inst : label is "B50F001121C90F001121220A10A14E44E400001122E200001122220A11A14E44";
    attribute INIT_24 of inst : label is "55B5CCCCCCCCCCCCCCCCDC0700A04E4455FB0011914DFB001111910D00A14E44";
    attribute INIT_25 of inst : label is "9F5D44343333FB3395CCCCCCCCCCCCFC53C9CCCCCCCC3F3304602DC82CA84E44";
    attribute INIT_26 of inst : label is "5A554534232222FB5E44332222222222DA5544343322B23FD9443323222222B2";
    attribute INIT_27 of inst : label is "FB554544FB1111A15E558488881811115A5545441F1111A15E45232222222222";
    attribute INIT_28 of inst : label is "11FB4544340E11A16E66665555EB0011B15F4544B41F11A16E665655B5EF1011";
    attribute INIT_29 of inst : label is "11114E44330E00A1A588885F5544FB1011B14F44340E10A1FB66665555B40F11";
    attribute INIT_2A of inst : label is "00114E33330E00A04E4433B35F44347A10114E34330E00A0D94433FB4544B40F";
    attribute INIT_2B of inst : label is "00102122220E00A04E443322B234337A00103233330E00A04E443323FB44337A";
    attribute INIT_2C of inst : label is "0F001121920D00A04E44F311112222FA00101122220E00A04E4423222222227A";
    attribute INIT_2D of inst : label is "CCCCCCCC7D0700A04E54FBFB1111D955FB001111D90700A04E44BA1F112192BD";
    attribute INIT_2E of inst : label is "2E462E3C2E322E282E1E2E142E0A2E002DF62DEC2DE293004E54B5CCCCCCCCCC";
    attribute INIT_2F of inst : label is "2E6A2ED22E7A2E762E5A2E6A2EA22E722E6E2E5A2E6A2E662E622E5E2E5A2E50";
    attribute INIT_30 of inst : label is "2E5A2E6A2EA22E9E2E9A2E962E6A2E922E8E2E8A2E862E6A2E822E7E2E7A2E5A";
    attribute INIT_31 of inst : label is "2E9A2E962E6A2EA22EC22EBE2E962E6A2EBA2EB62EB22E5A2E6A2EAE2EAA2EA6";
    attribute INIT_32 of inst : label is "7B7C6C6D6E6F2E6A2ED22ECE2ECA2E962E6A2EA22EC62E9A2E962E6A2EA22EC6";
    attribute INIT_33 of inst : label is "9989D4C4B4A49B9A999885756555BAAA9A8A5747372762616060A3938383797A";
    attribute INIT_34 of inst : label is "9595DDCDBDBD6D6D6E6F83736353D3C3B3B3DCCCBCBC8B7B6B5B74645454B9A9";
    attribute INIT_35 of inst : label is "B5B5B3B2B1B088878685BCBDBEBF73635353BCBDBEBFB3A39383A2A1A0A0B5A5";
    attribute INIT_36 of inst : label is "057206EA05FB06EA05D263626160D2C2B2B2ACABAAA97565555578777675B7B6";
    attribute INIT_37 of inst : label is "06EA06EA06EA06EA06EA06EA06EA06EA054F06EA060706EA04C906EA064E06EA";
    attribute INIT_38 of inst : label is "0B0B0B0A090806040200FEFCFAF8F7F6F5F5F5F6F7F8FAFCFE0006EA06EA06EA";
    attribute INIT_39 of inst : label is "0200FEFCFAF8F7F6F5F5F5F6F7F8FAFCFE0002040608090A0B0B02040608090A";
    attribute INIT_3A of inst : label is "EF9DEF9DEF9DEF9DFF9EFF9EFFAEFFBEFFCFFFDFFFEFFFFF00000B0A09080604";
    attribute INIT_3B of inst : label is "CE99CE99CE99CE99DE9ADE9ADE9ADE9ADE9BDE9BDE9BDE9BEF9CEF9CEF9CEF9C";
    attribute INIT_3C of inst : label is "31E131F231F321F4210521052125113411531162116111711171CE99CE99CE99";
    attribute INIT_3D of inst : label is "E29DF29DF3ADF3AEF3AEF3BE03BE03BE02CF12CF22CF32DF32DF41D041E041E0";
    attribute INIT_3E of inst : label is "0000000000000000000000000000000000000000000000000000E09CE19CE29D";
    attribute INIT_3F of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
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
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
