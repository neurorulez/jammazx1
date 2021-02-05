-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity color_prom_1c is
  port (
    ADDR        : in    std_logic_vector(8 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of color_prom_1c is

  signal rom_addr : std_logic_vector(11 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(8 downto 0) <= ADDR;
  end process;

  p_rom : process(rom_addr)
  begin
    DATA <= (others => '0');
    case rom_addr is
      when x"000" => DATA <= x"00";
      when x"001" => DATA <= x"0F";
      when x"002" => DATA <= x"0F";
      when x"003" => DATA <= x"0F";
      when x"004" => DATA <= x"00";
      when x"005" => DATA <= x"00";
      when x"006" => DATA <= x"00";
      when x"007" => DATA <= x"0F";
      when x"008" => DATA <= x"00";
      when x"009" => DATA <= x"0F";
      when x"00A" => DATA <= x"0B";
      when x"00B" => DATA <= x"0B";
      when x"00C" => DATA <= x"00";
      when x"00D" => DATA <= x"00";
      when x"00E" => DATA <= x"00";
      when x"00F" => DATA <= x"0B";
      when x"010" => DATA <= x"00";
      when x"011" => DATA <= x"0F";
      when x"012" => DATA <= x"07";
      when x"013" => DATA <= x"07";
      when x"014" => DATA <= x"00";
      when x"015" => DATA <= x"00";
      when x"016" => DATA <= x"00";
      when x"017" => DATA <= x"07";
      when x"018" => DATA <= x"00";
      when x"019" => DATA <= x"00";
      when x"01A" => DATA <= x"04";
      when x"01B" => DATA <= x"04";
      when x"01C" => DATA <= x"00";
      when x"01D" => DATA <= x"00";
      when x"01E" => DATA <= x"00";
      when x"01F" => DATA <= x"04";
      when x"020" => DATA <= x"00";
      when x"021" => DATA <= x"00";
      when x"022" => DATA <= x"00";
      when x"023" => DATA <= x"00";
      when x"024" => DATA <= x"00";
      when x"025" => DATA <= x"00";
      when x"026" => DATA <= x"00";
      when x"027" => DATA <= x"00";
      when x"028" => DATA <= x"00";
      when x"029" => DATA <= x"00";
      when x"02A" => DATA <= x"00";
      when x"02B" => DATA <= x"00";
      when x"02C" => DATA <= x"00";
      when x"02D" => DATA <= x"00";
      when x"02E" => DATA <= x"00";
      when x"02F" => DATA <= x"00";
      when x"030" => DATA <= x"00";
      when x"031" => DATA <= x"00";
      when x"032" => DATA <= x"00";
      when x"033" => DATA <= x"00";
      when x"034" => DATA <= x"00";
      when x"035" => DATA <= x"00";
      when x"036" => DATA <= x"00";
      when x"037" => DATA <= x"00";
      when x"038" => DATA <= x"00";
      when x"039" => DATA <= x"03";
      when x"03A" => DATA <= x"0A";
      when x"03B" => DATA <= x"00";
      when x"03C" => DATA <= x"00";
      when x"03D" => DATA <= x"00";
      when x"03E" => DATA <= x"00";
      when x"03F" => DATA <= x"00";
      when x"040" => DATA <= x"00";
      when x"041" => DATA <= x"00";
      when x"042" => DATA <= x"00";
      when x"043" => DATA <= x"00";
      when x"044" => DATA <= x"00";
      when x"045" => DATA <= x"00";
      when x"046" => DATA <= x"00";
      when x"047" => DATA <= x"00";
      when x"048" => DATA <= x"00";
      when x"049" => DATA <= x"00";
      when x"04A" => DATA <= x"0F";
      when x"04B" => DATA <= x"0F";
      when x"04C" => DATA <= x"0B";
      when x"04D" => DATA <= x"08";
      when x"04E" => DATA <= x"06";
      when x"04F" => DATA <= x"00";
      when x"050" => DATA <= x"00";
      when x"051" => DATA <= x"00";
      when x"052" => DATA <= x"0F";
      when x"053" => DATA <= x"0F";
      when x"054" => DATA <= x"0B";
      when x"055" => DATA <= x"08";
      when x"056" => DATA <= x"06";
      when x"057" => DATA <= x"00";
      when x"058" => DATA <= x"00";
      when x"059" => DATA <= x"00";
      when x"05A" => DATA <= x"0F";
      when x"05B" => DATA <= x"0F";
      when x"05C" => DATA <= x"0B";
      when x"05D" => DATA <= x"08";
      when x"05E" => DATA <= x"06";
      when x"05F" => DATA <= x"00";
      when x"060" => DATA <= x"00";
      when x"061" => DATA <= x"00";
      when x"062" => DATA <= x"0F";
      when x"063" => DATA <= x"0F";
      when x"064" => DATA <= x"0B";
      when x"065" => DATA <= x"08";
      when x"066" => DATA <= x"06";
      when x"067" => DATA <= x"00";
      when x"068" => DATA <= x"00";
      when x"069" => DATA <= x"0F";
      when x"06A" => DATA <= x"0F";
      when x"06B" => DATA <= x"0B";
      when x"06C" => DATA <= x"00";
      when x"06D" => DATA <= x"00";
      when x"06E" => DATA <= x"00";
      when x"06F" => DATA <= x"00";
      when x"070" => DATA <= x"00";
      when x"071" => DATA <= x"0F";
      when x"072" => DATA <= x"00";
      when x"073" => DATA <= x"00";
      when x"074" => DATA <= x"0F";
      when x"075" => DATA <= x"0B";
      when x"076" => DATA <= x"00";
      when x"077" => DATA <= x"00";
      when x"078" => DATA <= x"00";
      when x"079" => DATA <= x"0F";
      when x"07A" => DATA <= x"00";
      when x"07B" => DATA <= x"00";
      when x"07C" => DATA <= x"00";
      when x"07D" => DATA <= x"00";
      when x"07E" => DATA <= x"0F";
      when x"07F" => DATA <= x"0B";
      when x"080" => DATA <= x"00";
      when x"081" => DATA <= x"00";
      when x"082" => DATA <= x"0F";
      when x"083" => DATA <= x"0F";
      when x"084" => DATA <= x"0C";
      when x"085" => DATA <= x"09";
      when x"086" => DATA <= x"0F";
      when x"087" => DATA <= x"00";
      when x"088" => DATA <= x"00";
      when x"089" => DATA <= x"00";
      when x"08A" => DATA <= x"0F";
      when x"08B" => DATA <= x"00";
      when x"08C" => DATA <= x"00";
      when x"08D" => DATA <= x"00";
      when x"08E" => DATA <= x"0F";
      when x"08F" => DATA <= x"0A";
      when x"090" => DATA <= x"00";
      when x"091" => DATA <= x"00";
      when x"092" => DATA <= x"0F";
      when x"093" => DATA <= x"00";
      when x"094" => DATA <= x"00";
      when x"095" => DATA <= x"00";
      when x"096" => DATA <= x"00";
      when x"097" => DATA <= x"00";
      when x"098" => DATA <= x"00";
      when x"099" => DATA <= x"00";
      when x"09A" => DATA <= x"0F";
      when x"09B" => DATA <= x"0F";
      when x"09C" => DATA <= x"0F";
      when x"09D" => DATA <= x"0A";
      when x"09E" => DATA <= x"00";
      when x"09F" => DATA <= x"00";
      when x"0A0" => DATA <= x"00";
      when x"0A1" => DATA <= x"00";
      when x"0A2" => DATA <= x"0F";
      when x"0A3" => DATA <= x"0F";
      when x"0A4" => DATA <= x"0F";
      when x"0A5" => DATA <= x"0D";
      when x"0A6" => DATA <= x"00";
      when x"0A7" => DATA <= x"00";
      when x"0A8" => DATA <= x"00";
      when x"0A9" => DATA <= x"00";
      when x"0AA" => DATA <= x"0F";
      when x"0AB" => DATA <= x"0F";
      when x"0AC" => DATA <= x"00";
      when x"0AD" => DATA <= x"00";
      when x"0AE" => DATA <= x"0F";
      when x"0AF" => DATA <= x"0C";
      when x"0B0" => DATA <= x"00";
      when x"0B1" => DATA <= x"00";
      when x"0B2" => DATA <= x"0F";
      when x"0B3" => DATA <= x"0D";
      when x"0B4" => DATA <= x"0B";
      when x"0B5" => DATA <= x"08";
      when x"0B6" => DATA <= x"05";
      when x"0B7" => DATA <= x"0F";
      when x"0B8" => DATA <= x"02";
      when x"0B9" => DATA <= x"04";
      when x"0BA" => DATA <= x"06";
      when x"0BB" => DATA <= x"08";
      when x"0BC" => DATA <= x"0A";
      when x"0BD" => DATA <= x"0C";
      when x"0BE" => DATA <= x"0E";
      when x"0BF" => DATA <= x"0F";
      when x"0C0" => DATA <= x"00";
      when x"0C1" => DATA <= x"00";
      when x"0C2" => DATA <= x"0E";
      when x"0C3" => DATA <= x"0F";
      when x"0C4" => DATA <= x"00";
      when x"0C5" => DATA <= x"00";
      when x"0C6" => DATA <= x"0F";
      when x"0C7" => DATA <= x"00";
      when x"0C8" => DATA <= x"00";
      when x"0C9" => DATA <= x"00";
      when x"0CA" => DATA <= x"0F";
      when x"0CB" => DATA <= x"0F";
      when x"0CC" => DATA <= x"0F";
      when x"0CD" => DATA <= x"0C";
      when x"0CE" => DATA <= x"09";
      when x"0CF" => DATA <= x"08";
      when x"0D0" => DATA <= x"00";
      when x"0D1" => DATA <= x"00";
      when x"0D2" => DATA <= x"0F";
      when x"0D3" => DATA <= x"0F";
      when x"0D4" => DATA <= x"0C";
      when x"0D5" => DATA <= x"0A";
      when x"0D6" => DATA <= x"0F";
      when x"0D7" => DATA <= x"00";
      when x"0D8" => DATA <= x"00";
      when x"0D9" => DATA <= x"00";
      when x"0DA" => DATA <= x"0F";
      when x"0DB" => DATA <= x"0F";
      when x"0DC" => DATA <= x"0F";
      when x"0DD" => DATA <= x"0D";
      when x"0DE" => DATA <= x"0B";
      when x"0DF" => DATA <= x"09";
      when x"0E0" => DATA <= x"0F";
      when x"0E1" => DATA <= x"00";
      when x"0E2" => DATA <= x"00";
      when x"0E3" => DATA <= x"00";
      when x"0E4" => DATA <= x"00";
      when x"0E5" => DATA <= x"00";
      when x"0E6" => DATA <= x"00";
      when x"0E7" => DATA <= x"00";
      when x"0E8" => DATA <= x"0F";
      when x"0E9" => DATA <= x"00";
      when x"0EA" => DATA <= x"00";
      when x"0EB" => DATA <= x"00";
      when x"0EC" => DATA <= x"00";
      when x"0ED" => DATA <= x"00";
      when x"0EE" => DATA <= x"00";
      when x"0EF" => DATA <= x"00";
      when x"0F0" => DATA <= x"0F";
      when x"0F1" => DATA <= x"05";
      when x"0F2" => DATA <= x"0D";
      when x"0F3" => DATA <= x"00";
      when x"0F4" => DATA <= x"00";
      when x"0F5" => DATA <= x"00";
      when x"0F6" => DATA <= x"00";
      when x"0F7" => DATA <= x"00";
      when x"0F8" => DATA <= x"00";
      when x"0F9" => DATA <= x"00";
      when x"0FA" => DATA <= x"0F";
      when x"0FB" => DATA <= x"0F";
      when x"0FC" => DATA <= x"08";
      when x"0FD" => DATA <= x"00";
      when x"0FE" => DATA <= x"00";
      when x"0FF" => DATA <= x"05";
      when x"100" => DATA <= x"00";
      when x"101" => DATA <= x"0F";
      when x"102" => DATA <= x"0F";
      when x"103" => DATA <= x"0F";
      when x"104" => DATA <= x"00";
      when x"105" => DATA <= x"00";
      when x"106" => DATA <= x"00";
      when x"107" => DATA <= x"0F";
      when x"108" => DATA <= x"00";
      when x"109" => DATA <= x"0F";
      when x"10A" => DATA <= x"00";
      when x"10B" => DATA <= x"0F";
      when x"10C" => DATA <= x"0F";
      when x"10D" => DATA <= x"08";
      when x"10E" => DATA <= x"0A";
      when x"10F" => DATA <= x"00";
      when x"110" => DATA <= x"00";
      when x"111" => DATA <= x"00";
      when x"112" => DATA <= x"0F";
      when x"113" => DATA <= x"0D";
      when x"114" => DATA <= x"0B";
      when x"115" => DATA <= x"09";
      when x"116" => DATA <= x"07";
      when x"117" => DATA <= x"0A";
      when x"118" => DATA <= x"00";
      when x"119" => DATA <= x"00";
      when x"11A" => DATA <= x"0F";
      when x"11B" => DATA <= x"0D";
      when x"11C" => DATA <= x"0B";
      when x"11D" => DATA <= x"09";
      when x"11E" => DATA <= x"07";
      when x"11F" => DATA <= x"0A";
      when x"120" => DATA <= x"00";
      when x"121" => DATA <= x"00";
      when x"122" => DATA <= x"0F";
      when x"123" => DATA <= x"0D";
      when x"124" => DATA <= x"0B";
      when x"125" => DATA <= x"09";
      when x"126" => DATA <= x"07";
      when x"127" => DATA <= x"0A";
      when x"128" => DATA <= x"00";
      when x"129" => DATA <= x"00";
      when x"12A" => DATA <= x"0F";
      when x"12B" => DATA <= x"0D";
      when x"12C" => DATA <= x"0B";
      when x"12D" => DATA <= x"09";
      when x"12E" => DATA <= x"07";
      when x"12F" => DATA <= x"0A";
      when x"130" => DATA <= x"00";
      when x"131" => DATA <= x"00";
      when x"132" => DATA <= x"0F";
      when x"133" => DATA <= x"0D";
      when x"134" => DATA <= x"0B";
      when x"135" => DATA <= x"09";
      when x"136" => DATA <= x"07";
      when x"137" => DATA <= x"0A";
      when x"138" => DATA <= x"00";
      when x"139" => DATA <= x"00";
      when x"13A" => DATA <= x"0F";
      when x"13B" => DATA <= x"0D";
      when x"13C" => DATA <= x"0B";
      when x"13D" => DATA <= x"09";
      when x"13E" => DATA <= x"07";
      when x"13F" => DATA <= x"09";
      when x"140" => DATA <= x"00";
      when x"141" => DATA <= x"00";
      when x"142" => DATA <= x"00";
      when x"143" => DATA <= x"00";
      when x"144" => DATA <= x"00";
      when x"145" => DATA <= x"00";
      when x"146" => DATA <= x"00";
      when x"147" => DATA <= x"00";
      when x"148" => DATA <= x"00";
      when x"149" => DATA <= x"00";
      when x"14A" => DATA <= x"0F";
      when x"14B" => DATA <= x"0F";
      when x"14C" => DATA <= x"0B";
      when x"14D" => DATA <= x"08";
      when x"14E" => DATA <= x"06";
      when x"14F" => DATA <= x"00";
      when x"150" => DATA <= x"00";
      when x"151" => DATA <= x"00";
      when x"152" => DATA <= x"0F";
      when x"153" => DATA <= x"0F";
      when x"154" => DATA <= x"0B";
      when x"155" => DATA <= x"08";
      when x"156" => DATA <= x"06";
      when x"157" => DATA <= x"00";
      when x"158" => DATA <= x"00";
      when x"159" => DATA <= x"00";
      when x"15A" => DATA <= x"0F";
      when x"15B" => DATA <= x"0F";
      when x"15C" => DATA <= x"0B";
      when x"15D" => DATA <= x"08";
      when x"15E" => DATA <= x"06";
      when x"15F" => DATA <= x"00";
      when x"160" => DATA <= x"00";
      when x"161" => DATA <= x"00";
      when x"162" => DATA <= x"0F";
      when x"163" => DATA <= x"0F";
      when x"164" => DATA <= x"0B";
      when x"165" => DATA <= x"08";
      when x"166" => DATA <= x"06";
      when x"167" => DATA <= x"00";
      when x"168" => DATA <= x"00";
      when x"169" => DATA <= x"00";
      when x"16A" => DATA <= x"00";
      when x"16B" => DATA <= x"00";
      when x"16C" => DATA <= x"00";
      when x"16D" => DATA <= x"00";
      when x"16E" => DATA <= x"00";
      when x"16F" => DATA <= x"00";
      when x"170" => DATA <= x"00";
      when x"171" => DATA <= x"00";
      when x"172" => DATA <= x"00";
      when x"173" => DATA <= x"00";
      when x"174" => DATA <= x"00";
      when x"175" => DATA <= x"00";
      when x"176" => DATA <= x"00";
      when x"177" => DATA <= x"00";
      when x"178" => DATA <= x"00";
      when x"179" => DATA <= x"00";
      when x"17A" => DATA <= x"0F";
      when x"17B" => DATA <= x"0A";
      when x"17C" => DATA <= x"07";
      when x"17D" => DATA <= x"00";
      when x"17E" => DATA <= x"00";
      when x"17F" => DATA <= x"00";
      when x"180" => DATA <= x"00";
      when x"181" => DATA <= x"00";
      when x"182" => DATA <= x"0F";
      when x"183" => DATA <= x"0D";
      when x"184" => DATA <= x"0B";
      when x"185" => DATA <= x"09";
      when x"186" => DATA <= x"07";
      when x"187" => DATA <= x"0A";
      when x"188" => DATA <= x"00";
      when x"189" => DATA <= x"00";
      when x"18A" => DATA <= x"0F";
      when x"18B" => DATA <= x"0F";
      when x"18C" => DATA <= x"0C";
      when x"18D" => DATA <= x"0A";
      when x"18E" => DATA <= x"08";
      when x"18F" => DATA <= x"07";
      when x"190" => DATA <= x"00";
      when x"191" => DATA <= x"00";
      when x"192" => DATA <= x"0F";
      when x"193" => DATA <= x"0B";
      when x"194" => DATA <= x"09";
      when x"195" => DATA <= x"08";
      when x"196" => DATA <= x"0F";
      when x"197" => DATA <= x"00";
      when x"198" => DATA <= x"00";
      when x"199" => DATA <= x"0F";
      when x"19A" => DATA <= x"05";
      when x"19B" => DATA <= x"05";
      when x"19C" => DATA <= x"05";
      when x"19D" => DATA <= x"02";
      when x"19E" => DATA <= x"0C";
      when x"19F" => DATA <= x"09";
      when x"1A0" => DATA <= x"00";
      when x"1A1" => DATA <= x"0F";
      when x"1A2" => DATA <= x"06";
      when x"1A3" => DATA <= x"06";
      when x"1A4" => DATA <= x"06";
      when x"1A5" => DATA <= x"04";
      when x"1A6" => DATA <= x"0D";
      when x"1A7" => DATA <= x"0A";
      when x"1A8" => DATA <= x"00";
      when x"1A9" => DATA <= x"0F";
      when x"1AA" => DATA <= x"07";
      when x"1AB" => DATA <= x"07";
      when x"1AC" => DATA <= x"07";
      when x"1AD" => DATA <= x"06";
      when x"1AE" => DATA <= x"0E";
      when x"1AF" => DATA <= x"0B";
      when x"1B0" => DATA <= x"00";
      when x"1B1" => DATA <= x"0F";
      when x"1B2" => DATA <= x"08";
      when x"1B3" => DATA <= x"08";
      when x"1B4" => DATA <= x"08";
      when x"1B5" => DATA <= x"08";
      when x"1B6" => DATA <= x"0F";
      when x"1B7" => DATA <= x"0C";
      when x"1B8" => DATA <= x"00";
      when x"1B9" => DATA <= x"0F";
      when x"1BA" => DATA <= x"00";
      when x"1BB" => DATA <= x"00";
      when x"1BC" => DATA <= x"00";
      when x"1BD" => DATA <= x"00";
      when x"1BE" => DATA <= x"0B";
      when x"1BF" => DATA <= x"08";
      when x"1C0" => DATA <= x"00";
      when x"1C1" => DATA <= x"00";
      when x"1C2" => DATA <= x"0F";
      when x"1C3" => DATA <= x"0D";
      when x"1C4" => DATA <= x"0B";
      when x"1C5" => DATA <= x"09";
      when x"1C6" => DATA <= x"07";
      when x"1C7" => DATA <= x"08";
      when x"1C8" => DATA <= x"00";
      when x"1C9" => DATA <= x"00";
      when x"1CA" => DATA <= x"0F";
      when x"1CB" => DATA <= x"0D";
      when x"1CC" => DATA <= x"0B";
      when x"1CD" => DATA <= x"09";
      when x"1CE" => DATA <= x"07";
      when x"1CF" => DATA <= x"07";
      when x"1D0" => DATA <= x"00";
      when x"1D1" => DATA <= x"00";
      when x"1D2" => DATA <= x"0F";
      when x"1D3" => DATA <= x"0D";
      when x"1D4" => DATA <= x"0B";
      when x"1D5" => DATA <= x"09";
      when x"1D6" => DATA <= x"07";
      when x"1D7" => DATA <= x"06";
      when x"1D8" => DATA <= x"00";
      when x"1D9" => DATA <= x"00";
      when x"1DA" => DATA <= x"0F";
      when x"1DB" => DATA <= x"0D";
      when x"1DC" => DATA <= x"0B";
      when x"1DD" => DATA <= x"09";
      when x"1DE" => DATA <= x"07";
      when x"1DF" => DATA <= x"05";
      when x"1E0" => DATA <= x"00";
      when x"1E1" => DATA <= x"00";
      when x"1E2" => DATA <= x"00";
      when x"1E3" => DATA <= x"00";
      when x"1E4" => DATA <= x"00";
      when x"1E5" => DATA <= x"00";
      when x"1E6" => DATA <= x"00";
      when x"1E7" => DATA <= x"00";
      when x"1E8" => DATA <= x"00";
      when x"1E9" => DATA <= x"0F";
      when x"1EA" => DATA <= x"00";
      when x"1EB" => DATA <= x"00";
      when x"1EC" => DATA <= x"00";
      when x"1ED" => DATA <= x"00";
      when x"1EE" => DATA <= x"0B";
      when x"1EF" => DATA <= x"08";
      when x"1F0" => DATA <= x"00";
      when x"1F1" => DATA <= x"0F";
      when x"1F2" => DATA <= x"00";
      when x"1F3" => DATA <= x"00";
      when x"1F4" => DATA <= x"00";
      when x"1F5" => DATA <= x"00";
      when x"1F6" => DATA <= x"00";
      when x"1F7" => DATA <= x"00";
      when x"1F8" => DATA <= x"00";
      when x"1F9" => DATA <= x"00";
      when x"1FA" => DATA <= x"0F";
      when x"1FB" => DATA <= x"0D";
      when x"1FC" => DATA <= x"0B";
      when x"1FD" => DATA <= x"09";
      when x"1FE" => DATA <= x"07";
      when others => DATA <= (others => '0');
    end case;
  end process;
end RTL;
