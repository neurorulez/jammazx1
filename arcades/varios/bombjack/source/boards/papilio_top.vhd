--	(c) 2012 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

--------------------------------------------------------------------------------
--	Top level for Bomb Jack game targeted for Papilio Plus board, basic h/w specs:
--		Spartan 6 LX9
--		32Mhz xtal oscillator
--		256Kx16 SRAM 10ns access
--		4Mbit serial Flash
--

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity PAPILIO_TOP is
	port(
		I_RESET		: in		std_logic;								-- active high reset

		-- FLASH
		FLASH_CS		: out		std_logic;								-- Active low FLASH chip select
		FLASH_SI		: out		std_logic;								-- Serial output to FLASH chip SI pin
		FLASH_CK		: out		std_logic;								-- FLASH clock
		FLASH_SO		: in		std_logic := '0';						-- Serial input from FLASH chip SO pin
--		FLASH_HOLD	: OUT		std_logic;						
--		FLASH_WP		: OUT		std_logic;						

		-- SRAM
		SRAM_A		: out		std_logic_vector(18 downto 0);	-- SRAM address bus
		SRAM_D		: inout	std_logic_vector(7 downto 0);	-- SRAM data bus
		--SRAM_nCS		: out		std_logic;								-- SRAM chip select active low
		SRAM_nWE		: out		std_logic;								-- SRAM write enable active low
		--SRAM_nOE		: out		std_logic;								-- SRAM output enable active low
		--SRAM_nBE		: out		std_logic;								-- SRAM byte enables active low
		--SRAM_nLB 	: out		std_logic;
		--SRAM_nUB 	: out		std_logic;
		
		
		-- VGA monitor output
		O_VIDEO_R	: out		std_logic_vector(3 downto 0);
		O_VIDEO_G	: out		std_logic_vector(3 downto 0);
		O_VIDEO_B	: out		std_logic_vector(3 downto 0);
		O_HSYNC		: out		std_logic;
		O_VSYNC		: out		std_logic;

		-- Sound out
		O_AUDIO_L	: out		std_logic;
		O_AUDIO_R	: out		std_logic;

		-- Active high external buttons
		PS2CLK1		: inout	std_logic;
		PS2DAT1		: inout	std_logic;

		-- 32MHz clock
		CLK_IN		: in		std_logic := '0'						-- System clock 32Mhz

	);
end PAPILIO_TOP;

architecture RTL of PAPILIO_TOP is
	-- bootstrap control of SRAM, these signals connect to SRAM when bootstrap_done = '0'
	signal bs_A					: std_logic_vector(17 downto 0) := (others => '0');
	signal bs_Dout				: std_logic_vector( 7 downto 0) := (others => '0');
	signal bs_nCS				: std_logic := '1';
	signal bs_nWE				: std_logic := '1';
	signal bs_nOE				: std_logic := '1';

	signal bootstrap_done	: std_logic := '0';	-- low when FLASH is being copied to SRAM, can be used by user as active low reset

	-- ROM selectors in external RAM space
--	constant sel_3H			: std_logic_vector( 3 downto 0) := x"0"; -- audio CPU rom
	constant sel_4P			: std_logic_vector( 3 downto 0) := x"1"; -- graphics
	constant sel_8E			: std_logic_vector( 3 downto 0) := x"2"; -- chars 0
	constant sel_8H			: std_logic_vector( 3 downto 0) := x"3"; -- chars 1
	constant sel_8K			: std_logic_vector( 3 downto 0) := x"4"; -- chars 2
	constant sel_8L			: std_logic_vector( 3 downto 0) := x"5"; -- bg tiles 0
	constant sel_8N			: std_logic_vector( 3 downto 0) := x"6"; -- bg tiles 1
	constant sel_8R			: std_logic_vector( 3 downto 0) := x"7"; -- bg tiles 2
