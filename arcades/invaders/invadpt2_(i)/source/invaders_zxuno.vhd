-- Space Invaders top level for
-- ps/2 keyboard interface with sound and scan doubler MikeJ
--
-- Version : 0300
--
-- Copyright (c) 2002 Daniel Wallner (jesus@opencores.org)
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
-- The latest version of this file can be found at:
--      http://www.fpgaarcade.com
--
-- Limitations :
--
-- File history :
--
--      0241 : First release
--
--      0242 : Moved the PS/2 interface to ps2kbd.vhd, added the ROM from mw8080.vhd
--
--      0300 : MikeJ tidy up for audio release

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity invaders_zxuno is
	port(
		O_VIDEO_R         : out   std_logic_vector(2 downto 0);
		O_VIDEO_G         : out   std_logic_vector(2 downto 0);
		O_VIDEO_B         : out   std_logic_vector(2 downto 0);
		O_HSYNC           : out   std_logic;
		O_VSYNC           : out   std_logic;
		--
		O_AUDIO_L         : out   std_logic;
		O_AUDIO_R         : out   std_logic;	
		--
		I_JOYSTICK_A   : in    std_logic_vector(5 downto 0);
		I_JOYSTICK_B   : in    std_logic_vector(5 downto 0);
		JOYSTICK_A_GND : out	 std_logic;
		JOYSTICK_B_GND : out	 std_logic;
		I_PLAYER    : in std_logic_vector(1 downto 0);
		I_COIN      : in std_logic_vector(1 downto 0);		
		--
		CLK_IN            : in    std_logic; --Entrada Reloj 50Mhz
		PCLK			  : out   std_logic; --Salida CLK 10Mhz
		scanSW			  : in    std_logic_vector(20 downto 0);
		resetKey          : in    std_logic;
		scandblctrl       : in    std_logic_vector(1 downto 0)
		);
end invaders_zxuno;

architecture rtl of invaders_zxuno is

	signal clk             : std_logic;
	signal clk_x2          : std_logic;

	signal I_RESET_L       : std_logic;
	signal Rst_n_s         : std_logic;

	signal RWE_n           : std_logic;
	signal Video           : std_logic;
	signal VideoRGB        : std_logic_vector(2 downto 0);
	signal VideoMUX        : std_logic_vector(2 downto 0);
	signal HSync           : std_logic;
	signal VSync           : std_logic;
	signal CSync           : std_logic;
	signal CSync0          : std_logic;
	signal VideoRGB_x2     : std_logic_vector(7 downto 0);
	signal HSync_x2        : std_logic;
	signal VSync_x2        : std_logic;
	
	
	signal AD              : std_logic_vector(15 downto 0);
	signal RAB             : std_logic_vector(12 downto 0);
	signal RDB             : std_logic_vector(7 downto 0);
	signal RWD             : std_logic_vector(7 downto 0);
	signal IB              : std_logic_vector(7 downto 0);
	signal SoundCtrl3      : std_logic_vector(5 downto 0);
	signal SoundCtrl5      : std_logic_vector(5 downto 0);

	signal Buttons_n       : std_logic_vector(5 downto 1);
	signal Tick1us         : std_logic;

	signal PS2_Sample      : std_logic;
	signal PS2_Data_s      : std_logic;
	signal ScanCode        : std_logic_vector(7 downto 0);
	signal Press           : std_logic;
	signal Release         : std_logic;
	signal Reset           : std_logic;

	signal rom_data_0      : std_logic_vector(7 downto 0);
	signal rom_data_1      : std_logic_vector(7 downto 0);
	signal rom_data_2      : std_logic_vector(7 downto 0);
	signal rom_data_3      : std_logic_vector(7 downto 0);
	signal rom_data_4      : std_logic_vector(7 downto 0);
	signal rom_data_5      : std_logic_vector(7 downto 0);
	signal ram_we          : std_logic;
	--
	signal HCnt            : std_logic_vector(11 downto 0);
	signal VCnt            : std_logic_vector(11 downto 0);
	signal HSync_t1        : std_logic;
	signal hblank          : std_logic;
	signal vblank          : std_logic;
	signal blank           : std_logic;
	signal Overlay_R1      : boolean;
	signal Overlay_G1      : boolean;
	signal Overlay_B1      : boolean;
	signal Overlay_A1      : boolean;
	signal Overlay_C1      : boolean;
	signal Overlay_M1      : boolean;

	  --  
	signal button_in        : std_logic_vector(15 downto 0);
	signal buttons          : std_logic_vector(15 downto 0);
	signal button_debounced : std_logic_vector(15 downto 0);
	signal joystick_reg     : std_logic_vector(5 downto 0);
	signal joystick2_reg    : std_logic_vector(5 downto 0);

	--Entradas y dipsw
	signal GDB0         : std_logic_vector(7 downto 0);
	signal GDB1         : std_logic_vector(7 downto 0);
	signal GDB2         : std_logic_vector(7 downto 0);

	signal Audio 		     : std_logic_vector(7 downto 0);
	signal AudioPWM        : std_logic;
	signal dbl_scan        : std_logic;
	
