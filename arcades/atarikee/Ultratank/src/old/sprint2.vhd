-- Top level file for Kee Games Sprint 2 
-- (c) 2017 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

-- Targeted to EP2C5T144C8 mini board but porting to nearly any FPGA should be fairly simple
-- See Sprint 2 manual for video output details. Resistor values listed here have been scaled 
-- for 3.3V logic. 
-- R48 1k Ohm
-- R49 1k Ohm
-- R50 680R
-- R51 330R

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity sprint2 is 
port(		
			Clk_50_I		: in	std_logic;	-- 50MHz input clock
			clk_12		: in	std_logic;
			Reset_n		: in	std_logic;	-- Reset button (Active low)
			Audio1_O	: out std_logic;  -- Ideally this should have a simple low pass filter
			Audio2_O	: out std_logic;
		JOYSTICK_A_GND	: out	STD_LOGIC; -- needed for arcade megawing
		JOYSTICK_B_GND	: out	STD_LOGIC;  -- needed for arcade megawing
		I_JOYSTICK_A           : in    std_logic_vector(5 downto 0);
		I_JOYSTICK_B           : in    std_logic_vector(5 downto 0);
		I_COIN	       	   	 : in    std_logic_vector(1 downto 0);
		I_PLAYER	       		 : in    std_logic_vector(1 downto 0);
		scanSW			   	    : in    std_logic_vector(20 downto 0);
		scandblctrl            : in    std_logic_vector(1 downto 0);
		tv15Khz_mode : in std_logic;
		Hsync_O		: out std_logic;
		Vsync_O		: out std_logic;
		Video_O		: out std_logic;
		Video_OUT	: out std_logic_vector(2 downto 0)	-- Video output, sum this through a 470R resistor to composite video
			);
end sprint2;

architecture rtl of sprint2 is

signal 			Video       : std_logic;
signal			blank			: std_logic;
signal         Video_MUX   : std_logic_vector(2 downto 0);
signal         Video_RGB   : std_logic_vector(2 downto 0);
signal 			VideoRGB_X2 : std_logic_vector(2 downto 0);
signal 			HSync_X2    : std_logic;
signal 			VSync_X2    : std_logic;

signal 		VideoW_O	: std_logic;  --OUT White video output (680 Ohm)
signal 		VideoB_O	: std_logic;	--OUT Black video output (1.2k)
signal 		VideoG_O	: std_logic;	--OUT Gray video output
signal 		Sync_O		: std_logic;  --OUT Composite sync output (1.2k)
signal 		Coin1_I		: std_logic;  ----in   Coin switches (Active low)
signal 		Coin2_I		: std_logic;--in  
signal 		Start1_I	: std_logic;--in    -- Start buttons
signal 		Start2_I	: std_logic;--in  
signal 		Trak_Sel_I	: std_logic;  ----in   Track select button 
signal 		Gas1_I		: std_logic;	----in   Gas pedals 
signal 		Gas2_I		: std_logic;--in  
signal 		Gear1_1_I	: std_logic;  -- --in  Gear shifters, 4th gear = no other gear selected
signal 		Gear1_2_I	: std_logic;--in  
signal 		Gear2_1_I	: std_logic;--in  
signal 		Gear2_2_I	: std_logic;--in  
signal 		Gear3_1_I	: std_logic;       --in  
signal 		Gear3_2_I	: std_logic;       --in  
signal 		Test_I		: std_logic;       --in   Self-test switch
signal 		Steer_1A_I	: std_logic;       --in  Steering wheel inputs, these are quadrature encoders
signal 		Steer_1B_I	: std_logic;       --in	
signal 		Steer_2A_I	: std_logic;       --in	
signal 		Steer_2B_I	: std_logic;       --in 	
signal 		Lamp1_O		: std_logic;	   --out  Player 1 and 2 start button LEDs
signal 		Lamp2_O		: std_logic;       --out 

--signal clk_12			: std_logic;
signal clk_6			: std_logic;
signal phi1 			: std_logic;
signal phi2				: std_logic;

signal Hcount		   : std_logic_vector(8 downto 0) := (others => '0');
signal H256				: std_logic;
signal H256_s			: std_logic;
signal H256_n			: std_logic;
signal H128				: std_logic;
signal H64				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;
signal H8_n				: std_logic;
signal H4				: std_logic;
signal H4_n				: std_logic;
signal H2				: std_logic;
signal H1				: std_logic;

signal Hsync			: std_logic;
signal Vsync			: std_logic;

