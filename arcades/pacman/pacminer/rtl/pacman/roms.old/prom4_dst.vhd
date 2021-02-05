-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity PROM4_DST is
  port (
    ADDR        : in    std_logic_vector(7 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of PROM4_DST is

  signal rom_addr : std_logic_vector(11 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(7 downto 0) <= ADDR;
  end process;

  p_rom : process(rom_addr)
  begin
    DATA <= (others => '0');
    case rom_addr is
      when x"000" => DATA <= x"00";
      when x"001" => DATA <= x"00";
      when x"002" => DATA <= x"00";
      when x"003" => DATA <= x"00";
      when x"004" => DATA <= x"00";
      when x"005" => DATA <= x"07";
      when x"006" => DATA <= x"0E";
      when x"007" => DATA <= x"08";
      when x"008" => DATA <= x"00";
      when x"009" => DATA <= x"02";
      when x"00A" => DATA <= x"0E";
      when x"00B" => DATA <= x"0A";
      when x"00C" => DATA <= x"00";
      when x"00D" => DATA <= x"06";
      when x"00E" => DATA <= x"0C";
      when x"00F" => DATA <= x"0A";
      when x"010" => DATA <= x"00";
      when x"011" => DATA <= x"0F";
      when x"012" => DATA <= x"02";
      when x"013" => DATA <= x"0D";
      when x"014" => DATA <= x"00";
      when x"015" => DATA <= x"01";
      when x"016" => DATA <= x"09";
      when x"017" => DATA <= x"0B";
      when x"018" => DATA <= x"00";
      when x"019" => DATA <= x"0F";
      when x"01A" => DATA <= x"01";
      when x"01B" => DATA <= x"07";
      when x"01C" => DATA <= x"00";
      when x"01D" => DATA <= x"05";
      when x"01E" => DATA <= x"02";
      when x"01F" => DATA <= x"0E";
      when x"020" => DATA <= x"00";
      when x"021" => DATA <= x"07";
      when x"022" => DATA <= x"0B";
      when x"023" => DATA <= x"05";
      when x"024" => DATA <= x"00";
      when x"025" => DATA <= x"07";
      when x"026" => DATA <= x"0F";
      when x"027" => DATA <= x"04";
      when x"028" => DATA <= x"00";
      when x"029" => DATA <= x"07";
      when x"02A" => DATA <= x"0B";
      when x"02B" => DATA <= x"08";
      when x"02C" => DATA <= x"00";
      when x"02D" => DATA <= x"01";
      when x"02E" => DATA <= x"08";
      when x"02F" => DATA <= x"03";
      when x"030" => DATA <= x"00";
      when x"031" => DATA <= x"0E";
      when x"032" => DATA <= x"01";
      when x"033" => DATA <= x"0F";
      when x"034" => DATA <= x"00";
      when x"035" => DATA <= x"05";
      when x"036" => DATA <= x"07";
      when x"037" => DATA <= x"01";
      when x"038" => DATA <= x"00";
      when x"039" => DATA <= x"05";
      when x"03A" => DATA <= x"07";
      when x"03B" => DATA <= x"02";
      when x"03C" => DATA <= x"00";
      when x"03D" => DATA <= x"05";
      when x"03E" => DATA <= x"03";
      when x"03F" => DATA <= x"02";
      when x"040" => DATA <= x"00";
      when x"041" => DATA <= x"01";
      when x"042" => DATA <= x"07";
      when x"043" => DATA <= x"01";
      when x"044" => DATA <= x"00";
      when x"045" => DATA <= x"01";
      when x"046" => DATA <= x"07";
      when x"047" => DATA <= x"02";
      when x"048" => DATA <= x"00";
      when x"049" => DATA <= x"01";
      when x"04A" => DATA <= x"03";
      when x"04B" => DATA <= x"02";
      when x"04C" => DATA <= x"00";
      when x"04D" => DATA <= x"02";
      when x"04E" => DATA <= x"07";
      when x"04F" => DATA <= x"01";
      when x"050" => DATA <= x"00";
      when x"051" => DATA <= x"02";
      when x"052" => DATA <= x"07";
      when x"053" => DATA <= x"02";
      when x"054" => DATA <= x"00";
      when x"055" => DATA <= x"02";
      when x"056" => DATA <= x"03";
      when x"057" => DATA <= x"02";
      when x"058" => DATA <= x"00";
      when x"059" => DATA <= x"0C";
      when x"05A" => DATA <= x"07";
      when x"05B" => DATA <= x"01";
      when x"05C" => DATA <= x"00";
      when x"05D" => DATA <= x"0C";
      when x"05E" => DATA <= x"07";
      when x"05F" => DATA <= x"02";
      when x"060" => DATA <= x"00";
      when x"061" => DATA <= x"0C";
      when x"062" => DATA <= x"03";
      when x"063" => DATA <= x"02";
      when x"064" => DATA <= x"00";
      when x"065" => DATA <= x"04";
      when x"066" => DATA <= x"07";
      when x"067" => DATA <= x"01";
      when x"068" => DATA <= x"00";
      when x"069" => DATA <= x"04";
      when x"06A" => DATA <= x"07";
      when x"06B" => DATA <= x"02";
      when x"06C" => DATA <= x"00";
      when x"06D" => DATA <= x"04";
      when x"06E" => DATA <= x"03";
      when x"06F" => DATA <= x"02";
      when x"070" => DATA <= x"00";
      when x"071" => DATA <= x"07";
      when x"072" => DATA <= x"07";
      when x"073" => DATA <= x"01";
      when x"074" => DATA <= x"00";
      when x"075" => DATA <= x"07";
      when x"076" => DATA <= x"07";
      when x"077" => DATA <= x"02";
      when x"078" => DATA <= x"00";
      when x"079" => DATA <= x"07";
      when x"07A" => DATA <= x"03";
      when x"07B" => DATA <= x"02";
      when x"07C" => DATA <= x"00";
      when x"07D" => DATA <= x"0F";
      when x"07E" => DATA <= x"02";
      when x"07F" => DATA <= x"01";
      when others => DATA <= (others => '0');
    end case;
  end process;
end RTL;
