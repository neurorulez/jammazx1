//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Quest 2017
//---------------------------------------------------------------------------------
// Copyright (c) MikeJ - January 2006
//

`timescale 1 ps / 1 ps

module mrdo_top (
  input  wire CLK,
  input  wire [5:0] JOYSTICK,
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
  
  output wire LED,

 	output wire [3:0] JR,
   output wire [3:0] JG,
   output wire [3:0] JB,
   output wire JHSYNC,
   output wire JVSYNC,
   output wire JAUDIO,
	output wire JSELECT,
	input  wire [7:0] JJOY,
	input  wire [1:0] JCOIN,
	input  wire JSERVICE,
	input  wire JTEST
);

  wire [1:0] scandblctrl;
  
  assign O_NTSC = 1'b0;
  assign O_PAL = 1'b1;

  // MODULO
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign LED = scanSW[9];  
 assign resetHW = resetKey | !JTEST; 
 
wire ext_rst;
assign ext_rst = JSERVICE; 
reg [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
reg M_HSYNC,M_VSYNC;
assign O_VIDEO_R = M_VIDEO_R;
assign O_VIDEO_G = M_VIDEO_G;
assign O_VIDEO_B = M_VIDEO_B;
assign O_HSYNC=M_HSYNC;
assign O_VSYNC=M_VSYNC;
assign JR = {M_VIDEO_R,1'b0};
assign JG = {M_VIDEO_G,1'b0};
assign JB = {M_VIDEO_B,1'b0};

assign JHSYNC = M_HSYNC;
assign JVSYNC = M_VSYNC;
assign JAUDIO = O_AUDIO_M;

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
  
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;

parameter joyType = 1; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin //Joy Splitter Jamma
   assign JSELECT = joy_split;
   always @(posedge pclk) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge pclk) begin 
		if (~joy_split)
				joy1 <= JJOY & {2'b11, JOYSTICK};
		if (joy_split) 
				joy2 <= JJOY;	
   end  		
   assign joystick1 = joy1;
   assign joystick2 = joy2;
 end else begin //Find del If Joytype si llega aqui es 0, por lo que se asigna solo 1 Joy y el otro joy a pull-up
	assign joystick1 = {2'b11,JOYSTICK};
	assign joystick2 = 8'b11111111;
	assign JSELECT = 1'b0;
 end
endgenerate  //Fin de la generacion segun JoyType

  
  mrdo_zxuno pm (
	 .CLK(CLK),
    .O_VIDEO_R(M_VIDEO_R),
    .O_VIDEO_G(M_VIDEO_G),
    .O_VIDEO_B(M_VIDEO_B),
    .O_HSYNC(M_HSYNC),
    .O_VSYNC(M_VSYNC),
//    .O_BLANKING(vga_blanking),
    .O_AUDIO_L(O_AUDIO_ML),
    .O_AUDIO_R(O_AUDIO_MR),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
    .JOYSTICK_A_GND(),
    .JOYSTICK_B_GND(),
	 .I_PLAYER({joystick2[7],joystick1[7]}),
	 .I_COIN(JCOIN),
	 .scanSW(scanSW),
	 .resetKey(resetHW),
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
	  .REBOOT(master_reset || !ext_rst)
	);  

endmodule
