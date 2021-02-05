-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity INVADERS_ROM_F is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_F is

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
    attribute INIT_00 of inst : label is "2E3A0F07CD2C04010F00CD371B012200320FE6202E3AC90F07CD2E03010F00CD";
    attribute INIT_01 of inst : label is "013E1043CA00FE202F3A0F07CD2D04010F00CD361B012200320F0F0F0FF0E620";
    attribute INIT_02 of inst : label is "00320F0F0F0FF0E620253AC90F07CD2E04010F00CD351B01220032243E1045C3";
    attribute INIT_03 of inst : label is "07CD3403010F00CD2F1C012200320FE620253A0F07CD3503010F00CD2E1C0122";
    attribute INIT_04 of inst : label is "00320FE620243A0F07CD3303010F00CD301C012200320F0F0F0FF0E620243A0F";
    attribute INIT_05 of inst : label is "0F00CD2E1B012200320F0F0F0FF0E620273AC90F07CD3203010F00CD311C0122";
    attribute INIT_06 of inst : label is "0FF0E620263A0F07CD3404010F00CD2F1B012200320FE620273A0F07CD350401";
    attribute INIT_07 of inst : label is "0F00CD311B012200320FE620263A0F07CD3304010F00CD301B012200320F0F0F";
    attribute INIT_08 of inst : label is "201B3A3C1B01C90F07CD2703010F00CD220032201A3A3C1C01C90F07CD320401";
    attribute INIT_09 of inst : label is "49494122314945433100017F21003E4141413EC90F07CD2704010F00CD220032";
    attribute INIT_0A of inst : label is "1F3E4949493036494949363050484740264949493E4649494979047F24140C36";
    attribute INIT_0B of inst : label is "49413E404848487F414949497F1C2241417F224141413E364949497F1F244424";
    attribute INIT_0C of inst : label is "7F2018207F010101017F412214083F407E41010200417F41007F0808087F2F49";
    attribute INIT_0D of inst : label is "40402649494932314A4C487F3D4245413E304848487F3E4141413E7F0408107F";
    attribute INIT_0E of inst : label is "5149454360100F106063140814637E0106017E7C0201027C7E0101017E40407F";
    attribute INIT_0F of inst : label is "00141414141422147F1422081422410000412214080008040804000000000061";
    attribute INIT_10 of inst : label is "0000000000000000000000000000000000000000000000000000000000000000";
    attribute INIT_11 of inst : label is "224141413E364949497F1F2444241F0000000000000000000000000000000000";
    attribute INIT_12 of inst : label is "010200417F41007F0808087F2F4949413E404848487F414949497F1C2241417F";
    attribute INIT_13 of inst : label is "4848487F3E4141413E7F0408107F7F2018207F010101017F412214083F407E41";
    attribute INIT_14 of inst : label is "7E7C0201027C7E0101017E40407F40402649494932314A4C487F3D4245413E30";
    attribute INIT_15 of inst : label is "0F4DCD220132003E0000000000000303000060100F106022147F14227E010601";
    attribute INIT_16 of inst : label is "1D2E0F4DCDFF0000301D120D0E1B0C30300000000000300E1B180C1C12111E26";
    attribute INIT_17 of inst : label is "000000271B0E220A1519261C260F4DCDFF1912111C30150E1E0F300E1B180C1C";
    attribute INIT_18 of inst : label is "30303030303030303030303030301B260F4DCDFF003030303000003030300000";
    attribute INIT_19 of inst : label is "191B180C30181D120A1D2130022E0F4DCD220132013EFF303030303030303030";
    attribute INIT_1A of inst : label is "303030303030303030303030303030303030303030303003270F4DCDFF302123";
    attribute INIT_1B of inst : label is "32AFFF3030211B0E1C0A15300E0C0A191C21303030303030303004270F4DCDFF";
    attribute INIT_1C of inst : label is "2F1E012200320FE620353A0F00CD2E1E012200320F0F0F0FF0E620353AC92201";
    attribute INIT_1D of inst : label is "311E012200320FE620343A0F00CD301E012200320F0F0F0FF0E620343A0F00CD";
    attribute INIT_1E of inst : label is "484C202030363631120D483441313220444C4853202036353631120DC90F00CD";
    attribute INIT_1F of inst : label is "532020383636310F0D4D2C4120564F4D2020343636310F0D483241313220444C";
    attribute INIT_20 of inst : label is "3A1609CA00FE20513A1432C2FFE622023A0086C201E620503A157BC2A720573A";
    attribute INIT_21 of inst : label is "49C201E620553A14BEC280E602DB0086C3205132033E1562CD0086C202FE2051";
    attribute INIT_22 of inst : label is "013E201B32AF2202322780990622023A1466CA04E601DB205532013E1517CD14";
    attribute INIT_23 of inst : label is "3CC83D22023A1482C3990622023A147AC280E602DBC802E601DB148BC3203632";
    attribute INIT_24 of inst : label is "CD205B322050323C21CC32205532205C32205232AF203632AF22023227809806";
    attribute INIT_25 of inst : label is "553A0086C303D3204E32203E111ACD1107CD0F78CD1383CD0A5FCD1C48CD154B";
    attribute INIT_26 of inst : label is "1449C201FE20553A1449CA01FE22023A1449C3205532013E14EBCD14D0C2A720";
    attribute INIT_27 of inst : label is "280F4DCDFF111C1E1914300F4DCD220132AF1562CD1449C3205532023E1517CD";
    attribute INIT_28 of inst : label is "C280E602DB220132AFC9FF3030302817181D1D1E0B301D1B0A1D1C2830303011";
    attribute INIT_29 of inst : label is "0B241D1B0A1D1C282424242411280F4DCDFF111C1E1914300F4DCD1562CD152F";
    attribute INIT_2A of inst : label is "201B3AC8A7201A3AC91550C2BC230036240021403EC9FF2424242817181D1D1E";
    attribute INIT_2B of inst : label is "323D20583AC91568C240FE7C191568C21BFE1FE67D230036240621000B11C8A7";
    attribute INIT_2C of inst : label is "C200FEC920583220C603D3204E32205132205A32AF159DC201FE205A3AC02058";
    attribute INIT_2D of inst : label is "32AFC9205832303E205A32013E15C8C22059323D20593A15BECAA720593A15BE";
    attribute INIT_2E of inst : label is "0F00CDE5080E2346220032237E1915F12100165F8087473DC9205932093E2057";
    attribute INIT_2F of inst : label is "33300E3033182F341F2E350E2D361BC9220132AF205832093E000000170E46E1";
    attribute INIT_30 of inst : label is "39C201FE20523AC0205B323D205B3A1878CA00FE20523A362D10352E0A342F16";
    attribute INIT_31 of inst : label is "8CCD1656C202FEC9205232023E205B32203EFF220A151916300F4DCD1562CD16";
    attribute INIT_32 of inst : label is "0F280F4DCD16AEC203FEC9205232033E205B32203EC9205B32093E164BCAA717";
    attribute INIT_33 of inst : label is "0C01013211205F320A3EFF280E150B0A1D300E0C170A1F0D0A300E1B180C1C28";
    attribute INIT_34 of inst : label is "2C0A010F00CD220032293E2C0C011864CD29CA010E0011205F320F3E1864CD2A";
    attribute INIT_35 of inst : label is "3E205B32203E16C5C2A7178CCD16CBC204FEC9205232043E205B32203E0F00CD";
    attribute INIT_36 of inst : label is "5232063E205B32603E16E2C2A7178CCD16E8C205FEC9205B32093EC920523205";
    attribute INIT_37 of inst : label is "1712180C301D1B0E1C1712152C0F4DCD1562CD170CC206FEC9205B32093EC920";
    attribute INIT_38 of inst : label is "32083E205B32203E1723C2A7178CCD1729C207FEC9205232073E205B32603EFF";
    attribute INIT_39 of inst : label is "C9205232093E205B32203E1740C2A7178CCD1746C208FEC9205B32093EC92052";
    attribute INIT_3A of inst : label is "1776C280E602DB176BCAA7205C3A1776C2A7178CCD177CC209FEC9205B32093E";
    attribute INIT_3B of inst : label is "205232AFC9205B32093EC92052320A3E205B32403E1776C3205C320BC6205C3A";
    attribute INIT_3C of inst : label is "ACCAFEFE17EACAFFFE7E195F205C3A001617ED21C9205B32205132023E205C32";
    attribute INIT_3D of inst : label is "205C3204C6205C3A4623205D327E23205E327E2317C0C3205C323C205C3A4717";
    attribute INIT_3E of inst : label is "17E8CAFEFE7E195F205C3A001617ED210F00CD205D22244D44205D2A22003278";
    attribute INIT_3F of inst : label is "00010C2EFE1B0E1C0A15240E0C0A191C132CFE1C50C3C9AFC9FF3E17EACAFFFE";
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
