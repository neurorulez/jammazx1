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
    x"00",x"94",x"83",x"A7",x"00",x"F3",x"FC",x"F4", -- 0x0000
    x"00",x"D5",x"E3",x"28",x"00",x"67",x"D3",x"15", -- 0x0008
    x"00",x"3F",x"CF",x"7F",x"00",x"F7",x"FA",x"F8", -- 0x0010
    x"00",x"F1",x"F8",x"FA",x"00",x"F8",x"F3",x"F2"  -- 0x0018
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
