--
-- VHDL conversion by MikeJ - October 2002
--
-- FPGA video scan doubler
--
-- based on a design by Tatsuyuki Satoh
--
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
-- version 002 initial release
-- version 003 Jan 2006 release, general tidy up
-- version 004 spartan3e release
-- version 005 simplified logic (d18c7db)
--		uses only one RAMB
--		16bit I/O bus, can handle various RGB widths
--		adjusted sync pulse widths to more closely match VGA specs
--		triggers on falling (instead of rising) edge of active low input sync signals to more closely track them

--	VGA Signal 640 x 480 @ 60 Hz Industry standard timing
--
--	General timing
--
--	Screen refresh rate	60 Hz
--	Vertical refresh	31.46875 kHz
--	Pixel freq.	25.175 MHz
--
--	Horizontal timing (line)
--
--	Polarity of horizontal sync pulse is negative.
--	Scanline part	Pixels	Time [�s]
--	Visible area	640		25.422045680238
--	Front porch		16			0.6355511420060
--	Sync pulse		96			3.8133068520357
--	Back porch		48			1.9066534260179
--	Whole line		800		31.777557100298
--
--	Vertical timing (frame)
--
--	Polarity of vertical sync pulse is negative.
--	Frame part		Lines	Time [ms]
--	Visible area	480	15.253227408143
--	Front porch		10		0.3177755710030
--	Sync pulse		2		0.0635551142006
--	Back porch		33		1.0486593843098
--	Whole frame		525	16.683217477656


library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity vga_scandbl is
	port (
		I_VIDEO				: in  std_logic_vector(15 downto 0);
		I_HSYNC				: in  std_logic;
		I_VSYNC				: in  std_logic;
		scanlines			: in  std_logic;
		--
		O_VIDEO				: out std_logic_vector(15 downto 0);
		O_HSYNC				: out std_logic;
		O_VSYNC				: out std_logic;
		--
		CLK					: in  std_logic;
		CLK_X2				: in  std_logic
	);
end vga_scandbl;

architecture RTL of vga_scandbl is
	--
	-- input timing
	--
	signal ihs_t1			: std_logic := '0';
	signal ivs_t1			: std_logic := '0';
	signal bank_i			: std_logic := '0';
	signal hpos_i			: std_logic_vector( 8 downto 0) := (others => '0');
	signal hsize_i			: std_logic_vector( 8 downto 0) := (others => '0');
	--
	-- output timing
	--
	signal ohs_t1			: std_logic := '0';
	signal ovs_t1			: std_logic := '0';
	signal bank_o			: std_logic := '1';
	signal hpos_o			: std_logic_vector( 8 downto 0) := (others => '0');
	signal rgb_out			: std_logic_vector(15 downto 0) := (others => '0');
	signal vs_cnt			: std_logic_vector( 1 downto 0) := (others => '0');
	
	signal scanline : std_logic := '0';
begin

	u_ram : RAMB16_S18_S18
	generic map (INIT_A => X"00000", INIT_B => X"00000", SIM_COLLISION_CHECK => "ALL")  -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL"
		port map (
			-- input
			DOA					=> open,
			DIA					=> I_VIDEO,
			DOPA					=> open,
			DIPA					=> "00",
			ADDRA(9)				=> bank_i,
			ADDRA(8 downto 0)	=> hpos_i,
			WEA					=> '1',
			ENA					=> '1',
			SSRA					=> '0',
			CLKA					=> CLK,

			-- output
			DOB					=> rgb_out,
			DIB					=> x"0000",
			DOPB					=> open,
			DIPB					=> "00",
			ADDRB(9)				=> bank_o,
			ADDRB(8 downto 0)	=> hpos_o,
			WEB					=> '0',
			ENB					=> '1',
			SSRB					=> '0',
			CLKB					=> CLK_X2
		);

	p_input_timing : process(CLK)
		variable falling_h	: boolean;
		variable falling_v	: boolean;
	begin
		if rising_edge (CLK) then
			ihs_t1 <= I_HSYNC;
			ivs_t1 <= I_VSYNC;

			falling_h := (I_HSYNC = '0') and (ihs_t1 = '1');
			falling_v := (I_VSYNC = '0') and (ivs_t1 = '1');

			if falling_v then
				bank_i <= '0';
			elsif falling_h then
				bank_i <= not bank_i;
			end if;
			if falling_h then
				hpos_i  <= (others => '0');
				hsize_i <= hpos_i;
				scanline <= not scanline;
			else
				hpos_i <= hpos_i + "1";
			end if;
		end if;
	end process;

	p_output_timing : process(CLK_X2)
		variable falling_h : boolean;
		variable falling_v : boolean;
	begin
		if rising_edge (CLK_X2) then
			ohs_t1 <= I_HSYNC;
			ovs_t1 <= I_VSYNC;

			falling_h := (I_HSYNC = '0') and (ohs_t1 = '1');
			falling_v := (I_VSYNC = '0') and (ovs_t1 = '1');

			if falling_h or (hpos_o = hsize_i) then
				hpos_o <= (others => '0');
			else
				hpos_o <= hpos_o + "1";
			end if;

			if falling_v then
				bank_o <= '1';
				vs_cnt <= (others => '0');
			elsif falling_h then
				bank_o <= not bank_o;
				if (vs_cnt(1) = '0') then -- vsync pulse duration
					vs_cnt <= vs_cnt + "1";
				end if;
			end if;
		end if;
	end process;

	p_output : process(CLK_X2)
	begin
		if rising_edge (CLK_X2) then
			O_VSYNC <= not vs_cnt(0);
			if (hpos_o < 46) then -- hsync pulse duration = 0 to 45 clk2 cycles = 3.83us
				O_HSYNC <= '0';
			else
				O_HSYNC <= '1';
			end if;
	if scanline = '1' and scanlines = '1' then
	   O_VIDEO <= x"00" & rgb_out(7 downto 6) & '0' & rgb_out(4 downto 3) & '0' & rgb_out(1) & '0';
	else
		O_VIDEO <= rgb_out;
	end if;
		end if;
	end process;

end architecture RTL;
