--
-- A simulation model of Pacman hardware
-- Copyright (c) MikeJ - January 2006
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
-- Email pacman@fpgaarcade.com
--
-- Revision list
--
-- version 005 Papilio release by Jack Gassett
-- version 004 spartan3e release
-- version 003 Jan 2006 release, general tidy up
-- version 002 optional vga scan doubler
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

use work.pkg_pacman.all;
entity THEBLOB is
	generic(
		eight_sprites : boolean := false
	);
  port (
    O_VIDEO_R             : out   std_logic_vector(2 downto 0);
    O_VIDEO_G             : out   std_logic_vector(2 downto 0);
    O_VIDEO_B             : out   std_logic_vector(2 downto 0);
    O_HSYNC               : out   std_logic;
    O_VSYNC               : out   std_logic;
	 O_BLANKING            : out   std_logic_vector(0 downto 0);
    --
    O_AUDIO_L             : out   std_logic;
    O_AUDIO_R             : out   std_logic;
    --
	 I_JOYSTICK_A            : in    std_logic_vector(5 downto 0);
	 I_JOYSTICK_B            : in    std_logic_vector(5 downto 0);
	 JOYSTICK_A_GND			 : out	std_logic;
	 JOYSTICK_B_GND			 : out	std_logic;
	 I_COIN	       	   	 : in    std_logic_vector(1 downto 0);
	 I_PLAYER	       		 : in    std_logic_vector(1 downto 0);
	 I_TABLE			      	 : in    std_logic_vector(0 downto 0);
    --
    I_RESET            : in std_logic;
    I_CLK_REF          : in std_logic;
    I_CLK              : in std_logic;
    I_ENA_12           : in std_logic;
    I_ENA_6            : in std_logic;

	 scanSW			   	  : in    std_logic_vector(20 downto 0);
	 resetKey              : in    std_logic;
	 scandblctrl           : in    std_logic_vector(1 downto 0)
    );
end;

