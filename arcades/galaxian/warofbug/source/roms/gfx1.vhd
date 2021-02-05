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
    attribute INIT_05 of inst : label is "0007F00088888888888F7888888F7888C295512C06EEA2220000EE0006EC8CE6";
    attribute INIT_06 of inst : label is "008C4808000010EF8084C800FE0100000007F00088888888888F7888888F7888";
    attribute INIT_07 of inst : label is "0000044060000020040080001000000200000444006000120008000002214300";
    attribute INIT_08 of inst : label is "0008004E00124525E4008000F25421000000004E00885525E4000000F2558800";
    attribute INIT_09 of inst : label is "840E1C210EFF7333088CC44031364EA180E0C3000EFF733308CE54203136CC80";
    attribute INIT_0A of inst : label is "0080F000061137DF000F0C00FD73116000448000001131BF00084400FB131100";
    attribute INIT_0B of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_0C of inst : label is "000000008DEE6EC80000000008CFFC80000000009D56EEC80000000008CFEC80";
    attribute INIT_0D of inst : label is "000000009DEE6EC80000000008CCEE9000000000299AEEC80000000008CFCC80";
    attribute INIT_0E of inst : label is "0000000008CCFC800000000008CCFC800000000008DEEC800000000008DFEC80";
    attribute INIT_0F of inst : label is "0000000008CCFD800000000008CCFD800000000008CCFC800000000008CCFC80";
    attribute INIT_10 of inst : label is "0000000008CCFC8000000000888800000000000008DFEC880000000080000000";
    attribute INIT_11 of inst : label is "0000000008CCFD80000000000088C4200000000008CCFC880000000000000880";
    attribute INIT_12 of inst : label is "000000008CDE6EC8000000008888000000000000AE66EEC80000000080000000";
    attribute INIT_13 of inst : label is "000000009EEE6EC8000000000088C420000000009C56EEC80000000000000880";
    attribute INIT_14 of inst : label is "0000000000000000000000008C44EEC80000000000000000000000008C44EEC8";
    attribute INIT_15 of inst : label is "0000000000000000000000008C44EEC80000000000000000000000008C44EEC8";
    attribute INIT_16 of inst : label is "0000000088880000000000000000000000000000800000000000000000000000";
    attribute INIT_17 of inst : label is "000000000088C420000000000000000000000000000008800000000000000000";
    attribute INIT_18 of inst : label is "08C63E000EF3FEE90000000000000000000000007DCFFF780000000008DFEC80";
    attribute INIT_19 of inst : label is "08DFEC80000000008CEE44C8000000000008CCC867FFDEF90000000000000000";
    attribute INIT_1A of inst : label is "08CEEE000EF3FEE900000000000000000008000017FFFDDF0000000028DFEC80";
    attribute INIT_1B of inst : label is "08DFEC8100000000FCEEECC000000000C008CEEE37777331EC00000010000000";
    attribute INIT_1C of inst : label is "00000000006FFF6F0000000046D6D6D600000000006FFF6F0000000046D6D6D6";
    attribute INIT_1D of inst : label is "00000000696FFF6F0000000046D6D6D600000000006FFF6F000000004CCCCCC4";
    attribute INIT_1E of inst : label is "0088C88C1FFFFFDFC8CC0000EFFFFF7108CEEBBB7F9FFFEDFFF6C800FDDEBCFF";
    attribute INIT_1F of inst : label is "0000000000000000000000000C4EE4C044CFFC440000000044CFFC4400000000";
    attribute INIT_20 of inst : label is "000EE0000CE222EC046222EC08888EE8046222EC06EEAA220022EE2208C622C8";
    attribute INIT_21 of inst : label is "0EE0000000EE22220EE226C808C622640EE222EC0EE888EE002226C80C22AAEC";
    attribute INIT_22 of inst : label is "08C622EE0EE0000000EE22220EE226C808C622640EE222EC0EE888EE00000000";
    attribute INIT_23 of inst : label is "0CE222EC0EE08CEE0EE080EE00EE22220EE8CE62046222EC0022EE220EE000EE";
    attribute INIT_24 of inst : label is "08EC8CE8008CEC800CE222EC0000EE00046222EC0EE8CE620CE2AECA0EE88880";
    attribute INIT_25 of inst : label is "88888888888F78880007F00088888888C295512C06EEA2220000EE0006EC8CE6";
    attribute INIT_26 of inst : label is "8CE7FEC00003FF100CEF7EC801FF300088888888888F78880007F00088888888";
    attribute INIT_27 of inst : label is "000000000000482000000000980400000402045530608488001A000000004386";
    attribute INIT_28 of inst : label is "00080EB30012455ABFE08000A554210000000EB30088555ABFE00000A5558800";
    attribute INIT_29 of inst : label is "840E1C2100100000088CC44000264EA180E0C3000010000008CE54200026CC80";
    attribute INIT_2A of inst : label is "0080F00006110660000F0C000660116000448000001106600008440006601100";
    attribute INIT_2B of inst : label is "E0EF661F6EF0FF0F9669FE0EE0EF070FF0EEFF0FF070F078F0EE1FFFF0FFF0F0";
    attribute INIT_2C of inst : label is "000000008C55DFFE00000000CEE08EEC000000008CCD7FFE00000000CEE00EEC";
    attribute INIT_2D of inst : label is "000000008C55FFFE00000000CEE60CEC000000000889DFFE00000000CEE02EEC";
    attribute INIT_2E of inst : label is "00000000CEE28EEC00000000CEE28EEC00000000CEE00EEC00000000CEE00EEC";
    attribute INIT_2F of inst : label is "00000000CEE60EEC00000000CEE60EEC00000000CEE20EEC00000000CEE20EEC";
    attribute INIT_30 of inst : label is "00000000CEE28EEC00000000CCCCC80000000000CEE00EEC00000000CC800000";
    attribute INIT_31 of inst : label is "00000000CEE60EEC000000008CCEE73000000000CEE20EEC00000000C888CCC0";
    attribute INIT_32 of inst : label is "000000008C45DFFE00000000CCCCC800000000008CDD5FFE00000000CC800000";
    attribute INIT_33 of inst : label is "000000008D55FFFE000000008CCEE730000000008CCC5FFE00000000C888CCC0";
    attribute INIT_34 of inst : label is "0000000000000000000000008CDD7FFE0000000000000000000000008CDD7FFE";
    attribute INIT_35 of inst : label is "0000000000000000000000008CDD7FFE0000000000000000000000008CDD7FFE";
    attribute INIT_36 of inst : label is "00000000CCCCC800000000000000000000000000CC8000000000000000000000";
    attribute INIT_37 of inst : label is "000000008CCEE730000000000000000000000000C888CCC00000000000000000";
    attribute INIT_38 of inst : label is "08CEFE0C0EFF318C0000000000000000000000007FFCEFFF00000000CEE00EEC";
    attribute INIT_39 of inst : label is "CEE00EEC00000000EFF7DDC80000000008CEDDD803FFB88C0000000000000000";
    attribute INIT_3A of inst : label is "08CEEEC80EFF318C00000000000000000008880017FFFEEC00000000CEE00EEC";
    attribute INIT_3B of inst : label is "CEE00EEC00000000837FFFC00000000008CEFFFF37777300EC00000000000000";
    attribute INIT_3C of inst : label is "0000000000000990000000006969696000000000000009900000000069696960";
    attribute INIT_3D of inst : label is "000000000000099000000000696969600000000000000990000000006FFFFFF6";
    attribute INIT_3E of inst : label is "0088CCCC7FFFB7DFCCCC800067FBFF7308CCEBAA4F9F7B77FFE4C800FFFFBC79";
    attribute INIT_3F of inst : label is "000000000000000000000000EFE00EFE44CFFC4444CFFC4444CFFC4444CFFC44";
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
    attribute INIT_05 of inst : label is "1028201037FFFF7327D7DF6327D7DF63349AA8430889BFEC00CF11FC0CE737EC";
    attribute INIT_06 of inst : label is "0017F70F0000005FF07F7100F50000001028201037FFFF7327D7DF6327D7DF63";
    attribute INIT_07 of inst : label is "40100008000100224800010C002110000061000400001220C000300002100000";
    attribute INIT_08 of inst : label is "0024928500021140D829420024112000008924850000E140D8429800241E0000";
    attribute INIT_09 of inst : label is "788FCFEE0137C800E7C41111000000013C9ECFEE0137C800E7C4000000001241";
    attribute INIT_0A of inst : label is "003CDE630000000036EDC30000000000592CDE6B00000000B6EDC29500000000";
    attribute INIT_0B of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_0C of inst : label is "800000000137EEF7000C000037CBBFF7000000000136D9F70480000037C9BFF7";
    attribute INIT_0D of inst : label is "000000000137EEF70000000C37F98CF7000000001336D9F70000840037DB9CF7";
    attribute INIT_0E of inst : label is "0048000037CBBFF70048000037CBBFF70C00000037C9BFF70C00000037C9BFF7";
    attribute INIT_0F of inst : label is "0000084037F98CF70000084037F98CF70000800037DB9CF70000800037DB9CF7";
    attribute INIT_10 of inst : label is "0000000037CBBFF700000000773311320000000037C9BFF70000000033226480";
    attribute INIT_11 of inst : label is "0000000037F98CF700000000733100000000000037DB9CF70000000077233100";
    attribute INIT_12 of inst : label is "880000000137EEF70000000077331132000000000136D9F70000000033226480";
    attribute INIT_13 of inst : label is "000000000137EEF70000000073310000880000000136D9F70000000077233100";
    attribute INIT_14 of inst : label is "0000000000000000000000000136D9F70000000000000000000000000136D9F7";
    attribute INIT_15 of inst : label is "0000000000000000000000000136D9F70000000000000000000000000136D9F7";
    attribute INIT_16 of inst : label is "0000000077331132000000000000000000000000332264800000000000000000";
    attribute INIT_17 of inst : label is "0000000073310000000000000000000000000000772331000000000000000000";
    attribute INIT_18 of inst : label is "7DCFF73000136773000000000000000008C63E00000113370000000077C9BFF7";
    attribute INIT_19 of inst : label is "07C9BFF7000000007F9D6310000000006DBBFF71000111110000000000000000";
    attribute INIT_1A of inst : label is "7FFCE736001367730000000000000000CEFF3EC0000011330000000037C9BFF7";
    attribute INIT_1B of inst : label is "07C9BFF7000000007CDF731000000000FEFFFFFF000000003900000000000000";
    attribute INIT_1C of inst : label is "4463F6C8226CF6313C0C3842C303C1242233F6C844CCF6313C0C3842C303C124";
    attribute INIT_1D of inst : label is "08EFF6C8017FF6313C0C3842C303C1248C63F6C8136CF6313C0C3842C303C124";
    attribute INIT_1E of inst : label is "AFEFFFF700101311B7FFFEE033120100CF9EFFFB01376DDF3FFFCFFEFDE73310";
    attribute INIT_1F of inst : label is "000000000000000000000000001FF100294FF492294FF4922103301200000000";
    attribute INIT_20 of inst : label is "0CC89BEC037D99900EEAAAB10136CFF00089BFD804C99BF60004FF0003788C73";
    attribute INIT_21 of inst : label is "0FF9999800FF99980FF88C73037C88C40FF999F6037C8C7306F999F706FB9960";
    attribute INIT_22 of inst : label is "037C89990FF9999800FF99980FF88C73037C88C40FF999F6037C8C7300000000";
    attribute INIT_23 of inst : label is "07F888F70FF731FF0FF737FF00FF00000FF136C8000000FF0088FF880FF111FF";
    attribute INIT_24 of inst : label is "0FF131FF0FF101FF0FF000FF0088FF8806F99D500FF889F707F888F70FF888F7";
    attribute INIT_25 of inst : label is "37FFFF7327D7DF631028201037FFFF73349AA8430889BFEC00CF11FC0CE737EC";
    attribute INIT_26 of inst : label is "03FE8FF0000001400FF8EF300410000037FFFF7327D7DF631028201037FFFF73";
    attribute INIT_27 of inst : label is "0000420900000000582800000000000090618211012402A80120301642142000";
    attribute INIT_28 of inst : label is "0024925A00021113B5294200311120000089245A0000E113B5429800311E0000";
    attribute INIT_29 of inst : label is "780783400000004029281111000000013C168340000000402928000000001241";
    attribute INIT_2A of inst : label is "0034108C00000000C80143000000000059241084000000004801429500000000";
    attribute INIT_2B of inst : label is "D8FCBBCF77F09C0FCBBCFD8F707F878FF8FFFB8BF878F078F8BBCFFFF09C90F0";
    attribute INIT_2C of inst : label is "000000000136D9F70000000037FCCFF7888000000137EEF70000000037FECCF7";
    attribute INIT_2D of inst : label is "000000000136D9F70000000037CEFFF7048000001337EEF70000000037ECEFF7";
    attribute INIT_2E of inst : label is "0000000037FCCFF70000000037FCCFF70000000037FECCF70000000037FECCF7";
    attribute INIT_2F of inst : label is "0000000037CEFFF70000000037CEFFF70000000037ECEFF70000000037ECEFF7";
    attribute INIT_30 of inst : label is "0000000037FCCFF700000000773311320000000037FECCF70000000033336480";
    attribute INIT_31 of inst : label is "0000000037CEFFF700000000733100000000000037ECEFF70000000077333100";
    attribute INIT_32 of inst : label is "048000000136D9F70000000077331132000000000137EEF70000000033336480";
    attribute INIT_33 of inst : label is "000000000136D9F70000000073310000044800000137EEF70000000077333100";
    attribute INIT_34 of inst : label is "0000000000000000000000000137EEF70000000000000000000000000137EEF7";
    attribute INIT_35 of inst : label is "0000000000000000000000000137EEF70000000000000000000000000137EEF7";
    attribute INIT_36 of inst : label is "0000000077331132000000000000000000000000333364800000000000000000";
    attribute INIT_37 of inst : label is "0000000073310000000000000000000000000000773331000000000000000000";
    attribute INIT_38 of inst : label is "7FFCEFF700137773000000000000000008CEFE0C000113370000000077FECCF7";
    attribute INIT_39 of inst : label is "77FECCF7000000007FEE7310000000007FDDCF71000111110000000000000000";
    attribute INIT_3A of inst : label is "7FFFDCC1001377730000000000000000CEFFF77E000011330000000037FECCF7";
    attribute INIT_3B of inst : label is "77FECCF7000000007FEE73100000000083FFFFF7000000003100000000000000";
    attribute INIT_3C of inst : label is "00000800000001003C0C3842C303C12400000800000001003C0C3842C303C124";
    attribute INIT_3D of inst : label is "00000800000001003C0C3842C303C12400000800000001003C0C3842C303C124";
    attribute INIT_3E of inst : label is "EFFFBDF600111333A7D7FFEC333311004F9E7DEE00137D57FEDFCFE8BDE31310";
    attribute INIT_3F of inst : label is "00000000000000000000000013700731294FF492294FF492294FF492294FF492";
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
