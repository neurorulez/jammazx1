--
-- A simulation model of Asteroids Deluxe hardware
-- Copyright (c) MikeJ - May 2004
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--

    --
    -- Notes :
    --
    -- Button shorts input to ground when pressed
	 -- 
	 -- ToDo:
			-- Model sound effects for thump-thump, ship and saucer fire and saucer warble 
			-- Add player control switching and screen flip for cocktail mode 
			-- General cleanup



library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

entity ASTEROIDS_MAIN is
  port (
    clk_6					  	:  in  std_logic;  
	 clk_25						:  in  std_logic;
	 clk_50						:  in  std_logic;
    VIDEO_R_OUT       : out   std_logic_vector(3 downto 0);
    VIDEO_G_OUT       : out   std_logic_vector(3 downto 0);
    VIDEO_B_OUT       : out   std_logic_vector(3 downto 0);
    HSYNC_OUT         : out   std_logic;
    VSYNC_OUT         : out   std_logic;
    AUDIO_L_OUT       : out   std_logic;
	AUDIO_R_OUT       : out   std_logic;
   RESET_L           : in    std_logic;
 	sram_addr   : out     std_logic_vector(18 downto 0);
	sram_data   : inout   std_logic_vector(7  downto 0);  
	sram_we     : out     std_logic;
  --
  I_JOYSTICK_A           : in    std_logic_vector(5 downto 0);
  I_JOYSTICK_B           : in    std_logic_vector(5 downto 0);
  I_COIN	       	   	 : in    std_logic_vector(1 downto 0);
  I_PLAYER	       		 : in    std_logic_vector(1 downto 0);
  scanSW			   	    : in    std_logic_vector(20 downto 0);
  scandblctrl            : in    std_logic_vector(1 downto 0)
    );
end;

architecture RTL of ASTEROIDS_MAIN is

   signal BUTTON            : std_logic_vector(7 downto 0); -- active low
   signal LANG				 : std_logic_vector(1 downto 0);
	signal SHIPS			 : std_logic_vector(1 downto 0);
   signal AUDIO_OUT         : std_logic_vector(7 downto 0);
	signal AUDIO_PWM         : std_logic; 
	signal SELF_TEST_SWITCH_L: std_logic; 
	signal VID_HBLANK			: std_logic;
	signal VID_VBLANK			: std_logic;
	signal VGA_DE				: std_logic;

	signal RAM_ADDR_A        :   std_logic_vector(18 downto 0);
   signal RAM_ADDR_B        :   std_logic_vector(15 downto 0); -- same as above
   signal RAM_WE_L          :   std_logic;
   signal RAM_ADV_L         :   std_logic;
   signal RAM_OE_L          :   std_logic;
   signal RAM_DO           :  std_logic_vector(31 downto 0);
	signal RAM_DI           :  std_logic_vector(31 downto 0);
	signal ram_we          :   std_logic;
	
  signal reset_dll_h          : std_logic;

  signal delay_count          : std_logic_vector(7 downto 0) := (others => '0');
  signal reset_6_l            : std_logic;
  signal reset_6              : std_logic;

  signal clk_cnt              : std_logic_vector(2 downto 0) := "000";

  signal x_vector             : std_logic_vector(9 downto 0);
  signal y_vector             : std_logic_vector(9 downto 0);
  signal z_vector             : std_logic_vector(3 downto 0);
  signal beam_on              : std_logic;
  signal beam_ena             : std_logic;

  signal ram_addr_int         : std_logic_vector(18 downto 0);
  signal ram_we_l_int         : std_logic;
  signal ram_adv_l_int        : std_logic;
  signal ram_oe_l_int         : std_logic;
  signal ram_dout_oe_l        : std_logic;
  signal ram_dout_oe_l_reg    : std_logic;
  signal ram_dout             : std_logic_vector(31 downto 0);
  signal ram_dout_reg         : std_logic_vector(31 downto 0);
  signal ram_din              : std_logic_vector(31 downto 0);