architecture RTL of THEBLOB is



	--constant HWSEL_PACMANICMINERMAN : boolean := false ; -- p2 joystick right used for jump, collides with default config.
    signal I_SW           : std_logic_vector(3 downto 0); -- active high
    signal O_LED          : std_logic_vector(2 downto 0);
    signal OSC_IN         : std_logic;
																			
    
	 signal I_RESET_L        : std_logic;
    signal reset            : std_logic;
    signal clk_ref          : std_logic;
    signal clk              : std_logic;
    signal ena_12           : std_logic;
    signal ena_6            : std_logic;

    -- timing
    signal hcnt             : std_logic_vector(8 downto 0) := "010000000"; -- 80
    signal vcnt             : std_logic_vector(8 downto 0) := "011111000"; -- 0F8

    signal do_hsync         : boolean;
    signal hsync            : std_logic;
    signal vsync            : std_logic;
    signal hblank           : std_logic;
    signal vblank           : std_logic := '1';
    signal h1_inv           : std_logic;
    signal comp_sync_l      : std_logic;

    -- cpu
    signal cpu_ena          : std_logic;
    signal cpu_m1_l         : std_logic;
    signal cpu_mreq_l       : std_logic;
    signal cpu_iorq_l       : std_logic;
    signal cpu_rd_l         : std_logic;
    signal cpu_wr_l         : std_logic;
    signal cpu_rfsh_l       : std_logic;
    signal cpu_halt_l       : std_logic;
    signal cpu_wait_l       : std_logic;
    signal cpu_int_l        : std_logic;
    signal cpu_nmi_l        : std_logic;
    signal cpu_busrq_l      : std_logic;
    signal cpu_busak_l      : std_logic;
    signal cpu_addr         : std_logic_vector(15 downto 0);
    signal cpu_data_out     : std_logic_vector(7 downto 0);
    signal cpu_data_in      : std_logic_vector(7 downto 0);

	 signal rom_x,rom_d      : std_logic_vector(7 downto 0);
	 signal dcnt             : std_logic_vector(1 downto 0);
	 signal old_rd_l         : std_logic;

    signal sync_bus_cs_l    : std_logic;

    signal control_reg      : std_logic_vector(7 downto 0);
    --
    signal vram_addr_ab     : std_logic_vector(11 downto 0);
    signal ab               : std_logic_vector(11 downto 0);

    signal sync_bus_db      : std_logic_vector(7 downto 0);
    signal sync_bus_r_w_l   : std_logic;
    signal sync_bus_wreq_l  : std_logic;
    signal sync_bus_stb     : std_logic;

    signal cpu_vec_reg      : std_logic_vector(7 downto 0);
    signal sync_bus_reg     : std_logic_vector(7 downto 0);

    signal vram_l           : std_logic;
    signal rams_data_out    : std_logic_vector(7 downto 0);
    -- more decode
    signal wr0_l            : std_logic;
    signal wr1_l            : std_logic;
    signal wr2_l            : std_logic;
    signal iodec_out_l      : std_logic;
    signal iodec_wdr_l      : std_logic;
    signal iodec_in0_l      : std_logic;
    signal iodec_in1_l      : std_logic;
    signal iodec_dipsw_l    : std_logic;

	signal iodec_spr_l      : std_logic;
	signal iodec_sn1_l      : std_logic;
	signal iodec_sn2_l      : std_logic;
	signal iodec_dipsw1_l   : std_logic;
	signal iodec_dipsw2_l   : std_logic;

    -- watchdog
    signal watchdog_cnt     : std_logic_vector(3 downto 0);
    signal watchdog_reset_l : std_logic;
    signal freeze           : std_logic;

    -- ip registers
    signal button_in        : std_logic_vector(15 downto 0);
    signal buttons	       : std_logic_vector(15 downto 0);
    signal button_debounced : std_logic_vector(15 downto 0);
    signal in0_reg          : std_logic_vector(7 downto 0);
    signal in1_reg          : std_logic_vector(7 downto 0);
    signal dipsw1_reg       : std_logic_vector(7 downto 0);
	 signal dipsw2_reg       : std_logic_vector(7 downto 0);
    signal joystick_reg     : std_logic_vector(5 downto 0);
	 signal joystick2_reg    : std_logic_vector(5 downto 0);

    -- scan doubler signals
    signal video_r          : std_logic_vector(2 downto 0);
    signal video_g          : std_logic_vector(2 downto 0);
    signal video_b          : std_logic_vector(1 downto 0);
	 signal blanking         : std_logic_vector(0 downto 0);
    --
    signal video_r_x2       : std_logic_vector(2 downto 0);
    signal video_g_x2       : std_logic_vector(2 downto 0);
    signal video_b_x2       : std_logic_vector(1 downto 0);
    signal hsync_x2         : std_logic;
    signal vsync_x2         : std_logic;
    signal blanking_x2      : std_logic_vector(0 downto 0);
    --
    signal audio            : std_logic_vector(7 downto 0);
    signal audio_pwm        : std_logic;
	 
    signal scan_converter_mode        : std_logic;

begin

  I_RESET_L <= not I_RESET;
  ena_12 <= I_ENA_12;
  ena_6 <= I_ENA_6;
  clk <= I_CLK;
  clk_ref <= I_CLK_REF;

  joystick_reg  <=  I_JOYSTICK_A;
  joystick2_reg <=  I_JOYSTICK_B;
  JOYSTICK_A_GND <= '0';
  JOYSTICK_B_GND <= '0';
  
p_hvcnt : process
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then
		if hcnt = "111111111" then
			hcnt <= "010000000"; -- 080
		else
			hcnt <= hcnt +"1";
		end if;
		-- hcnt 8 on circuit is 256H_L
		if do_hsync then
			if vcnt = "111111111" then
				vcnt <= "011111000"; -- 0F8
			else
				vcnt <= vcnt +"1";
			end if;
		end if;
	end if;
end process;

vsync <= not vcnt(8);
do_hsync <= (hcnt = "010101111"); -- 0AF

p_sync : process
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then

		if (hcnt = "010001111") and not eight_sprites then -- 08F
			hblank <= '1';
		elsif (hcnt = "011101111") and not eight_sprites then
			hblank <= '0'; -- 0EF
		elsif (hcnt = "111111111") and eight_sprites then
			hblank <= '1';
		elsif (hcnt = "011111111") and eight_sprites then
			hblank <= '0';
		end if;

		if do_hsync then
			hsync <= '1';
		elsif (hcnt = "011001111") then -- 0CF
			hsync <= '0';
		end if;

		if do_hsync then
			if (vcnt = "111101111") then -- 1EF
				vblank <= '1';
			elsif (vcnt = "100001111") then -- 10F
				vblank <= '0';
			end if;
		end if;
	end if;
