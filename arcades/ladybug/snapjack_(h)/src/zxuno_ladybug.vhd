-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- Toplevel port for Papilio Plus board.
--
-------------------------------------------------------------------------------
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
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;

library ieee;
	use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.ladybug_dip_pack.all;

entity snapjack_zxuno is
port (
	-- Global Interface -------------------------------------------------------
	CLK_IN       : in    std_logic;
	I_RESET      : in    std_logic;
	-- VGA Interface ----------------------------------------------------------
	O_VIDEO_R    : out   std_logic_vector( 2 downto 0);
	O_VIDEO_G    : out   std_logic_vector( 2 downto 0);
	O_VIDEO_B    : out   std_logic_vector( 2 downto 0);
	O_VSYNC      : out   std_logic;
	O_HSYNC      : out   std_logic;
	-- Audio Interface --------------------------------------------------------
	O_AUDIO_L    : out   std_logic;
	O_AUDIO_R    : out   std_logic;
	-- Entradas desede Joystick
	I_JOYSTICK_A          : in    std_logic_vector(5 downto 0);
	I_JOYSTICK_B          : in    std_logic_vector(5 downto 0);
	JOYSTICK_A_GND			 : out	 std_logic;
	JOYSTICK_B_GND			 : out	 std_logic;
   I_COIN	       	    : in    std_logic_vector(1 downto 0);
	I_PLAYER	       		 : in    std_logic_vector(1 downto 0);
	-- Teclado y registro de control del ZX-UNO
	scanSW			   	 : in    std_logic_vector(20 downto 0);
	resetKey              : in    std_logic;
	scandblctrl           : in    std_logic_vector(1 downto 0);
	-- Rejoj de Salida con la velocidad del arcade para acceso al teclado----
	PCLK        : out  std_logic
);
end snapjack_zxuno;

architecture struct of snapjack_zxuno is

	signal
		ps2_codeready,
		clk_20mhz_s,
		clk_en_10mhz_s,
		clk_en_5mhz_s,
		por_n_s,
		ext_res_n_s,
		ext_res_s,
		audio_s,
		hblank,
		vblank,
		blankn,
		vid_hsync,
		vid_vsync,
		vga_hsync,
		csync,
		vid_comp_sync_n,
		vga_comp_sync_n,
		vga_vsync           : std_logic;

	signal rom_cpu_a_s     : std_logic_vector(14 downto 0);
	signal rom_cpu_d_s     : std_logic_vector( 7 downto 0);
	signal rom_cpu_d1      : std_logic_vector( 7 downto 0);
	signal rom_cpu_d2      : std_logic_vector( 7 downto 0);
	signal rom_cpu_d3      : std_logic_vector( 7 downto 0);
	signal rom_cpu_d4      : std_logic_vector( 7 downto 0);
	signal rom_cpu_d5      : std_logic_vector( 7 downto 0);
	signal rom_cpu_d6      : std_logic_vector( 7 downto 0);

	signal rom_char_a_s    : std_logic_vector(11 downto 0);
	signal rom_char_d_s    : std_logic_vector(15 downto 0);

	signal rom_sprite_a_s  : std_logic_vector(11 downto 0);
	signal rom_sprite_d_s  : std_logic_vector(15 downto 0);

	signal
		dac_audio_s,
		dip_block_1_s,
		dip_block_2_s       : std_logic_vector( 7 downto 0) := (others => '0');

	signal ps2_scancode    : std_logic_vector( 9 downto 0) := (others => '0');

	signal
		vid_mux,
		vid_rgb,
		vga_rgb             : std_logic_vector(15 downto 0) := (others => '0');

	signal but_chute_s     : std_logic_vector( 1 downto 0) := (others=>'0');

	signal
		but_fire_s,
		but_bomb_s,
		but_tilt_s,
		but_select_s,
		but_up_s,
		but_down_s,
		but_left_s,
		but_right_s         : std_logic_vector( 1 downto 0) := (others=>'1');

	signal signed_audio_s  : signed(7 downto 0);
	
   signal scan_converter_mode        : std_logic;
	signal comp_sync : std_logic; --Mia, parece que no vale 

		-- input registers
   signal joystick_reg     : std_logic_vector( 5 downto 0);
	signal joystick2_reg     : std_logic_vector(5 downto 0);
	signal button_in        : std_logic_vector( 15 downto 0);
	signal button_debounced : std_logic_vector( 15 downto 0);
	signal buttons	         : std_logic_vector( 15 downto 0);

