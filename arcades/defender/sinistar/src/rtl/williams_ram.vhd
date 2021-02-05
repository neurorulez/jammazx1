-- Williams memory for later boards (DW oldgit)
-- Dec 2018
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity RAMS is
port (
	CLK  : in  std_logic;
	ENL  : in  std_logic;
	ENH  : in  std_logic;
	WE   : in  std_logic;
	ADDR : in  std_logic_vector(15 downto 0);
	DI   : in  std_logic_vector( 7 downto 0);
	DO   : out std_logic_vector( 7 downto 0)
	);
end;

architecture RTL of RAMS is
	signal cmos_we : std_logic;
	signal ram_out, cmos_out : std_logic_vector(7 downto 0);
	

begin

cmos_we  <= '1' when WE = '1' and ADDR(15 downto 10) = "110011" else '0';
	
	-- cpu/video wram low
cpu_video_low : entity work.gen_ram
generic map( dWidth => 4, aWidth => 16)
port map(
	clk  => CLK,
	we   => ENL and WE,
	addr => ADDR(15 downto 0),
	d    => DI(3 downto 0),
	q    => ram_out(3 downto 0)
);

cpu_video_high : entity work.gen_ram
generic map( dWidth => 4, aWidth => 16)
port map(
	clk  => CLK,
	we   => ENH and WE,
	addr => ADDR(15 downto 0),
	d    => DI(7 downto 4),
	q    => ram_out(7 downto 4)
);
			   

DO  <= cmos_out when ADDR(15 downto 10) = "110011" else ram_out;
	
-- cmos ram 
cmos_ram : entity work.sinistar_cmos_ram
port map
(
	clk  => CLK,
	we   => cmos_we,
	addr => ADDR(9 downto 0),
	d    => DI,
	q    => cmos_out
);

end RTL;	