-----------------------------------------------------------------------------	
-- COMPUTER SPACE TOP LEVEL - embedded audio memory version          		--
-- Implementation of Computer Space FPGA emulator.									--
-- 																								--
-- Developed primarily to understand the inner workings of						--
-- the Computer Space game logic.														--
--																									--
-- The emulator can also serve the purpose of game									--
-- preservation as the schematics have been copied "wire by wire"				--
-- and "component by component"/"gate by gate" and hence represents			--
-- a very close realization of the original, except for sound 		 			--	
-- generation which in this solution is based on audio samples.				--
--																									--
-- Some errors in the original schematics have been 								--
-- discovered during the transfer of schematics into vhdl.	They are 		--	
-- accounted for and corrected in the vhdl code.									--
-- 																								--	
-- The Computer Space Logic part replicates the three Computer Space			--
-- Boards and represents the complete game. It is implementation agnostic,	--
-- but requires the ability to support global clock signals,					--
-- input signals from control panel buttons and										--
-- coin mechanism, output signal to trigger audio and output signal for		--
-- composite ntsc video and audio.														--
-- 																								--
--																									-- 
-- Credit goes to:																			--
-- 	*	Overall fpga development community; there is a lot of stuff			--
--			readily available as inspiration and working code - in 				--
--			particular regarding the implementation specifics						--
--		* 	Mike Salay (KLOV: road.runner) - who has provided a large number	--
--		  	of measurement points from real Computer Space boards to determine--	
--			timer values, resolve logic behind the distribution of stars on	--
--			screen and verify the original video sync logic.						-- 
--		*	Computerspacefan.com - who has provided sound samples and			--
--			original schematics																--
--		* 	Chris (http://www.pyroelectro.com/) whose code for interlaced		--
--			ntsc signalling I have kindly used as a basis for creating an		--
--			interlaced ntsc video signal version 										--
--																									--
-- v1.0																							--
-- by Mattias G, 2015																		--
-- Enjoy!																						-- 
-----------------------------------------------------------------------------

library 	ieee;
use 		ieee.std_logic_1164.all; 
--use 		ieee.std_logic_arith.all;
use 		ieee.std_logic_unsigned.all;
use      ieee.numeric_std.all;
library	work;

--80---------------------------------------------------------------------------|

entity computer_space_top is 
	port
	(
    O_VIDEO_R             : out   std_logic_vector(2 downto 0);
    O_VIDEO_G             : out   std_logic_vector(2 downto 0);
    O_VIDEO_B             : out   std_logic_vector(2 downto 0);
    O_HSYNC               : out   std_logic;
    O_VSYNC               : out   std_logic;
	 --
	 O_AUDIO					  : out   std_logic_vector(16 downto 0);
    --O_AUDIO_L             : out   std_logic;
    --O_AUDIO_R             : out   std_logic;
    --
	 I_JOYSTICK_A        : in    std_logic_vector(5 downto 0);
	 I_JOYSTICK_B        : in    std_logic_vector(5 downto 0);
	 JOYSTICK_A_GND		 : out	std_logic;
	 JOYSTICK_B_GND		 : out	std_logic;
	 I_COIN	       	   	 : in    std_logic_vector(1 downto 0);
	 I_PLAYER	       	 : in    std_logic_vector(1 downto 0);
	 I_TABLE			 : in    std_logic_vector(0 downto 0);
    --
    reset  			: in  std_logic;
	clock_50 		: in  std_logic;
	game_clk			: in  std_logic;
	game_clk_x2  	: in  std_logic;
	--
	 led                   : out   std_logic:='0';
	 scanSW			   	  : in    std_logic_vector(20 downto 0);
	 resetKey              : in    std_logic;
	 scandblctrl           : in    std_logic_vector(1 downto 0)
	);
end computer_space_top;

architecture computer_space_architecture
				 of computer_space_top is 		 
				 
component clocks is 
	port (
	clock_50  										: in  std_logic;
	thrust_and_rotate_clk 						: out std_logic:='0';
	explosion_clk 									: out std_logic;
	explosion_rotate_clk  						: out std_logic; 
	seconds_clk 									: out std_logic;
	timer_base_clk 								: out std_logic;
	rocket_missile_life_time_duration,
	saucer_missile_life_time_duration,
	saucer_missile_hold_duration,
	signal_delay_duration 						: out integer
	);
end component clocks;

component computer_space_logic is
	port (
	reset,
	game_clk, super_clk, explosion_clk,
	seconds_clk 									: in std_logic;
	timer_base_clk 								: in std_logic;
	rocket_missile_life_time_duration,
	saucer_missile_life_time_duration,
	saucer_missile_hold_duration,
	signal_delay_duration 						: in integer; 
	thrust_and_rotate_clk,
	explosion_rotate_clk 						: in std_logic;	
	signal_start, signal_coin, 
	signal_thrust, signal_fire,
	signal_cw, signal_ccw  						: in std_logic;
	composite_video_signal					 	: out std_logic_vector(3 downto 0);
	blank												: out std_logic;
	hsync												: out std_logic;
	vsync												: out std_logic;
	led												: out std_logic;
	audio_gate										: out std_logic;
	sound_switch									: out std_logic_vector (7 downto 0);
	saucer_missile_sound                   : out std_logic;
	rocket_missile_sound                   : out std_logic;
	turn_sound                             : out std_logic
	);
end component computer_space_logic;	

--component sound is
--	port (
--	clock_50, audio_gate							: in std_logic;
--	sound_switch									: in std_logic_vector (7 downto 0);
--	sigma_delta_wav 								: out signed (15 downto 0) 
--	);
--end component sound;

-- signals for thrust 
-- so that a continuous button push
-- create continuous thrust and/or
-- rotation 
signal thrust_and_rotate_clk  				: std_logic:='0';

-- signals for explosion circuitry
-- logic
signal explosion_clk 							: std_logic;

-- clock to rotate the rocket
-- rapdily at explosion
signal explosion_rotate_clk					: std_logic; 

--signals for clock counting seconds
signal seconds_clk 								: std_logic;

-- timer components for Motion Board 
signal timer_base_clk 							: std_logic;
signal rocket_missile_life_time_duration,
		 saucer_missile_life_time_duration,
		 saucer_missile_hold_duration,
		 signal_delay_duration  				: integer;

-- signals for composite
-- video
		 

-- signals to fetch and activate sound
-- from audio memory 
signal sound_switch 								: std_logic_vector (7 downto 0)
														:= "00000000" ;
-- not using bit 0, only bit 1 to 5
-- 1 = rocket rotate
-- 2 = rocket thrust,
-- 3 = rocket missile
-- 4 = rocket explosion,
-- 5 = saucer missile shooting

signal saucer_missile_sound : std_logic;	 
signal rocket_missile_sound : std_logic;	 
signal turn_sound           : std_logic;	 

signal audio_gate 								: std_logic;
	
--signal wav_out			: signed (15 downto 0);
signal blank			: std_logic;
signal video 			: std_logic_vector(3 downto 0);
signal normal_video  : std_logic_vector(3 downto 0);
signal inverse_video : std_logic_vector(3 downto 0);
signal muxed_video   : std_logic_vector(3 downto 0);
signal blked_video   : std_logic_vector(3 downto 0);
signal blked_video_x2 : std_logic_vector(3 downto 0);
signal hsync			: std_logic;
signal vsync			: std_logic;
signal hsync_x2		: std_logic;
signal vsync_x2		: std_logic;
signal csync			: std_logic;
signal dbl_scan		: std_logic;

signal 		signal_ccw 		: std_logic;
signal 		signal_cw 		: std_logic;
signal 		signal_thrust 	: std_logic;
signal 		signal_fire 	: std_logic;
signal 		signal_start 	: std_logic;
signal 		signal_coin 	: std_logic;
 
 signal audio            : integer range -32768 to 32767;
 signal audio_us         : unsigned(16 downto 0);
 signal pwm_accumulator  : std_logic_vector(16 downto 0);
 signal reset_n          : std_logic;
 signal button_in        : std_logic_vector(15 downto 0);
 signal buttons	       : std_logic_vector(15 downto 0);
 signal button_debounced : std_logic_vector(15 downto 0);
 signal joystick_reg     : std_logic_vector(5 downto 0);
 signal joystick2_reg    : std_logic_vector(5 downto 0);

------------------------------------------------------------------------//
begin 

--------------------------------------------------------------------------
-- GENERATE CLOCKS																		--
--------------------------------------------------------------------------
generate_clock : CLOCKS 
port map
(clock_50, thrust_and_rotate_clk,explosion_clk, explosion_rotate_clk,
seconds_clk, timer_base_clk,
rocket_missile_life_time_duration, saucer_missile_life_time_duration,
saucer_missile_hold_duration, signal_delay_duration);

--------------------------------------------------------------------------
-- CORE COMPUTER SPACE LOGIC															--
--------------------------------------------------------------------------
computer_space : COMPUTER_SPACE_LOGIC
port map
(reset, game_clk, clock_50, explosion_clk, seconds_clk, timer_base_clk,
rocket_missile_life_time_duration, saucer_missile_life_time_duration,
saucer_missile_hold_duration, signal_delay_duration,
thrust_and_rotate_clk, explosion_rotate_clk, 
signal_start, signal_coin, signal_thrust, signal_fire,
signal_cw,signal_ccw, video, blank,
hsync, vsync,
led,
audio_gate, sound_switch, saucer_missile_sound,rocket_missile_sound,
turn_sound
);		

--------------------------------------------------------------------------
-- AUDIO SIMULATOR
--------------------------------------------------------------------------
sound_simulation : entity work.computer_space_sound
port map(
	clock_50 => clock_50,
	reset => reset,
		
	sound_switch         => sound_switch,
	saucer_missile_sound => saucer_missile_sound,
	rocket_missile_sound => rocket_missile_sound,
	turn_sound           => turn_sound,
	
	audio_gate => audio_gate,
	audio      => audio
);

-- pwm sound output
audio_us <= '0'&to_unsigned(audio+32767,16);

--process(game_clk)  -- use same clock as time_pilot_sound_board
--begin
--  if rising_edge(game_clk) then
--    pwm_accumulator  <=  std_logic_vector(unsigned('0' & pwm_accumulator(15 downto 0)) + audio_us);
--  end if;
--end process;
--O_AUDIO_L <= pwm_accumulator(16); 
--O_AUDIO_R <= pwm_accumulator(16); 

O_AUDIO <= std_logic_vector(audio_us);

reset_n   <= not reset;

with video(2 downto 0) select 
normal_video <= "0000" when "000",
					 "0101" when "001",
					 "1000" when "010",
					 "1000" when "011",
					 "1111" when others;

with video(2 downto 0) select 
inverse_video <= "0111" when "000",
					  "0000" when "001",
					  "0000" when "010",
					  "0000" when "011",
					  "0000" when others;

muxed_video <= normal_video when video(3) = '0' else inverse_video;
blked_video <= muxed_video when blank = '0' else "0000";
					  
O_VIDEO_R <= blked_video(3 downto 1) when dbl_scan = '0' else blked_video_x2(3 downto 1);
O_VIDEO_G <= blked_video(3 downto 1) when dbl_scan = '0' else blked_video_x2(3 downto 1);
O_VIDEO_B <= blked_video(3 downto 1) when dbl_scan = '0' else blked_video_x2(3 downto 1);

O_HSYNC   <= csync when dbl_scan = '0' else hsync_x2;--not (hsync xor vsync);
O_VSYNC   <= '1'   when dbl_scan = '0' else vsync_x2;
 
composite_sync : entity work.composite_sync
port map(
 clk   => game_clk,
 hsync => hsync,
 vsync => vsync,
 csync => csync,
 blank => open
); 

dblscan : entity work.DBLSCAN
port map (
  RGB_IN(7 downto 4) => "0000",
  RGB_IN(3 downto 0) => blked_video,
  I_HSYNC           => hsync,
  I_VSYNC           => vsync,

  RGB_OUT(7 downto 4) => open,
  RGB_OUT(3 downto 0) => blked_video_x2,
  O_HSYNC           => hsync_x2,
  O_VSYNC           => vsync_x2,
  --  NOTE CLOCKS MUST BE PHASE LOCKED !!
  CLK                => game_clk,
  CLK_X2             => game_clk_x2,
  scanlines    =>  scandblctrl(1) xor scanSW(8)	  
);
	
dbl_scan <=  scandblctrl(0) xor scanSW(6); -- 1 = VGAS  0 = RGB	

 
signal_ccw 	  <= not button_debounced(2);
signal_cw 	  <= not button_debounced(3);
signal_thrust <= not button_debounced(5);
signal_fire   <= not button_debounced(4);
signal_start  <= not button_debounced(6);
signal_coin   <= not button_debounced(8);
 
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
    CLK      => game_clk
    );

end computer_space_architecture;	