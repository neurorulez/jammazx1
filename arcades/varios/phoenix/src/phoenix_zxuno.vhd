---------------------------------------------------------------------------------
-- Arcade ZX-UNO Jamma port by Neuro based on the Quest 2017 code
---------------------------------------------------------------------------------
-- DE2-35 by Dar (darfpga@aol.fr) (April 2016)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

entity phoenix_zxuno is
port
(
	clk44		   : in  std_logic;
	pll_locked  : in  std_logic;
	O_VIDEO_R	: out std_logic_vector(2 downto 0); 
	O_VIDEO_G	: out std_logic_vector(2 downto 0);
	O_VIDEO_B	: out std_logic_vector(2 downto 0);
	O_HSYNC		: out std_logic;
	O_VSYNC		: out std_logic;

	O_AUDIO_L 	: out std_logic;
	O_AUDIO_R 	: out std_logic;
	
	I_JOYSTICK_A: in std_logic_vector(5 downto 0);	
	I_JOYSTICK_B: in std_logic_vector(5 downto 0);
	JOYSTICK_A_GND : out	 std_logic;
	JOYSTICK_B_GND : out	 std_logic;

	I_PLAYER    : in std_logic_vector(1 downto 0);
	I_COIN      : in std_logic_vector(1 downto 0);
	
--	PCLK					    : out  std_logic;
	scanSW			       : in    std_logic_vector(20 downto 0);
	resetKey              : in    std_logic;
	scandblctrl           : in    std_logic_vector(1 downto 0)
);
end;

architecture struct of phoenix_zxuno is

--	signal clk        : std_logic;
--	signal clk44      : std_logic;
	signal ena22      : std_logic;
	signal ena11      : std_logic;
	signal reset      : std_logic;
--	signal pll_locked : std_logic;

	signal audio      : std_logic_vector(11 downto 0);
	signal audio_out	: std_logic;
	signal video_r		: std_logic_vector(1 downto 0);
	signal video_g		: std_logic_vector(1 downto 0);
	signal video_b		: std_logic_vector(1 downto 0);
	signal vsync		: std_logic;
	signal hsync		: std_logic;

	signal dip_switch : std_logic_vector(7 downto 0);
	signal ce_pix     : std_logic;

	signal scanlines   : std_logic_vector(1 downto 0);
	signal comp_sync_l : std_logic;
	signal video_r_x2  : std_logic_vector(3 downto 0);
	signal video_g_x2  : std_logic_vector(3 downto 0);
	signal video_b_x2  : std_logic_vector(3 downto 0);
	signal hsync_x2    : std_logic;
	signal vsync_x2    : std_logic;  

	signal div_cnt     : std_logic_vector(1 downto 0);

	signal button_in        : std_logic_vector(15 downto 0);
	signal buttons          : std_logic_vector(15 downto 0);
	signal button_debounced : std_logic_vector(15 downto 0);
	signal joystick_reg     : std_logic_vector(5 downto 0);
	signal joystick2_reg    : std_logic_vector(5 downto 0);

	signal dbl_scan	  : std_logic; 
  

begin
 
--	relojes: entity work.relojes
--	port map(
--     CLK_IN1  => clk50, 
--		CLK_OUT1 => clk44,
--      LOCKED	=> pll_locked
--	);
	
 
	dac : entity work.pwm_sddac
	port  map(
		clk_i	=> clk44,
		reset	=> reset,
		dac_i	=> audio,
		dac_o	=> audio_out,
		we		=> '1'
	);