begin

	-----------------------------------------------------------------------------
	-- outputs assignments
	-----------------------------------------------------------------------------
composite_sync : entity work.composite_sync
port map(
 clk   => clk_en_5mhz_s,
 hsync => not vid_hsync, --La maquina original las da negadas
 vsync => not vid_vsync, --La maquina original las da negadas
 csync => csync,
 blank => open
);

	scan_converter_mode <= scandblctrl(0) xor scanSW(6);
	 blankn <= not (hblank or vblank);
	 vid_mux <= vid_rgb when blankn  = '1' else (others => '0');
	 
	 O_VIDEO_R <= vga_rgb(5 downto 4) & "0" when scan_converter_mode = '1' else vid_mux(5 downto 4) & "0";
	 O_VIDEO_G <= vga_rgb(3 downto 2) & "0" when scan_converter_mode = '1' else vid_mux(3 downto 2) & "0";
	 O_VIDEO_B <= vga_rgb(1 downto 0) & "0" when scan_converter_mode = '1' else vid_mux(1 downto 0) & "0";

	 O_AUDIO_R <= audio_s;
	 O_AUDIO_L <= audio_s;
	 O_VSYNC   <= vga_vsync when scan_converter_mode = '1' else '1';
 	 O_HSYNC   <= vga_hsync when scan_converter_mode = '1' else csync;--not (vid_hsync xor vid_vsync); --Con el not xor (sin el modulo conversor a vcomp) saca bien rgb, pero el video compuesto en b&n

	-----------------------------------------------------------------------------
	-- inputs assignments
	-----------------------------------------------------------------------------
	ext_res_s <= resetKey; --I_RESET;
	ext_res_n_s <= not ext_res_s;
	PCLK <= clk_20mhz_s;
  -----------------------------------------------------------------------------
  -- Clock generator
  -----------------------------------------------------------------------------
	dcm_inst : DCM_SP
	generic map (
		CLKFX_MULTIPLY	=> 10,
		CLKFX_DIVIDE	=> 25,  --16,
		CLKIN_PERIOD	=> 50.0 --31.25
	)
	port map (
		CLKIN	=> CLK_IN,	-- 32MHz
		CLKFX	=> clk_20mhz_s,
		RST	=> ext_res_s
	);

  -----------------------------------------------------------------------------
  -- VGA Scan Converter
  -----------------------------------------------------------------------------
  dblscan_b : entity work.VGA_SCANCONV
	-- these parameters are critical to achieving proper video timing
	-- ladybug game resolution is 192x240, or 384x480 after doubling
	-- output pixel clock must be 4x the input pixel clock, phase locked
	generic map (
		hB				=>  44,	-- h sync
		hC				=>  32,	-- h back porch
		-- hres should be 480 but there is a bug in the game video timing causing the video data to be delayed by about 16 clocks
		-- relative to the hsync signal so for now we fudge it here until we can check the logic against the schematic and fix it.
		-- once that is sorted, remember to remove the in_cmpblk_n delay inside the scan converter too
		hres			=> 496,	-- visible video
		hpad			=>  14,	-- padding either side to reach standard VGA resolution (hres + 2*hpad = hD)
		hmax			=> 623,	-- output pixel clock / horizontal line frequency = max line in pixels

		vB				=>   2,	-- v sync
		vC				=>  84,	-- v back porch
		vres			=> 384,	-- visible video
		vpad			=>  37	-- padding either side to reach standard VGA resolution (vres + vpad = vD)
	)
	port map (
      I_VIDEO      => vid_rgb,
      I_HSYNC      => vid_hsync,
      I_VSYNC      => vid_vsync,
		I_CMPBLK_N   => vid_comp_sync_n,

      O_VIDEO      => vga_rgb,
      O_HSYNC      => vga_hsync,
      O_VSYNC      => vga_vsync,
		O_CMPBLK_N   => open,

		scanlines    =>  scandblctrl(1) xor scanSW(8),
		
      CLK          => clk_en_5mhz_s,	-- input pixel clock
		CLK_X4       => clk_20mhz_s		-- output pixel clock
    );

	-----------------------------------------------------------------------------
	-- Convert signed audio data of Lady Bug Machine (range 127 to -128) to
	-- simple unsigned value.
	-----------------------------------------------------------------------------
	dac_audio_s <= std_logic_vector(unsigned(signed_audio_s + 128));

	-----------------------------------------------------------------------------
	-- Audio DAC
	-----------------------------------------------------------------------------
	dac_l_b : entity work.dac
	generic map (
		msbi_g => 7
	)
	port map (
		clk_i   => clk_20mhz_s,
		res_n_i => por_n_s,
		dac_i   => dac_audio_s,
		dac_o   => audio_s
	);

	-----------------------------------------------------------------------------
	-- Ladybug Machine
	-----------------------------------------------------------------------------
	machine_b : entity work.ladybug_machine
	port map (
		ext_res_n_i       => ext_res_n_s,
		clk_20mhz_i       => clk_20mhz_s,
		clk_en_5mhz_o     => clk_en_5mhz_s,
		por_n_o           => por_n_s,     -- porno makes porns... hells yeah!
		tilt_n_i          => but_tilt_s(0),
		player_select_n_i => but_select_s,
		player_fire_n_i   => but_fire_s,
		player_up_n_i     => but_up_s,
		player_right_n_i  => but_right_s,
		player_down_n_i   => but_down_s,
		player_left_n_i   => but_left_s,
		player_bomb_n_i   => but_bomb_s,
		right_chute_i     => but_chute_s(0),
		left_chute_i      => but_chute_s(1),
		dip_block_1_i     => dip_block_1_s,
		dip_block_2_i     => dip_block_2_s,
		rgb_r_o           => vid_rgb(5 downto 4),
		rgb_g_o           => vid_rgb(3 downto 2),
		rgb_b_o           => vid_rgb(1 downto 0),
		hsync_n_o         => vid_hsync,
		vsync_n_o         => vid_vsync,
	   vblank_o          => vblank,
	   hblank_o          => hblank,
		comp_sync_n_o     => vid_comp_sync_n,
		audio_o           => signed_audio_s,
		rom_cpu_a_o       => rom_cpu_a_s,
		rom_cpu_d_i       => rom_cpu_d_s,
		rom_char_a_o      => rom_char_a_s,
		rom_char_d_i      => rom_char_d_s,
		rom_sprite_a_o    => rom_sprite_a_s,
		rom_sprite_d_i    => rom_sprite_d_s
	);

	-----------------------------------------------------------------------------
	-- Joys & Keypad - active low buttons
	-----------------------------------------------------------------------------
  joystick_reg  <=  I_JOYSTICK_A;
  joystick2_reg <=  I_JOYSTICK_B;
  JOYSTICK_A_GND <= '0';
  JOYSTICK_B_GND <= '0';

  button_in(15) <= I_COIN(1) and not scanSW(20);   --ic2
  button_in(8)  <= I_COIN(0) and not scanSW(13);   --ic1
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
 
	btn_debounce : entity work.LADYBUG_DEBOUNCE
	generic map (
		G_WIDTH => 16
	)
	port map (
		I_BUTTON => buttons,
		O_BUTTON => button_debounced,
		CLK      => clk_20mhz_s
	);

 but_tilt_s(0)   <= '1';
 but_tilt_s(1)   <= '1';
 but_select_s(0) <= button_debounced(6);
 but_select_s(1) <= button_debounced(7);
 but_chute_s(0)  <= not button_debounced(8);
 but_chute_s(1)  <= not button_debounced(15);
 but_up_s(0)     <= button_debounced(0);
 but_up_s(1)     <= button_debounced(9);
 but_down_s(0)   <= button_debounced(1);
 but_down_s(1)   <= button_debounced(10);
 but_left_s(0)   <= button_debounced(2);
 but_left_s(1)   <= button_debounced(11);
 but_right_s(0)  <= button_debounced(3);
 but_right_s(1)  <= button_debounced(12);
 but_fire_s(0)   <= button_debounced(4);
 but_fire_s(1)   <= button_debounced(13);
 but_bomb_s(0)   <= button_debounced(5);
 but_bomb_s(1)   <= button_debounced(14);
 
 	-----------------------------------------------------------------------------
	-- Building the DIP Switches - see file ladybug_dip_pack.vhd
	-----------------------------------------------------------------------------
