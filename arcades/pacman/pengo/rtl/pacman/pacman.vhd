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
entity PACMAN is
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

architecture RTL of PACMAN is

	constant PACMAN         : std_logic := '0'; -- 1 for Pacman hardware, 0 for Pengo hardware
	signal decoder_ena_l    : std_logic;

	signal I_RESET_L        : std_logic;
	signal reset            : std_logic;
	signal clk_ref          : std_logic;
	signal clk              : std_logic;
	signal ena_12           : std_logic;
	signal ena_6            : std_logic;

	-- timing
	signal hcnt             : std_logic_vector( 8 downto 0) := "010000000"; -- 80
	signal vcnt             : std_logic_vector( 8 downto 0) := "011111000"; -- 0F8

	signal do_hsync         : boolean := true;
	signal hsync            : std_logic := '1';
	signal vsync            : std_logic := '1';
	signal hblank           : std_logic;
	signal vblank           : std_logic;
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
	signal cpu_data_out     : std_logic_vector( 7 downto 0);
	signal cpu_data_in      : std_logic_vector( 7 downto 0);

	signal program_rom_dinl : std_logic_vector( 7 downto 0);
	signal program_rom_dinh : std_logic_vector( 7 downto 0);
	signal rom_to_dec       : std_logic_vector( 7 downto 0);
	signal rom_from_dec     : std_logic_vector( 7 downto 0);
