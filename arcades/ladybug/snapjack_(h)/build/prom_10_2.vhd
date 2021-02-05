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
    x"F5",x"05",x"54",x"C1",x"C4",x"94",x"84",x"24", -- 0x0000
    x"D0",x"90",x"A1",x"00",x"31",x"50",x"25",x"F5", -- 0x0008
    x"90",x"31",x"05",x"25",x"05",x"94",x"30",x"41", -- 0x0010
    x"05",x"94",x"61",x"30",x"94",x"50",x"05",x"A5"  -- 0x0018
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
