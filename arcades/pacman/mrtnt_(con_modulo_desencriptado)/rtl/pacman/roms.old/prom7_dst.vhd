-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity PROM7_DST is
  port (
    ADDR        : in    std_logic_vector(3 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of PROM7_DST is

  signal rom_addr : std_logic_vector(11 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(3 downto 0) <= ADDR;
  end process;

  p_rom : process(rom_addr)
  begin
    DATA <= (others => '0');
    case rom_addr is
      when x"000" => DATA <= x"00";
      when x"001" => DATA <= x"47";
      when x"002" => DATA <= x"38";
      when x"003" => DATA <= x"C8";
      when x"004" => DATA <= x"E8";
      when x"005" => DATA <= x"3F";
      when x"006" => DATA <= x"C6";
      when x"007" => DATA <= x"FF";
      when x"008" => DATA <= x"9F";
      when x"009" => DATA <= x"29";
      when x"00A" => DATA <= x"DF";
      when x"00B" => DATA <= x"37";
      when x"00C" => DATA <= x"86";
      when x"00D" => DATA <= x"1F";
      when x"00E" => DATA <= x"27";
      when x"00F" => DATA <= x"1D";
      when others => DATA <= (others => '0');
    end case;
  end process;
end RTL;
