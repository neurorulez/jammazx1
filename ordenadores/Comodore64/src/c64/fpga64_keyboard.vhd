-- -----------------------------------------------------------------------
--
--                                 FPGA 64
--
--     A fully functional commodore 64 implementation in a single FPGA
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
-- -----------------------------------------------------------------------
-- 'Joystick emulation on keypad' additions by
-- Mark McDougall (msmcdoug@iinet.net.au)
-- -----------------------------------------------------------------------
--
-- VIC20/C64 Keyboard matrix
--
-- Hardware huh?
--	In original machine if a key is pressed a contact is made.
--	Bidirectional reading is possible on real hardware, which is difficult
--	to emulate. (set backwardsReadingEnabled to '1' if you want this enabled).
--	Then we have the joysticks, one of which is normally connected
--	to a OUTPUT pin.
--
-- Emulation:
--	All pins are high except when one is driven low and there is a
--	connection. This is consistent with joysticks that force a line
--	low too. CIA will put '1's when set to input to help this emulation.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.ALL;

entity fpga64_keyboard is
	port (
		clk: in std_logic;
		ps2_key : in std_logic_vector(7 downto 0);
		ps2_ok  : in std_logic;
		joyA: in unsigned(4 downto 0);
		joyB: in unsigned(4 downto 0);

		pai: in unsigned(7 downto 0);
		pbi: in unsigned(7 downto 0);
		pao: out unsigned(7 downto 0);
		pbo: out unsigned(7 downto 0);
		
		reset_key   : out std_logic;
		restore_key : out std_logic;
		videoKey    : out std_logic;
		rgbKey      : out std_logic;
		colorKey    : out std_logic;
		romKey      : out std_logic;
		
		disk_num : out std_logic_vector(7 downto 0);
		
		-- Config
		-- backwardsReadingEnabled = 1 allows reversal of PIA registers to still work.
		-- not needed for kernel/normal operation only for some specific programs.
		-- set to 0 to save some hardware.
		backwardsReadingEnabled : in std_logic
	);
end fpga64_keyboard;