signal Vcount  		: std_logic_vector(7 downto 0) := (others => '0');
signal V128				: std_logic;
signal V64				: std_logic;
signal V32				: std_logic;
signal V16				: std_logic;
signal V8				: std_logic;
signal V4				: std_logic;
signal V2				: std_logic;
signal V1				: std_logic;

signal Vblank			: std_logic;
signal Vreset			: std_logic;
signal Vblank_s		: std_logic;
signal Vblank_n_s		: std_logic;
signal HBlank			: std_logic;

signal CompBlank_s	: std_logic;
signal CompSync_n_s	: std_logic;

signal WhitePF_n		: std_logic;
signal BlackPF_n		: std_logic;

signal Display			: std_logic_vector(7 downto 0);


-- Address decoder
signal addec_bus		: std_logic_vector(7 downto 0);
signal RnW				: std_logic;
signal Write_n			: std_logic;
signal ROM1				: std_logic;
signal ROM2				: std_logic;
signal ROM3				: std_logic;
signal WRAM				: std_logic;
signal RAM_n			: std_logic;
signal Sync_n			: std_logic;
signal Switch_n		: std_logic;
signal Collision1_n	: std_logic;
signal Collision2_n	: std_logic;
signal Display_n		: std_logic;
signal TimerReset_n	: std_logic;
signal CollRst1_n		: std_logic;
signal CollRst2_n		: std_logic;
signal SteerRst1_n	: std_logic;
signal SteerRst2_n	: std_logic;
signal NoiseRst_n		: std_logic;
signal Attract			: std_logic := '1';	
signal Skid1			: std_logic;
signal Skid2			: std_logic;
signal Lamp1			: std_logic;
signal Lamp2			: std_logic;

signal Crash_n			: std_logic;
signal Motor1_n 		: std_logic;
signal Motor2_n		: std_logic;
signal Car1				: std_logic;
signal Car1_n			: std_logic;
signal Car2				: std_logic;
signal Car2_n			: std_logic;
signal Car3_4_n		: std_logic;	

signal NMI_n			: std_logic;

signal Adr				: std_logic_vector(9 downto 0);

signal SW1				: std_logic_vector(7 downto 0);

signal Inputs			: std_logic_vector(1 downto 0);
signal Collisions1	: std_logic_vector(1 downto 0);
signal Collisions2	: std_logic_vector(1 downto 0);

signal dbl_scan : std_logic;

---Joystick
signal button_in        : std_logic_vector(15 downto 0);
signal buttons	         : std_logic_vector(15 downto 0);
signal button_debounced : std_logic_vector(15 downto 0);
signal joystick_reg     : std_logic_vector(5 downto 0);
signal joystick2_reg     : std_logic_vector(5 downto 0);

