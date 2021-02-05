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
-- version 001 Jan 2006 release - initial release of this module

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity PACMAN_CLOCKS is
	port (
		I_CLK_REF         : in    std_logic;
		I_RESET_L         : in    std_logic;
		--
		O_CLK_REF         : out   std_logic;
		--
		O_ENA_12          : out   std_logic;
		O_ENA_6           : out   std_logic;
		O_CLK             : out   std_logic;
		O_RESET           : out   std_logic
	);
end;

architecture RTL of PACMAN_CLOCKS is
	-- Input clock buffering / unused connectors
	signal clkin1            : std_logic;
	-- Output clock buffering
	signal clkfb             : std_logic;
	signal clk0              : std_logic;
	signal clkfx             : std_logic;
	signal locked_internal   : std_logic;
	signal status_internal   : std_logic_vector(7 downto 0);

	signal clk               : std_logic;
	signal reset             : std_logic;
	signal delay_count       : std_logic_vector(7 downto 0) := (others => '0');
	signal div_cnt           : std_logic_vector(1 downto 0);

	-- The original uses a 6.144 MHz clock
	--
	-- Here we are taking in 32MHz clock, and using the CLKFX 32*(10/13) to get 24.615MHz
	-- We are then clock enabling the whole design at /4 and /2
	--
	-- This runs the game at 6.15 MHz which is 0.16% fast.
	--
	-- (The scan doubler requires a x2 freq clock)

begin

	reset <= not I_RESET_L;

	O_CLK_REF <= clk0;
	O_CLK     <= clk;

	-- Input buffering
	--------------------------------------
	clkin1_buf : IBUFG
	port map (I => I_CLK_REF, O => clkin1);

	-- Output buffering
	-------------------------------------
	clkf_buf : BUFG
	port map (I => clk0, O => clkfb);

	clkout1_buf : BUFG
	port map (I => clkfx, O => clk);
	 
	dcm_sp_inst: DCM_SP
	generic map(
		CLK_FEEDBACK          => "1X",
		CLKDV_DIVIDE          => 2.0,
		CLKFX_DIVIDE          => 25,
		CLKFX_MULTIPLY        => 12,
		CLKIN_DIVIDE_BY_2     => FALSE,
		CLKIN_PERIOD          => 20.00,
		CLKOUT_PHASE_SHIFT    => "NONE",
		DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",
		DSS_MODE              => "NONE",
		DFS_FREQUENCY_MODE    => "LOW",   -- deprecated
		DLL_FREQUENCY_MODE    => "LOW",   -- deprecated
		DUTY_CYCLE_CORRECTION => TRUE,    -- deprecated
		FACTORY_JF            => x"C080", -- deprecated
		PHASE_SHIFT           => 0,
		STARTUP_WAIT          => FALSE
	)
	port map (
		-- Input clock
		CLKIN                 => clkin1,
		CLKFB                 => clkfb,
		-- Output clocks
		CLK0                  => clk0,
		CLK90                 => open,
		CLK180                => open,
		CLK270                => open,
		CLK2X                 => open,
		CLK2X180              => open,
		CLKFX                 => clkfx,
		CLKFX180              => open,
		CLKDV                 => open,
		-- Ports for dynamic phase shift
		PSCLK                 => '0',
		PSEN                  => '0',
		PSINCDEC              => '0',
		PSDONE                => open,
		-- Other control and status signals
		LOCKED                => locked_internal,
		STATUS                => status_internal,
		RST                   => reset,
		-- Unused pin, tie low
		DSSEN                 => '0'
	);

  p_delay : process(I_RESET_L, clk)
  begin
    if (I_RESET_L = '0') then
      delay_count <= x"00"; -- longer delay for cpu
      O_RESET <= '1';
    elsif rising_edge(clk) then
      if (delay_count(7 downto 0) = (x"FF")) then
        delay_count <= (x"FF");
        O_RESET <= '0';
      else
        delay_count <= delay_count + "1";
        O_RESET <= '1';
      end if;
    end if;
  end process;

  p_clk_div : process(I_RESET_L, clk)
  begin
    if (I_RESET_L = '0') then
      div_cnt <= (others => '0');
    elsif rising_edge(clk) then
      div_cnt <= div_cnt + "1";
    end if;
  end process;

  p_assign_ena : process(div_cnt)
  begin
    O_ENA_12 <= div_cnt(0);
    O_ENA_6  <= div_cnt(0) and not div_cnt(1);
  end process;
end RTL;