-- keyboard to joystick
signal button_in        : std_logic_vector(15 downto 0);
signal buttons	       : std_logic_vector(15 downto 0);
signal button_debounced : std_logic_vector(15 downto 0);
signal joystick_reg     : std_logic_vector(5 downto 0);
signal joystick2_reg     : std_logic_vector(5 downto 0);

begin

  --
  -- Note about clocks
  --
  -- (the original uses a 6.048 MHz clock, so 40 / 6  - slightly slower)
  --

  reset_dll_h <= not RESET_L;
  reset_6 <= reset_dll_h;

  p_delay : process(RESET_L, clk_6)
  begin
    if (RESET_L = '0') then
      delay_count <= x"00"; -- longer delay for cpu
      reset_6_l <= '0';
    elsif rising_edge(clk_6) then
      if (delay_count(7 downto 0) = (x"FF")) then
        delay_count <= (x"FF");
        reset_6_l <= '1';
      else
        delay_count <= delay_count + "1";
        reset_6_l <= '0';
      end if;
    end if;
  end process;

  u_asteroids : entity work.ASTEROIDS
    port map (
	  SELF_TEST_SWITCH_L => SELF_TEST_SWITCH_L,
      BUTTON            => BUTTON,
     -- LANG					=> LANG,
	--	SHIPS					=> SHIPS,
      AUDIO_OUT         => AUDIO_OUT,

      X_VECTOR          => x_vector,
      Y_VECTOR          => y_vector,
      Z_VECTOR          => z_vector,
      BEAM_ON           => beam_on,
      BEAM_ENA          => beam_ena,
      --
      RESET_6_L         => reset_6_l,
      CLK_6             => clk_6
      );

  u_DW : entity work.ASTEROIDS_DW
    port map (
      RESET            => reset_6,
	  clk_25		   => clk_25,
	  clk_50		   => clk_50,
	  clk_6			   => clk_6,

      X_VECTOR         => x_vector,
      Y_VECTOR         => y_vector,
      Z_VECTOR         => z_vector,

      BEAM_ON          => beam_on,
      BEAM_ENA         => beam_ena,

      VIDEO_R_OUT      => VIDEO_R_OUT,
      VIDEO_G_OUT      => VIDEO_G_OUT,
      VIDEO_B_OUT      => VIDEO_B_OUT,
      HSYNC_OUT        => HSYNC_OUT,
      VSYNC_OUT        => VSYNC_OUT,
 	  
 	  sram_addr  => sram_addr,
	  sram_data  => sram_data,
	  sram_we    => sram_we,
      
	  VID_DE		   => VGA_DE,
	  VID_HBLANK	   => VID_HBLANK,
	  VID_VBLANK	   => VID_VBLANK
      );

u_dac : entity work.dac
  generic map(
    msbi_g => 7
  )
port  map(
    clk_i   => clk_6,
    res_n_i => RESET_L,
    dac_i   => AUDIO_OUT,
    dac_o   => AUDIO_PWM
);

AUDIO_L_OUT <= AUDIO_PWM;
AUDIO_R_OUT <= AUDIO_PWM;

-------
--INPUT
-------
  joystick_reg  <=  I_JOYSTICK_A;
  joystick2_reg <=  I_JOYSTICK_B;

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
    CLK      => clk_6
    );

SELF_TEST_SWITCH_L <= button_debounced(15);
BUTTON(0) <= button_debounced(1); --shield
BUTTON(1) <= button_debounced(5); --thrust
BUTTON(2) <= button_debounced(8); --coin 
BUTTON(3) <= button_debounced(4); --fire
BUTTON(4) <= button_debounced(7); --start2
BUTTON(5) <= button_debounced(6); --start1
BUTTON(6) <= button_debounced(2); --left
BUTTON(7) <= button_debounced(3); --right

end RTL;