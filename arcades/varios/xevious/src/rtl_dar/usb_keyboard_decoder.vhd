---------------------------------------------------------------------------------
-- Usb keyboard decoder by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.usb_report_pkg.all;

entity usb_keyboard_decoder is
port(
 clk     : in std_logic;
 
 usb_report : in usb_report_t;
 new_usb_report : in std_logic;
 
 joyBCPPFRLDU : inout std_logic_vector (8 downto 0)

);
end usb_keyboard_decoder;

architecture struct of usb_keyboard_decoder is

signal data : std_logic_vector(8 downto 0) := '0'&X"AA";

begin

keyboard_decoder : process (clk)
	variable byte_cnt : integer range 0 to 9;
begin 
	if rising_edge(clk) then
		if new_usb_report = '1' then
			-- usb keyboard report is 9 bytes
			-- first byte (#0) is max3421e status
			-- then 2 bytes are for modifiers keys
			-- (only use ctrl key : 0x01 of byte #1)
			if usb_report(1)(0) = '1' then 
				data <= '1'&X"00"; -- ctrl (bomb)
			else
				data <= (others => '0');			
			end if;
			byte_cnt := 3;
		else
			-- scan bytes #3 to #9 for normal keys
 			if byte_cnt < 10 then
				case usb_report(byte_cnt) is
					when X"52" => data <= data or '0'&X"01";  -- arrow up
					when X"51" => data <= data or '0'&X"02";  -- arrow down
					when X"50" => data <= data or '0'&X"04";  -- arrow left
					when X"4F" => data <= data or '0'&X"08";  -- arrow right
					when X"2C" => data <= data or '0'&X"10";  -- space (fire)
					when X"3A" => data <= data or '0'&X"20";  -- F1 (start 1)
					when X"3B" => data <= data or '0'&X"40";  -- F2 (start 2)
					when X"3C" => data <= data or '0'&X"80";  -- F3 (coin)
					when others => null;
				end case;	
				byte_cnt := byte_cnt +1;
			else
				-- when all bytes scanned return bit pattern
				-- if byte #3 = 0x01 keyboard overflow (too many keys down)
				--   then keep previous bit pattern
				if usb_report(3) /= X"01" then
					joyBCPPFRLDU <= data;
				end if;
			end if;
			
		end if;
	end if;
end process;

end struct;