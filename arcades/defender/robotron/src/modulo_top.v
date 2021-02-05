//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Quest 2017
//---------------------------------------------------------------------------------
// Copyright (c) MikeJ - January 2006
//

`timescale 1 ps / 1 ps

module defender_top (
  input  wire SYS_CLK,
  input  wire [5:0] JOYSTICK,
  output [2:0] vga_red, 
  output [2:0] vga_green, 
  output [2:0] vga_blue,
  output vga_hsync,
  output vga_vsync,
  
  output [20:0] sram_addr,
  input  [1:0]  sram_dq,
  output sram_we_n,

  output O_NTSC,
  output O_PAL,
  
  output wire audio_l,
  output wire audio_r,
  
  input wire ps2_clk,
  input wire ps2_data,
  
  output wire LED/*,

  	output wire [3:0] JR,
   output wire [3:0] JG,
   output wire [3:0] JB,
   output wire JHSYNC,
   output wire JVSYNC,
   output wire JAUDIO,
	output wire JSELECT,
	input  wire [7:0] JJOY,
	input  wire [1:0] JCOIN,
	input  wire JTEST,
	input  wire JSERVICE */
);

  	wire [3:0] JR;
   wire [3:0] JG;
   wire [3:0] JB;
   wire JHSYNC;
   wire JVSYNC;
   wire JAUDIO;
	wire JSELECT;
	wire [7:0] JJOY;
	wire [1:0] JCOIN;
	wire JTEST;
	wire JSERVICE;

  wire [1:0] scandblctrl;

  wire pllclk0, pllclk1, pllclk2;
  wire pll_lckd;
  wire clkfbout;
  wire reset;
  
 // wire [5:0] JOYSTICK2;          //Variable temporal hasta que se meta la señal de Joystick 2 en el .UCF
  //assign JOYSTICK2 = 6'b111111;  //Asignacion temporal al Joystick en Pullup
  //assign JOYSTICK2 = JOYSTICK;

  BUFG pclkbufg  (.I(pllclk0), .O(clk12));
  BUFG pclkbufg1 (.I(pllclk1), .O(clk3p58));
  BUFG pclkbufg2 (.I(pllclk2), .O(pclk));

  //////////////////////////////////////////////////////////////////
  // 10x pclk is used to drive IOCLK network so a bit rate reference
  // can be used by OSERDES2
  //////////////////////////////////////////////////////////////////
  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(6),      //
    .CLKOUT0_DIVIDE(25),    //12 Mhz
    .CLKOUT1_DIVIDE(83.75), //3.58hz
    .CLKOUT2_DIVIDE(12.5),  //24Mhz
    .COMPENSATION("INTERNAL")
  ) PLL_OSERDES (
    .CLKFBOUT(clkfbout),
    .CLKOUT0(pllclk0),
    .CLKOUT1(pllclk1),
    .CLKOUT2(pllclk2),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(pll_lckd),
    .CLKFBIN(clkfbout),
    .CLKIN(SYS_CLK),
    .RST(1'b0)
  );


  assign O_NTSC = 1'b0;
  assign O_PAL = 1'b1;

  // Relojes 12 y 6Mhz
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_12;
  wire ena_6;  
  always @ (posedge pclk or negedge pll_lckd) begin
    if (!pll_lckd) begin
      delay_count <= 8'd0;
      pm_reset <= 1'b1;
    end else begin
      delay_count <= delay_count + 1'b1;
      if (delay_count == 8'hff)
        pm_reset <= 1'b0;        
    end
  end   
  assign ena_12 = delay_count[0];                    //12.19Mhz
  assign ena_6 = delay_count[0] & ~delay_count[1];   //6.09Mhz

  // Reloj 3.58Mhz
  reg [7:0] delay_count_14;
  wire clk_3p58;
  always @ (posedge clk14) begin
      delay_count_14 <= delay_count_14 + 1'b1;
  end
  assign clk_3p58 = delay_count_14[0] & ~delay_count_14[1];

  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign resetHW = resetKey | !JTEST; 
 assign LED = scanSW[9];  

wire ext_rst;
assign ext_rst = JSERVICE; 
reg [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
reg M_HSYNC,M_VSYNC,M_AUDIO_L,M_AUDIO_R;
assign vga_red   = M_VIDEO_R;
assign vga_green = M_VIDEO_G;
assign vga_blue  = M_VIDEO_B;
assign vga_hsync = M_HSYNC;
assign vga_vsync = M_VSYNC;
assign audio_l = M_AUDIO_L;
assign audio_r = M_AUDIO_R;
assign JR = {M_VIDEO_R,1'b0}; 
assign JG = {M_VIDEO_G,1'b0};
assign JB = {M_VIDEO_B,1'b0};
assign JHSYNC = M_HSYNC;
assign JVSYNC = M_VSYNC;
assign JAUDIO = M_AUDIO_L;
	
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;
	
parameter joyType = 0; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin 
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
				joy1 <= JJOY;
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
  
  defender pm (
	 .reset(pm_reset),
    .clock_12(ena_6),
    .clock_3p58(clk_1p79),

    .video_r(M_VIDEO_R),
    .video_g(M_VIDEO_G),
    .video_b(M_VIDEO_B),
    .video_hs(M_HSYNC),
    .video_vs(M_VSYNC),
    .audio_l(M_AUDIO_L),
    .audio_r(M_AUDIO_R),

    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
    .JOYSTICK_A_GND(),
    .JOYSTICK_B_GND(),
	 .I_COIN(JCOIN),
	 .I_PLAYER({joystick2[7],joystick1[7]}), //Pendiente de la entrada de player desde el jamma mientras se dea a 1 los dos botones (sin pulsar)
	 .I_TABLE(1'b1),   //No se sabe si se utilizara una entrada para cambiar entre TABLE=0 y UP=1 (en la entrada del core esta a 1)

	 .scanSW(scanSW),
	 .resetKey(resetHW),
	 .scandblctrl(scandblctrl)
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
