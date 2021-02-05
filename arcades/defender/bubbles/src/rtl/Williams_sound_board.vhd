---------------------------------------------------------------------------------
-- Defender sound board by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- gen_ram.vhd 
-------------------------------- 
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
---------------------------------------------------------------------------------
-- cpu68 - Version 9th Jan 2004 0.8
-- 6800/01 compatible CPU core 
-- GNU public license - December 2002 : John E. Kent
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Version 0.0 -- 15/10/2017 -- 
--		    initial version
---------------------------------------------------------------------------------
-- Dec 2018 DW
-- change name to williams for easier porting. changes to sound selection and speech input for later williams boards.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity williams_sound_board is
port(
	clk_snd2     : in std_logic;
	clk_snd1     : in std_logic;
	reset        : in std_logic;
	test_sw_l		: in std_logic := '1'; -- Test switch
	ds1_1				: in std_logic := '1'; -- Configuration switch 1, these are not used by all games
	ds1_2				: in std_logic := '1'; -- Configuration switch 2
	hand			 : in std_logic;
	select_sound : in std_logic_vector(5 downto 0);
	audio_o	    : out std_logic_vector( 7 downto 0)
);
end williams_sound_board;

architecture struct of williams_sound_board is

	signal cpu_clock  : std_logic;
	signal cpu_addr   : std_logic_vector(15 downto 0);
	signal cpu_di     : std_logic_vector( 7 downto 0);
	signal cpu_do     : std_logic_vector( 7 downto 0);
	signal cpu_rw     : std_logic;
	signal cpu_irq    : std_logic;

	signal wram_cs   : std_logic;
	signal wram_we   : std_logic;
	signal wram_do   : std_logic_vector( 7 downto 0);

	signal rom_cs    : std_logic;
	signal roms_cs   : std_logic;
	signal rom_do    : std_logic_vector( 7 downto 0);

	signal pia_rw_n   : std_logic;
	signal pia_cs     : std_logic;
	signal pia_irqa   : std_logic;
	signal pia_irqb   : std_logic;
	signal pia_do     : std_logic_vector( 7 downto 0);
	signal pia_pa_o   : std_logic_vector( 7 downto 0);
	signal pia_pb_i   : std_logic_vector( 7 downto 0);
	signal pia_cb1_i  : std_logic;
	signal speech_clk      : std_logic;
	signal speech_data     : std_logic;
	signal cpu_nmi     : std_logic;
	signal vma    : std_logic;
	
begin

cpu_nmi <= (not test_sw_l);

-- cpu_clock
cpu_clock <= clk_snd1;

-- pia cs
wram_cs <= '1' when cpu_addr(15 downto  8) = X"00" else '0';                       -- 0000-007F
pia_cs  <= '1' when cpu_addr(15 downto 12) = X"0" and cpu_addr(10) = '1' else '0'; -- 8400-8403 ? => 0400-0403
rom_cs  <= '1' when cpu_addr(15 downto 12) = X"F" else '0';                        -- F800-FFFF
	
-- write enables
wram_we <=    '1' when cpu_rw = '0' and cpu_clock = '1' and wram_cs = '1' else '0';
pia_rw_n <=   '0' when cpu_rw = '0' and cpu_clock = '1' and pia_cs = '1' else '1'; 

-- mux cpu in data between roms/io/wram
cpu_di <=
	wram_do when wram_cs = '1' else
	pia_do  when pia_cs = '1' else
	rom_do when rom_cs = '1' else X"55";

-- microprocessor 6800
main_cpu : entity work.cpu68
port map(	
	clk      => cpu_clock,-- E clock input (falling edge)
	rst      => reset,    -- reset input (active high)
	rw       => cpu_rw,   -- read not write output
	vma      => vma,     -- valid memory address (active high)
	address  => cpu_addr, -- address bus output
	data_in  => cpu_di,   -- data bus input
	data_out => cpu_do,   -- data bus output
	hold     => '0',      -- hold input (active high) extend bus cycle
	halt     => '0',      -- halt input (active high) grants DMA
	irq      => cpu_irq,  -- interrupt request input (active high)
	nmi      => cpu_nmi,      -- non maskable interrupt request input (active high)
	test_alu => open,
	test_cc  => open
);

-- cpu program rom
cpu_prog_rom : entity work.bubbles_sound
port map(
 clk  => clk_snd2, --clock_div(0),  -- 3p58/2
 addr => cpu_addr(11 downto 0),
 data => rom_do
);

-- cpu wram 
cpu_ram : entity work.gen_ram
generic map( dWidth => 8, aWidth => 7)
port map(
	clk  => clk_snd2,  -- 3p58/2
	we   => wram_we,
	addr => cpu_addr(6 downto 0),
	d    => cpu_do,
	q    => wram_do
);

-- pia I/O
audio_o <= pia_pa_o;

pia_pb_i <= hand & ds1_1 & select_sound(5 downto 0);

-- pia Cb1
pia_cb1_i <= not (hand and select_sound(5) and select_sound(4) and select_sound(3) and select_sound(2) and select_sound(1) and select_sound(0));

-- pia irqs to cpu
cpu_irq  <= pia_irqa or pia_irqb;

-- pia 
pia : entity work.pia6821
port map
(	
	clk_p      	=> clk_snd2,
	clk_n      	=> not clk_snd2,
	rst       	=> reset,
	cs        	=> pia_cs,
	rw        	=> pia_rw_n,
	addr      	=> cpu_addr(1 downto 0),
	data_in   	=> cpu_do,
	data_out  	=> pia_do,
	irqa      	=> pia_irqa,
	irqb      	=> pia_irqb,
	pa_i      	=> x"FF", 
	pa_o        => pia_pa_o,
	ca1       	=> '1',
	ca2_i      	=> '1',
	ca2_o			=> speech_data,
	pb_i      	=> pia_pb_i,
	cb1       	=> pia_cb1_i,
	cb2_i      	=> '0',
	cb2_o			=> speech_clk
);



-- CVSD speech decoder	
--IC1: entity work.HC55564	
--port map(	
--	clk => speech_clk,
--	rst => '0', -- Reset is not currently implemented
--	bit_in => speech_data,
--	sample_out(15 downto 0) => speech_out

--	);

end struct;