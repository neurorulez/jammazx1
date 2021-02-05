--
-- VHDL conversion by MikeJ - October 2002
--
-- video scan doubler
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

-- Screen inversion version, to draw screen other way up!
-- Specifically for invaders where only red, green or white used.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity DBLSCAN is
  port (
	RGB_IN        : in    std_logic_vector(7 downto 0);
	HSYNC_IN      : in    std_logic;
	VSYNC_IN      : in    std_logic;

	RGB_OUT       : out   std_logic_vector(7 downto 0);
	HSYNC_OUT     : out   std_logic;
	VSYNC_OUT     : out   std_logic;
	--  NOTE CLOCKS MUST BE PHASE LOCKED !!
	CLK           : in    std_logic; -- input pixel clock (6MHz)
	CLK_X2        : in    std_logic;  -- output clock      (12MHz)
	scanlines     : in    std_logic	
	);
end;

architecture RTL of DBLSCAN is

COMPONENT u_invert
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;
  --
  -- Output Screen Positioning
  --
  constant Horizontal : natural := 100; --Desplazamiento horizontal. Empieza desde 0
  constant Vertical   : natural := 268; --Cuenta hacia atras, tiene que ser > 244 que seria el 0 Vertical (Las lineas verticales del juego)
  --constant Horizontal : natural := 140;
  --constant Vertical   : natural := 278; 
  --
  -- input timing
  --
  signal hsync_in_t1 : std_logic;
  signal vsync_in_t1 : std_logic;
  signal hpos_i : std_logic_vector(9 downto 0) := (others => '0');    -- input capture postion
  signal vpos_i : std_logic_vector(8 downto 0) := (others => '0');    -- input capture postion
  signal we_a : std_logic_vector(0 downto 0);
  signal pixel : std_logic_vector(1 downto 0);
  --
  -- output timing
  --
  signal hpos_o : std_logic_vector(9 downto 0) := (others => '0');
  signal hpos_2 : std_logic_vector(9 downto 0) := (others => '0');
  signal vpos_o : std_logic_vector(9 downto 0) := (others => '0');
  signal tpos_o : std_logic_vector(9 downto 0) := (others => '0');
  signal ohs : std_logic;
  signal ohs_t1 : std_logic;
  signal ovs : std_logic;
  signal ovs_t1 : std_logic;
  --
  signal vs_cnt : std_logic_vector(2 downto 0);
  signal pixel_out : std_logic_vector(1 downto 0);
  signal scanline : std_logic;
begin

i_bitmap : u_invert
  PORT MAP (
    clka => CLK,
    ena => '1',
    wea(0 downto 0) => we_a(0 downto 0),
    addra(15 downto 8) => vpos_i(7 downto 0),
	 addra(7 downto 0) => hpos_i(8 downto 1), 
    dina => pixel,
	 
    clkb => CLK_X2,
	 addrb(15 downto 8) => vpos_o(7 downto 0),
	 addrb(7 downto 0)  => hpos_2(8 downto 1),
    --addrb(15 downto 8) => tpos_o(8 downto 1),			-- rotate screen
	 --addrb(7 downto 0) => vpos_o(7 downto 0),
    doutb => pixel_out
  );

  p_input_timing : process
	variable rising_h : boolean;
  begin
	wait until rising_edge (CLK);
	hsync_in_t1 <= HSYNC_IN;
	vsync_in_t1 <= VSYNC_IN;

	-- Sort out X Y counters
	rising_h := (HSYNC_IN = '1') and (hsync_in_t1 = '0');
	
	if rising_h then
		hpos_i <= (others => '0');
	else
		hpos_i <= hpos_i + 1;
	end if;

   if (VSYNC_IN = '0') then
	  vpos_i <= (others => '0');
	elsif rising_h then
	  vpos_i <= vpos_i + "1";
	end if;
	
   pixel <= RGB_IN(2 downto 1);		-- keep Red & Green bits only
	
   if ((hpos_i < 511) and (vpos_i < 256)) then
 	 we_a <= "1";
   else
	 we_a <= "0";
   end if;

  end process;

  p_output_timing : process
	variable falling_h : boolean;
  begin
	wait until rising_edge (CLK_X2);
	falling_h := ((ohs = '0') and (ohs_t1 = '1'));

	if falling_h or (hpos_o = "01001111111") then -- 27f
	  hpos_o <= (others => '0');
	  hpos_2 <= (others => '1');
	else
     hpos_o <= hpos_o + "1";
	  if hpos_o > Horizontal then			-- Delay for start of actual screen : adjust this to centre the screen! 
		 hpos_2 <= hpos_2 - 1;
	  end if;
	end if;

	tpos_o <= not hpos_2;  -- draw back to front!

	if (ovs = '0') and (ovs_t1 = '1') then -- falling V
     vpos_o <= conv_std_logic_vector(Vertical, vpos_o'length);
	  vs_cnt <= "000";
	elsif falling_h then
	  if (vs_cnt(2) = '0') then
		 vs_cnt <= vs_cnt + "1";
	  else
	    vpos_o <= vpos_o - 1;
	  end if;
	end if;

	ohs <= HSYNC_IN; -- reg on clk_X2
	ohs_t1 <= ohs;

	ovs <= VSYNC_IN; -- reg on clk_X2
	ovs_t1 <= ovs;
  end process;

  p_op : process
  begin
	wait until rising_edge (CLK_X2);

	HSYNC_OUT <= '0';
	if (hpos_o < 32) then
	  HSYNC_OUT <= '1';
	end if;

	if hpos_o = 0 then
		scanline <= not scanline;
	end if;	

	if pixel_out="11" then
	 if scanline = '1' and scanlines = '1' then
	   RGB_OUT(2 downto 0) <= "000";
		RGB_OUT(5 downto 3) <= (others => '1');
	 else
	   RGB_OUT <= (others => '1');
	 end if;
	else
	 if scanline = '1' and scanlines = '1' then
	   RGB_OUT(2 downto 0) <= "000";
		RGB_OUT(5 downto 3) <= pixel_out & "0";
	 else
	   RGB_OUT <= "00000" & pixel_out & "0";
	 end if;
	end if;

	VSYNC_OUT <= not vs_cnt(2);
  end process;

end architecture RTL;

