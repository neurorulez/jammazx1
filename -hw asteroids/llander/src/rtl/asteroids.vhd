--
-- A simulation model of Asteroids hardware modified to drive a real vector monitor using a VGA DAC 
-- James Sweet 2016
-- This is not endorsed by fpgaarcade, please do not bother MikeJ with support requests
--
-- Built upon model of Asteroids Deluxe hardware
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
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

 entity ASTEROIDS is
  port (
    --BUTTON            : in    std_logic_vector(15 downto 1); -- active low
    BUTTON            : in    std_logic_vector(7 downto 0); -- active low
	 SELF_TEST_SWITCH_L: in		std_logic; 
    --
    AUDIO_OUT         : out   std_logic_vector(7 downto 0);
    --
    X_VECTOR          : out   std_logic_vector(9 downto 0);
    Y_VECTOR          : out   std_logic_vector(9 downto 0);
    Z_VECTOR          : out   std_logic_vector(3 downto 0);
    BEAM_ON           : out   std_logic;
    BEAM_ENA          : out   std_logic;
	 START1_LED_L		 : out 	std_logic;
	 START2_LED_L		 : out	std_logic;
	 L_COIN_COUNTER	 : out   std_logic;
	 C_COIN_COUNTER    : out   std_logic;
	 R_COIN_COUNTER	 : out   std_logic;
    --
	 --PROG_ROM_ADDR		 : out std_logic_vector(12 downto 0);
	 --PROG_ROM_DATA		 : in	std_logic_vector(7 downto 0);
	 --
    RESET_6_L         : in    std_logic;
    CLK_6             : in    std_logic
	 );
end;

