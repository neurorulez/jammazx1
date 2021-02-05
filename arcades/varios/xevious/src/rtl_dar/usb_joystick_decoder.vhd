---------------------------------------------------------------------------------
-- Usb joystick decoder by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.usb_report_pkg.all;

entity usb_joystick_decoder is
port(
 clk     : in std_logic;
 
 usb_report : in usb_report_t;
 new_usb_report : in std_logic;
 
 joyBCPPFRLDU : inout std_logic_vector (8 downto 0)

);
end usb_joystick_decoder;

architecture struct of usb_joystick_decoder is

signal data : std_logic_vector(8 downto 0) := '0'&X"AA";

begin

joystick_decoder : process (clk)
	variable byte_cnt : integer range 0 to 9;
begin 
	if rising_edge(clk) then
--		joyBCPPFRLDU <= (others => '0');
		if new_usb_report = '1' then
			joyBCPPFRLDU(0) <= usb_report(3)(0);  -- #2 0x01 (up)      dir. cross up
			joyBCPPFRLDU(1) <= usb_report(3)(1);  -- #2 0x02 (down)    dir. cross low
			joyBCPPFRLDU(2) <= usb_report(3)(2);  -- #2 0x04 (left)    dir. cross left
			joyBCPPFRLDU(3) <= usb_report(3)(3);  -- #2 0x08 (right)   dir. cross right
			joyBCPPFRLDU(4) <= usb_report(4)(4);  -- #3 0x10 (fire)    btn low
			joyBCPPFRLDU(5) <= usb_report(4)(0);  -- #3 0x01 (start 1) trigger left
			joyBCPPFRLDU(6) <= usb_report(4)(1);  -- #3 0x02 (start 2) trigger right
			joyBCPPFRLDU(7) <= usb_report(4)(7);  -- #3 0x80 (coin)    btn up
			joyBCPPFRLDU(8) <= usb_report(4)(6);  -- #3 0x40 (bomb)    btn left		
		end if;
	end if;
end process;

end struct;