begin

  I_RESET_L <= not resetKey;
  PCLK <= clk; --Salida 10Mhz para el modulo principal
  
   u_clocks : entity work.INVADERS_CLOCKS
	port map (
	   I_CLK_REF  => CLK_IN,
	   I_RESET_L  => '1',
	   --
	   O_CLK      => clk,   --10Mhz
	   O_CLK_X2   => clk_x2 --20Mhz (VGA dblscan)
	 );
 
	core : entity work.invaderst
		port map(
			Rst_n      => I_RESET_L,
			Clk        => Clk,
			GDB0		  => GDB0,
			GDB1		  => GDB1,
			GDB2		  => GDB2,
			RDB        => RDB,
			IB         => IB,
			RWD        => RWD,
			RAB        => RAB,
			AD         => AD,
			SoundCtrl3 => SoundCtrl3,
			SoundCtrl5 => SoundCtrl5,
			Rst_n_s    => Rst_n_s,
			RWE_n      => RWE_n,
			Video      => Video,
			HSync      => HSync,
			VSync      => VSync
			);
	--
	-- ROM
	--
	u_rom_h : entity work.INVADERS_ROM_H
	  port map (
		CLK         => Clk,
		ENA         => '1',
		ADDR        => AD(10 downto 0),
		DATA        => rom_data_0
		);
	--
	u_rom_g : entity work.INVADERS_ROM_G
	  port map (
		CLK         => Clk,
		ENA         => '1',
		ADDR        => AD(10 downto 0),
		DATA        => rom_data_1
		);
	--
	u_rom_f : entity work.INVADERS_ROM_F
	  port map (
		CLK         => Clk,
		ENA         => '1',
		ADDR        => AD(10 downto 0),
		DATA        => rom_data_2
		);
	--
	u_rom_e : entity work.INVADERS_ROM_E
	  port map (
		CLK         => Clk,
		ENA         => '1',
		ADDR        => AD(10 downto 0),
		DATA        => rom_data_3
		);
	--
	u_rom_d : entity work.INVADERS_ROM_D
	  port map (
		CLK         => Clk,
		ENA         => '1',
		ADDR        => AD(10 downto 0),
		DATA        => rom_data_4
		);
	--
	p_rom_data : process(AD, rom_data_0, rom_data_1, rom_data_2, rom_data_3)
	begin
	  IB <= (others => '0');
	  if  AD(14) = '0' then
	   case AD(12 downto 11) is
	 	 when "00" => IB <= rom_data_0;
		 when "01" => IB <= rom_data_1;
		 when "10" => IB <= rom_data_2;
		 when "11" => IB <= rom_data_3;
		 when others => null;
	   end case;
	  else
     	IB <= rom_data_4;
     end if;	  	  
	end process;
	--
	-- RAM
	--
	ram_we <= not RWE_n;

	rams : for i in 0 to 3 generate
	  u_ram : component RAMB16_S2
	  port map (
		do   => RDB((i*2)+1 downto (i*2)),
		addr => RAB,
		clk  => Clk,
		di   => RWD((i*2)+1 downto (i*2)),
		en   => '1',
		ssr  => '0',
		we   => ram_we
		);
	end generate;
	--
	-- Glue
	--
	process (Rst_n_s, Clk)
		variable cnt : unsigned(3 downto 0);
	begin
		if Rst_n_s = '0' then
			cnt := "0000";
			Tick1us <= '0';
		elsif Clk'event and Clk = '1' then
			Tick1us <= '0';
			if cnt = 9 then
				Tick1us <= '1';
				cnt := "0000";
			else
				cnt := cnt + 1;
			end if;
		end if;
	end process;
	
  p_overlay : process(Rst_n_s, Clk)
	variable HStart : boolean;
  begin
	if Rst_n_s = '0' then
	  HCnt <= (others => '0');
	  VCnt <= (others => '0');
	  HSync_t1 <= '0';
	elsif Clk'event and Clk = '1' then
	  HSync_t1 <= HSync;
	  HStart := (HSync_t1 = '0') and (HSync = '1');-- rising

	  if HStart then
		HCnt <= (others => '0');
	  else
		HCnt <= HCnt + "1";
	  end if;

	  if (VSync = '0') then
		VCnt <= (others => '0');
	  elsif HStart then
		VCnt <= VCnt + "1";
	  end if;
	  
	  --Generar señal de blank
