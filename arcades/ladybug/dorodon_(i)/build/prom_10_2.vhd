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
    x"FF",x"BB",x"4E",x"21",x"9E",x"DB",x"DE",x"1E", -- 0x0000
    x"9E",x"4F",x"DE",x"10",x"00",x"FF",x"90",x"FF", -- 0x0008
    x"21",x"21",x"21",x"21",x"90",x"00",x"00",x"00", -- 0x0010
    x"90",x"DE",x"9E",x"00",x"DE",x"BB",x"1E",x"FF"  -- 0x0018
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
