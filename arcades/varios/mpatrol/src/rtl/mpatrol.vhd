library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;

entity mpatrol is
  port
    (
	  clk50mhz       : in std_logic;
      clock_3p58   	 : in std_logic;
	  clk_sys		 : in std_logic;
	  clk_vid		 : in std_logic;
      AUDIO_L        : out std_logic;
      AUDIO_R        : out std_logic;	  
      VIDEO_VS         : out std_logic;
      VIDEO_HS         : out std_logic;
      VIDEO_R          : out std_logic_vector(2 downto 0);
      VIDEO_G          : out std_logic_vector(2 downto 0);
      VIDEO_B          : out std_logic_vector(2 downto 0);
	  reset			 : in std_logic;
  	  scanSW         : in std_logic_vector(20 downto 0);
      I_JOYSTICK_A	 : in std_logic_vector(5 downto 0);
      I_JOYSTICK_B	 : in std_logic_vector(5 downto 0);
	  I_PLAYER       : in std_logic_vector(1 downto 0);
	  I_COIN         : in std_logic_vector(1 downto 0)
  );    
  
end mpatrol;

architecture SYN of mpatrol is

  signal init       		: std_logic := '1';  
  signal clkrst_i       : from_CLKRST_t;
  signal buttons_i      : from_BUTTONS_t;
  signal switches_i     : from_SWITCHES_t;
  signal leds_o         : to_LEDS_t;
  signal inputs_i       : from_INPUTS_t;
  signal video_i        : from_VIDEO_t;
  signal video_o        : to_VIDEO_t;
  --MIST
  signal audio       	: std_logic;
  signal status     		: std_logic_vector(31 downto 0); 
  signal joystick1      : std_logic_vector(7 downto 0);
  signal joystick2      : std_logic_vector(7 downto 0);
  signal kbd_joy 			: std_logic_vector(9 downto 0);	 
  signal switches       : std_logic_vector(1 downto 0);
  signal buttons        : std_logic_vector(1 downto 0);
  signal ps2_kbd_clk    : std_logic;
  signal ps2_kbd_data	: std_logic;
  signal scan_disable   : std_logic;
  signal ypbpr   			: std_logic;
  signal r  				: std_logic_vector(5 downto 0);
  signal g  				: std_logic_vector(5 downto 0);
  signal b  				: std_logic_vector(5 downto 0);
  signal hs 				: std_logic;
  signal vs 				: std_logic;  
 -- signal reset 			: std_logic;  
  signal audio_out 		: std_logic_vector(11 downto 0);
  signal sound_data     : std_logic_vector(7 downto 0);
  

begin

     clkrst_i.clk_ref   <=  clk50mhz;
	 clkrst_i.clk(0)	<=	clk_sys;
	 clkrst_i.clk(1)	<=	clk_vid;
	 
--RESET
	process (clk_sys)
		variable count : std_logic_vector (11 downto 0) := (others => '0');
	begin
		if rising_edge(clk_sys) then
			if count = X"FFF" then
				init <= '0';
			else
				count := count + 1;
				init <= '1';
			end if;
		end if;
	end process;

  clkrst_i.arst 		<= init or reset;
  clkrst_i.arst_n 	<= not clkrst_i.arst;

  GEN_RESETS : for i in 0 to 3 generate

    process (clkrst_i)
      variable rst_r : std_logic_vector(2 downto 0) := (others => '0');
    begin
      if clkrst_i.arst = '1' then
        rst_r := (others => '1');
      elsif rising_edge(clkrst_i.clk(i)) then
        rst_r := rst_r(rst_r'left-1 downto 0) & '0';
      end if;
      clkrst_i.rst(i) <= rst_r(rst_r'left);
    end process;

  end generate GEN_RESETS;	 

    video_i.clk 		<= clk_vid;
    video_i.clk_ena 	<= '1';
    video_i.reset 	<= clkrst_i.rst(1);

		inputs_i.jamma_n.coin(1) <= scanSW(13) or not I_COIN(0);
		inputs_i.jamma_n.p(1).start <= scanSW(11) or not I_PLAYER(0);	
		inputs_i.jamma_n.p(1).up <= I_JOYSTICK_A(0) and not scanSW(0);
		inputs_i.jamma_n.p(1).down <= I_JOYSTICK_A(1) and not scanSW(1);
		inputs_i.jamma_n.p(1).left <= I_JOYSTICK_A(2) and not scanSW(2);
		inputs_i.jamma_n.p(1).right <= I_JOYSTICK_A(3) and not scanSW(3);	
		inputs_i.jamma_n.p(1).button(1) <= I_JOYSTICK_A(4) and not scanSW(4);	
		inputs_i.jamma_n.p(1).button(2) <= I_JOYSTICK_A(5) and not scanSW(5);	
		inputs_i.jamma_n.p(1).button(3) <= '1';
		inputs_i.jamma_n.p(1).button(4) <= '1';
		inputs_i.jamma_n.p(1).button(5) <= '1';		
		inputs_i.jamma_n.p(2).up <=  I_JOYSTICK_B(0) and not scanSW(0);
		inputs_i.jamma_n.p(2).down <=  I_JOYSTICK_B(1) and not scanSW(1);
		inputs_i.jamma_n.p(2).left <=  I_JOYSTICK_B(2) and not scanSW(2);
		inputs_i.jamma_n.p(2).right <= I_JOYSTICK_B(3) and not scanSW(3);
		inputs_i.jamma_n.p(2).button(1) <=  I_JOYSTICK_B(4) and not scanSW(4);
		inputs_i.jamma_n.p(2).button(2) <=  I_JOYSTICK_B(5) and not scanSW(5);
		inputs_i.jamma_n.p(2).button(3) <= '1';
		inputs_i.jamma_n.p(2).button(4) <= '1';
		inputs_i.jamma_n.p(2).button(5) <= '1';
		-- not currently wired to any inputs
		inputs_i.jamma_n.coin_cnt <= (others => '1');
		inputs_i.jamma_n.coin(2) <= '1';
		inputs_i.jamma_n.service <= '1';
		inputs_i.jamma_n.tilt <= '1';
		inputs_i.jamma_n.test <= '1';

 -- LED <= '1';
  
moon_patrol_sound_board : entity work.moon_patrol_sound_board
	port map(
		clock_3p58    	=> clock_3p58,
		reset     		=> clkrst_i.arst, 
		select_sound  	=> sound_data,
		audio_out     	=> audio_out,
		dbg_cpu_addr  	=> open
	);  
  
dac : entity work.dac
   port map (
      clk_i     		=> clk_sys,
		res_n_i   		=> '1',
      dac_i   			=> audio_out,
      dac_o  			=> audio
   );
		
  AUDIO_R <= audio;
  AUDIO_L <= audio; 		
		


 pace_inst : entity work.pace                                            
   port map
   (
		clkrst_i				=> clkrst_i,
		buttons_i         => buttons_i,
		switches_i        => switches_i,
		leds_o            => open,
		inputs_i          => inputs_i,
		video_i           => video_i,
		video_o           => video_o,
		sound_data_o 		=> sound_data
    );


		VIDEO_R	<= video_o.rgb.r(9 downto 7);--9 downto 4
		VIDEO_G	<= video_o.rgb.g(9 downto 7);
		VIDEO_B	<= video_o.rgb.b(9 downto 7);
		VIDEO_HS	<= video_o.hsync;
		VIDEO_VS	<= video_o.vsync;

	 
end SYN;