--	  if    (HCnt = x"14")  then vblank <= '0'; --14   VBLANK ends at V = 0
--	  elsif (HCnt = x"216") then vblank <= '1'; --216  VBLANK begins at V = 224 (0x0e0)
--	  end if;

--	  if    (VCnt = x"7E")  then hblank <= '0'; --7e  HBLANK ends at H = 0
--	  elsif (VCnt = x"1FC") then hblank <= '1'; --1fc HBLANK begins at H = 256 (0x100)
--	  end if;


	  --Generar señal de blank
	  if    (HCnt = x"14")  then vblank <= '0'; --14   VBLANK ends at V = 0
	  elsif (HCnt = x"216") then vblank <= '1'; --216  VBLANK begins at V = 224 (0x0e0)
	  end if;

	  if    (VCnt = x"7E")  then hblank <= '0'; --7e  HBLANK ends at H = 0
	  elsif (VCnt = x"1FC") then hblank <= '1'; --1fc HBLANK begins at H = 256 (0x100)
	  end if;
		
	  blank <= not (hblank or vblank);
     
	  --Generar csync (no esta fino...)
	  if     Vcnt = x"0"  then csync0 <= '0';  --              HSYNC begins at H = 272 (0x110)
	  elsif  Vcnt = x"9"  then csync0 <= '1';  --1b ok:9       HSYNC ends at H = 288 (0x120)
	  end if;
	  
	  if     Hcnt < x"2c" then csync <='0'; --11 ok:25 a 35 (2d la mitad)(2c esta bien)   VSYNC begins at V = 236 (0x0ec)
	                      else csync <= csync0;                           -- VSYNC ends at V = 240 (0x0f0)
	  end if;
	  
	  --Generar Overlay de Colores
	  Overlay_R1 <= false;
	  Overlay_G1 <= false;
	  Overlay_B1 <= false;
	  Overlay_A1 <= false;
	  Overlay_C1 <= false;
	  Overlay_M1 <= false;
    if (SoundCtrl3(2)='1') then
	  Overlay_R1 <= true; --Dead todo rojo.
	 else --Si no le dan...
		if (HCnt > x"035" and HCnt < x"046" ) then --Creditos y Vidas
		  if (Vcnt > x"0" and Vcnt < x"1F") then Overlay_A1 <= true; elsif (Vcnt > x"96" and Vcnt < x"C6") then Overlay_M1 <= true; else Overlay_C1 <= true; end if; --if (Vcnt > x"C6" and Vcnt < x"D6") then Overlay_M1 <= false; else Overlay_M1 <= true; end if;
		end if;

		if (HCnt > x"045" and HCnt < x"056" ) then --Linea Suelo Roja
		  Overlay_R1 <= true; 
		end if;

	  if (HCnt > x"055" and HCnt < x"076") then --Nave CYAN
		Overlay_C1 <= true; 
	  end if;

	  if (HCnt > x"075" and HCnt < x"0A6") then --Bases protectoras ROJO
		Overlay_R1 <= true; 
	  end if;

	  if (HCnt > x"0A5" and HCnt < x"0E6") then --Lineas AMARILLA
		Overlay_A1 <= true; 
	  end if;

	  if (HCnt > x"0E5" and HCnt < x"126") then --Lineas MAGENTA
		Overlay_M1 <= true;
	  end if;

	  if (HCnt > x"125" and HCnt < x"166") then --Lineas CYAN
		Overlay_C1 <= true;
	  end if;

	  if (HCnt > x"165" and HCnt < x"1A6") then --Lineas VERDE
		Overlay_G1 <= true;
	  end if;

	  if (HCnt > x"1A5" and HCnt < x"1D6") then --Platillo MAGENTA
		Overlay_M1 <= true;
	  end if;

	  if (HCnt > x"1D5" and HCnt < x"1E6") then --Linea Invisible ROJA
		Overlay_R1 <= true;
	  end if;

	  if (HCnt > x"1E5" and HCnt < x"1F6") then --Puntuaciones
		if (Vcnt > x"60" and Vcnt < x"A0") then Overlay_G1 <= true; elsif (Vcnt > x"A0" and Vcnt < x"F1") then Overlay_A1 <= true; end if;
	  end if;
		--1F5..206 -- Linea en Blanco
	  if (HCnt > x"205" and HCnt < x"216") then --Titulos de Scores
	  if (Vcnt > x"0" and Vcnt < x"60") then Overlay_C1 <= true; elsif (Vcnt > x"60" and Vcnt < x"A0") then Overlay_R1 <= true; else Overlay_A1 <= true; end if;
	  end if;
	  
   end if; --Del Dead (todo rojo)
  end if;
 end process;

  p_video_out_comb : process(Video)
  begin
	if (Video = '0') then
	  VideoRGB  <= "000";
	else
	  if    Overlay_R1 then
		VideoRGB  <= "100";
	  elsif Overlay_G1 then
		VideoRGB  <= "010";
	  elsif Overlay_B1 then
		VideoRGB  <= "001";
  	  elsif Overlay_A1 then
		VideoRGB  <= "110";
  	  elsif Overlay_C1 then
		VideoRGB  <= "011";
  	  elsif Overlay_M1 then
		VideoRGB  <= "101";
	  else
		VideoRGB  <= "111";
	  end if;
	end if;
  end process;

  u_dblscan : entity work.DBLSCAN
	port map (
	  RGB_IN(7 downto 3) => "00000",
	  RGB_IN(2 downto 0) => VideoMUX, --VideoRGB,
	  HSYNC_IN           => not HSync,
	  VSYNC_IN           => not VSync,

	  RGB_OUT            => VideoRGB_X2,
	  HSYNC_OUT          => HSync_X2,
	  VSYNC_OUT          => VSync_X2,
	  --  NOTE CLOCKS MUST BE PHASE LOCKED !!
	  CLK                => Clk,
	  CLK_X2             => Clk_x2,
	  scanlines    =>  scandblctrl(1) xor scanSW(8)	  
	);
	
  dbl_scan <=  scandblctrl(0) xor scanSW(6); -- 1 = VGAS  0 = RGB	