--	dip_block_1_s <= lb_dip_block_1_c; -- Lady Bug
--	dip_block_1_s <= do_dip_block_1_c; -- Dorodon
--	dip_block_1_s <= ca_dip_block_1_c; -- Cosmic Avenger
	dip_block_1_s <= sj_dip_block_1_c; -- Snap Jack
	dip_block_2_s <= price_dip_block_2_c; -- Common for all games (coins per game pricing)

	-----------------------------------------------------------------------------
	-- Game ROMs
	-----------------------------------------------------------------------------
	inst_rom_spritel : entity work.rom_sprite_l
	port map (
		CLK         => clk_20mhz_s,
		ADDR        => rom_sprite_a_s,
		DATA        => rom_sprite_d_s( 7 downto 0)
	);

	inst_rom_spriteu : entity work.rom_sprite_u
	port map (
		CLK         => clk_20mhz_s,
		ADDR        => rom_sprite_a_s,
		DATA        => rom_sprite_d_s(15 downto 8)
	);

	inst_rom_charl : entity work.rom_char_l
	port map (
		CLK         => clk_20mhz_s,
		ADDR        => rom_char_a_s,
		DATA        => rom_char_d_s( 7 downto 0)
	);

	inst_rom_charu : entity work.rom_char_u
	port map (
		CLK         => clk_20mhz_s,
		ADDR        => rom_char_a_s,
		DATA        => rom_char_d_s(15 downto 8)
	);

	inst_rom_cpu1 : entity work.rom_cpu1
	port map (
		CLK         => clk_20mhz_s,
		ADDR        => rom_cpu_a_s(12 downto 0),
		DATA        => rom_cpu_d1
	);

	inst_rom_cpu2 : entity work.rom_cpu2
	port map (
		CLK         => clk_20mhz_s,
		ADDR        => rom_cpu_a_s(12 downto 0),
		DATA        => rom_cpu_d2
	);

	inst_rom_cpu3 : entity work.rom_cpu3
	port map (
		CLK         => clk_20mhz_s,
		ADDR        => rom_cpu_a_s(12 downto 0),
		DATA        => rom_cpu_d3
	);

	-----------------------------------------------------------------------------
	-- Program ROMs data mux
	-----------------------------------------------------------------------------
	rom_cpu_d_s <=
		rom_cpu_d1 when rom_cpu_a_s(14 downto 13) = "00" else
		rom_cpu_d2 when rom_cpu_a_s(14 downto 13) = "01" else
		rom_cpu_d3 when rom_cpu_a_s(14 downto 13) = "10" else
		(others=>'0');

end struct;