architecture RTL of ASTEROIDS is
--  constant SELF_TEST_SWITCH_L : std_logic := '1';
  signal ena_count            : std_logic_vector(10 downto 0) := (others => '0');
  signal ena_3M               : std_ulogic;
  signal ena_1_5M             : std_ulogic;
  signal ena_1_5M_e           : std_ulogic;
  signal ena_48k					: std_ulogic;
  signal ena_12K              : std_ulogic;
  signal ena_3K               : std_ulogic;
  signal clk_3K               : std_ulogic;
  signal ena_6K  					: std_ulogic;
  signal clk_6K					: std_ulogic;

  -- cpu
  signal c_addr               : std_logic_vector(23 downto 0);
  signal c_din                : std_logic_vector(7 downto 0);
  signal c_dout               : std_logic_vector(7 downto 0);
  signal c_rw_l               : std_logic;
  signal c_irq_l              : std_logic;
  signal c_nmi_l              : std_logic;
  signal reset_l              : std_logic;
  signal wd_cnt               : std_logic_vector(7 downto 0);
  --
  signal nmi_count            : std_logic_vector(3 downto 0);
  -- addr decode
  signal ram_we               : std_logic;
  signal zpage_l              : std_logic;
  signal vmem_l               : std_logic;
  signal pmem_l               : std_logic;
  --
  signal sinp0_l              : std_logic;
  signal sinp1_l              : std_logic;
  signal dpts_l               : std_logic;
  signal thrust_l             : std_logic;
  --
  signal dma_go_l             : std_logic;
  signal out_l            		: std_logic;
  signal wdclr_l              : std_logic;
  signal explode_l            : std_logic;
  signal dma_reset_l          : std_logic;
  signal thump_l          		: std_logic;
  signal audio_l              : std_logic;
  signal noiserst_l           : std_logic;
  --
  signal shipthrusten         : std_logic;
  signal ramsel_l             : std_logic;
  --
  signal test_l               : std_logic;
  signal halt                 : std_logic;

  -- memory
  signal rom0_dout            : std_logic_vector(7 downto 0);
  signal rom1_dout            : std_logic_vector(7 downto 0);
  signal rom2_dout            : std_logic_vector(7 downto 0);
  signal rom3_dout            : std_logic_vector(7 downto 0);
  signal rom_dout             : std_logic_vector(7 downto 0);
  signal ram_addr             : std_logic_vector(9 downto 0);
  signal ram_dout             : std_logic_vector(7 downto 0);
  signal vg_dout              : std_logic_vector(7 downto 0);


  -- io
  signal dips_p6_l            : std_logic_vector(7 downto 0);
  signal dips_ip_sel          : std_logic_vector(1 downto 0);

  signal control_ip0_l        : std_logic_vector(4 downto 0);
  signal control_ip0_sel      : std_logic;
  signal control_ip1_l        : std_logic_vector(7 downto 0);
  signal control_ip1_sel      : std_logic;
  signal control_thr_l        : std_logic_vector(7 downto 0);
  signal control_thr_sel      : std_logic;

  -- sound
  signal aud						: std_logic_vector(5 downto 0);
  signal tone3khz					: std_logic_vector(3 downto 0);
  signal tone6khz					: std_logic_vector(3 downto 0);

  signal t_e_vol               : std_logic_vector(2 downto 0);

  signal noise_shift          : std_logic_vector(15 downto 0);
  signal noise                : std_logic;
  signal shpsnd               : std_logic_vector(3 downto 0);
  signal lifesnd					: std_logic_vector(3 downto 0);
  signal thumpsnd_filtered		: std_logic_vector(5 downto 0);
   signal firesnd					: std_logic_vector(3 downto 0);
 
  signal saucrsnden				: std_logic;
  signal saucer_snd				: std_logic;
  signal saucrsnd					: std_logic_vector(3 downto 0);
  signal saucer_ramp_count 	: integer range 0 to 80000;
  signal saucer_ramp_term		: integer range 1 to 80000;
  signal pitch_bend				: integer range 0 to 30000;
  signal pitchbendterm 			: integer range 1 to 255;
  signal pitchbendmult			: integer range 1 to 15;
  signal pitch_rising 			: std_logic;
  signal fnum						: std_logic_vector(4 downto 0);
  signal vco_cnt					: std_logic_vector(3 downto 0);
  signal comp						: std_logic;
  signal saucrfireen				: std_logic;
  signal saucrsel_l				: std_logic;
  signal shpfireen				: std_logic;
  
  
  signal shpfr_pitch  			: Integer;
  signal shpfr_decay 			: Integer;
  signal shpfr_count 			: Integer;

  signal saucrfr_pitch  		: Integer;
  signal saucrfr_decay 			: Integer;
  signal saucrfr_count 			: Integer;
  signal saucrfiresnd			: std_logic_vector(3 downto 0);

  signal thump_count				: std_logic_vector(5 downto 0);
  signal thumpsnd 				: std_logic_vector(3 downto 0);
  signal thumpfreq 				: std_logic_vector(3 downto 0);
  signal thumpvol 				: std_logic;

  signal lifeen					: std_logic;
  signal shpsnd_prefilter     : std_logic;
  signal shpsnd_filter_t1     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t2     : std_logic_vector(3 downto 0);
  signal shpsnd_filter_t3     : std_logic_vector(3 downto 0);
  signal shpsnd_filtered      : std_logic_vector(5 downto 0);
  signal expaud               : std_logic_vector(3 downto 0);
  signal expitch              : std_logic_vector(1 downto 0);
  signal noise_cnt            : std_logic_vector(3 downto 0);
  signal expld_snd            : std_logic_vector(3 downto 0);