--	constant sel_1J			: std_logic_vector( 3 downto 0) := x"8"; -- main CPU prog rom 0
--	constant sel_1L			: std_logic_vector( 3 downto 0) := x"9"; -- main CPU prog rom 1
--	constant sel_1M			: std_logic_vector( 3 downto 0) := x"A"; -- main CPU prog rom 2
--	constant sel_1N			: std_logic_vector( 3 downto 0) := x"B"; -- main CPU prog rom 3
--	constant sel_1R			: std_logic_vector( 3 downto 0) := x"C"; -- main CPU prog rom 4
	constant sel_7J			: std_logic_vector( 3 downto 0) := x"D"; -- sprites 0
	constant sel_7L			: std_logic_vector( 3 downto 0) := x"E"; -- sprites 1
	constant sel_7M			: std_logic_vector( 3 downto 0) := x"F"; -- sprites 2

	--
	-- user signals
	--

	-- video
	signal VideoR				: std_logic_vector(3 downto 0);
	signal VideoG				: std_logic_vector(3 downto 0);
	signal VideoB				: std_logic_vector(3 downto 0);
	signal HSync				: std_logic := '1';
	signal VSync				: std_logic := '1';

	-- user control of SRAM, these signals connect to SRAM when boostrap_busy = '0'
	signal user_A				: std_logic_vector(16 downto 0) := (others => '0');
	signal user_Din			: std_logic_vector( 7 downto 0) := (others => '0');
--	signal user_Dout			: std_logic_vector( 7 downto 0) := (others => '0');
	signal user_nCS			: std_logic := '1';
	signal user_nWE			: std_logic := '1';
	signal user_nOE			: std_logic := '1';

-- Bomb Jack signals
	signal ext_reset			: std_logic := '0';
	signal clk_4M_en			: std_logic := '0';
	signal clk_6M_en			: std_logic := '0';
	signal clk_12M				: std_logic := '0';
	signal clk_24M				: std_logic := '0';
	signal clk_48M				: std_logic := '0';

	signal s_red				: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_grn				: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_blu				: std_logic_vector( 3 downto 0) := (others => '0');
	signal dummy				: std_logic_vector( 3 downto 0) := (others => '0');

	signal i_rom_4P_data		: std_logic_vector( 7 downto 0) := (others => '0');
	signal o_rom_4P_addr		: std_logic_vector(12 downto 0) := (others => '0');
	signal o_rom_4P_ena		: std_logic := '1';

	signal i_rom_7JLM_data	: std_logic_vector(23 downto 0) := (others => '0');
	signal o_rom_7JLM_addr	: std_logic_vector(12 downto 0) := (others => '0');
	signal o_rom_7JLM_ena	: std_logic := '1';

	signal i_rom_8KHE_data	: std_logic_vector(23 downto 0) := (others => '0');
	signal o_rom_8KHE_addr	: std_logic_vector(12 downto 0) := (others => '0');
	signal o_rom_8KHE_ena	: std_logic := '1';

	signal i_rom_8RNL_data	: std_logic_vector(23 downto 0) := (others => '0');
	signal o_rom_8RNL_addr	: std_logic_vector(12 downto 0) := (others => '0');
	signal o_rom_8RNL_ena	: std_logic := '1';

	signal ram_state_ctr		: std_logic_vector( 5 downto 0) := (others => '0');

	signal cpu_addr			: std_logic_vector(15 downto 0) := (others => '0');
	signal cpu_data_in		: std_logic_vector( 7 downto 0) := (others => '0');
	signal cpu_data_out		: std_logic_vector( 7 downto 0) := (others => '0');
	signal ram0_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal ram1_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal rom_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal io_data				: std_logic_vector( 7 downto 0) := (others => '0');
	signal rom_sel				: std_logic_vector( 4 downto 0) := (others => '0');
	signal wd_ctr				: std_logic_vector( 3 downto 0) := (others => '0');
	signal cpu_rd_n			: std_logic := '0';
	signal cpu_wr_n			: std_logic := '0';
	signal cpu_rfsh_n			: std_logic := '0';
	signal cpu_mreq_n			: std_logic := '0';
	signal cpu_reset_n		: std_logic := '0';
	signal RESET				: std_logic := '1';

	signal s_audio				: std_logic_vector( 7 downto 0) := (others => '0');

	signal s_cmpblk_n			: std_logic := '1';
	signal s_dac_out			: std_logic := '1';

	signal s_hsync_n			: std_logic := '1';
	signal s_hsync_n_t1		: std_logic := '1';
	signal s_vsync_n			: std_logic := '1';

	signal ps2_codeready		: std_logic := '1';
	signal ps2_scancode		: std_logic_vector( 9 downto 0) := (others => '0');

	-- buttons
	signal
		p1_start, p1_coin, p1_jump, p1_down, p1_up, p1_left, p1_right,
		p2_start, p2_coin, p2_jump, p2_down, p2_up, p2_left, p2_right : std_logic := '0';