end process;

  p_comp_sync : process(hsync, vsync)
  begin
    comp_sync_l <= (not vsync) and (not hsync);
  end process;

  --
  -- cpu
  --

p_irq_req_watchdog : process
	variable rising_vblank : boolean;
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then
		rising_vblank := do_hsync and (vcnt = "111101111"); -- 1EF

		if (control_reg(0) = '0') then
			cpu_int_l <= '1';
		elsif rising_vblank then -- 1EF
			cpu_int_l <= '0';
		end if;

		-- watchdog 8c
		-- note sync reset
		if (reset = '1') then
			watchdog_cnt <= "1111";
		elsif (iodec_wdr_l = '0') then
			watchdog_cnt <= "0000";
		elsif rising_vblank then
			watchdog_cnt <= watchdog_cnt + "1";
		end if;

		--watchdog_reset_l <= not reset;

		watchdog_reset_l <= '1';
		if (watchdog_cnt = "1111") then
			watchdog_reset_l <= '0';
		end if;
	end if;
end process;

  u_cpu : entity work.T80sed
          port map (
				RESET_n => watchdog_reset_l and (not reset),
				CLK_n   => clk,
				CLKEN   => hcnt(0) and ena_6,
				WAIT_n  => sync_bus_wreq_l,
				INT_n   => cpu_int_l,
				NMI_n   => '1',
				BUSRQ_n => '1',
				M1_n    => cpu_m1_l,
				MREQ_n  => cpu_mreq_l,
				IORQ_n  => cpu_iorq_l,
				RD_n    => cpu_rd_l,
				WR_n    => open,
				RFSH_n  => cpu_rfsh_l,
				HALT_n  => open,
				BUSAK_n => open,
				A       => cpu_addr,
				DI      => cpu_data_in,
				DO      => cpu_data_out
              );
  --
  -- primary addr decode
  --
-- rom     0x0000 - 0x3FFF
-- syncbus 0x4000 - 0x7FFF
sync_bus_cs_l   <= '0' when cpu_mreq_l = '0' and cpu_rfsh_l = '1' and cpu_addr(14) = '1' else '1';
sync_bus_wreq_l <= '0' when sync_bus_cs_l = '0' and hcnt(1) = '1' and cpu_rd_l = '0' else '1';
sync_bus_stb    <= '0' when sync_bus_cs_l = '0' and hcnt(1) = '0' else '1';
sync_bus_r_w_l  <= '0' when sync_bus_stb  = '0' and cpu_rd_l = '1' else '1';

--
-- sync bus custom ic
--
p_sync_bus_reg : process
begin
	wait until rising_edge(clk);
	if (ena_6 = '1') then
		-- register on sync bus module that is used to store interrupt vector
		if (cpu_iorq_l = '0') and (cpu_m1_l = '1') then
			cpu_vec_reg <= cpu_data_out;
		end if;

		-- read holding reg
		if (hcnt(1 downto 0) = "01") then
			sync_bus_reg <= cpu_data_in;
		end if;
	end if;
end process;

  --
  -- vram addr custom ic
  --
  u_vram_addr : entity work.PACMAN_VRAM_ADDR
    port map (
      AB      => vram_addr_ab,
      H256_L  => hcnt(8),
      H128    => hcnt(7),
      H64     => hcnt(6),
      H32     => hcnt(5),
      H16     => hcnt(4),
      H8      => hcnt(3),
      H4      => hcnt(2),
      H2      => hcnt(1),
      H1      => hcnt(0),
      V128    => vcnt(7),
      V64     => vcnt(6),
      V32     => vcnt(5),
      V16     => vcnt(4),
      V8      => vcnt(3),
      V4      => vcnt(2),
      V2      => vcnt(1),
      V1      => vcnt(0),
      FLIP    => control_reg(3)
      );

  p_ab_mux_comb : process(hcnt, cpu_addr, vram_addr_ab)
  begin
    --When 2H is low, the CPU controls the bus.
    if (hcnt(1) = '0') then
      ab <= cpu_addr(11 downto 0);
    else
      ab <= vram_addr_ab;
    end if;
  end process;

  p_vram_comb : process(hcnt, cpu_addr, sync_bus_stb)
    variable a,b : std_logic;
  begin

    a := not (cpu_addr(12) or sync_bus_stb);
    b := hcnt(1) and hcnt(0);
    vram_l <= not (a or b);
  end process;