-- p_video_ouput : process(clk_x2)
--  begin
--    if rising_edge(clk_x2) then
--	  if (dbl_scan = '1') then	
	   --VGA
--		  O_VIDEO_R <= VideoRGB_X2(2) & VideoRGB_X2(2) & VideoRGB_X2(2);
--        O_VIDEO_G <= VideoRGB_X2(1) & VideoRGB_X2(1) & VideoRGB_X2(1);
--		  O_VIDEO_B <= VideoRGB_X2(0) & VideoRGB_X2(0) & VideoRGB_X2(0);
--  		  O_HSYNC   <= HSync_X2;
--		  O_VSYNC   <= VSync_X2;
--		else
		-- RGB  
--		 O_VIDEO_R <= VideoRGB(2) & VideoRGB(2) & VideoRGB(2);
--       O_VIDEO_G <= VideoRGB(1) & VideoRGB(1) & VideoRGB(1);
--		 O_VIDEO_B <= VideoRGB(0) & VideoRGB(0) & VideoRGB(0);
--       O_HSYNC   <= not (vsync xor hsync); --asi saca "csync" o con  "not (vsync xor hsync)"
--       O_VSYNC   <= '1';
--     end if;
--   end if;
-- end process;

	videoMUX <= VideoRGB when blank = '1';
		  O_VIDEO_R <= VideoRGB_X2(2) & VideoRGB_X2(2) & '0' when dbl_scan = '1' else VideoMUX(2) & VideoMUX(2) & '0'; --El ultimo bit lo ponemos a cero para el color
        O_VIDEO_G <= VideoRGB_X2(1) & VideoRGB_X2(1) & '0' when dbl_scan = '1' else VideoMUX(1) & VideoMUX(1) & '0'; --no salga tan puro y haga el efecto de plastico
		  O_VIDEO_B <= VideoRGB_X2(0) & VideoRGB_X2(0) & '0' when dbl_scan = '1' else VideoMUX(0) & VideoMUX(0) & '0'; --para hacelo puro cambiar el '0' por el VideoXXX(x) que sea
  		  O_HSYNC   <= HSync_X2 when dbl_scan = '1' else not (vsync xor hsync);  --csync; --not (vsync xor hsync); --(vsync and hsync) --(en csync va bien el video compuesto pero mal en RGB)
		  O_VSYNC   <= VSync_X2 when dbl_scan = '1' else '1'; 
 
  --
  -- Audio
  --
  u_audio : entity work.invaders_audio
	port map (
	  Clk => Clk,
	  S1  => SoundCtrl3,
	  S2  => SoundCtrl5,
	  Aud => Audio
	  );

  u_dac : entity work.dac
	generic map(
	  msbi_g => 7
	)
	port  map(
	  clk_i   => Clk,
	  res_n_i => Rst_n_s,
	  dac_i   => Audio,
	  dac_o   => AudioPWM
	);

  O_AUDIO_L <= AudioPWM;
  O_AUDIO_R <= AudioPWM;

  joystick_reg  <= I_JOYSTICK_A;
  joystick2_reg <= I_JOYSTICK_A;
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
  buttons(2) <= button_in(2) when scanSW(9) = '0' else button_in(0);
  buttons(3) <= button_in(3) when scanSW(9) = '0' else button_in(1);
  buttons(8 downto 4) <= button_in(8 downto 4);
  buttons(9)  <= button_in(9)  when scanSW(9) = '0' else button_in(11);
  buttons(10) <= button_in(10) when scanSW(9) = '0' else button_in(12);
  buttons(11) <= button_in(11) when scanSW(9) = '0' else button_in(9);
  buttons(12) <= button_in(12) when scanSW(9) = '0' else button_in(10);
  buttons(15 downto 13) <= button_in(15 downto 13);

  u_debounce : entity work.BUTTON_DEBOUNCE
  generic map (
    G_WIDTH => 16
    )
  port map (
    I_BUTTON => buttons,
    O_BUTTON => button_debounced,
    CLK      => clk
    );