begin

  p_ena : process -- clock divider
  begin
    wait until rising_edge(CLK_6);
    ena_count <= ena_count + "1";
    ena_3M   <= not ena_count(0); -- 3 Mhz;

    ena_1_5M <= '0';
    ena_1_5M_e <= '0';
    if (ena_count(1 downto 0) = "00") then
      ena_1_5M <= '1'; -- 1.5 Mhz
    end if;
    if (ena_count(1 downto 0) = "10") then
      ena_1_5M_e <= '1'; -- 1.5 Mhz (early)
    end if;
	 
	 ena_48k <= '0';
    if (ena_count(8 downto 0) = "0000000") then
      ena_48k <= '1';
    end if;

	 
    ena_12k <= '0';
    if (ena_count(8 downto 0) = "000000000") then
      ena_12k <= '1';
    end if;
	 ena_6k <= '0';
	 if (ena_count(9 downto 0) = "000000000") then
		ena_6k <= '1';
	 end if;
	 clk_6k <= ena_count(9);

    ena_3k <= '0';
    if (ena_count(10 downto 0) ="00000000000") then
      ena_3k <= '1';
    end if;

    clk_3k <= ena_count(10);
  end process;
 cpu : entity work.T65 -- main cpu
      port map (
          Mode    => "00",
          Res_n   => reset_l,
          Enable  => ena_1_5M,
          Clk     => CLK_6,
          Rdy     => '1',
          Abort_n => '1',
          IRQ_n   => c_irq_l,
          NMI_n   => c_nmi_l,
          SO_n    => '1',
          R_W_n   => c_rw_l,
          Sync    => open,
          EF      => open,
          MF      => open,
          XF      => open,
          ML_n    => open,
          VP_n    => open,
          VDA     => open,
          VPA     => open,
          A       => c_addr,
          DI      => c_din,
          DO      => c_dout
      );
  c_irq_l <= '1';

  p_nmi : process(reset_l, CLK_6)
    variable carry : boolean;
  begin
    if (reset_l = '0') then
      c_nmi_l <= '1';
      nmi_count <= "0000";
    elsif rising_edge(CLK_6) then
    -- divide 3k signal by 12
      carry := (nmi_count = "1111");

      c_nmi_l <= '1';
      if (test_l = '1') and carry then
        c_nmi_l <= '0';
      end if;

      if (ena_3K = '1') then
        if carry then
          nmi_count <= "0100";
        else
          nmi_count <= nmi_count + "1";
        end if;
      end if;

    end if;
  end process;

  p_wd_reset : process(RESET_6_L, CLK_6)
  begin
    if (RESET_6_L = '0') then
      wd_cnt <= "00000000";
      reset_l <= '0';
    elsif rising_edge(CLK_6) then

      if (wdclr_l = '0') then
        wd_cnt <= "00000000";
      elsif (ena_3K = '1') then
        wd_cnt <= wd_cnt + "1";
      end if;

      if (ena_3k = '1') and (wd_cnt = "01111111") then
        reset_l <= not reset_l;
      end if;
      -- simulation
      -- reset_l <= reset_6_l;
    end if;
  end process;

  p_addr_decode1 : process(c_addr, c_rw_l, ena_1_5M, reset_l)
    variable deca : std_logic_vector(3 downto 0);
    variable decb : std_logic_vector(3 downto 0);
    variable decc : std_logic_vector(7 downto 0);
    variable input_read : std_logic;
    variable control_write : std_logic;
  begin
  -- cpu address bit 15 is tied to ground
  -- as far as the rest of the system is concerned
    deca := "1111";
    case c_addr(14 downto 13) is
      when "00" => deca := "1110";
      when "01" => deca := "1101";
      when "10" => deca := "1011";
      when "11" => deca := "0111";
      when others => null;
    end case;
    zpage_l <= deca(0);
    vmem_l  <= deca(2);
    pmem_l  <= deca(3);

	 
    input_read := (not deca(1)) and (not c_addr(12)) and c_rw_l;
    decb := "1111";
    if (input_read = '1') then
      case c_addr(11 downto 10) is
        when "00" => decb := "1110";
        when "01" => decb := "1101";
        when "10" => decb := "1011";
        when "11" => decb := "0111";
        when others => null;
      end case;
    end if;
    sinp0_l  <= decb(0);
    sinp1_l  <= decb(1);
    dpts_l   <= decb(2);
	thrust_l <= decb(3);
	
    control_write := (not deca(1)) and c_addr(12) and (not c_rw_l);-- and ena_1_5M;
    decc := "11111111";
    if (control_write = '1') then
      case c_addr(11 downto 9) is
        when "000" => decc := "11111110";
        when "001" => decc := "11111101";
        when "010" => decc := "11111011";
        when "011" => decc := "11110111";
        when "100" => decc := "11101111";
        when "101" => decc := "11011111";
        when "110" => decc := "10111111";
        when "111" => decc := "01111111";
        when others => null;
      end case;
    end if;
    dma_go_l     <= decc(0);
    out_l    	  <= decc(1);
    wdclr_l      <= decc(2);
    explode_l    <= decc(3);
    dma_reset_l  <= decc(4);
    thump_l  	  <= decc(5);
    audio_l      <= decc(6);
    noiserst_l   <= decc(7);
  end process;

  
 --  p_output_registers : process(RESET_L, CLK_6)