------------------------------
   --PCLK <= ena22;	
	O_AUDIO_R <= audio_out;
	O_AUDIO_L <= audio_out;

	reset <= resetKey;  --not pll_locked or resetKey; 
	
	phoenix : entity work.phoenix
	port map
	(
		clk          => ena11, --clk,
		reset        => reset,
		ce_pix       => ce_pix,
		dip_switch   => dip_switch,
		btn_coin     => (not button_debounced(8) or not button_debounced(15)),
		btn_player_start(0) => not button_debounced(6),
		btn_player_start(1) => not button_debounced(7),
		btn_left     => not button_debounced(2),
		btn_right    => not button_debounced(3),
		btn_barrier  => not button_debounced(5),
		btn_fire     => not button_debounced(4),
		video_r      => video_r,
		video_g      => video_g,
		video_b      => video_b,
		video_hs     => hsync,
		video_vs     => vsync,
		audio_select => "000",
		audio        => audio
	);	

  dbl_scan <=  scandblctrl(0) xor scanSW(6); -- 1 = VGA  0 = RGB
  
  ----genera sincro compuesta
  comp_sync_l <= not (vsync xor hsync);

  p_video_ouput : process
  begin
    wait until rising_edge(clk44);
		 if (dbl_scan = '0') then  
		  O_VIDEO_R <= video_r & '0';
		  O_VIDEO_G <= video_g & '0';
		  O_VIDEO_B <= video_b & '0';
		  
		  O_HSYNC <= comp_sync_l;
		  O_VSYNC <= '1';
		else  
		  O_VIDEO_R <= video_r_x2(3 downto 1);
		  O_VIDEO_G <= video_g_x2(3 downto 1);
		  O_VIDEO_B <= video_b_x2(3 downto 1);
		  
		  O_HSYNC <= hsync_x2;
		  O_VSYNC <= vsync_x2;
		end if;
	end process;
  
vga: entity work.scandoubler
	port map(
		clk_sys => ena22,
		scanlines => scandblctrl(1) xor scanSW(8),
		r_in   => video_r & video_r,
		g_in   => video_g & video_g,
		b_in   => video_b & video_b,
		hs_in  => hsync,
		vs_in  => vsync,
		r_out  => video_r_x2(3 downto 1),
		g_out  => video_g_x2(3 downto 1),
		b_out  => video_b_x2(3 downto 1),
		hs_out => hsync_x2,
		vs_out => vsync_x2
	);
		
  p_clk_div : process(pll_locked, clk44)
  begin
    if (pll_locked = '0') then
      div_cnt <= (others => '0');
      ena22   <= '0';
      ena11   <= '0';
    elsif rising_edge(clk44) then
      div_cnt <= div_cnt + "1";
      ena22   <= div_cnt(0);
      ena11   <= div_cnt(0) and not div_cnt(1);
    end if;
  end process;		

  joystick_reg  <= I_JOYSTICK_A;
  joystick2_reg <= I_JOYSTICK_B;
  JOYSTICK_A_GND <= '0';
  JOYSTICK_B_GND <= '0';

  button_in(15) <= I_COIN(1) and not scanSW(20);   --ic2
  button_in(8)  <= I_COIN(0) and not scanSW(13);   --ic1
  button_in(7)  <= I_PLAYER(1) and not scanSW(12); --p2
  button_in(6)  <= I_PLAYER(0) and not scanSW(11); --p1

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
    CLK      => clk44
    );

  
	
---------------------------------------

	--   SWITCH 1:     SWITCH 2:    NUMBER OF SPACESHIPS:
	--   ---------     ---------    ---------------------
	--     OFF           OFF                  6
	--     ON            OFF                  5
	--     OFF           ON                   4
	--     ON            ON                   3
	--                               FIRST FREE     SECOND FREE
	--   SWITCH 3:     SWITCH 4:     SHIP SCORE:    SHIP SCORE:
	--  ---------     ---------     -----------    -----------
	--     OFF           OFF           6,000          60,000
	--     ON            OFF           5,000          50,000
	--     OFF           ON            4,000          40,000
	--     ON            ON            3,000          30,000
	 
	--Cocktail,Factory,Factory,Factory,Bonus2,Bonus1,Ships2,Ships1
	dip_switch <= "00001111";	
	
end struct;
