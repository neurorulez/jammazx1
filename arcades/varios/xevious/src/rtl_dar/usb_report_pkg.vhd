library ieee;
use ieee.std_logic_1164.all;

package usb_report_pkg is
	-- range depend on device report length but shall not be less than (0 to 8)
	type   usb_report_t is array (0 to 14) of std_logic_vector(7 downto 0);
end;	
