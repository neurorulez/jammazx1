-- Top level file for FPGA implementation of Super Breakout arcade game by Atari
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
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;

entity super_breakout is 
port(		
		Clk_50_I		: in	std_logic;	-- 50MHz input clock
		clk_12		: in	std_logic;
		Reset_n		: in	std_logic;	-- Reset (Active low)
		JOYSTICK_A_GND	: out	STD_LOGIC; -- needed for arcade megawing
		JOYSTICK_B_GND	: out	STD_LOGIC;  -- needed for arcade megawing
		I_JOYSTICK_A           : in    std_logic_vector(5 downto 0);
		I_JOYSTICK_B           : in    std_logic_vector(5 downto 0);
		I_COIN	       	   	 : in    std_logic_vector(1 downto 0);
		I_PLAYER	       		 : in    std_logic_vector(1 downto 0);
		scanSW			   	    : in    std_logic_vector(20 downto 0);
		scandblctrl            : in    std_logic_vector(1 downto 0);
		tv15Khz_mode : in std_logic;
		Audio_O		: out std_logic;	-- PWM audio, low pass filter is desirable but not really necessary for the simple SFX in this game
		Hsync_O		: out std_logic;
		Vsync_O		: out std_logic;
		Video_O		: out std_logic;
		Video_OUT	: out std_logic_vector(5 downto 0);	-- Video output, sum this through a 470R resistor to composite video
		CompSync_O	: out std_logic);  -- Composite sync, sum this through a 1k resistor to composite video

end super_breakout;

architecture rtl of super_breakout is

signal 			Video       : std_logic;
signal         Video_MUX   : std_logic_vector(5 downto 0);
signal         Video_RGB   : std_logic_vector(5 downto 0);
signal 			VideoRGB_X2 : std_logic_vector(5 downto 0);
signal 			HSync_X2    : std_logic;
signal 			VSync_X2    : std_logic;
signal			Test_I		: std_logic := '1'; 	-- Self test switch
signal			Slam_I		: std_logic := '1';	-- Slam switch
signal			Pot_Comp1_I	: std_logic;	-- If you want to use a pot instead, this goes to the output of the comparator
signal			VBlank_O		: std_logic;  -- VBlank signal to reset the ramp genrator used by the pot reading circuitry
signal			Lamp1_O		: std_logic;	-- Player start button lamps (Active high to control incandescent lamps via SCR or transistors)
signal			Lamp2_O		: std_logic;
signal			Serve_LED_O	: std_logic;	-- Serve button LED (Active low)
signal			Counter_O	: std_logic;	-- Coin counter output (Active high)

signal			Coin1_I		: std_logic;	-- Coin switches 
signal			Coin2_I		: std_logic;
signal			Start1_I		: std_logic;	-- Player start buttons
signal			Start2_I		: std_logic;
signal			Serve_I		: std_logic;
signal			Select1_I	: std_logic;  -- Select inputs from game type select knob
signal			Select2_I	: std_logic;
signal			Enc_A			: std_logic;	-- Rotary encoder, used in place of a pot to control the paddle
signal			Enc_B			: std_logic;

--signal clk_12			: std_logic;
signal clk_6			: std_logic;
signal phi2				: std_logic;

signal reset_h			: std_logic;

signal NMI_n			: std_logic;
signal Timer_Reset_n	: std_logic;
signal IntAck_n		: std_logic;
signal IO_wr			: std_logic;
signal Adr				: std_logic_vector(9 downto 0);
signal Inputs			: std_logic_vector(1 downto 0);

-- Video timing signals
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

signal Vcount  		: std_logic_vector(7 downto 0) := (others => '0');
signal V128				: std_logic;
signal V64				: std_logic;
signal V32				: std_logic;
signal V16				: std_logic;
signal V8				: std_logic;
signal V4				: std_logic;
signal V2				: std_logic;
signal V1				: std_logic;

signal Hsync			: std_logic;
signal Vsync			: std_logic;
signal Vblank			: std_logic;
signal Vreset			: std_logic;
signal Vblank_s		: std_logic;
signal Vblank_n_s		: std_logic;
signal HBlank			: std_logic;
signal CompBlank_s	: std_logic;
signal CompSync_n_s	: std_logic;
signal blank		   : std_logic;

---Joystick
signal button_in        : std_logic_vector(15 downto 0);
signal buttons	         : std_logic_vector(15 downto 0);
signal button_debounced : std_logic_vector(15 downto 0);
signal joystick_reg     : std_logic_vector(5 downto 0);
signal joystick2_reg     : std_logic_vector(5 downto 0);