-- WRITE
-- out_l 0x5000 - 0x503F control space
-- sn1_l 0x5040 - 0x504F sound
-- sn2_l 0x5050 - 0x505F sound
-- spr_l 0x5060 - 0x506F sprite
-- wdr_l 0x50C0 - 0x50FF watchdog reset
iodec_out_l <= '0' when sync_bus_r_w_l = '0' and cpu_addr(15 downto 6) = X"50"&"00" else '1';
iodec_sn1_l <= '0' when sync_bus_r_w_l = '0' and cpu_addr(15 downto 4) = X"50"&X"4" else '1';
iodec_sn2_l <= '0' when sync_bus_r_w_l = '0' and cpu_addr(15 downto 4) = X"50"&X"5" else '1';
iodec_spr_l <= '0' when sync_bus_r_w_l = '0' and cpu_addr(15 downto 4) = X"50"&X"6" else '1';
iodec_wdr_l <= '0' when sync_bus_r_w_l = '0' and cpu_addr(15 downto 6) = X"50"&"11" else '1';

-- READ
-- in0_l   0x5000 - 0x503F in port 0
-- in1_l   0x5040 - 0x507F in port 1
-- dipsw_l 0x5080 - 0x50BF dip switches
iodec_in0_l    <= '0' when sync_bus_r_w_l = '1' and cpu_addr(15 downto 6) = X"50"&"00" else '1';
iodec_in1_l    <= '0' when sync_bus_r_w_l = '1' and cpu_addr(15 downto 6) = X"50"&"01" else '1';
iodec_dipsw1_l <= '0' when sync_bus_r_w_l = '1' and cpu_addr(15 downto 6) = X"50"&"10" else '1';
iodec_dipsw2_l <= '0' when sync_bus_r_w_l = '1' and cpu_addr(15 downto 6) = X"50"&"11" else '1';

p_control_reg : process
begin
	-- 8 bit addressable latch 7K
	-- (made into register)

	-- 0 interrupt ena
	-- 1 sound ena
	-- 2 not used
	-- 3 flip
	-- 4 1 player start lamp
	-- 5 2 player start lamp
	-- 6 coin lockout
	-- 7 coin counter

	wait until rising_edge(clk);
	if (ena_6 = '1') then
		if (watchdog_reset_l = '0') then
			control_reg <= (others => '0');
		elsif (iodec_out_l = '0') then
			control_reg(to_integer(unsigned(cpu_addr(2 downto 0)))) <= cpu_data_out(0);
		end if;
	end if; 
end process;

  p_db_mux_comb : process(hcnt, cpu_data_out, rams_data_out)
  begin
    -- simplified data source for video subsystem
    -- only cpu or ram are sources of interest
    if (hcnt(1) = '0') then
      sync_bus_db <= cpu_data_out;
    else
      sync_bus_db <= rams_data_out;
    end if;
  end process;

p_decrypt : process
begin
	wait until rising_edge(clk);
	if watchdog_reset_l = '0' then
		dcnt <= "10"; --Parte baja de 0x0a (10 10)
	else
		old_rd_l <= cpu_rd_l;
		if old_rd_l = '1' and cpu_rd_l = '0' and cpu_iorq_l = '0' and cpu_m1_l = '1' then
			if cpu_addr(0) = '1' then
				dcnt <= dcnt - "1";
			else
				dcnt <= dcnt + "1";
			end if;
		end if;
	end if;
end process;