begin
	-----------------------------------------------
	-- DCM generates all the system clocks required
	-----------------------------------------------
	clockgen : entity work.CLOCKGEN
	generic map (
		C_CLKFX_DIVIDE   => 25,
		C_CLKFX_MULTIPLY => 24, -- obtenemos 48mhz 
		C_CLKIN_PERIOD   => 20.00
	)
	port map(
		I_CLK			=> CLK_IN,
		I_RST			=> ext_reset,
		O_CLK_4M		=> clk_4M_en,
		O_CLK_6M		=> clk_6M_en,
		O_CLK_12M	=> clk_12M,
		O_CLK_24M	=> clk_24M,
--		O_CLK_32M	=> open,
		O_CLK_48M	=> clk_48M
	);

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- SRAM Bootstrap begins here
------------------------------------------------------------------------------
----------------------------------------------------------------------------

	-- SRAM muxer, allows access to physical SRAM by either bootstrap or user
	SRAM_D	<= bs_Dout	when bootstrap_done = '0' and bs_nWE = '0'	else (others => 'Z'); -- no need for user write
	SRAM_A	<= "0"&bs_A	when bootstrap_done = '0'							else "00" & user_A;
--	SRAM_nCS	<= bs_nCS	when bootstrap_done = '0'							else user_nCS;
	SRAM_nWE	<= bs_nWE	when bootstrap_done = '0'							else user_nWE;
--	SRAM_nOE	<= bs_nOE	when bootstrap_done = '0'							else user_nOE;

	--SRAM_nBE	<= '0';						-- nUB and nLB tied together, SRAM always in 16 bit mode, grrr!
	--SRAM_nUB	<= '1';
	--SRAM_nLB	<= '0';

--   FLASH_HOLD <= '1';
--	FLASH_WP   <= '1';
	
	user_Din	<= SRAM_D( 7 downto 0);	-- anyone can read SRAM_D without contention but his provides some logical separation
	
	-- using the user's DCM for clocking

	u_bs : entity work.bootstrap
	port map (
		I_CLK				=> clk_6M_en,
		I_RESET			=> ext_reset,
		-- FLASH interface
		I_FLASH_SO		=> FLASH_SO,	-- to FLASH chip SPI output
		O_FLASH_CK		=> FLASH_CK,	-- to FLASH chip SPI clock
		O_FLASH_CS		=> FLASH_CS,	-- to FLASH chip select
		O_FLASH_SI		=> FLASH_SI,	-- to FLASH chip SPI input
		-- SRAM interface
		O_A				=> bs_A(17 downto 0),
		O_DOUT			=> bs_Dout,
		O_nCS				=> bs_nCS,
		O_nWE				=> bs_nWE,
		O_nOE				=> bs_nOE,
		O_BS_DONE		=> bootstrap_done -- reset output to rest of machine
	);

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- USER portion begins here
------------------------------------------------------------------------------
----------------------------------------------------------------------------
	O_AUDIO_L	<= s_dac_out;
	O_AUDIO_R	<= s_dac_out;

	O_VIDEO_R	<= VideoR;
	O_VIDEO_G	<= VideoG;
	O_VIDEO_B	<= VideoB;
	O_HSYNC		<= HSync;
	O_VSYNC		<= VSync;

	--user_nCS		<= '0';				-- SRAM always selected
	--user_nOE		<= '0';				-- SRAM output enabled
	user_nWE		<= '1';				-- SRAM write enable inactive (we use it as ROM)

	RESET			<= not bootstrap_done;	-- active high reset (after boostrap has finished)

	ext_reset	<= I_RESET;				-- active high external reset

	-----------------------------------------------------------------------------
	-- Keyboard - active low buttons
	-----------------------------------------------------------------------------
	kbd_inst : entity work.Keyboard
	port map (
		Reset     => ext_reset,
		Clock     => clk_12M,
		PS2Clock  => PS2CLK1,
		PS2Data   => PS2DAT1,
		CodeReady => ps2_codeready,  --: out STD_LOGIC;
		ScanCode  => ps2_scancode    --: out STD_LOGIC_VECTOR(9 downto 0)
	);