-- Video output signals
signal Playfield_n	: std_logic;
signal Ball1_n			: std_logic := '1';
signal Ball2_n			: std_logic := '1';
signal Ball3_n			: std_logic := '1';

signal Display			: std_logic_vector(7 downto 0);

signal Tones_n			: std_logic;

signal SW2				: std_logic_vector(7 downto 0) := (others => '0');
signal Mask1_n			: std_logic;
signal Mask2_n			: std_logic;
signal Sense1			: std_logic;
signal Sense2			: std_logic;

signal dbl_scan : std_logic;
signal Overlay_R1      : boolean;
signal Overlay_G1      : boolean;
signal Overlay_B1      : boolean;
signal Overlay_A1      : boolean;
signal Overlay_C1      : boolean;
signal Overlay_M1      : boolean;

signal Enc_pos		   : std_logic_vector(1 downto 0) := "00";
signal Enc_data		: std_logic_vector(1 downto 0) := "00";
signal enc_delay     : std_logic_vector(11 downto 0);
signal clk_enc  		: std_logic;

begin
-- Configuration DIP switches, these can be brought out to external switches if desired
-- See Super Breakout manual page 13 for complete information. Active low (0 = On, 1 = Off)
--    1 	2							Language				(00 - English)
--   			3	4					Coins per play		(10 - 1 Coin, 1 Play) 
--						5				3/5 Balls			(1 - 3 Balls)
--							6	7	8	Bonus play			(011 - 600 Progressive, 400 Cavity, 600 Double)
		
SW2 <= "00101011";
  
p_overlay : process(video)
 begin
	  --Generar Overlay de Colores
	  Overlay_R1 <= false;
	  Overlay_G1 <= false;
	  Overlay_B1 <= false;
	  Overlay_A1 <= false;
	  Overlay_C1 <= false;
	  Overlay_M1 <= false;

		if (HCount >= x"080" and HCount < x"090" ) then --Linea Superior de la pantalla azul
		  Overlay_B1 <= true; 
		end if;

		if (HCount >= x"1E0" and HCount < x"200" ) then --Trozo hasta la linea superior azul
		  Overlay_B1 <= true; 
		end if;

		if (HCount >= x"1C0" and HCount < x"1E0" ) then --Trozo bloque naranja
		  Overlay_G1 <= true; 
		end if;

		if (HCount >= x"1A0" and HCount < x"1C0" ) then --Trozo bloque verde
		  Overlay_R1 <= true; 
		end if;

		if (HCount >= x"121" and HCount < x"1A0" ) then --Trozo bloque amarillo
		  Overlay_A1 <= true; 
		end if;

		if (HCount >= x"118" and HCount < x"121" ) then --Trozo paleta azul
		  Overlay_B1 <= true; 
		end if;
 
   if (Video = '0') then
	  Video_RGB  <= "000000";
	else
	  if    Overlay_R1 then
		Video_RGB <= "110100"; --Naranja
	  elsif Overlay_G1 then
		Video_RGB  <= "011101"; --Verde Clarito
	  elsif Overlay_B1 then
		Video_RGB  <= "010111"; --Azul Calrito
  	  elsif Overlay_A1 then
		Video_RGB  <= "111101"; --Amarillo Clarito
  	  elsif Overlay_C1 then
		Video_RGB  <= "001111"; --No se usa
  	  elsif Overlay_M1 then
		Video_RGB  <= "110011"; --No se usa
	  else
		Video_RGB  <= "111111"; --Blanco
	  end if;
	end if;
end process;

dblscan : entity work.line_doubler
 port map (
	  video_i(7 downto 6) => "00",
	  video_i(5 downto 0) => Video_MUX, --VideoRGB,
	  hsync_i           => HSync,
	  vsync_i           => VSync,

	  video_o(7 downto 6)=> open,
	  video_o(5 downto 0)=> VideoRGB_X2,
	  hsync_o          => HSync_X2,
	  vsync_o          => VSync_X2,

	  clock_12mhz      => Clk_12,
	  scanlines        => scandblctrl(1) xor scanSW(8)	  
	);
	
dbl_scan <=  scandblctrl(0) xor scanSW(6); -- 1 = VGAS  0 = RGB	

-- Video mixer
blank <= not (hblank or vblank);
Video <= not(Playfield_n and Ball1_n and Ball2_n and Ball3_n);
Video_O <= Video;
CompSync_O <= CompSync_n_s;
Video_MUX <= Video_RGB when blank <= '1' else "000000"; 
Video_OUT <= VideoRGB_X2 when dbl_scan = '1' else Video_MUX;
Hsync_O <= HSync_X2 when dbl_scan = '1' else CompSync_n_s;--not (Hsync xor Vsync);
Vsync_O <= VSync_X2 when dbl_scan = '1' else '1';