--  begin
--    if (reset_l = '0') then
--      saucrsnden <= '0';
--      saucrfireen <= '0';
--		saucrsel_l <= '1'; -- inverted
--      shipthrusten <= '0';
--      shpfireen <= '0';
--		lifeen <= '0';
--
--    elsif rising_edge(CLK_6) then
--      if (ena_1_5M = '1') and (audio_l = '0') then
--        case c_addr(2 downto 0) is
--          when "000" => saucrsnden <= c_dout(7);
--          when "001" => saucrfireen <= c_dout(7);
--          when "010" => saucrsel_l <= (not c_dout(7));
--          when "011" => shipthrusten <= c_dout(7);
--          when "100" => shpfireen <= c_dout(7);
--          when "101" => lifeen <= c_dout(7);
--          when "110" => null;
--          when "111" => null;
--          when others => null;
--        end case;
--      end if;
--    end if;
--  end process;


-- Output register for ramsel_l and lamp, LED and coin counter output
  lamp_register : process(out_l)
  begin
		if reset_l = '1' then
			if rising_edge(out_l) then
				ramsel_l <= c_dout(2);
				start1_led_l <= c_dout(1);
				start2_led_l <= c_dout(0);
				l_coin_counter <= c_dout(3);
				c_coin_counter <= c_dout(4);
				r_coin_counter <= c_dout(5);
			end if;
		end if;
	end process;
			

  p_input_registers : process
  begin
    wait until rising_edge(CLK_6);
    -- off is 1, on is 0
    --            12345678
    dips_p6_l <= "00100101"; -- default 1-0 Right Coin / 3-4 Languaje / 6 Normal, Free PLay / 8,7,5 Fuel Units per Coin 

    -- self test, slam, diag step, fire, hyper
    control_ip0_l <= "11111";
    control_ip0_l(4) <= SELF_TEST_SWITCH_L; -- IPL
	control_ip0_l(3) <= '1'; 			    -- TILT
	control_ip0_l(2) <= '1'; 			    -- DIAG STEP
    control_ip0_l(1) <= '1'; 	        -- ?
    control_ip0_l(0) <= '1'; 	        -- ?
    test_l           <= SELF_TEST_SWITCH_L;

    -- left, right, thrust, start2, start1, coinr, coinc, coinl
    control_ip1_l <= "11111111";
    control_ip1_l(7) <= BUTTON(6); -- left
    control_ip1_l(6) <= BUTTON(7); -- right
    control_ip1_l(5) <= BUTTON(1); -- abort
    control_ip1_l(4) <= BUTTON(4); -- Select Game
    control_ip1_l(3) <= '0';       -- coin3
    control_ip1_l(2) <= '1';       -- coin2
    control_ip1_l(1) <= not BUTTON(2); -- coin1
    control_ip1_l(0) <= BUTTON(5); -- startl

	control_thr_l <= "11111111";
	control_thr_l(7) <= '1'; 
	control_thr_l(6) <= '1'; 
	control_thr_l(5) <= '1'; 
	control_thr_l(4) <= '1'; 
	control_thr_l(3) <= '1'; 
	control_thr_l(2) <= '1';
	control_thr_l(1) <= '1';    
	control_thr_l(0) <= BUTTON(3); 
	end process;

  p_input_sel : process(c_addr, dips_p6_l, control_ip0_l, control_ip1_l, clk_3k, halt)
  begin
    control_ip0_sel <= '0';
    case c_addr(2 downto 0) is
      when "000" => control_ip0_sel <= halt; 
      when "001" => control_ip0_sel <= not control_ip0_l(4); --not control_ip0_l(4); 
      when "010" => control_ip0_sel <= not control_ip0_l(3); --not control_ip0_l(3); 
      when "011" => control_ip0_sel <= '0'; 
      when "100" => control_ip0_sel <= '0';
      when "101" => control_ip0_sel <= '0'; 
      when "110" => control_ip0_sel <= not clk_3k;
      when "111" => control_ip0_sel <= not control_ip0_l(2); --not control_ip0_l(2); 
      when others => null;
    end case;

    control_ip1_sel <= '0';
    case c_addr(2 downto 0) is
      when "000" => control_ip1_sel <= not control_ip1_l(0);
      when "001" => control_ip1_sel <= not control_ip1_l(1);
      when "010" => control_ip1_sel <= not control_ip1_l(2);
      when "011" => control_ip1_sel <= not control_ip1_l(3);
      when "100" => control_ip1_sel <= not control_ip1_l(4);
      when "101" => control_ip1_sel <= not control_ip1_l(5);
      when "110" => control_ip1_sel <= not control_ip1_l(6);
      when "111" => control_ip1_sel <= not control_ip1_l(7);
      when others => null;
    end case;

    dips_ip_sel <= "00";
    case c_addr(1 downto 0) is
      when "00" => dips_ip_sel <= dips_p6_l(1) & dips_p6_l(0);
      when "01" => dips_ip_sel <= dips_p6_l(3) & dips_p6_l(2);
      when "10" => dips_ip_sel <= dips_p6_l(5) & dips_p6_l(4);
      when "11" => dips_ip_sel <= dips_p6_l(7) & dips_p6_l(6);
      when others => null;
    end case;

	control_thr_sel <= '0';
    case c_addr(2 downto 0) is
      when "000" => control_thr_sel <= not control_thr_l(0);
      when "001" => control_thr_sel <= not control_thr_l(1);
      when "010" => control_thr_sel <= not control_thr_l(2);
      when "011" => control_thr_sel <= not control_thr_l(3);
      when "100" => control_thr_sel <= not control_thr_l(4);
      when "101" => control_thr_sel <= not control_thr_l(5);
      when "110" => control_thr_sel <= not control_thr_l(6);
      when "111" => control_thr_sel <= not control_thr_l(7);
      when others => null;
    end case;

  end process;


  --  Internal program ROMs if the FPGA is big enough
  rom0 : entity work.ASTEROIDS_PROG_ROM_0
    port map (
      addr    => c_addr(10 downto 0),
      data     => rom0_dout,
      clk      => CLK_6
      );

  rom1 : entity work.ASTEROIDS_PROG_ROM_1
    port map (
      addr     => c_addr(10 downto 0),
      data     => rom1_dout,
      clk      => CLK_6
      );

  rom2 : entity work.ASTEROIDS_PROG_ROM_2
    port map (
      addr     => c_addr(10 downto 0),
      data     => rom2_dout,
      clk      => CLK_6
      );

  rom3 : entity work.ASTEROIDS_PROG_ROM_3
    port map (
      addr     => c_addr(10 downto 0),
      data     => rom3_dout,
      clk      => CLK_6
      );

