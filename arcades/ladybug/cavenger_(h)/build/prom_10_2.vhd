-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity prom_10_2 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(4 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prom_10_2 is


  type ROM_ARRAY is array(0 to 31) of std_logic_vector(7 downto 0);
  constant ROM : ROM_ARRAY := (
    x"F5",x"C4",x"D0",x"B1",x"D4",x"90",x"45",x"44", -- 0x0000
    x"00",x"54",x"91",x"94",x"25",x"21",x"65",x"F5", -- 0x0008
    x"21",x"00",x"25",x"D0",x"B1",x"90",x"D4",x"D4", -- 0x0010
    x"25",x"B1",x"C4",x"90",x"65",x"D4",x"00",x"00"  -- 0x0018
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
