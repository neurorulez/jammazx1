-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
-- Date        : Wed May 29 14:36:04 2019
-- Host        : W7-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               F:/repos/a35/NUEVO/mpatrol/A35/A35.srcs/sources_1/ip/relojes/relojes_stub.vhdl
-- Design      : relojes
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tftg256-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity relojes is
  Port ( 
    clock_7164 : out STD_LOGIC;
    clk12 : out STD_LOGIC;
    clk30 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    inclk0 : in STD_LOGIC
  );

end relojes;

architecture stub of relojes is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clock_7164,clk12,clk30,reset,locked,inclk0";
begin
end;
