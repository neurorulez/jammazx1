--	(c) 2012 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

-- Standard DCM
-- Input
--		CLK_IN		system input clock 32Mhz
-- Outputs
--		O_CLK_24M	generated 32Mhz/13*10 = 24.6154Mhz

entity clocks is
	port (
		CLK_IN			: in  std_logic;
		I_RESET			: in  std_logic;
		O_CLK_24M		: out std_logic
	);
end clocks ;

architecture RTL of clocks is
	signal clk_in_buf			: std_logic;
	signal clk_0				: std_logic;
	signal clk_fx				: std_logic;
	signal clk_fb				: std_logic;
	signal clk_fx_buf			: std_logic;
	signal lockd_24M			: std_logic := '0';
begin
	O_CLK_24M		<= clk_fx_buf; -- 24.6154MHz
	IBUFG0 : IBUFG port map (I=> CLK_IN,		O => clk_in_buf);
	BUFG0  : BUFG  port map (I=> clk_0,			O => clk_fb);
	BUFG1  : BUFG  port map (I=> clk_fx,		O => clk_fx_buf);

	dcm_inst : DCM_SP
		generic map (
			DLL_FREQUENCY_MODE		=> "LOW",
			DUTY_CYCLE_CORRECTION	=> TRUE,
			CLKOUT_PHASE_SHIFT		=> "NONE",
			PHASE_SHIFT					=> 0,
			CLKFX_MULTIPLY				=> 10,	-- range 2 to 32
			CLKFX_DIVIDE				=> 13,	-- range 1 to 32
			CLKDV_DIVIDE				=> 2.0,
			STARTUP_WAIT				=> FALSE,
			CLKIN_PERIOD				=> 31.25
		)
		port map (
			CLKIN			=> clk_in_buf,
			CLKFB			=> clk_fb,
			DSSEN			=> '0',
			PSINCDEC		=> '0',
			PSEN			=> '0',
			PSCLK			=> '0',
			RST			=> I_RESET,
			CLK0			=> clk_0,
			CLK90			=> open,
			CLK180		=> open,
			CLK270		=> open,
			CLK2X			=> open,
			CLK2X180		=> open,
			CLKDV			=> open,
			CLKFX			=> clk_fx,
			CLKFX180		=> open,
			LOCKED		=> lockd_24M,
			PSDONE		=> open
		);
end RTL;
