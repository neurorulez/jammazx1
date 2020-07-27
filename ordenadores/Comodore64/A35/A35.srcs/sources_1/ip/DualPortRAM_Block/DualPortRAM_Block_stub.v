// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
// Date        : Thu May  2 13:49:39 2019
// Host        : W7-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               f:/repos/a35/NUEVO/comodore64_beta_7/A35/A35.srcs/sources_1/ip/DualPortRAM_Block/DualPortRAM_Block_stub.v
// Design      : DualPortRAM_Block
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3.1" *)
module DualPortRAM_Block(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[8:0],dina[7:0],douta[7:0],clkb,web[0:0],addrb[8:0],dinb[7:0],doutb[7:0]" */;
  input clka;
  input [0:0]wea;
  input [8:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  input clkb;
  input [0:0]web;
  input [8:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
endmodule
