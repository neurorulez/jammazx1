-- Top level file for Kee Games Ultra Tank
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
-- See Ultra Tank manual for video output details. Resistor values listed here have been scaled 
-- for 3.3V logic. 


library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity ultra_tank is 
port(		
			Clk_50_I		: in	std_logic;	-- 50MHz input clock
			clk_12		: in	std_logic;
			Reset_n		: in	std_logic;	-- Reset button (Active low)
			Audio1_O		: out std_logic;  -- Ideally these should have a simple low pass filter
			Audio2_O		: out std_logic;
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
end ultra_tank;

architecture rtl of ultra_tank is

signal 		Video       : std_logic;
signal		blank			: std_logic;
signal      Video_MUX   : std_logic_vector(2 downto 0);
signal      Video_RGB   : std_logic_vector(2 downto 0);
signal 		VideoRGB_X2 : std_logic_vector(2 downto 0);
signal 		HSync_X2    : std_logic;
signal 		VSync_X2    : std_logic;

signal		Video1_O	: std_logic;  --out  White video output (680 Ohm)
signal		Video2_O	: std_logic;  --out  Black video output (1.2k)
signal		Sync_O		: std_logic;  --out  Composite sync output (1.2k)
signal		Blank_O		: std_logic;  --out  Composite blank output
signal		CC3_n_O		: std_logic;  --out  Not sure what these are, color monitor? (not connected in real game)
signal		CC2_O		: std_logic;  --out
signal		CC1_O		: std_logic;  --out
signal		CC0_O		: std_logic;  --out
signal		White_O		: std_logic;  --out
signal		LED1_O		: std_logic;  --out  Player 1 and 2 start button LEDs
signal		LED2_O		: std_logic;  --out
signal		Lockout_O	: std_logic;   --out  Coin mech lockout coil

signal		Coin1_I		: std_logic;  --in Coin switches (Active low)
signal		Coin2_I		: std_logic;  --in
signal		Start1_I	: std_logic;  --in Start buttons
signal		Start2_I	: std_logic;  --in
signal		Invisible_I	: std_logic;  --in Invisible tanks switch
signal		Rebound_I	: std_logic;  --in Rebounding shells switch
signal		Barrier_I	: std_logic;  --in Barriers switch
signal		JoyW_Fw_I	: std_logic;  --in Joysticks, these are all active low
signal		JoyW_Bk_I	: std_logic;  --in
signal		JoyY_Fw_I	: std_logic;  --in
signal		JoyY_Bk_I	: std_logic;  --in
signal		JoyX_Fw_I	: std_logic;  --in
signal		JoyX_Bk_I	: std_logic;  --in
signal		JoyZ_Fw_I	: std_logic;  --in
signal		JoyZ_Bk_I	: std_logic;  --in
signal		FireA_I		: std_logic;  --in Fire buttons
signal		FireB_I		: std_logic;  --in
signal		Test_I		: std_logic;  --in Self-test switch
signal		Slam_I		: std_logic;  --in Slam switch

--signal Clk_12				: std_logic;
signal Clk_6				: std_logic;
signal Phi1 				: std_logic;
signal Phi2					: std_logic;

signal Hcount		   	: std_logic_vector(8 downto 0);
signal Vcount  			: std_logic_vector(7 downto 0) := (others => '0');
signal H256_s				: std_logic;
signal Hsync				: std_logic;
signal Vsync				: std_logic;
signal Vblank				: std_logic;
signal Vblank_n_s			: std_logic;
signal HBlank				: std_logic;
signal CompBlank_s		: std_logic;
signal CompSync_n_s		: std_logic;

signal DMA					: std_logic_vector(7 downto 0);
signal DMA_n				: std_logic_vector(7 downto 0);
signal PRAM					: std_logic_vector(7 downto 0);
signal Load_n				: std_logic_vector(8 downto 1);
signal Object				: std_logic_vector(4 downto 1);
signal Object_n			: std_logic_vector(4 downto 1);
signal Playfield_n		: std_logic;

signal CPU_Din				: std_logic_vector(7 downto 0);
signal CPU_Dout			: std_logic_vector(7 downto 0);
signal DBus_n				: std_logic_vector(7 downto 0);
signal BA					: std_logic_vector(15 downto 0);

signal Barrier_Read_n	: std_logic;
signal Throttle_Read_n	: std_logic;
signal Coin_Read_n		: std_logic;
signal Collision_Read_n	: std_logic;
signal Collision_n		: std_logic;
signal CollisionReset_n	: std_logic_vector(4 downto 1);
signal Options_Read_n	: std_logic;
signal Wr_DA_Latch_n 	: std_logic;
signal Wr_Explosion_n	: std_logic;
signal Fire1				: std_logic;
signal Fire2				: std_logic;
signal Attract				: std_logic;
signal Attract_n			: std_logic;	

signal SW1					: std_logic_vector(7 downto 0);

signal dbl_scan : std_logic;

---Joystick
signal button_in        : std_logic_vector(15 downto 0);
signal buttons	         : std_logic_vector(15 downto 0);
signal button_debounced : std_logic_vector(15 downto 0);
signal joystick_reg     : std_logic_vector(5 downto 0);
signal joystick2_reg     : std_logic_vector(5 downto 0);
signal JoyA,JoyB : std_logic_vector(3 downto 0);


begin
-- Configuration DIP switches, these can be brought out to external switches if desired
-- See Ultra Tank manual page 6 for complete information. Active low (0 = On, 1 = Off)
--    1 	2							Extended Play		(11 - 75pts, 01 - 50pts, 10 - 25pts, 00 - None)
--   			3	4					Game Length			(11 - 60sec, 10 - 90sec, 01 - 120sec, 00 - 150sec) 
--						5	6			Game Cost   		(10 - 1 Coin, 1 Play, 01 - 2 Plays, 1 Coin, 11 - 2 Coins, 1 Play)
--								7	8	Unused?
SW1 <= "10010100"; -- Config dip switches



-- PLL to generate 12.096 MHz clock
--PLL: entity work.clk_pll
--port map(
--		inclk0 => Clk_50_I,
--		c0 => clk_12
--		);
		
		
Vid_sync: entity work.synchronizer
port map(
		Clk_12 => Clk_12,
		Clk_6 => Clk_6,
		HCount => HCount,
		VCount => VCount,
		HSync => HSync,
		HBlank => HBlank,
		VBlank_n_s => VBlank_n_s,
		VBlank => VBlank,
		VSync => VSync
		);


Background: entity work.playfield
port map( 
		Clk6 => Clk_6,
		DMA => DMA,
		PRAM => PRAM,
		Load_n => Load_n,
		Object => Object,
		HCount => HCount,
		VCount => VCount,
		HBlank => HBlank,
		VBlank => VBlank,
		VBlank_n_s => VBlank_n_s,
		HSync => Hsync,
		VSync => VSync,
		H256_s => H256_s,
		Playfield_n => Playfield_n,
		CC3_n => CC3_n_O,
		CC2 => CC2_O,
		CC1 => CC1_O,
		CC0 => CC0_O,
		White => White_O,
		PF_Vid1 => Video1_O,
		PF_Vid2 => Video2_O
		);
			
		
Tank_Shells: entity work.motion
port map(
		CLK6 => Clk_6,
		PHI2 => Phi2,
		DMA_n => DMA_n,
      PRAM => PRAM,
		H256_s => H256_s,
		VCount => VCount,
		HCount => HCount,
		Load_n => Load_n,
		Object => Object,
		Object_n => Object_n
		);
		
		
Tank_Shell_Comparator: entity work.collision_detect
port map(	
		Clk6 => Clk_6,
		Adr => BA(2 downto 0),
		Object_n	=> Object_n,
		Playfield_n => Playfield_n,
		CollisionReset_n => CollisionReset_n,
		Slam_n => Slam_I,
		Collision_n	=> Collision_n
		);
	
	
CPU: entity work.cpu_mem
port map(
		Clk12 => clk_12,
		Clk6 => clk_6,
		Reset_n => reset_n,
		VCount => VCount,
		HCount => HCount,
		Vblank_n_s => Vblank_n_s,
		Test_n => Test_I,
		Collision_n => Collision_n,
		DB_in => CPU_Din,
		DBus => CPU_Dout,
		DBus_n => DBus_n,
		PRAM => PRAM,
		ABus => BA,
		Attract => Attract,
		Attract_n => Attract_n,
		CollReset_n => CollisionReset_n,
		Barrier_Read_n => Barrier_Read_n,
		Throttle_Read_n => Throttle_Read_n,
		Coin_Read_n => Coin_Read_n,
		Options_Read_n => Options_Read_n,
		Wr_DA_Latch_n => Wr_DA_Latch_n,
		Wr_Explosion_n => Wr_Explosion_n,
		Fire1 => Fire1,
		Fire2 => Fire2,
		LED1 => LED1_O,
		LED2 => LED2_O,
		Lockout_n => Lockout_O,
		Phi1_o => Phi1,
		Phi2_o => Phi2,
		DMA => DMA,
		DMA_n => DMA_n
		);
		
		
Input: entity work.Control_Inputs
port map(
		Clk6 => Clk_6,
		DipSw => SW1, -- DIP switches
		Coin1_n => Coin1_I,
		Coin2_n => Coin2_I,
		Start1_n => Start1_I,
		Start2_n => Start2_I,
		Invisible_n => Invisible_I,
		Rebound_n => Rebound_I,
		Barrier_n => Barrier_I,
		JoyW_Fw => not JoyW_Fw_I,
		JoyW_Bk => not JoyW_Bk_I,
		JoyY_Fw => not JoyY_Fw_I,
		JoyY_Bk => not JoyY_Bk_I,
		JoyX_Fw => not JoyX_Fw_I,
		JoyX_Bk => not JoyX_Bk_I,
		JoyZ_Fw => not JoyZ_Fw_I,
		JoyZ_Bk => not JoyZ_Bk_I,
		FireA_n => FireA_I,
		FireB_n => FireB_I,
	   Throttle_Read_n => Throttle_Read_n,
		Coin_Read_n => Coin_Read_n,
		Options_Read_n => Options_Read_n,
		Barrier_Read_n => Barrier_Read_n,
		Wr_DA_Latch_n => Wr_DA_Latch_n,
		Adr => BA(2 downto 0),
		DBus => CPU_Dout(3 downto 0),
		Dout => CPU_Din
	);	

	
Sound: entity work.audio
port map( 
		Clk_50 => Clk_50_I,
		Clk_6 => Clk_6,
		Reset_n => Reset_n,
		Load_n => Load_n,
		Fire1 => Fire1,
		Fire2 => Fire2,
		Write_Explosion_n => Wr_Explosion_n,
		Attract => Attract,
		Attract_n => Attract_n,
		PRAM => PRAM,
		DBus_n => not CPU_Dout,
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
		
Sync_O <= HSync nor VSync;
Blank_O <= HBlank nor VBlank;
--Video_RGB <= "111" when Video1_O = '1' and Video2_O = '1' else --Blanco
--				 "000" when Video1_O = '0' and Video2_O = '0' else --Negro
--				 "101" when Video1_O = '1' and Video2_O = '0' else  "011"; --Gris

Video_RGB <= CC2_O & CC1_O & CC0_O;
--Video_RGB <= CC2_O & CC0_O & CC1_O;

Video_MUX <= Video_RGB when Blank_O <= '1' else "000"; 
Video_OUT <= VideoRGB_X2 when dbl_scan = '1' else Video_MUX;
Hsync_O <= HSync_X2 when dbl_scan = '1' else Sync_O;--not (Hsync xor Vsync);
Vsync_O <= VSync_X2 when dbl_scan = '1' else '1';

--Asign Imputs
Coin1_I		<= button_debounced(8); --in Coin switches (Active low)
Coin2_I		<= button_debounced(15);
Start1_I	   <= button_debounced(6); --in Start buttons
Start2_I	   <= button_debounced(7);

Invisible_I	<= not scanSW(10);      --in Invisible tanks switch (F11)
Rebound_I	<= not scanSW(9);       --in Rebounding shells switch (TAB)
Barrier_I	<= not scanSW(7);       --in Barriers switch (*)

--JoyW_Fw_I	<= button_debounced(0);  --in Joysticks, these are all active low (Control con 2 Palancas de un eje)
--JoyW_Bk_I	<= button_debounced(1);  --in
--JoyX_Fw_I	<= button_debounced(2);  --in
--JoyX_Bk_I	<= button_debounced(3);  --in
--FireA_I	<= button_debounced(4);  --in Fire button p1
--JoyY_Fw_I	<= button_debounced(9);  --in Joys p2 (Control con 2 Palancas de un eje)
--JoyY_Bk_I	<= button_debounced(10); --in
--JoyZ_Fw_I	<= button_debounced(11); --in
--JoyZ_Bk_I	<= button_debounced(12); --in
--FireB_I	<= button_debounced(13); --in Fire button p2

--Simulador para control con una palanca de dos ejes
--Convert from Two Levels to a Joystick
--	       Up_Left   |  Up    |    Up_Right    |  Right  |  Down_Right   | Down  |  Down_Left | Left
--JoyY_Fw	           |   x    |       x        |    x    |               |       |            |
--JoyY_Bk	           |        |                |         |      x        |   x   |            |  x
--JoyZ_Fw      x      |   x    |                |         |               |       |            |  x
--JoyZ_Bk             |        |                |    x    |               |   x   |      x     |

JoyA <= not button_debounced(0) & not button_debounced(1)  & not button_debounced(2)  & not button_debounced(3);
JoyB <= not button_debounced(9) & not button_debounced(10) & not button_debounced(11) & not button_debounced(12);
FireA_I		<= button_debounced(4);  --in Fire button p1
FireB_I		<= button_debounced(13); --in Fire button p2
Test_I		<= '1';  -- in Self-test switch
Slam_I		<= '1';  --in Slam switch

joy_decoder: process(clk_12)
begin
	if rising_edge(Clk_12) then
		case (JoyA) is
			when "1010" => JoyW_Fw_I<='0'; JoyW_Bk_I<='0'; JoyX_Fw_I<='1'; JoyX_Bk_I<='0'; --Up_Left
			when "1000" => JoyW_Fw_I<='1'; JoyW_Bk_I<='0'; JoyX_Fw_I<='1'; JoyX_Bk_I<='0'; --Up
			when "1001" => JoyW_Fw_I<='1'; JoyW_Bk_I<='0'; JoyX_Fw_I<='0'; JoyX_Bk_I<='0'; --Up_Right
			when "0001" => JoyW_Fw_I<='1'; JoyW_Bk_I<='0'; JoyX_Fw_I<='0'; JoyX_Bk_I<='1'; --Right
			when "0101" => JoyW_Fw_I<='0'; JoyW_Bk_I<='1'; JoyX_Fw_I<='0'; JoyX_Bk_I<='0'; --Down_Right
			when "0100" => JoyW_Fw_I<='0'; JoyW_Bk_I<='1'; JoyX_Fw_I<='0'; JoyX_Bk_I<='1'; --Down
			when "0110" => JoyW_Fw_I<='0'; JoyW_Bk_I<='0'; JoyX_Fw_I<='0'; JoyX_Bk_I<='1'; --Down_Left
			when "0010" => JoyW_Fw_I<='0'; JoyW_Bk_I<='1'; JoyX_Fw_I<='1'; JoyX_Bk_I<='0'; --Left
			when others => JoyW_Fw_I<='0'; JoyW_Bk_I<='0'; JoyX_Fw_I<='0'; JoyX_Bk_I<='0'; --Stop															
		end case;
		case (JoyB) is
			when "1010" => JoyY_Fw_I<='0'; JoyY_Bk_I<='0'; JoyZ_Fw_I<='1'; JoyZ_Bk_I<='0'; --Arriba_Izda
			when "1000" => JoyY_Fw_I<='1'; JoyY_Bk_I<='0'; JoyZ_Fw_I<='1'; JoyZ_Bk_I<='0'; --Arriba
			when "1001" => JoyY_Fw_I<='1'; JoyY_Bk_I<='0'; JoyZ_Fw_I<='0'; JoyZ_Bk_I<='0'; --Arriba_Derecha
			when "0001" => JoyY_Fw_I<='1'; JoyY_Bk_I<='0'; JoyZ_Fw_I<='0'; JoyZ_Bk_I<='1'; --Derecha
			when "0101" => JoyY_Fw_I<='0'; JoyY_Bk_I<='1'; JoyZ_Fw_I<='0'; JoyZ_Bk_I<='0'; --Abajo_Derecha
			when "0100" => JoyY_Fw_I<='0'; JoyY_Bk_I<='1'; JoyZ_Fw_I<='0'; JoyZ_Bk_I<='1'; --Abajo
			when "0110" => JoyY_Fw_I<='0'; JoyY_Bk_I<='0'; JoyZ_Fw_I<='0'; JoyZ_Bk_I<='1'; --Abajo_Izquierda
			when "0010" => JoyY_Fw_I<='0'; JoyY_Bk_I<='1'; JoyZ_Fw_I<='1'; JoyZ_Bk_I<='0'; --Izquierda
			when others => JoyY_Fw_I<='0'; JoyY_Bk_I<='0'; JoyZ_Fw_I<='0'; JoyZ_Bk_I<='0'; --Quieto																							
		end case;		
	end if;
end process;

--JoyW_Fw_I	<= '0' when button_debounced(0) = '0' else '0' when button_debounced(3) = '0' else '1';  --in Joysticks, these are all active low
--JoyW_Bk_I	<= '0' when button_debounced(1) = '0' else '0' when button_debounced(2) = '0' else '1';  --in
--JoyX_Fw_I	<= '0' when button_debounced(0) = '0' else '0' when button_debounced(2) = '0' else '1';  --in
--JoyX_Bk_I	<= '0' when button_debounced(1) = '0' else '0' when button_debounced(3) = '0' else '1';  --in

--JoyY_Fw_I	<= '0' when button_debounced(9)  = '0' else '0' when button_debounced(12) = '0' else '1';  --in Joysticks, these are all active low
--JoyY_Bk_I	<= '0' when button_debounced(10) = '0' else '0' when button_debounced(11) = '0' else '1';  --in
--JoyZ_Fw_I	<= '0' when button_debounced(9)  = '0' else '0' when button_debounced(11) = '0' else '1';  --in
--JoyZ_Bk_I	<= '0' when button_debounced(10) = '0' else '0' when button_debounced(12) = '0' else '1';  --in

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
  buttons(0) <= button_in(0);-- when scanSW(9) = '0' else button_in(2);
  buttons(1) <= button_in(1);-- when scanSW(9) = '0' else button_in(3);
  buttons(2) <= button_in(2);-- when scanSW(9) = '0' else button_in(1);
  buttons(3) <= button_in(3);-- when scanSW(9) = '0' else button_in(0);
  buttons(8 downto 4) <= button_in(8 downto 4);
  buttons(9)  <= button_in(9);--  when scanSW(9) = '0' else button_in(11);
  buttons(10) <= button_in(10);-- when scanSW(9) = '0' else button_in(12);
  buttons(11) <= button_in(11);-- when scanSW(9) = '0' else button_in(10);
  buttons(12) <= button_in(12);-- when scanSW(9) = '0' else button_in(9);
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