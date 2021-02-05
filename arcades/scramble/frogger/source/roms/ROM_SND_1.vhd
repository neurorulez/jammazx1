-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity ROM_SND_1 is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of ROM_SND_1 is

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
    attribute INIT_00 of inst : label is "000621CB4E0366DD026EDD086208620862086208620845082F0815C9D556235E";
    attribute INIT_01 of inst : label is "42A2327E09094B2100064E0366DD026EDD23180572DD0473DD56235E0908B321";
    attribute INIT_02 of inst : label is "C30374DD0275DD230366DD026EDD0777DD0677DD7E0366DD026EDD0D180177DD";
    attribute INIT_03 of inst : label is "0077DD0410013E47070707E0E6783318DF00060872CDC9FF0036DDDF000607D9";
    attribute INIT_04 of inst : label is "0646DDEFEB56235E090566DD046EDD00064F073D1FE678C10872CDC5F71807C9";
    attribute INIT_05 of inst : label is "EB08E708E308DF08DB08D708D3C90374DD0275DD230366DD026EDDDF0777DD78";
    attribute INIT_06 of inst : label is "F3064E06AE0714078007F2086B090F090B0907090308FF08FB08F708F308EF08";
    attribute INIT_07 of inst : label is "5D028102A702CF02FA03270357038A03C003F90436047604B90501054E059E05";
    attribute INIT_08 of inst : label is "F000FE010D011D012E014001530168017D019401AC01C501E001FD021B023B02";
    attribute INIT_09 of inst : label is "5F0065006B00710078007F0087008F009700A000AA00B400BE00CA00D600E300";
    attribute INIT_0A of inst : label is "A77E42A5210A0F1011131416181A1D21252C3408040047004C00500055005A00";
    attribute INIT_0B of inst : label is "0989CD4282110909AB2100064F81874F8742A33AB0ED001801428011099321C0";
    attribute INIT_0C of inst : label is "00000001010000000000000101C91323127E0990CD127E4292110989CD428A11";
    attribute INIT_0D of inst : label is "3A0C150B3A0B190AFB0B3A0AE70ACE0A8D0A6A0A470000000000000101000000";
    attribute INIT_0E of inst : label is "3A0D1A0CEE0B3A0CBA0C7E0B3A0C550C2A0B3A0BE60BB50000000000000B3A0B";
    attribute INIT_0F of inst : label is "470B3A0F130EDD0B3A0EB00E810B3A0E5C0E030B3A0DD20D9F0B3A0D7B0D430B";
    attribute INIT_10 of inst : label is "9212660B3A124012180B3A121711F10B3A11C711740B3A0FE20FA70B3A0F780F";
    attribute INIT_11 of inst : label is "3A1448141E0B3A13EC13B80B3A137A133A0B3A131912F60B3A12DD12BE0B3A12";
    attribute INIT_12 of inst : label is "8F91919292A0AF919192928D8D8D918D8D8D91075F0A3F0B1F0B3A10CA10340B";
    attribute INIT_13 of inst : label is "928F9288928F9288928F9188918D9188918D075F051FFFA0AD8F91929496968F";
    attribute INIT_14 of inst : label is "808F808F808F808D808D808D808D80075F051FFFA0B19288928F9288928F9288";
    attribute INIT_15 of inst : label is "8021DD0961C3F742A63242A332013EE7FFA0AD8F808F808F808F808F808F808F";
    attribute INIT_16 of inst : label is "ABCD6F717274B6B2B28A80AD075F0F3F0C1F07A1C3428821DDC9F7E707A1C342";
    attribute INIT_17 of inst : label is "5F0C3F0B1FFFCAADA6ADABADA8ADAAADA6ADAAADAA075F061FFFC6ADAAADA8AD";
    attribute INIT_18 of inst : label is "858885075F0B1FFFCD8F919294B1B492918F8DADAD8F918F8DB1B492918F8D07";
    attribute INIT_19 of inst : label is "42C832AFE7FFC588868886888588858885888588858885888588858885888588";
    attribute INIT_1A of inst : label is "C9F7E707A1C3428821DDC9F7E707A1C3428021DD0961C3F742A63242A332023E";
    attribute INIT_1B of inst : label is "61C342A532013EF742A332112818FE102801FE7E3442A721E707A1C3429021DD";
    attribute INIT_1C of inst : label is "033EE707A1C3428821DD07A1C3428021DDC9F7E7E918183E0436EF187E053609";
    attribute INIT_1D of inst : label is "A6BB7D609B065F0D3F0B1F07A1C3428021DD07B4C2A742A53A095BC3F742A332";
    attribute INIT_1E of inst : label is "80BD7B609BB8948F6F608FB6938F6F608FA0B893999B80BD7B609BB8BB7D609B";
    attribute INIT_1F of inst : label is "608FA0B497969580B5766098B4B8776098B4B8776098065F0B1FFFA0B493999B";
    attribute INIT_20 of inst : label is "96936F608F065F0E3F0B1FFFA0AC8D8F9380B4766098B48F8C6D608FB6938F6F";
    attribute INIT_21 of inst : label is "96B79980B7978DB48D94B69780B6968D065F0D3F0B1FFFA0B6989B786098A0BB";
    attribute INIT_22 of inst : label is "91B29180B2928D065F0B1FFFA0D29197999B949192949697B99B80B99996B68D";
    attribute INIT_23 of inst : label is "0B1FFFA0D28D949697918D8F919294B69780B69692B28D92B49680B4948DB18D";
    attribute INIT_24 of inst : label is "BDBBB9B8B9BBB273609DB49D949D94756096B69E969E96756094A0C0065F0D3F";
    attribute INIT_25 of inst : label is "B2E0065F051FFFC0D9B8B9BBB4746094BD99949994796096B692969296756094";
    attribute INIT_26 of inst : label is "80AD92AD928D80B28D91948D8880AD88A8888880A88DA88D8880AD92AD928D80";
    attribute INIT_27 of inst : label is "CAAC8DAF80B1B394969680B8065F0D3F0B1FFFE094889488948394888DA88D88";
    attribute INIT_28 of inst : label is "80A3065F051FFFA0D4B6B8B6B899988094B8AF8D8C8094B8AF8D8C809BDBB6AF";
    attribute INIT_29 of inst : label is "AFB4B3AFB3AAB4A8B4A8B4A8B4A883838F8FAFA3AFAFAFA3AF8FAF80A3AF8FAF";
    attribute INIT_2A of inst : label is "80AF989694B696969696B1B180B1999896989898989898065F0D3F0B1FFF8088";
    attribute INIT_2B of inst : label is "A8065F051FFFA0D496988F8F80B3939491B1999999999896989898989898AFAF";
    attribute INIT_2C of inst : label is "1FFFC0A8C38380A3CA8A80AAC88880A8ACAF8F80B4CF8F80AFCA8A80AAC88880";
    attribute INIT_2D of inst : label is "9491726094D49496949476609879609BAF9996999BB99491726094065F0D3F0B";
    attribute INIT_2E of inst : label is "91929498B99491726094065F0B1FFFD99896949476609879609BAF9996999BB9";
    attribute INIT_2F of inst : label is "929292746094766092B291929498B99491726094D192929292746094766092B2";
    attribute INIT_30 of inst : label is "9280A86F6C726F9180A8716D74719280B4716D68658688065F0D3F0B1FFFD192";
    attribute INIT_31 of inst : label is "7160947160967160949698B976726D6A6B608DB4716D6865666088A8716D7471";
    attribute INIT_32 of inst : label is "065F0B1FFFD96074686F6071686F6071686F9180B4716D68719280B46F6C6872";
    attribute INIT_33 of inst : label is "C5A6A8A6A0A5A8A0A6A8A5A6A5A0A8AAA0A7ADA0A6A8A0A5A6A0A8AAA0ACADA0";
    attribute INIT_34 of inst : label is "9896949899B49492918F919280B4B6B99B989D9D9B9B999994065F0D3F0B1FFF";
    attribute INIT_35 of inst : label is "B4B3B1929294949494949494065F0B1FFFB99896949899B49492918F919280B9";
    attribute INIT_36 of inst : label is "3F0B1FFFB192929292B48F8F8F8D8C8D8F80B192929292B48F8F8F8D8C8D8F80";
    attribute INIT_37 of inst : label is "AA686087808A938F8E9678609A94716E6F608FCA6C608E8F80AA686087065F0D";
    attribute INIT_38 of inst : label is "6C608E8F80AA686087065F0B1FFFCF8E9678609A94716E6F608FCA6C608E8F80";
    attribute INIT_39 of inst : label is "916E6E6F608FC76860888780AA686087808788878891746096916E6E6F608FCA";
    attribute INIT_3A of inst : label is "938F8E8CAA918E8F8AAA938F8E8CAA918E8F8A065F0D3F0B1FFFC78891746096";
    attribute INIT_3B of inst : label is "8888878A065F0B1FFFCF8E9678609A94716E6F608FCA6C608E8F80AA686087AA";
    attribute INIT_3C of inst : label is "916E6E6F608FC76860888780AA686087A78A878888A888888787A78A878888A8";
    attribute INIT_3D of inst : label is "9194969494949480B48F9199B49698B98D91B4065F0C3F0B1FFFC78891746096";
    attribute INIT_3E of inst : label is "94B1B9918091949296999B999999998D919496949494949296999B999999998D";
    attribute INIT_3F of inst : label is "918D9188918D928A928D928A928D9188918D9188918DD8D9D6D9065F051FFFCF";
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