-- ScanCode(9)          : 1 = Extended  0 = Regular
-- ScanCode(8)          : 1 = Break     0 = Make
-- ScanCode(7 downto 0) : Key Code
	process
	begin
		wait until rising_edge(clk_12M);
		if ext_reset = '1' then
			p1_start <= '0';
			p1_coin  <= '0';
			p1_jump  <= '0';
			p1_down  <= '0';
			p1_up    <= '0';
			p1_left  <= '0';
			p1_right <= '0';
			p2_start <= '0';
			p2_coin  <= '0';
			p2_jump  <= '0';
			p2_down  <= '0';
			p2_up    <= '0';
			p2_left  <= '0';
			p2_right <= '0';
		elsif (ps2_codeready = '1') then
			case (ps2_scancode(7 downto 0)) is
				when x"05" =>	p1_coin  <= not ps2_scancode(8);     -- P1 coin "F1"
				when x"04" =>	p2_coin  <= not ps2_scancode(8);     -- P2 coin "F3"

				when x"06" =>	p1_start <= not ps2_scancode(8);     -- P1 start "F2"
				when x"0c" =>	p2_start <= not ps2_scancode(8);     -- P2 start "F4"

				when x"43" =>	p1_jump  <= not ps2_scancode(8);     -- P1 jump "I"
									p2_jump  <= not ps2_scancode(8);     -- P2 jump "I"

				when x"75" =>	p1_up    <= not ps2_scancode(8);     -- P1 up arrow
									p2_up  	<= not ps2_scancode(8);     -- P2 up arrow

				when x"72" =>	p1_down  <= not ps2_scancode(8);     -- P1 down arrow
									p2_down  <= not ps2_scancode(8);     -- P2 down arrow

				when x"6b" =>	p1_left  <= not ps2_scancode(8);     -- P1 left arrow
									p2_left  <= not ps2_scancode(8);     -- P2 left arrow

				when x"74" =>	p1_right <= not ps2_scancode(8);     -- P1 right arrow
									p2_right <= not ps2_scancode(8);     -- P2 right arrow

				when others => null;
			end case;
		end if;
	end process;

	bombjack_inst : entity work.BOMB_JACK
	port map(
		-- player 1 controls
		I_P1(7 downto 5)	=> "000",					-- P1 unused
		I_P1(4)				=> p1_jump, 				-- P1 jump
		I_P1(3)				=> p1_down, 				-- P1 down
		I_P1(2)				=> p1_up, 					-- P1 up
		I_P1(1)				=> p1_left, 				-- P1 left
		I_P1(0)				=> p1_right, 				-- P1 right

		-- player 2 controls
		I_P2(7 downto 5)	=> "000",					-- P2 unused
		I_P2(4)				=> p2_jump,					-- P2 jump
		I_P2(3)				=> p2_down,					-- P2 down
		I_P2(2)				=> p2_up,					-- P2 up
		I_P2(1)				=> p2_left,					-- P2 left
		I_P2(0)				=> p2_right,				-- P2 right

		-- system inputs
		I_SYS(7 downto 4)	=> "1111",					-- unused
		I_SYS(3)				=> p2_start,				-- P2 start
		I_SYS(2)				=> p1_start,				-- P1 start
		I_SYS(1)				=> p2_coin,					-- P2 coin
		I_SYS(0)				=> p1_coin,					-- P1 coin

		-- SW1 presets
		I_SW1(7)				=> '1',						-- demo sounds 1=on, 0=off
		I_SW1(6)				=> '0',						-- orientation 1=upright, 0=cocktail
		I_SW1(5 downto 4)	=> "00",						-- lives 00=3, 01=4, 10=5, 11=2
		I_SW1(3 downto 2)	=> "00",						-- coin b 00=1Coin/1Credit, 01=2Coins/1Credit, 10=1Coin/2Credits, 11=1Coin/3Credits
		I_SW1(1 downto 0)	=> "00",						-- coin a 00=1Coin/1Credit, 01=1Coin/2Credits, 10=1Coin/3Credits, 11=1Coin/6Credits
                           
		-- SW2 presets       
		I_SW2(7)				=> '0',						-- special coin 0=easy, 1=hard
		I_SW2(6 downto 5)	=> "00",						-- enemies number and speed 00=easy, 01=medium, 10=hard, 11=insane
		I_SW2(4 downto 3)	=> "00",						-- bird speed 00=easy, 01=medium, 10=hard, 11=insane
		I_SW2(2 downto 0)	=> "000",					-- bonus life 000=none, 001=every 100k, 010=every 30k, 011=50k only, 100=100k only, 101=50k and 100k, 110=100k and 300k, 111=50k and 100k and 300k

		-- Audio out
		O_AUDIO				=> s_audio,

		-- VGA monitor output
		O_VIDEO_R			=> s_red,
		O_VIDEO_G			=> s_grn,
		O_VIDEO_B			=> s_blu,
		O_HSYNC				=> s_hsync_n,
		O_VSYNC				=> s_vsync_n,
		O_CMPBLK_n			=> s_cmpblk_n,

		-- external ROMs
		I_ROM_4P_DATA		=> i_rom_4P_data,
		O_ROM_4P_ADDR		=> o_rom_4P_addr,
		O_ROM_4P_ENA		=> o_rom_4P_ena,
                           
		I_ROM_7JLM_DATA	=> i_rom_7JLM_data,
		O_ROM_7JLM_ADDR	=> o_rom_7JLM_addr,
		O_ROM_7JLM_ENA		=> o_rom_7JLM_ena,
                           
		I_ROM_8KHE_DATA	=> i_rom_8KHE_data,
		O_ROM_8KHE_ADDR	=> o_rom_8KHE_addr,
		O_ROM_8KHE_ENA		=> o_rom_8KHE_ena,
                           
		I_ROM_8RNL_DATA	=> i_rom_8RNL_data,
		O_ROM_8RNL_ADDR	=> o_rom_8RNL_addr,
		O_ROM_8RNL_ENA		=> o_rom_8RNL_ena,

		-- Active high reset
		I_RESET				=> RESET,

		-- Clocks
		I_CLK_4M				=> clk_4M_en,
		I_CLK_6M				=> clk_6M_en,
		I_CLK_12M			=> clk_12M
	);

	-----------------------------------------------------------------
	-- video scan converter required to display video on VGA hardware
	-----------------------------------------------------------------
	-- game native resolution 224x256
	-- take note: the values below are relative to the CLK period not standard VGA clock period
	scan_conv : entity work.VGA_SCANCONV
	generic map (
		-- mark active area of input video
		cstart      =>  56,  -- composite sync start
		clength     => 256,  -- composite sync length

		-- output video timing
		hA				=>  41,	-- h front porch
		hB				=>  46,	-- h sync
		hC				=>  41,	-- h back porch
		hD				=> 256,	-- visible video

--		vA				=>   8,	-- v front porch (not used)
		vB				=>   2,	-- v sync
		vC				=>  22,	-- v back porch
		vD				=> 224,	-- visible video

		hpad			=>   0,	-- create H black border
		vpad			=>   0	-- create V black border
	)
	port map (
		I_VIDEO(15 downto 12)=> "0000",
		I_VIDEO(11 downto 8) => s_red,
		I_VIDEO( 7 downto 4) => s_grn,
		I_VIDEO( 3 downto 0) => s_blu,
		I_HSYNC					=> s_hsync_n,
		I_VSYNC					=> s_vsync_n,
		--
		O_VIDEO(15 downto 12)=> dummy,
		O_VIDEO(11 downto 8) => VideoR,
		O_VIDEO( 7 downto 4) => VideoG,
		O_VIDEO( 3 downto 0) => VideoB,
		O_HSYNC					=> HSync,
		O_VSYNC					=> VSync,
		O_CMPBLK_N				=> open,
		--
		CLK						=> clk_6M_en,
		CLK_X2					=> clk_12M
	);

	----------------------
	-- 1 bit D/A converter
	----------------------
	dac : entity work.DAC
	port map (
		clk_i		=> clk_48M, -- the higher the clock the better
		res_i		=> RESET,
		dac_i		=> s_audio,
		dac_o		=> s_dac_out
	);

	-- The following state machine implements all the 10 separate video ROMs (4P, 7J, 7L, 7M, 8K, 8H, 8E, 8R, 8N, 8L)
	-- by reading the external SRAM on a 48Mhz clock and presenting the data just in time to the video circuitry which
	-- thinks it's accessing 10 discrete ROM chips

	-- all the video signals are in sync with each other because they are derived from vcount and hcount.
	-- hcount is free running off the 6Mhz clock and vcount is clocked off hcount's MSB (256H)
	-- because of that, we can rely on ram_state_ctr to identify what signal is active and when

	-- the output of ROM 4P is latched at the rise of /SLOAD but also at the rise of /SL2
	-- all other ROM outputs are latched at the rise of /SLOAD

	-- sync the state machine to falling edge of /HSYNC and advance 
	ram_state : process
	begin
		wait until rising_edge(clk_48M);
		s_hsync_n_t1 <= s_hsync_n;
		-- rising edge of s_hsync_n
		if (s_hsync_n = '1') and (s_hsync_n_t1 = '0') then
			ram_state_ctr <= (others => '0');
		else
			ram_state_ctr <= ram_state_ctr + 1;
		end if;
	end process;

	-- perform a SRAM read from a specific address depending on which state we're currently in
	ram_read : process
	begin
		wait until falling_edge(clk_48M);
		case ram_state_ctr is
			when "000000" =>	-- 00
				user_A <= sel_4P & o_rom_4P_addr;
			when "000001" =>	-- 01
				if o_rom_4P_ena ='1' then i_rom_4P_data <= user_Din; else i_rom_4P_data <= (others => '0'); end if;
