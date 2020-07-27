// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
// Date        : Sat May  4 12:28:17 2019
// Host        : W7-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ relojes_stub.v
// Design      : relojes
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk32, clk32n, clk64, clk64ps, clk_ctrl, locked, 
  clock_50)
/* synthesis syn_black_box black_box_pad_pin="clk32,clk32n,clk64,clk64ps,clk_ctrl,locked,clock_50" */;
  output clk32;
  output clk32n;
  output clk64;
  output clk64ps;
  output clk_ctrl;
  output locked;
  input clock_50;
endmodule
