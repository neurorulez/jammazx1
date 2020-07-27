-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
-- Date        : Sat May  4 12:56:19 2019
-- Host        : W7-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               F:/repos/a35/NUEVO/comodore64_beta_7/A35/A35.srcs/sources_1/ip/relojes/relojes_stub.vhdl
-- Design      : relojes
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tftg256-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity relojes is
  Port ( 
    clk32 : out STD_LOGIC;
    clk32n : out STD_LOGIC;
    clk64 : out STD_LOGIC;
    clk64ps : out STD_LOGIC;
    clk_ctrl : out STD_LOGIC;
    locked : out STD_LOGIC;
    clock_50 : in STD_LOGIC
  );

end relojes;

architecture stub of relojes is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk32,clk32n,clk64,clk64ps,clk_ctrl,locked,clock_50";
begin
end;