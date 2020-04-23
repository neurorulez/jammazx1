//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Darfpga
//---------------------------------------------------------------------------------


`timescale 1 ps / 1 ps

module asteroids_top (
  input  wire SYS_CLK,
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

  wire pllclk0, pllclk1, pllclk2, pll_lckd;
  wire clk25,clk50, clk12;
  wire clkfbout;
  wire reset;
  
  //GENERACION DE RELOJES BUGF
  BUFG pclkbufg  (.I(pllclk0), .O(clk25));
  BUFG pclkbufg1 (.I(pllclk1), .O(clk12));
  BUFG pclkbufg2 (.I(pllclk2), .O(clk50));

  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(12),  //10 //set VCO to 10x of CLKIN
    .CLKOUT0_DIVIDE(24),  //2
    .CLKOUT1_DIVIDE(50), //20
    .CLKOUT2_DIVIDE(12), //10
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
  assign sram_addr[20:19] = 2'b00;
  
  // MODULO
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_6;
  
  always @ (posedge clk12 or negedge pll_lckd) begin
    if (!pll_lckd) begin
      delay_count <= 8'd0;
      pm_reset <= 1'b1;
    end else begin
      delay_count <= delay_count + 1'b1;
      if (delay_count == 8'hff)
        pm_reset <= 1'b0;        
    end
  end
    
  assign ena_6 = delay_count[0];
  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign LED = scanSW[9];  
 assign resetHW = resetKey | !JTEST; 
 
wire ext_rst;
assign ext_rst = JSERVICE; 
reg [3:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
reg M_HSYNC,M_VSYNC;
assign O_VIDEO_R = M_VIDEO_R[3:1];
assign O_VIDEO_G = M_VIDEO_G[3:1];
assign O_VIDEO_B = M_VIDEO_B[3:1];
assign O_HSYNC=M_HSYNC;
assign O_VSYNC=M_VSYNC;
assign JR = {M_VIDEO_R};
assign JG = {M_VIDEO_G};
assign JB = {M_VIDEO_B};

assign JHSYNC = M_HSYNC;
assign JVSYNC = M_VSYNC;
assign JAUDIO = O_AUDIO_ML;

reg O_AUDIO_ML,O_AUDIO_MR;

assign O_AUDIO_L = O_AUDIO_ML;
assign O_AUDIO_R = O_AUDIO_ML;
  
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;

parameter joyType = 1; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin //Joy Splitter Jamma
   assign JSELECT = joy_split;
   always @(posedge clk12) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge clk12) begin 
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
 
 wire sram_we;
 assign sram_we_n = !sram_we;
 
 asteroids_main pm (
	 .clk_6(ena_6),
	 .clk_25(clk25),
	 .clk_50(clk50),
	 .RESET_L(!resetHW),
    .VIDEO_R_OUT(M_VIDEO_R),
    .VIDEO_G_OUT(M_VIDEO_G),
    .VIDEO_B_OUT(M_VIDEO_B),
    .HSYNC_OUT(M_HSYNC),
    .VSYNC_OUT(M_VSYNC),
    .AUDIO_L_OUT(M_AUDIO_L),
    .AUDIO_R_OUT(M_AUDIO_R),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
	 .I_PLAYER({joystick2[7],joystick1[7]}),
	 .I_COIN(JCOIN),
	 .scanSW(scanSW),
  	 .sram_addr(sram_addr),
     .sram_data(sram_data),
	 .sram_we(sram_we),
	 .scandblctrl(scandblctrl)
  );


 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 //assign sram_addr = 21'b000001000111111010101; 	
 //assign scandblctrl = sram_dq[1:0];  
 //assign sram_we_n = 1'b1;

  keyboard keyb (
		.CLOCK(clk12),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);
  
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(clk12),
	  .REBOOT(master_reset || !ext_rst)
	);  

endmodule