rom_d <= not rom_x(3) & not rom_x(7) &     rom_x(0) & not rom_x(6) & not rom_x(4) &     rom_x(1) & not rom_x(2) & not rom_x(5) when dcnt = "00" else
         not rom_x(1) & not rom_x(7) &     rom_x(0) &     rom_x(3) & not rom_x(4) & not rom_x(6) & not rom_x(2) & not rom_x(5) when dcnt = "01" else
         not rom_x(3) & not rom_x(0) & not rom_x(4) & not rom_x(6) &     rom_x(7) &     rom_x(1) & not rom_x(2) & not rom_x(5) when dcnt = "10" else
         not rom_x(1) & not rom_x(0) & not rom_x(4) &     rom_x(3) &     rom_x(7) & not rom_x(6) & not rom_x(2) & not rom_x(5);


cpu_data_in <=	cpu_vec_reg      when (cpu_iorq_l = '0') and (cpu_m1_l = '0') else 
					sync_bus_reg     when sync_bus_wreq_l = '0' else
					rom_d            when cpu_addr(14) = '0' else -- ROM Decrypter
					in0_reg          when iodec_in0_l = '0' else
					in1_reg          when iodec_in1_l = '0' else
					dipsw1_reg       when iodec_dipsw1_l = '0' else
					dipsw2_reg       when iodec_dipsw2_l = '0' else
					rams_data_out;--ram_data;

  u_rams : entity work.PACMAN_RAMS
    port map (
      -- note, we get a one clock delay from our rams
      I_AB     => ab,
      I_DATA   => cpu_data_out, -- cpu only source of ram data
      O_DATA   => rams_data_out,
      I_R_W_L  => sync_bus_r_w_l,
      I_VRAM_L => vram_l,
      ENA_6    => ena_6,
      CLK      => clk
      );

  -- example of internal program rom, if you have a big enough device
  u_program_rom : entity work.ROM_PGM_0
    port map (
      CLK         => clk,
      ENA         => ena_6,
      ADDR        => cpu_addr(13 downto 0),
      DATA        => rom_x
      );

--	Commented out for use on the Papilio board so ROMs can be merged into the bitstream. Not enough BRAM to include this for the Papilio One.
--  u_program_wiz : entity work.ROM_PGM_1
--    port map (
--      CLK         => clk,
--      ENA         => ena_6,
--      ADDR        => cpu_addr(12 downto 0),
--      DATA        => program_rom_dinh
--      );

  --
  -- video subsystem
  --
  u_video : entity work.PACMAN_VIDEO
    port map (
      I_HCNT        => hcnt,
      I_VCNT        => vcnt,
      --
      I_AB          => ab,
      I_DB          => sync_bus_db,
      --
      I_HBLANK      => hblank,
      I_VBLANK      => vblank,
      I_FLIP        => control_reg(3),
      I_WR2_L       => iodec_spr_l,--wr2_l,
      --
      O_RED         => video_r,
      O_GREEN       => video_g,
      O_BLUE        => video_b,
      O_BLANKING    => blanking,
      --
      ENA_6         => ena_6,
      CLK           => clk
      );

  -- if PACMAN_DBLSCAN used, remember to add pacman_dblscan.vhd to the
  -- sythesis script you are using (pacman.prg for xst / webpack)
  --
  u_dblscan : entity work.VGA_SCANDBL
    port map (
      I_R          => video_r,
      I_G          => video_g,
      I_B          => video_b,
      I_HSYNC      => hsync,
      I_VSYNC      => vsync,
		I_BLANKING   => blanking,
		
      O_R          => video_r_x2,
      O_G          => video_g_x2,
      O_B          => video_b_x2,
      O_HSYNC      => hsync_x2,
      O_VSYNC      => vsync_x2,
		O_BLANKING   => blanking_x2,
      --
      CLK          => ena_6,
      CLK_X2       => ena_12,
		scanlines	 => scandblctrl(1) xor scanSW(8)
    );

	scan_converter_mode <= scandblctrl(0) xor scanSW(6);
  p_video_ouput : process
  begin
    wait until rising_edge(clk);
    -- switch is on (up) use scan converter and light led
--    O_LED(3 downto 1) <= "000";

--    O_VIDEO_R(0) <= '0';
--    O_VIDEO_G(0) <= '0';
--    O_VIDEO_B(1 downto 0) <= "00";

    if (scan_converter_mode = '1') then