Reset_h <= (not Reset_n); -- Some components need an active-high reset
Vblank_O <= Vblank; -- Resets ramp in analog paddle circuit (if used)

--Asign Imputs
Coin1_I		<= button_debounced(8);
Coin2_I		<= button_debounced(15);
Start1_I		<= button_debounced(6);
Start2_I		<= button_debounced(7);
Serve_I		<= button_debounced(4);
Select1_I	<= button_debounced(0);
Select2_I	<= button_debounced(1);
--Enc_A	<= button_debounced(2);		
--Enc_B	<= button_debounced(3);		
Enc_A <= Enc_data(0);
Enc_B <= Enc_data(1);

p_clk_enc : process(clk_6)
begin
 if rising_edge(clk_6) then
  enc_delay <= enc_delay + 1;
  clk_enc <= enc_delay(11);
 end if;
end process;

p_encoder : process(clk_enc)
 begin
if rising_edge(clk_enc) then

  if    (button_debounced(3) = '0') then 
   Enc_pos <= Enc_pos + 1;
  elsif (button_debounced(2) = '0') then 
   Enc_pos <= Enc_pos - 1; 
  end if;

 case  Enc_pos is
  when "00" => Enc_data <= "00";
  when "01" => Enc_data <= "01";
  when "10" => Enc_data <= "11";
  when "11" => Enc_data <= "10";
  when others => Enc_data <= "00";
 end case;

end if;
end process;

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


-- PLL to generate 12.096 MHz master clock
--PLL: entity work.clk_pll
--port map(
--		inclk0 => Clk_50_I,
--		c0 => clk_12,
--		areset => reset_h
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

PF: entity work.playfield
port map(
		Clk6 => clk_6,
		Display => Display,
		HCount => HCount,
		VCount => VCount,
		H256_s => H256_s,
		HBlank => HBlank,
		VBlank => VBlank,
		VBlank_n_s => VBlank_n_s,
		HSync => HSync,
		VSync => VSync,
		CompSync_n_s => CompSync_n_s,
		CompBlank_s => CompBlank_s,
		Playfield_n => Playfield_n
		);
	
Ball_motion: entity work.motion
port map(
		Clk6 => clk_6,
		PHI2 => phi2,
		Display => Display,
		H256_s => H256_s,
		VCount => VCount,
		HCount => HCount,
		Tones_n => Tones_n,
		Ball1_n => Ball1_n,
		Ball2_n => Ball2_n,
		Ball3_n => Ball3_n	
		);

Sounds: entity work.audio
port map(
		Clk_50 => Clk_50_i,
		Reset_n => Reset_n,
		Tones_n => Tones_n,
		Display => Display(3 downto 0),
		VCount => VCount,
		Audio_PWM => Audio_O
		);
	
Knob: entity work.paddle
port map(
		Clk6 => Clk_6,
		Enc_A => Enc_A,
		Enc_B => Enc_B,
		Mask1_n => Mask1_n,
		Mask2_n => Mask2_n,
		Vblank => Vblank,
		Sense1 => Sense1,
		Sense2 => Sense2,
		NMI_n => NMI_n
		);
	
CPU: entity work.cpu_mem
port map(
		Clk12 => Clk_12,
		Clk6 => Clk_6,
		Reset_n => Reset_n,
		NMI_n => NMI_n,
		VCount => VCount,
		HCount => HCount,
		Hsync_n => not Hsync,
		Timer_Reset_n => Timer_Reset_n,
		IntAck_n => IntAck_n,
		IO_wr => IO_wr,
		Phi2_o => Phi2,
		Display => Display,
		IO_Adr => Adr,
		Inputs => Inputs
		);
	
Input_Output: entity work.IO
port map(
		clk6 => clk_6,
		SW2 => SW2, -- DIP switches
		Coin1_n => Coin1_I,
		Coin2_n => Coin2_I,
		Start1_n => Start1_I,
		Start2_n => Start2_I,
		Select1_n => Select1_I,
		Select2_n => Select2_I,
		Serve_n => Serve_I,
		Test_n => Test_I,
		Slam_n => Slam_I,
		Sense1 => Sense1,
		Sense2 => Sense2,
		Mask1_n => Mask1_n,
		Mask2_n => Mask2_n,
		Timer_Reset_n => Timer_Reset_n,
		IntAck_n => IntAck_n,
		IO_wr => IO_wr,
		Lamp1 => Lamp1_O,
		Lamp2 => Lamp2_O,
		Serv_LED_n => Serve_LED_O, 
		Counter => Counter_O,
		Adr => Adr,
		Inputs => Inputs
	);	
	
end rtl;