--			when "000010" =>	-- 02
--			when "000011" =>	-- 03
--			when "000100" =>	-- 04
--			when "000101" =>	-- 05
--			when "000110" =>	-- 06 /MDL latches data into 6F
--			when "000111" =>	-- 07
--			when "001000" =>	-- 08
--			when "001001" =>	-- 09
--			when "001010" =>	-- 0a
--			when "001011" =>	-- 0b
--			when "001100" =>	-- 0c
--			when "001101" =>	-- 0d
--			when "001110" =>	-- 0e /SL1 latches data into 5L
--			when "001111" =>	-- 0f
--			when "010000" =>	-- 10
--			when "010001" =>	-- 11
--			when "010010" =>	-- 12
--			when "010011" =>	-- 13
--			when "010100" =>	-- 14
--			when "010101" =>	-- 15
--			when "010110" =>	-- 16 /CDL latches data into 6E
--			when "010111" =>	-- 17
--			when "011000" =>	-- 18
--			when "011001" =>	-- 19
--			when "011010" =>	-- 1a
--			when "011011" =>	-- 1b
--			when "011100" =>	-- 1c
--			when "011101" =>	-- 1d
--			when "011110" =>	-- 1e /SL2 latches data into 4L and 6S
--			when "011111" =>	-- 1f
			when "100000" =>	-- 20
				user_A <= sel_4P & o_rom_4P_addr;
			when "100001" =>	-- 21
				if o_rom_4P_ena ='1' then i_rom_4P_data <= user_Din; else i_rom_4P_data <= (others => '0'); end if;
