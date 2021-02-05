-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity prom_10_1 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(4 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prom_10_1 is


  type ROM_ARRAY is array(0 to 31) of std_logic_vector(7 downto 0);
  constant ROM : ROM_ARRAY := (
    x"00",x"9D",x"11",x"B8",x"00",x"79",x"62",x"18", -- 0x0000
    x"00",x"9E",x"25",x"DA",x"00",x"D7",x"A3",x"79", -- 0x0008
    x"00",x"DE",x"29",x"74",x"00",x"D4",x"75",x"9D", -- 0x0010
    x"00",x"AD",x"86",x"97",x"00",x"5A",x"4C",x"17"  -- 0x0018
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