input_registers : process
  begin
   wait until rising_edge(clk);
	GDB0(0) <= '0';  -- Unused ?
	GDB0(1) <= '0';
	GDB0(2) <= '0';  -- Unused ?
	GDB0(3) <= '0';             -- Unused ?
	GDB0(4) <= '0'; --Fire p?
	GDB0(5) <= '0'; --left p?
	GDB0(6) <= '1'; --right p?
	GDB0(7) <= '0';  -- Unused ?

	GDB1(0) <= button_debounced(8); -- Coin 1 - Active High !
	GDB1(1) <= not button_debounced(7); --star p2
	GDB1(2) <= not button_debounced(6); --star p1
	GDB1(3) <= '0';             -- Unused ?
	GDB1(4) <= not button_debounced(4); -- Fire p1 - Active Low
	GDB1(5) <= not button_debounced(2); -- MoveLeft p1 - Active Low
	GDB1(6) <= not button_debounced(3); -- MoveRight p1 - Active Low
	GDB1(7) <= '1';             -- Unused ?

	GDB2(0) <= '0';  -- LSB Lives 3-6
	GDB2(1) <= '0';  -- MSB Lives 3-6
	GDB2(2) <= '0';  -- Tilt
	GDB2(3) <= '0';  -- Bonus life at 1000 or 1500
	GDB2(4) <= '0'; --not button_debounced(13); -- Fire p2 - Active Low
	GDB2(5) <= '0'; --not button_debounced(12); -- MoveRight p2 - Active Low
	GDB2(6) <= '0'; --not button_debounced(11); -- MoveLeft p2 - Active Low
	GDB2(7) <= '0';  -- Coin info
  end process;

end;