--			when "100010" =>	-- 22
--			when "100011" =>	-- 23
--			when "100100" =>	-- 24
--			when "100101" =>	-- 25
--			when "100110" =>	-- 26 /VPL latches data into 5H
--			when "100111" =>	-- 27
--			when "101000" =>	-- 28
			when "101001" =>	-- 29
				user_A <= sel_8R & o_rom_8RNL_addr;
			when "101010" =>	-- 2a
				if o_rom_8RNL_ena ='1' then i_rom_8RNL_data(23 downto 16) <= user_Din; else i_rom_8RNL_data(23 downto 16) <= (others => '0'); end if;
				user_A <= sel_8N & o_rom_8RNL_addr;
			when "101011" =>	-- 2b
				if o_rom_8RNL_ena ='1' then i_rom_8RNL_data(15 downto  8) <= user_Din; else i_rom_8RNL_data(15 downto  8) <= (others => '0'); end if;
				user_A <= sel_8L & o_rom_8RNL_addr;
			when "101100" =>	-- 2c
				if o_rom_8RNL_ena ='1' then i_rom_8RNL_data( 7 downto  0) <= user_Din; else i_rom_8RNL_data( 7 downto  0) <= (others => '0'); end if;
				user_A <= sel_8K & o_rom_8KHE_addr;
			when "101101" =>	-- 2d
				if o_rom_8KHE_ena ='1' then i_rom_8KHE_data(23 downto 16) <= user_Din; else i_rom_8KHE_data(23 downto 16) <= (others => '0'); end if;
				user_A <= sel_8H & o_rom_8KHE_addr;
			when "101110" =>	-- 2e
				if o_rom_8KHE_ena ='1' then i_rom_8KHE_data(15 downto  8) <= user_Din; else i_rom_8KHE_data(15 downto  8) <= (others => '0'); end if;
				user_A <= sel_8E & o_rom_8KHE_addr;
			when "101111" =>	-- 2f
				if o_rom_8KHE_ena ='1' then i_rom_8KHE_data( 7 downto  0) <= user_Din; else i_rom_8KHE_data( 7 downto  0) <= (others => '0'); end if;
				user_A <= sel_7J & o_rom_7JLM_addr;
			when "110000" =>	-- 30
				i_rom_7JLM_data(23 downto 16) <= user_Din;
				user_A <= sel_7L & o_rom_7JLM_addr;
			when "110001" =>	-- 31
				i_rom_7JLM_data(15 downto  8) <= user_Din;
				user_A <= sel_7M & o_rom_7JLM_addr;
			when "110010" =>	-- 32
				i_rom_7JLM_data( 7 downto  0) <= user_Din;
--			when "110011" =>	-- 33
--			when "110100" =>	-- 34
--			when "110101" =>	-- 35
--			when "110110" =>	-- 36
--			when "110111" =>	-- 37
--			when "111000" =>	-- 38
--			when "111001" =>	-- 39
--			when "111010" =>	-- 3a
--			when "111011" =>	-- 3b
--			when "111100" =>	-- 3c /SLOAD latches data into shifters
--			when "111101" =>	-- 3d
--			when "111110" =>	-- 3e
--			when "111111" =>	-- 3f
			when others   => null;
		end case;
	end process;
end RTL;