architecture rtl of fpga64_keyboard is	
	signal extended: std_logic := '0';
	signal release: std_logic := '0';

	signal key_del: std_logic := '0';
	signal key_return: std_logic := '0';
	signal key_left: std_logic := '0';
	signal key_right: std_logic := '0';
	signal key_f7: std_logic := '0';
	signal key_f1: std_logic := '0';
	signal key_f3: std_logic := '0';
	signal key_f5: std_logic := '0';
	signal key_up: std_logic := '0';
	signal key_down: std_logic := '0';

	signal key_3: std_logic := '0';
	signal key_W: std_logic := '0';
	signal key_A: std_logic := '0';
	signal key_4: std_logic := '0';
	signal key_Z: std_logic := '0';
	signal key_S: std_logic := '0';
	signal key_E: std_logic := '0';
	signal key_shiftl: std_logic := '0';

	signal key_5: std_logic := '0';
	signal key_R: std_logic := '0';
	signal key_D: std_logic := '0';
	signal key_6: std_logic := '0';
	signal key_C: std_logic := '0';
	signal key_F: std_logic := '0';
	signal key_T: std_logic := '0';
	signal key_X: std_logic := '0';
	
	signal key_7: std_logic := '0';
	signal key_Y: std_logic := '0';
	signal key_G: std_logic := '0';
	signal key_8: std_logic := '0';
	signal key_B: std_logic := '0';
	signal key_H: std_logic := '0';
	signal key_U: std_logic := '0';
	signal key_V: std_logic := '0';

	signal key_9: std_logic := '0';
	signal key_I: std_logic := '0';
	signal key_J: std_logic := '0';
	signal key_0: std_logic := '0';
	signal key_M: std_logic := '0';
	signal key_K: std_logic := '0';
	signal key_O: std_logic := '0';
	signal key_N: std_logic := '0';

	signal key_plus: std_logic := '0';
	signal key_P: std_logic := '0';
	signal key_L: std_logic := '0';
	signal key_minus: std_logic := '0';
	signal key_dot: std_logic := '0';
	signal key_colon: std_logic := '0';
	signal key_at: std_logic := '0';
	signal key_comma: std_logic := '0';

	signal key_pound: std_logic := '0';
	signal key_star: std_logic := '0';
	signal key_semicolon: std_logic := '0';
	signal key_home: std_logic := '0';
	signal key_shiftr: std_logic := '0';
	signal key_equal: std_logic := '0';
	signal key_arrowup: std_logic := '0';
	signal key_slash: std_logic := '0';

	signal key_1: std_logic := '0';
	signal key_arrowleft: std_logic := '0';
	signal key_ctrl: std_logic := '0';
	signal key_2: std_logic := '0';
	signal key_space: std_logic := '0';
	signal key_commodore: std_logic := '0';
	signal key_Q: std_logic := '0';
	signal key_runstop: std_logic := '0';

	-- for joystick emulation on PS2
	signal joySelKey : std_logic := '0';
	signal joyKeys   : std_logic_vector(joyA'range) := (others => '1');	-- active low
	signal joyA_s    : unsigned(joyA'range);										-- active low
	signal joyB_s    : unsigned(joyB'range);										-- active low

	-- for disk image selection
	signal diskChgKeyFw : std_logic;
   signal diskChgKeyBw : std_logic;
	signal disk_nb : std_logic_vector(7 downto 0);
	
begin

	joyA_s <= joyA and unsigned(joyKeys) when joySelKey = '0' else joyA;
	joyB_s <= joyB and unsigned(joyKeys) when joySelKey = '1' else joyB;
	
	disk_num <= disk_nb;

	matrix: process(clk)
	begin
		if rising_edge(clk) then
			-- reading A, scan pattern on B
			pao(0) <= pai(0) and joyA_s(0) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_del) and
				(pbi(1) or not key_return) and
				(pbi(2) or not (key_left or key_right)) and
				(pbi(3) or not key_f7) and
				(pbi(4) or not key_f1) and
				(pbi(5) or not key_f3) and
				(pbi(6) or not key_f5) and
				(pbi(7) or not (key_up or key_down))));
			pao(1) <= pai(1) and joyA_s(1) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_3) and
				(pbi(1) or not key_W) and
				(pbi(2) or not key_A) and
				(pbi(3) or not key_4) and
				(pbi(4) or not key_Z) and
				(pbi(5) or not key_S) and
				(pbi(6) or not key_E) and
				(pbi(7) or not (key_left or key_up or key_shiftL))));
			pao(2) <= pai(2) and joyA_s(2) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_5) and
				(pbi(1) or not key_R) and
				(pbi(2) or not key_D) and
				(pbi(3) or not key_6) and
				(pbi(4) or not key_C) and
				(pbi(5) or not key_F) and
				(pbi(6) or not key_T) and
				(pbi(7) or not key_X)));
			pao(3) <= pai(3) and joyA_s(3) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_7) and
				(pbi(1) or not key_Y) and
				(pbi(2) or not key_G) and
				(pbi(3) or not key_8) and
				(pbi(4) or not key_B) and
				(pbi(5) or not key_H) and
				(pbi(6) or not key_U) and
				(pbi(7) or not key_V)));
			pao(4) <= pai(4) and joyA_s(4) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_9) and
				(pbi(1) or not key_I) and
				(pbi(2) or not key_J) and
				(pbi(3) or not key_0) and
				(pbi(4) or not key_M) and
				(pbi(5) or not key_K) and
				(pbi(6) or not key_O) and
				(pbi(7) or not key_N)));
			pao(5) <= pai(5) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_plus) and
				(pbi(1) or not key_P) and
				(pbi(2) or not key_L) and
				(pbi(3) or not key_minus) and
				(pbi(4) or not key_dot) and
				(pbi(5) or not key_colon) and
				(pbi(6) or not key_at) and
				(pbi(7) or not key_comma)));
			pao(6) <= pai(6) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_pound) and
				(pbi(1) or not key_star) and
				(pbi(2) or not key_semicolon) and
				(pbi(3) or not key_home) and
				(pbi(4) or not key_shiftr) and
				(pbi(5) or not key_equal) and
				(pbi(6) or not key_arrowup) and
				(pbi(7) or not key_slash)));
			pao(7) <= pai(7) and
				((not backwardsReadingEnabled) or
				((pbi(0) or not key_1) and
				(pbi(1) or not key_arrowleft) and
				(pbi(2) or not key_ctrl) and
				(pbi(3) or not key_2) and
				(pbi(4) or not key_space) and
				(pbi(5) or not key_commodore) and
				(pbi(6) or not key_Q) and
				(pbi(7) or not key_runstop)));

			-- reading B, scan pattern on A
			pbo(0) <= pbi(0) and joyB_s(0) and 
				(pai(0) or not key_del) and
				(pai(1) or not key_3) and
				(pai(2) or not key_5) and
				(pai(3) or not key_7) and
				(pai(4) or not key_9) and
				(pai(5) or not key_plus) and
				(pai(6) or not key_pound) and
				(pai(7) or not key_1);
			pbo(1) <= pbi(1) and joyB_s(1) and
				(pai(0) or not key_return) and
				(pai(1) or not key_W) and
				(pai(2) or not key_R) and
				(pai(3) or not key_Y) and
				(pai(4) or not key_I) and
				(pai(5) or not key_P) and
				(pai(6) or not key_star) and
				(pai(7) or not key_arrowleft);
			pbo(2) <= pbi(2) and joyB_s(2) and
				(pai(0) or not (key_left or key_right)) and
				(pai(1) or not key_A) and
				(pai(2) or not key_D) and
				(pai(3) or not key_G) and
				(pai(4) or not key_J) and
				(pai(5) or not key_L) and
				(pai(6) or not key_semicolon) and
				(pai(7) or not key_ctrl);
			pbo(3) <= pbi(3) and joyB_s(3) and
				(pai(0) or not key_F7) and
				(pai(1) or not key_4) and
				(pai(2) or not key_6) and
				(pai(3) or not key_8) and
				(pai(4) or not key_0) and
				(pai(5) or not key_minus) and
				(pai(6) or not key_home) and
				(pai(7) or not key_2);
			pbo(4) <= pbi(4) and joyB_s(4) and
				(pai(0) or not key_F1) and
				(pai(1) or not key_Z) and
				(pai(2) or not key_C) and
				(pai(3) or not key_B) and
				(pai(4) or not key_M) and
				(pai(5) or not key_dot) and
				(pai(6) or not key_shiftr) and
				(pai(7) or not key_space);
			pbo(5) <= pbi(5) and
				(pai(0) or not key_F3) and
				(pai(1) or not key_S) and
				(pai(2) or not key_F) and
				(pai(3) or not key_H) and
				(pai(4) or not key_K) and
				(pai(5) or not key_colon) and
				(pai(6) or not key_equal) and
				(pai(7) or not key_commodore);
			pbo(6) <= pbi(6) and
				(pai(0) or not key_F5) and
				(pai(1) or not key_E) and
				(pai(2) or not key_T) and
				(pai(3) or not key_U) and
				(pai(4) or not key_O) and
				(pai(5) or not key_at) and
				(pai(6) or not key_arrowup) and
				(pai(7) or not key_Q);
			pbo(7) <= pbi(7) and
				(pai(0) or not (key_up or key_down)) and
				(pai(1) or not (key_left or key_up or key_shiftL)) and
				(pai(2) or not key_X) and
				(pai(3) or not key_V) and
				(pai(4) or not key_N) and
				(pai(5) or not key_comma) and
				(pai(6) or not key_slash) and
				(pai(7) or not key_runstop);
				--Puesta a 0 de teclas especiales que no vale el "not release"
				reset_key <= '0'; 
				colorKey  <= '0'; 
				romKey    <= '0'; 
				videoKey  <= '0'; 
				rgbKey    <= '0'; 
				diskChgKeyFw <= '0'; 
				diskChgKeyBw <= '0'; 
		if ps2_ok = '1' then
			if ps2_key = X"e0" then
					-- Extended key code follows
					extended <= '1';
				elsif ps2_key = X"f0" then
					-- Release code follows
					release <= '1';
				else
					-- Cancel extended/release flags for next time
					release <= '0';
					extended <= '0';
				case ps2_key(7 downto 0) is
				when X"03" => key_F5 <= not release; --F5
				when X"04" => key_F3 <= not release; --F3
				when X"05" => key_F1 <= not release; --F1
				when X"83" => key_F7 <= not release; --F7
				--when X"06" => -- F2
				--when X"0A" => -- F8
				--when X"0B" => -- F6
				--when X"0C" => -- F4
            when X"01" => colorKey <= not release;       -- F9
            when X"09" => romKey <= not release;         -- F10
				when X"78" => joySelKey <= joySelKey xor not release;-- F11
				when X"07" => videoKey <= not release;       -- F12  
            when X"7E" => rgbKey <= not release;         -- Scroll Lock					
				when X"0D" => restore_key <= not release;    -- TAB
				when X"7C" => key_pound <= not release;      -- "*" KBNUM
				when X"79" => key_plus <= not release;       -- "+" KBNUM
				when X"0E" => key_arrowleft <= not release;
				when X"11" => key_commodore <= not release; 
				when X"12" => key_shiftl <= not release;
				when X"14" => key_ctrl <= not release; 
				when X"15" => key_Q <= not release; 
				when X"16" => key_1 <= not release; 
				when X"1A" => key_Z <= not release; 
				when X"1B" => key_S <= not release; 
				when X"1C" => key_A <= not release; 
				when X"1D" => key_W <= not release; 
				when X"1E" => key_2 <= not release; 
				when X"21" => key_C <= not release; 
				when X"22" => key_X <= not release; 
				when X"23" => key_D <= not release; 
				when X"24" => key_E <= not release; 
				when X"25" => key_4 <= not release; 
				when X"26" => key_3 <= not release; 
				when X"29" => key_space <= not release; 
				when X"2A" => key_V <= not release; 
				when X"2B" => key_F <= not release; 
				when X"2C" => key_T <= not release; 
				when X"2D" => key_R <= not release; 
				when X"2E" => key_5 <= not release; 
				when X"31" => key_N <= not release; 
				when X"32" => key_B <= not release; 
				when X"33" => key_H <= not release; 
				when X"34" => key_G <= not release; 
				when X"35" => key_Y <= not release; 
				when X"36" => key_6 <= not release; 
				when X"3A" => key_M <= not release; 
				when X"3B" => key_J <= not release; 
				when X"3C" => key_U <= not release; 
				when X"3D" => key_7 <= not release; 
				when X"3E" => key_8 <= not release;
				when X"41" => key_comma <= not release; 
				when X"42" => key_K <= not release;
				when X"43" => key_I <= not release; 
				when X"44" => key_O <= not release; 
				when X"45" => key_0 <= not release; 
				when X"46" => key_9 <= not release; 
				when X"49" => key_dot <= not release; 
				when X"4A" => key_slash <= not release; 
				when X"4B" => key_L <= not release; 
				when X"4C" => key_colon <= not release; 
				when X"4D" => key_P <= not release; 
				when X"4E" => key_minus <= not release;
				when X"52" => key_semicolon <= not release; 
				when X"54" => key_at <= not release; 
				when X"55" => key_equal <= not release;
				when X"59" => key_shiftr <= not release;
				when X"5A" => key_Return <= not release; 
				when X"5B" => key_star <= not release; 
				when X"5D" => key_arrowup <= not release;
				when X"6B" => if extended = '0' then joyKeys(2) <= release; else key_left <= not release; end if;
				when X"6C" => key_home <= not release; 
				when X"66" => key_del <= not release; 
				when X"71" => if key_ctrl = '1' and key_commodore = '1' then reset_key <= not release; end if;
				when X"70" => if extended = '0' then joyKeys(4) <= release; end if;
				when X"72" => if extended = '0' then joyKeys(1) <= release; else key_down <= not release; end if;
				when X"74" => if extended = '0' then joyKeys(3) <= release; else key_right <= not release; end if;
				when X"75" => if extended = '0' then joyKeys(0) <= release; else key_up <= not release; end if;
				when X"76" => key_runstop <= not release; 
            when X"7A" => if extended = '1' then if release = '1' then 
																						if    (key_ctrl = '1') then disk_nb <= disk_nb + 100;
																						elsif (key_shiftl = '1' or key_shiftr = '1') then disk_nb <= disk_nb + 10; 
																						else  disk_nb <= disk_nb + 1; end if; end if; end if;
            when X"7D" => if extended = '1' then if release = '1' then 
																						if    (key_ctrl = '1') then disk_nb <= disk_nb - 100;
																						elsif (key_shiftl = '1' or key_shiftr = '1') then disk_nb <= disk_nb - 10; 
																						else  disk_nb <= disk_nb - 1; end if; end if; end if;
				when others => null;
				end case;
			 end if;	
			end if;
		end if; --Rising clock
	end process;
end architecture;