--	signal program_rom_cs_l : std_logic;

	signal control_reg      : std_logic_vector( 7 downto 0);
	--
	signal vram_addr_ab     : std_logic_vector(11 downto 0);
	signal ab               : std_logic_vector(11 downto 0);

	signal sync_bus_reg     : std_logic_vector( 7 downto 0);
	signal sync_bus_db      : std_logic_vector( 7 downto 0);
	signal sync_bus_r_w_l   : std_logic;
	signal sync_bus_wreq_l  : std_logic;
	signal sync_bus_stb     : std_logic;
	signal sync_bus_cs_l    : std_logic;

	signal cpu_vec_reg      : std_logic_vector( 7 downto 0) := (others => '0');
	signal ps_reg           : std_logic_vector( 2 downto 0);

	signal vram_l           : std_logic;
	signal rams_data_out    : std_logic_vector( 7 downto 0);
	-- more decode
	signal wr0_l            : std_logic := '1';
	signal wr1_l            : std_logic := '1';
	signal wr2_l            : std_logic := '1';
	signal iodec_out_l      : std_logic := '1';
	signal iodec_wdr_l      : std_logic := '1';
	signal iodec_in0_l      : std_logic := '1';
	signal iodec_in1_l      : std_logic := '1';
	signal iodec_dipsw1_l   : std_logic := '1';
	signal iodec_dipsw2_l   : std_logic := '1';

	-- watchdog
	signal watchdog_cnt     : std_logic_vector( 3 downto 0);
	signal watchdog_reset_l : std_logic := '1';
	signal freeze           : std_logic;

	-- input registers
   signal joystick_reg     : std_logic_vector( 5 downto 0);
	signal joystick2_reg     : std_logic_vector(5 downto 0);
	signal button_in        : std_logic_vector( 15 downto 0);
	signal button_debounced : std_logic_vector( 15 downto 0);
	signal buttons	         : std_logic_vector( 15 downto 0);
	
	signal in0_reg          : std_logic_vector( 7 downto 0) := (others => '1');
	signal in1_reg          : std_logic_vector( 7 downto 0) := (others => '1');
	signal dipsw1_reg       : std_logic_vector( 7 downto 0) := "11001001";
	signal dipsw2_reg       : std_logic_vector( 7 downto 0);

	-- scan doubler signals
	signal video_r          : std_logic_vector( 2 downto 0);
	signal video_g          : std_logic_vector( 2 downto 0);
	signal video_b          : std_logic_vector( 1 downto 0);
   signal blanking         : std_logic_vector(0 downto 0);
	--
	signal video_r_x2       : std_logic_vector( 2 downto 0);
	signal video_g_x2       : std_logic_vector( 2 downto 0);
	signal video_b_x2       : std_logic_vector( 1 downto 0);
	signal hsync_x2         : std_logic;
	signal vsync_x2         : std_logic;
	signal blanking_x2      : std_logic_vector(0 downto 0);
	--
	signal audio            : std_logic_vector( 7 downto 0);
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


	--
	-- video timing
	--
	p_hvcnt : process
	variable hcarry,vcarry : boolean;
	begin
		wait until rising_edge(clk);
		if (ena_6 = '1') then
			hcarry := (hcnt = "111111111");
			if hcarry then
				hcnt <= "010000000"; -- 080
			else
				hcnt <= hcnt +"1";
			end if;
			-- hcnt 8 on circuit is 256H_L
			vcarry := (vcnt = "111111111");
			if do_hsync then
				if vcarry then
					vcnt <= "011111000"; -- 0F8
				else
					vcnt <= vcnt +"1";
				end if;
			end if;
		end if;
	end process;

   p_sync_comb : process(hcnt, vcnt)
   begin
     vsync <= not vcnt(8);
     do_hsync <= (hcnt = "010101111"); -- 0AF
   end process;

	p_sync : process
	begin
		wait until rising_edge(clk);
		if (ena_6 = '1') then
			-- Timing hardware is coded differently to the real hw
			-- to avoid the use of multiple clocks. Result is identical.

			if (hcnt = "010001111") then -- 08F
				hblank <= '1';
			elsif (hcnt = "011101111") then
				hblank <= '0'; -- 0EF
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

	u_cpu : entity work.T80sed
	port map (
		RESET_n => watchdog_reset_l,
		CLK_n   => clk,
		CLKEN   => cpu_ena,
		WAIT_n  => cpu_wait_l,
		INT_n   => cpu_int_l,
		NMI_n   => cpu_nmi_l,
		BUSRQ_n => cpu_busrq_l,
		M1_n    => cpu_m1_l,
		MREQ_n  => cpu_mreq_l,
		IORQ_n  => cpu_iorq_l,
		RD_n    => cpu_rd_l,
		WR_n    => cpu_wr_l,
		RFSH_n  => cpu_rfsh_l,
		HALT_n  => cpu_halt_l,
		BUSAK_n => cpu_busak_l,
		A       => cpu_addr,
		DI      => cpu_data_in,
		DO      => cpu_data_out
	);

	--
	-- cpu
	--
	p_cpu_wait_comb : process(freeze, sync_bus_wreq_l)
	begin
		cpu_wait_l  <= '1';
		if (freeze = '1') or (sync_bus_wreq_l = '0') then
			cpu_wait_l  <= '0';
		end if;
	end process;

	p_irq_req_watchdog : process
	variable rising_vblank : boolean;
	begin
		wait until rising_edge(clk);
		if (ena_6 = '1') then
			rising_vblank := do_hsync and (vcnt = "111101111"); -- 1EF
			--rising_vblank := do_hsync; -- debug
			-- interrupt 8c

			if (control_reg(0) = '0') then
				cpu_int_l <= '1';
			elsif rising_vblank then -- 1EF
				cpu_int_l <= '0';
			end if;

			-- watchdog 8c
			-- note sync reset
				reset <= resetKey;
			if (reset = '1') then
				watchdog_cnt <= "1111";
			elsif (iodec_wdr_l = '0') then
				watchdog_cnt <= "0000";
			elsif rising_vblank and (freeze = '0') then
				watchdog_cnt <= watchdog_cnt + "1";
			end if;

			watchdog_reset_l <= '1';
			if (watchdog_cnt = "1111") then
				watchdog_reset_l <= '0';
			end if;

			-- simulation
			-- pragma translate_off
			-- synopsys translate_off
			watchdog_reset_l <= not reset; -- watchdog disable
			-- synopsys translate_on
			-- pragma translate_on
		end if;
	end process;

	-- other cpu signals
	cpu_busrq_l <= '1';
	cpu_nmi_l   <= '1';	
	
	p_cpu_ena : process(hcnt, ena_6)
	begin
		cpu_ena <= '0';
		if (ena_6 = '1') then
			cpu_ena <= hcnt(0);
		end if;
	end process;

	--
	-- primary addr decode
	--
	p_mem_decode_comb : process(cpu_rfsh_l, cpu_rd_l, cpu_mreq_l, cpu_addr)
	begin
		-- 7M
		-- 7N
		sync_bus_cs_l <= '1';
		--    program_rom_cs_l  <= '1';

		if (cpu_mreq_l = '0') and (cpu_rfsh_l = '1') then

			--      if (cpu_addr(14) = '0') and (cpu_rd_l = '0') then
			--         program_rom_cs_l <= '0';
			--      end if;

			if (PACMAN = '0' and cpu_addr(15) = '1') or (PACMAN = '1' and cpu_addr(14) = '1')then
				sync_bus_cs_l <= '0';
			end if;

		end if;
	end process;

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

	p_sync_bus_comb : process(cpu_rd_l, sync_bus_cs_l, hcnt)
	begin
		-- sync_bus_stb is now an active low clock enable signal
		sync_bus_stb <= '1';
		sync_bus_r_w_l <= '1';

		if (sync_bus_cs_l = '0') and (hcnt(1) = '0') then
			if (cpu_rd_l = '1') then
				sync_bus_r_w_l <= '0';
			end if;
			sync_bus_stb <= '0';
		end if;

		sync_bus_wreq_l <= '1';
		if (sync_bus_cs_l = '0') and (hcnt(1) = '1') and (cpu_rd_l = '0') then
			sync_bus_wreq_l <= '0';
		end if;
	end process;
 
	--
	-- vram addresser custom ic
	--
	u_vram_addr : entity work.PACMAN_VRAM_ADDR
	port map (
		AB      => vram_addr_ab,
		H       => hcnt,
		V       => vcnt(7 downto 0),
		FLIP    => control_reg(3)
	);

	--When 2H is low, the CPU controls the bus.
	ab <= cpu_addr(11 downto 0) when hcnt(1) = '0' else vram_addr_ab;

	--  vram_l <= ( ( cpu_addr(12) or sync_bus_stb ) and not ( hcnt(1) and hcnt(0) ) );
	vram_l <= ( ( cpu_addr(12) or sync_bus_stb ) and ( not hcnt(1) ) );

	-- PENGO                                                   PACMAN

	-- WRITE
	-- wr0_l    0x9000 - 0x900F voice 1,2,3 waveform           wr0_l    0x5040 - 0x504F sound
	-- wr1_l    0x9010 - 0x901F x50 wr voice 1,2,3 freq/vol    wr1_l    0x5050 - 0x505F sound
	-- wr2_l    0x9020 - 0x902F sprites                        wr2_l    0x5060 - 0x506F sprite
	--                                                                  0x5080 - 0x50BF unused
	-- out_l    0x9040 - 0x904F control space                  out_l    0x5000 - 0x503F control space
	-- wdr_l    0x9070 - 0x907F watchdog reset                 wdr_l    0x50C0 - 0x50FF watchdog reset

	-- READ
	-- dipsw2_l 0x9000 - 0x903F dip switch 2
	-- dipsw1_l 0x9040 - 0x907F dip switch 1                   dipsw1_l 0x5080 - 0x50BF dip switches
	-- in1_l    0x9080 - 0x90BF in port 1                      in1_l    0x5040 - 0x507F in port 1
	-- in0_l    0x90C0 - 0x90FF in port 0                      in0_l    0x5000 - 0x503F in port 0

	-- writes                                           <------------- PENGO ------------->    <------------- PACMAN ------------>
	wr0_l          <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"0") or (PACMAN='1' and ab(7 downto 4)=x"4") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr voice 1,2,3 waveform
	wr1_l          <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"1") or (PACMAN='1' and ab(7 downto 4)=x"5") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr voice 1,2,3 freq/vol
	wr2_l          <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"2") or (PACMAN='1' and ab(7 downto 4)=x"6") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr sprites
	iodec_out_l    <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"4") or (PACMAN='1' and ab(7 downto 6)="00") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr control space
	iodec_wdr_l    <= '0' when sync_bus_r_w_l='0' and ( (PACMAN='0' and ab(7 downto 4)=x"7") or (PACMAN='1' and ab(7 downto 6)="11") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- wr watchdog reset
                                                                                                                                        
	-- reads                                                                                                                             
	iodec_dipsw2_l <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="00") or (PACMAN='1' and ab(7 downto 6)="11") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in dip sw2
	iodec_dipsw1_l <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="01") or (PACMAN='1' and ab(7 downto 6)="10") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in dip sw1
	iodec_in1_l    <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="10") or (PACMAN='1' and ab(7 downto 6)="01") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in port 1 
	iodec_in0_l    <= '0' when sync_bus_r_w_l='1' and ( (PACMAN='0' and ab(7 downto 6)="11") or (PACMAN='1' and ab(7 downto 6)="00") ) and cpu_addr(12)='1' and sync_bus_stb='0' else '1'; -- rd in port 0 

	ps_reg <= control_reg(7) & control_reg(6) & control_reg(2) when PACMAN = '0' else "000";

	p_control_reg : process
	variable ena : std_logic_vector(7 downto 0);
	begin

		wait until rising_edge(clk);
		if (ena_6 = '1') then
			ena := "00000000";
		-- 8 bit addressable latch 7K  (made into register)

		--   PENGO            PACMAN
		-- 0 Interrupt ena    Interrupt ena
		-- 1 Sound ena        Sound ena
		-- 2 PS1              Not used
		-- 3 Flip             Flip
		-- 4 Coin 1 meter     1 player start lamp
		-- 5 Coin 2 meter     2 player start lamp
		-- 6 PS2              Coin lockout
		-- 7 PS3              Coin counter
			if (iodec_out_l = '0') then
				case ab(2 downto 0) is
					when "000" => ena := "00000001";
					when "001" => ena := "00000010";
					when "010" => ena := "00000100";
					when "011" => ena := "00001000";
					when "100" => ena := "00010000";
					when "101" => ena := "00100000";
					when "110" => ena := "01000000";
					when "111" => ena := "10000000";
					when others => null;
				end case;
			end if;

			if (watchdog_reset_l = '0') then
				control_reg <= (others => '0');
			else
				for i in 0 to 7 loop
					if (ena(i) = '1') then
						control_reg(i) <= cpu_data_out(0);
					end if;
				end loop;
			end if;
		end if;
	end process;

	-- simplified data source for video subsystem
	-- only cpu or ram are sources of interest
	sync_bus_db <= cpu_data_out when hcnt(1) = '0' else rams_data_out;

	-- simplifed again
	cpu_data_in <=	cpu_vec_reg      when (cpu_iorq_l = '0') and (cpu_m1_l = '0') else
						sync_bus_reg     when (sync_bus_wreq_l = '0') else
						rom_from_dec     when (PACMAN = '0' and cpu_addr(15) = '0') else  -- ROM at 0000 - 7fff (Pengo decoded)
						program_rom_dinl when (PACMAN = '1' and cpu_addr(15 downto 14) = "00") else   -- ROM at 0000 - 3fff (Pacman/Pengo)
						program_rom_dinh when (PACMAN = '1' and cpu_addr(15 downto 13) = "100") else  -- ROM at 8000 - 9fff (LizWiz)
						in0_reg          when (iodec_in0_l = '0') else
						in1_reg          when (iodec_in1_l = '0') else
						dipsw1_reg       when (iodec_dipsw1_l = '0') else
						dipsw2_reg       when (iodec_dipsw2_l = '0') else
						rams_data_out;

	rom_to_dec <=	program_rom_dinl when cpu_addr(15 downto 14) = "00" else  -- ROM at 0000 - 3fff (Pengo)
						program_rom_dinh when cpu_addr(15 downto 14) = "01" else  -- ROM at 4000 - 7fff (Pengo)
						(others => '0');

	decoder_ena_l <= (PACMAN or cpu_addr(15));

	-- Sega ROM descrambler adapted from MAME segacrpt.c source code
	u_sega_decode : entity work.sega_decode
	port map (
		I_EN_n   => decoder_ena_l,
		I_CK     => clk,
		I_A(6)   => cpu_m1_l,
		I_A(5)   => cpu_addr(12),
		I_A(4)   => cpu_addr(8),
		I_A(3)   => cpu_addr(4),
		I_A(2)   => cpu_addr(0),
		I_A(1)   => rom_to_dec(5),
		I_A(0)   => rom_to_dec(3),
		I_D      => rom_to_dec,
		O_D      => rom_from_dec
	);

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
	u_program_rom0 : entity work.ROM_PGM_0
	port map (
		CLK         => clk,
		ENA         => ena_6,
		ADDR        => cpu_addr(13 downto 0),
		DATA        => program_rom_dinl
	);

	u_program_rom1 : entity work.ROM_PGM_1
	port map (
		CLK         => clk,
		ENA         => ena_6,
		ADDR        => cpu_addr(13 downto 0),
		DATA        => program_rom_dinh
	);

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
		I_PS          => ps_reg,
		I_WR2_L       => wr2_l,
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
		if (scan_converter_mode = '1') then
		O_VIDEO_R(2 downto 0) <= video_r_x2;
		O_VIDEO_G(2 downto 0) <= video_g_x2;
		O_VIDEO_B(2 downto 0) <= video_b_x2 & video_b_x2(0);
		O_HSYNC   <= hSync_X2;
		O_VSYNC   <= vSync_X2;
		O_BLANKING <= blanking_x2;
	else
	   O_VIDEO_R(2 downto 0) <= video_r;
      O_VIDEO_G(2 downto 0) <= video_g;
      O_VIDEO_B(2 downto 0) <= video_b & video_b(0); -- 2 downto 1
      O_HSYNC   <= comp_sync_l;
      O_VSYNC   <= '1';
      O_BLANKING <= blanking;
    end if;
	end process;

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
		I_WR1_L       => wr1_l,
		I_WR0_L       => wr0_l,
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
		clk_i   => ena_12,
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
				in0_reg(7) <= button_debounced(4);   -- p1 fire
				in0_reg(6) <= '1';                   -- service
				in0_reg(5) <= button_debounced(15);                   -- coin2
				in0_reg(4) <= button_debounced(8);   -- coin1
				in0_reg(3) <= button_debounced(3);   -- p1 right
				in0_reg(2) <= button_debounced(2);   -- p1 left
				in0_reg(1) <= button_debounced(1);   -- p1 dw 
				in0_reg(0) <= button_debounced(0);   -- p1 up

				in1_reg(7) <= button_debounced(13);  -- p2 fire
				in1_reg(6) <= button_debounced(7);   -- start2
				in1_reg(5) <= button_debounced(6);   -- start1
				in1_reg(4) <= '1';                   -- test
				in1_reg(3) <= button_debounced(12);  -- p2 right 
				in1_reg(2) <= button_debounced(11);  -- p2 left
				in1_reg(1) <= button_debounced(10);  -- p2 down
				in1_reg(0) <= button_debounced(9);   -- p2 up 

				freeze <= '0';
				-- closed is low
				dipsw1_reg(7 downto 6) <= "11";    -- easy
				dipsw1_reg(5) <= '1';              -- normal play
				dipsw1_reg(4 downto 3) <= "10";    -- 3 pengos
				dipsw1_reg(2) <= '0';              -- upright=0 cocktail=1
				dipsw1_reg(1) <= '0';              -- attrack sound on
				dipsw1_reg(0) <= '0';              -- bonus at 30K

				dipsw2_reg <= "11011101";          -- 1 coin/1 play
		end if;
	end process;
end RTL;
