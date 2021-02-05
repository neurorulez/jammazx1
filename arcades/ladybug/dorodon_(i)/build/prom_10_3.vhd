-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity prom_10_3 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(4 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prom_10_3 is


  type ROM_ARRAY is array(0 to 31) of std_logic_vector(7 downto 0);
  constant ROM : ROM_ARRAY := (
    x"37",x"37",x"37",x"37",x"37",x"37",x"37",x"37", -- 0x0000
    x"3A",x"3A",x"3A",x"3A",x"28",x"28",x"38",x"38", -- 0x0008
    x"08",x"08",x"38",x"38",x"20",x"20",x"38",x"38", -- 0x0010
    x"20",x"20",x"38",x"38",x"3E",x"3E",x"3E",x"3E"  -- 0x0018
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
