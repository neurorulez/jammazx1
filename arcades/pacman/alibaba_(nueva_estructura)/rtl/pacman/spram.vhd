-- A parameterized, inferable, true dual-port, dual-clock block RAM in VHDL.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity spram is
generic (
    ADDR    : integer := 12;
    DATA    : integer := 8
);
port (
    -- Port A
    a_clk   : in  std_logic;
	 a_ena   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR-1 downto 0);
    a_din   : in  std_logic_vector(DATA-1 downto 0);
    a_dout  : out std_logic_vector(DATA-1 downto 0)
);
end spram;

architecture rtl of spram is
    -- Shared memory
    type mem_type is array ( (2**ADDR)-1 downto 0 ) of std_logic_vector(DATA-1 downto 0);
    shared variable mem : mem_type;
begin

-- Port A
process(a_clk)
begin
    if(a_clk'event and a_clk='1' and a_ena='1') then
        if(a_wr='1') then
            mem(conv_integer(a_addr)) := a_din;
        end if;
        a_dout <= mem(conv_integer(a_addr));
    end if;
end process;

end rtl;