--
  p_rom_mux : process(c_addr, rom0_dout, rom1_dout, rom2_dout,rom3_dout)
  begin
    rom_dout <= (others => '0');
    case c_addr(12 downto 11) is
      when "00" => rom_dout <= rom0_dout;
      when "01" => rom_dout <= rom1_dout;
      when "10" => rom_dout <= rom2_dout;
      when "11" => rom_dout <= rom3_dout;
      when others => null;
    end case;
  end process;
  p_ram_addr : process(ramsel_l, c_addr)
    variable swap : std_logic;
  begin
    swap := not (ramsel_l and c_addr(9));

    ram_addr(9) <= c_addr(9);
    ram_addr(8) <= c_addr(8) xor swap;
    ram_addr(7 downto 0) <= c_addr(7 downto 0);
  end process;
  --
  -- main memory
  --
ram_we <= (not zpage_l) and (not c_rw_l) and ena_1_5M;
  RAM: Entity work.RAM256
port map(
    clock => clk_6,
    address => c_addr(7 downto 0),
    data => c_dout,
    wren => ram_we,
    q => ram_dout
    );
  
  p_cpu_data_mux : process(c_addr, ram_dout, rom_dout, vg_dout, zpage_l, pmem_l, vmem_l,
                           sinp0_l, control_ip0_sel, sinp1_l, control_ip1_sel,
                           dpts_l, dips_ip_sel, thrust_l, control_thr_sel)
  begin
    c_din <= (others => '0');
    if (sinp0_l = '0') then
      c_din <= control_ip0_sel & "1111111";
    elsif (sinp1_l = '0') then
      c_din <= control_ip1_sel & "1111111";
    elsif (dpts_l = '0') then
      c_din <= "111111" & dips_ip_sel;
    elsif (thrust_l = '0') then
      c_din <= control_thr_sel & "1111111";	  
    elsif (zpage_l = '0') then
      c_din <= ram_dout;
    elsif (pmem_l = '0') then
      c_din <= rom_dout;
    elsif (vmem_l = '0') then
      c_din <= vg_dout;
    end if;
  end process;
  
  --
  -- audio
  --

  -- Thrust Aud0 through Aud 2 - volume
  -- Explosion - Aud 3,  volume by Aud 0 through Aud 2
  -- 3k - Aud 4
  -- 6k - Aud 5
  
  tone3khz <= "1111" when clk_3k = '1' and aud(4) = '1' else "0000";
  tone6khz <= "1111" when clk_6k = '1' and aud(5) = '1' else "0000";
  t_e_vol  <= aud(2 downto 0);
  shipthrusten <= aud(0) or aud(1) or aud(2);
  
  
  -- LFSR to generate noise used in the ship thrust and explosion sounds
  p_noise_gen : process(RESET_L, CLK_6)
    variable shift_in : std_logic;
  begin
    if (reset_l = '0') then
      noise_shift <= (others => '0');
      noise <= '0';
    elsif rising_edge(CLK_6) then
      if (ena_12k = '1') then
        shift_in := not(noise_shift(6) xor noise_shift(14));
        noise_shift <= noise_shift(14 downto 0) & shift_in;
        noise <= shift_in; -- one clock late
      end if;

    end if;
  end process;

  -- Ship thrust sound, passes noise through a low pass filter
  p_ship_snd : process
  begin
    wait until rising_edge(CLK_6);
    shpsnd_prefilter <= noise and shipthrusten;
    -- simple low pass filter
    if (ena_3k = '1') then
      if (shpsnd_prefilter = '1') then
        shpsnd_filter_t1 <= t_e_vol & '0';--"1111";
      else
        shpsnd_filter_t1 <= "0000";
      end if;

      shpsnd_filter_t2 <= shpsnd_filter_t1;
      shpsnd_filter_t3 <= shpsnd_filter_t2;
    end if;
    shpsnd_filtered <= ("00" & shpsnd_filter_t1      ) +
                       ('0'  & shpsnd_filter_t2 & '0') +
                       ("00" & shpsnd_filter_t3      );
  end process;

  -- Explosion sound, 
  p_expld_gen_reg : process(RESET_L, CLK_6)
  begin
    if (reset_l = '0') then
      expitch <= "00";
      expaud  <= "0000";
    elsif rising_edge(CLK_6) then
      if (ena_1_5M = '1') then
        if (aud(3) = '1') then
          --expitch <= c_dout(7 downto 6);
          --expaud <= c_dout(5 downto 2);
          expitch <= "10";--c_dout(7 downto 6);
          expaud <= t_e_vol& '0';--c_dout(5 downto 2);
        end if;
      end if;
    end if;
  end process;

  


  p_expld_gen : process
    variable rc : boolean;
  begin
    wait until rising_edge(CLK_6);
    rc := (noise_cnt = "1111"); -- rc output
    if (ena_12k = '1') then
      if rc then -- rp output
        noise_cnt <= (expitch(1) or expitch(0)) & (not expitch(0)) & expitch(0) & expitch(1);
      else
        noise_cnt <= noise_cnt + "1";
      end if;

      if rc then
        if (noise = '1') then
          expld_snd <= expaud;
        else
          expld_snd <= "0000";
        end if;
      end if;
    end if;
  end process;
  


		
		
  -- Mix the audio outputs (needs work for original Asteroids)
  p_audio_output_reg : process
    variable sum_p : std_logic_vector(6 downto 0);
    variable sum : std_logic_vector(7 downto 0);
  begin
    wait until rising_edge(CLK_6);

	 
	 sum := ('0' & tone6khz)+ ('0' & tone3khz)+  ("00" & expld_snd & "00") + ("00" & shpsnd_filtered);


--    if (sum(8) = '0') then
      AUDIO_OUT <= sum(7 downto 0);
--    else -- clip
--      AUDIO_OUT <= "11111111";
--    end if;
	 
  end process;

  --
  -- vector generator
  --

  vg : entity work.ASTEROIDS_VG
    port map (
      C_ADDR       => c_addr(15 downto 0),
      C_DIN        => c_dout,
      C_DOUT       => vg_dout,
      C_RW_L       => c_rw_l,
      VMEM_L       => vmem_l,

      DMA_GO_L     => dma_go_l,
      DMA_RESET_L  => dma_reset_l,
      HALT_OP      => halt,

      X_VECTOR     => X_VECTOR,
      Y_VECTOR     => Y_VECTOR,
      Z_VECTOR     => Z_VECTOR,
      BEAM_ON      => BEAM_ON,
      --
      ENA_1_5M     => ena_1_5m,
      ENA_1_5M_E   => ena_1_5m_e,
      RESET_L      => reset_l,
      CLK_6        => CLK_6		
      );
  BEAM_ENA <= ena_1_5m;

end RTL;
