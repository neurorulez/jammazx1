//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Quest 2017
//---------------------------------------------------------------------------------
// Copyright (c) MikeJ - January 2006
//

`timescale 1 ps / 1 ps

module mooncresta_top (
  input  wire CLK,
  input  wire [5:0] JOYSTICK,
  input  wire [5:0] JOYSTICK_MFH, 
  output wire joy_split_out,  
//  input wire ext_rst,
//  input wire ext_p1,
//  input wire ext_p2,
//  input wire ext_ic,
  output [2:0] O_VIDEO_R, 
  output [2:0] O_VIDEO_G, 
  output [2:0] O_VIDEO_B,
  output O_HSYNC,
  output O_VSYNC,
  
  output [20:0] sram_addr,
  input  [1:0]  sram_dq,
  output sram_we_n,

  output O_NTSC,
  output O_PAL,
  
  output wire O_AUDIO_L,
  output wire O_AUDIO_R,
  
  input wire ps2_clk,
  input wire ps2_data,
  
  output wire O_LED
  
);

  wire [1:0] scandblctrl;
  
  assign O_NTSC = 1'b0;
  assign O_PAL = 1'b1;

  // MODULO
  wire resetKey, master_reset;
  wire [20:0]scanSW;
 
 assign O_LED = scanSW[9];  

reg O_AUDIO_ML,O_AUDIO_MR,O_AUDIO_M;
reg [8:0]O_AUDIO_CNT = 9'd0;
assign O_AUDIO_L = O_AUDIO_M;
assign O_AUDIO_R = O_AUDIO_M;
always @(posedge pclk) begin 
 O_AUDIO_CNT <= O_AUDIO_CNT +9'd1;
 if(O_AUDIO_CNT[8] == 1'b0) begin 
  O_AUDIO_M <= O_AUDIO_ML;  
  end else begin 
  O_AUDIO_M <= O_AUDIO_MR; 
  end 
end

  wire [5:0] joystick1, joystick2;
   reg [5:0] joy1, joy2;
   reg joy_split;

parameter joyType = 0; //0=Nada . 1=JoySplitter . 2=Jamma . 3=MFH
generate //generar segun joyType
 if (joyType == 1) begin //Joy Splitter
   assign joy_split_out = joy_split;
   always @(posedge pclk) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge pclk) begin 
		if (~joy_split)
				joy1 <= JOYSTICK;
		if (joy_split) 
				joy2 <= JOYSTICK;	
   end  		
   assign joystick1 = joy1;
   assign joystick2 = joy2;
 end else if (joyType == 3) begin
	assign joystick1 = JOYSTICK;
	assign joystick2 = JOYSTICK_MFH;
	assign joy_split_out = 1'b0;
 end else begin //Find del If Joytype si llega aqui es 0, por lo que se asigna solo 1 Joy y el otro joy a pull-up
	assign joystick1 = JOYSTICK;
	assign joystick2 = 8'b11111111;
	assign joy_split_out = 1'b0;
 end
endgenerate  //Fin de la generacion segun JoyType

  
  mooncresta pm (
	 .CLK(CLK),
    .O_VIDEO_R(O_VIDEO_R),
    .O_VIDEO_G(O_VIDEO_G),
    .O_VIDEO_B(O_VIDEO_B),
    .O_HSYNC(O_HSYNC),
    .O_VSYNC(O_VSYNC),
//    .O_BLANKING(vga_blanking),
    .O_AUDIO_L(O_AUDIO_ML),
    .O_AUDIO_R(O_AUDIO_MR),
    .I_JOYSTICK_A(joystick1),
    .I_JOYSTICK_B(joystick2),
    .JOYSTICK_A_GND(),
    .JOYSTICK_B_GND(),
//   .I_RESET(reserkey),
//	 .ext_rst(ext_rst),
//	 .ext_p1(ext_p1),
//	 .ext_p2(ext_p2),
//	 .ext_ic(ext_ic),
	 .scanSW(scanSW),
	 .resetKey(resetKey),
	 .scandblctrl(scandblctrl),
	 .PCLK(pclk)
  );
  

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 assign sram_addr = 21'b000001000111111010101; 	
 assign scandblctrl = sram_dq[1:0];  
 assign sram_we_n = 1'b1;

  keyboard keyb (
		.CLOCK(pclk),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);
  
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(pclk),
	  .REBOOT(master_reset)
	  //.REBOOT(master_reset || !ext_rst)
	);  

endmodule