begin
-- Configuration DIP switches, these can be brought out to external switches if desired
-- See Sprint 2 manual page 11 for complete information. Active low (0 = On, 1 = Off)
--    1 								Oil slicks			(0 - Oil slicks enabled)
--			2							Cycle tracks      (1 - Cycle through all tracks in attract mode)
--   			3	4					Coins per play		(00 - 1 Coin per player) 
--						5				Extended Play		(0 - Extended Play enabled)
--							6			Not used				(X - Don't care)
--								7	8	Game time			(01 - 120 Seconds)
SW1 <= "01000101"; -- Config dip switches

-- PLL to generate 12.096 MHz clock
--PLL: entity work.clk_pll
--port map(
--		inclk0 => Clk_50_I,
--		c0 => clk_12
--		);
		
		
Vid_sync: entity work.synchronizer
port map(
		clk_12 => clk_12,
		clk_6 => clk_6,
		hcount => hcount,
		vcount => vcount,
		hsync => hsync,
		hblank => hblank,
		vblank_s => vblank_s,
		vblank_n_s => vblank_n_s,
		vblank => vblank,
		vsync => vsync,
		vreset => vreset
		);


Background: entity work.playfield
port map( 
		clk6 => clk_6,
		display => display,
		HCount => HCount,
		VCount => VCount,
		HBlank => HBlank,		
		H256_s => H256_s,
		VBlank => VBlank,
		VBlank_n_s => Vblank_n_s,
		HSync => Hsync,
		VSync => VSync,
		CompSync_n_s => CompSync_n_s,
		CompBlank_s => CompBlank_s,
		WhitePF_n => WhitePF_n,
		BlackPF_n => BlackPF_n 
		);

		
Cars: entity work.motion
port map(
		CLK6 => clk_6,
		CLK12 => clk_12,
		PHI2 => phi2,
		DISPLAY => Display,
		H256_s => H256_s,
		VCount => VCount,
		HCount => HCount,
		Crash_n => Crash_n,
		Motor1_n => Motor1_n,
		Motor2_n => Motor2_n,
		Car1 => Car1,
		Car1_n => Car1_n,
		Car2 => Car2,
		Car2_n => Car2_n,
		Car3_4_n => Car3_4_n	
		);
		
		
PF_Comparator: entity work.collision_detect
port map(	
		Clk6 => clk_6,
		Car1 => Car1,
		Car1_n => Car1_n,
		Car2 => Car2,
		Car2_n => Car2_n,
		Car3_4_n	=> Car3_4_n,
		WhitePF_n => WhitePF_n,
		BlackPF_n => BlackPF_n,
		CollRst1_n => CollRst1_n,
		CollRst2_n => CollRst2_n,
		Collisions1 => Collisions1,
		Collisions2 => Collisions2
		);
	
	
CPU: entity work.cpu_mem
port map(
		Clk12 => clk_12,
		Clk6 => clk_6,
		Reset_n => reset_n,
		VCount => VCount,
		HCount => HCount,
		Hsync_n => not Hsync,
		Vblank_s => Vblank_s,
		Vreset => Vreset,
		Test_n => not Test_I,
		Attract => Attract,
		Skid1 => Skid1,
		Skid2 => Skid2,
		NoiseReset_n => NoiseRst_n,
		CollRst1_n => CollRst1_n,
		CollRst2_n => CollRst2_n,
		SteerRst1_n => SteerRst1_n,
		SteerRst2_n => SteerRst2_n,
		Lamp1 => Lamp1_O,
		Lamp2 => Lamp2_O,
		Phi1_o => Phi1,
		Phi2_o => Phi2,
		Display => Display,
		IO_Adr => Adr,
		Collisions1 => Collisions1,
		Collisions2 => Collisions2,
		Inputs => Inputs
		);


Input: entity work.Control_Inputs
port map(
		clk6 => clk_6,
		SW1 => SW1, -- DIP switches
		Coin1_n => Coin1_I,
		Coin2_n => Coin2_I,
		Start1 => not Start1_I, -- Active high in real hardware, inverting these makes more sense with the FPGA
		Start2 => not Start2_I,
		Trak_Sel => not Trak_Sel_I,
		Gas1 => not Gas1_I,
		Gas2 => not Gas2_I,
		Gear1_1 => not Gear1_1_I,
		Gear1_2 => not Gear1_2_I,
		Gear2_1 => not Gear2_1_I,
		Gear2_2 => not Gear2_2_I,
		Gear3_1 => not Gear3_1_I,
		Gear3_2 => not Gear3_2_I,
		Self_Test => not Test_I,
		Steering1A_n => Steer_1A_I,
		Steering1B_n => Steer_1B_I,
		Steering2A_n => Steer_2A_I,
		Steering2B_n => Steer_2B_I,
		SteerRst1_n => SteerRst1_n,
		SteerRst2_n => SteerRst2_n,
		Adr => Adr,
		Inputs => Inputs
	);	

	
Sound: entity work.audio
port map( 
		Clk_50 => Clk_50_I,
		Clk_6 => Clk_6,
		Reset_n => Reset_n,
		Motor1_n => Motor1_n,
		Motor2_n => Motor2_n,
		Skid1 => Skid1,
		Skid2 => Skid2,
		Crash_n => Crash_n,
		NoiseReset_n => NoiseRst_n,
		Attract => Attract,
		Display => Display,
		HCount => HCount,
		VCount => VCount,
		Audio1 => Audio1_O,
		Audio2 => Audio2_O
		);

dblscan : entity work.line_doubler
 port map (
	  video_i(7 downto 3) => "00000",
	  video_i(2 downto 0) => Video_MUX,
	  hsync_i           => HSync,
	  vsync_i           => VSync,

	  video_o(7 downto 3)=> open,
	  video_o(2 downto 0)=> VideoRGB_X2,
	  hsync_o          => HSync_X2,
	  vsync_o          => VSync_X2,

	  clock_12mhz      => Clk_12,
	  scanlines        => scandblctrl(1) xor scanSW(8)	  
	);
	
dbl_scan <=  scandblctrl(0) xor scanSW(6); -- 1 = VGAS  0 = RGB	

-- Video mixing	
--VideoB_O <= (not(BlackPF_n and Car2_n and Car3_4_n)) nor CompBlank_s;	
--VideoW_O <= not(WhitePF_n and Car1_n and Car3_4_n);  
VideoB_O <= not(BlackPF_n and Car2_n);
VideoG_O <= not(BlackPF_n and Car3_4_n);
VideoW_O <= not(WhitePF_n and Car1_n);  
Sync_O <= CompSync_n_s;

Video_RGB <= "111" when VideoW_O = '1' else 
				 "000" when VideoB_O = '1' else 
				 "101" when VideoG_O = '1' else  "011";

Video_MUX <= Video_RGB when CompBlank_s <= '0' else "000"; 
Video_OUT <= VideoRGB_X2 when dbl_scan = '1' else Video_MUX;
Hsync_O <= HSync_X2 when dbl_scan = '1' else CompSync_n_s;--not (Hsync xor Vsync);
Vsync_O <= VSync_X2 when dbl_scan = '1' else '1';

--Asign Imputs
Coin1_I		<= button_debounced(8);
Coin2_I		<= '1';
Start1_I	<= button_debounced(6);
Start2_I	<= button_debounced(7);
Trak_Sel_I	<= button_debounced(15); ----in   Track select button  2p start
Gas1_I		<= button_debounced(4);
Gear1_1_I	<= button_debounced(5);
Gear2_1_I	<= button_debounced(0);
Gear3_1_I	<= button_debounced(1);
Gas2_I		<= button_debounced(13);
Gear1_2_I	<= button_debounced(14);
Gear2_2_I	<= button_debounced(10);
Gear3_2_I	<= button_debounced(9);
Test_I		<= not scanSW(10); -- F11
Steer_1A_I	<= button_debounced(2);--Steering wheel inputs, these are quadrature encoders
Steer_1B_I	<= button_debounced(3);		
Steer_2A_I	<= button_debounced(11);		
Steer_2B_I  <= button_debounced(12);		

-------
--INPUT
-------
  joystick_reg  <=  I_JOYSTICK_A;
  joystick2_reg <=  I_JOYSTICK_B;
  JOYSTICK_A_GND <= '0';
  JOYSTICK_B_GND <= '0';

  button_in(15) <= I_COIN(1) and not scanSW(20); --ic2
  button_in(8)  <= I_COIN(0) and not scanSW(13); --ic1
  button_in(7)  <= I_PLAYER(1) and not scanSW(12); --p2
  button_in(6)  <= I_PLAYER(0) and not scanSW(11); --p1
                                                     -- Player 1
  button_in(5) <= joystick_reg(5) and not scanSW(5); -- fire2 / x / lwin
  button_in(4) <= joystick_reg(4) and not scanSW(4); -- fire1 / enter / z / space
  button_in(3) <= joystick_reg(3) and not scanSW(3); -- right
  button_in(2) <= joystick_reg(2) and not scanSW(2); -- left
  button_in(1) <= joystick_reg(1) and not scanSW(1); -- down
  button_in(0) <= joystick_reg(0) and not scanSW(0); -- up
                                                        -- Player 2
  button_in(14) <= joystick2_reg(5) and not scanSW(19); -- fire2 / x / lwin
  button_in(13) <= joystick2_reg(4) and not scanSW(18); -- fire1 / enter / z / space
  button_in(12) <= joystick2_reg(3) and not scanSW(17); -- right
  button_in(11) <= joystick2_reg(2) and not scanSW(16); -- left
  button_in(10) <= joystick2_reg(1) and not scanSW(15); -- down
  button_in(9)  <= joystick2_reg(0) and not scanSW(14); -- up
  
  --Swap directions for horizontal screen help
  buttons(0) <= button_in(0) when scanSW(9) = '0' else button_in(2);
  buttons(1) <= button_in(1) when scanSW(9) = '0' else button_in(3);
  buttons(2) <= button_in(2) when scanSW(9) = '0' else button_in(1);
  buttons(3) <= button_in(3) when scanSW(9) = '0' else button_in(0);
  buttons(8 downto 4) <= button_in(8 downto 4);
  buttons(9)  <= button_in(9)  when scanSW(9) = '0' else button_in(11);
  buttons(10) <= button_in(10) when scanSW(9) = '0' else button_in(12);
  buttons(11) <= button_in(11) when scanSW(9) = '0' else button_in(10);
  buttons(12) <= button_in(12) when scanSW(9) = '0' else button_in(9);
  buttons(15 downto 13) <= button_in(15 downto 13);

  debounce : entity work.DEBOUNCE
  generic map (
    G_WIDTH => 16
    )
  port map (
    I_BUTTON => buttons,
    O_BUTTON => button_debounced,
    CLK      => clk_12
    );

end rtl;