--      O_LED(0) <= '1';
      O_VIDEO_R(2 downto 0) <= video_r_x2;
      O_VIDEO_G(2 downto 0) <= video_g_x2;
      O_VIDEO_B(2 downto 0) <= video_b_x2 & video_b_x2(0);
      O_HSYNC   <= hSync_X2;
      O_VSYNC   <= vSync_X2;
		O_BLANKING <= blanking_x2;
    else
--      O_LED(0) <= '0';
      O_VIDEO_R(2 downto 0) <= video_r;
      O_VIDEO_G(2 downto 0) <= video_g;
      O_VIDEO_B(2 downto 0) <= video_b & video_b(0);
		O_HSYNC   <= comp_sync_l;
      O_VSYNC   <= '1';
		O_BLANKING <= blanking;
    end if;
  end process;
  --O_COMP_SYNC_L <= comp_sync_l;

  --
  --
  -- audio subsystem
  --
  u_audio : entity work.PACMAN_AUDIO
    port map (
      I_HCNT        => hcnt,
      --
      I_AB          => ab,
      I_DB          => sync_bus_db,
      --
      I_WR1_L       => iodec_sn2_l, --wr1_l,
      I_WR0_L       => iodec_sn1_l, --wr0_l,
      I_SOUND_ON    => control_reg(1),
      --
      O_AUDIO       => audio,
      ENA_6         => ena_6,
      CLK           => clk
      );
  --
  -- Audio DAC
  --
  u_dac : entity work.dac
    generic map(
      msbi_g => 7
    )
    port  map(
      clk_i   => clk_ref,
      res_n_i => I_RESET_L,
      dac_i   => audio,
      dac_o   => audio_pwm
    );

  O_AUDIO_L <= audio_pwm;
  O_AUDIO_R <= audio_pwm;

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

  u_debounce : entity work.PACMAN_DEBOUNCE
  generic map (
    G_WIDTH => 16
    )
  port map (
    I_BUTTON => buttons,
    O_BUTTON => button_debounced,
    CLK      => clk
    );

  p_input_registers : process
  begin
    wait until rising_edge(clk);
    if (ena_6 = '1') then
      in0_reg(7) <= button_debounced(14);		-- p2 fire 2
      in0_reg(6) <= '1';		               -- ? coin2
      in0_reg(5) <= button_debounced(8);		-- coin1		
      in0_reg(4) <= '1';                     -- ? Service Mode - test_l dipswitch (rack advance)
      in0_reg(3) <= button_debounced(1); 		-- p1 down
      in0_reg(2) <= button_debounced(3); 		-- p1 right
      in0_reg(1) <= button_debounced(2); 		-- p1 left
      in0_reg(0) <= button_debounced(0); 		-- p1 up

      in1_reg(7) <= '1';                     -- Table 1=Up / 0=Coskctail
      in1_reg(6) <= button_debounced(7) and button_debounced(5); 		-- start2 y 1p Fire 2
      in1_reg(5) <= button_debounced(6) and button_debounced(4); 		-- start1 y 1p Fire 1
      in1_reg(4) <= button_debounced(13);    -- p2 fire 1
      in1_reg(3) <= button_debounced(10);		-- p2 down
      in1_reg(2) <= button_debounced(12); 	-- p2 right
      in1_reg(1) <= button_debounced(11); 	-- p2 left
      in1_reg(0) <= button_debounced(9); 		-- p2 up		

      freeze <= '0';	  
      -- on is 0
      dipsw1_reg(7) <= '1';            -- (Hz VGA modo Cocktail? Con 0 en modo cocktail VGA va mal)
      dipsw1_reg(6) <= '1';            -- ?
      dipsw1_reg(5) <= '0';            -- Demo sounds 0=on / 1=off
      dipsw1_reg(4 downto 2) <= "100"; --Dificultad 111=Easiest / 110=Very esasy / 101=Easy / 100=Normal / 011=Dificult / 010=Very Dificult / 001= Very Hard / 000=Hardest
      dipsw1_reg(1 downto 0) <= "11";  --Vidas 11=3 / 10=4 / 01=5 / 00=6
		dipsw2_reg <= "00000000";
    end if;
  end process;

end RTL;
