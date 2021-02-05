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
    x"00",x"78",x"A3",x"B5",x"00",x"8C",x"79",x"64", -- 0x0000
    x"00",x"C3",x"EE",x"DD",x"00",x"3C",x"A2",x"4A", -- 0x0008
    x"00",x"87",x"BA",x"DE",x"00",x"2A",x"AE",x"BB", -- 0x0010
    x"00",x"8C",x"C2",x"B7",x"00",x"AC",x"E2",x"1D"  -- 0x0018
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
