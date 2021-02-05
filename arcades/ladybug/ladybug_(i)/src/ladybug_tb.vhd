--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:37 01/30/2013
-- Design Name:   
-- Module Name:   C:/Users/alex/workspace/fpga_ladybug-2.1_papilio/ladybug_tb.vhd
-- Project Name:  ladybug_papilio
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: papilio_ladybug
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ladybug_tb IS
END ladybug_tb;
 
ARCHITECTURE behavior OF ladybug_tb IS 

   --Inputs
   signal CLK_IN : std_logic := '0';
   signal I_RESET : std_logic := '0';
   signal I_SW : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal O_VIDEO_R : std_logic_vector(3 downto 0);
   signal O_VIDEO_G : std_logic_vector(3 downto 0);
   signal O_VIDEO_B : std_logic_vector(3 downto 0);
   signal O_VSYNC : std_logic;
   signal O_HSYNC : std_logic;
   signal O_AUDIO_L : std_logic;
   signal O_AUDIO_R : std_logic;
   signal O_LED : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_IN_period : time := 31.25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.papilio_ladybug PORT MAP (
          CLK_IN    => CLK_IN,
          I_RESET   => I_RESET,
          O_VIDEO_R => O_VIDEO_R,
          O_VIDEO_G => O_VIDEO_G,
          O_VIDEO_B => O_VIDEO_B,
          O_VSYNC   => O_VSYNC,
          O_HSYNC   => O_HSYNC,
          O_AUDIO_L => O_AUDIO_L,
          O_AUDIO_R => O_AUDIO_R
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		I_SW <= "0000";
		I_RESET <= '1';
      wait for 100 ns;	
		I_RESET <= '0';

      wait for CLK_IN_period*16;

      -- insert stimulus here 

      wait;
   end process;

END;
