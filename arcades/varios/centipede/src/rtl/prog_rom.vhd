
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity rom is
    Port ( address 	: in  STD_LOGIC_VECTOR (12 downto 0);
           data 		: out  STD_LOGIC_VECTOR (7 downto 0);
           clk 		: in  STD_LOGIC
			  );
end rom;

architecture Behavioral of rom is

signal rom0_dout		:		std_logic_vector(7 downto 0);
signal rom1_dout		:		std_logic_vector(7 downto 0);
signal rom2_dout		: 		std_logic_vector(7 downto 0);
signal rom3_dout		: 		std_logic_vector(7 downto 0);


begin


  --  roms
  rom0 : entity work.progrom_0
    port map (
      ADDR        => address(10 downto 0),
      DATA        => rom0_dout,
      CLK         => clk
      );

  rom1 : entity work.progrom_1
    port map (
      ADDR        => address(10 downto 0),
      DATA        => rom1_dout,
      CLK         => clk
      );

  rom2 : entity work.progrom_2
    port map (
      ADDR        => address(10 downto 0),
      DATA        => rom2_dout,
      CLK         => clk
      );

  rom3 : entity work.progrom_3
    port map (
      ADDR        => address(10 downto 0),
      DATA        => rom3_dout,
      CLK         => clk
      );

  p_rom_mux : process(address, rom0_dout, rom1_dout, rom2_dout, rom3_dout)
  begin
    data <= (others => '0');
    case address(12 downto 11) is
      when "00" => data <= rom0_dout;
      when "01" => data <= rom1_dout;
      when "10" => data <= rom2_dout;
      when "11" => data <= rom3_dout;
      when others => null;
    end case;
  end process;

end Behavioral;

