//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Quest 2017
//---------------------------------------------------------------------------------
// Copyright (c) MikeJ - January 2006
//

`timescale 1 ps / 1 ps

module acitya_top (
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
	input  wire JTEST,
	input  wire JSERVICE
);

  wire [1:0] scandblctrl;

  wire pllclk0, pllclk1, pllclk2;
  wire pclkx2, pclkx10, pll_lckd;
  wire clkfbout;
  wire reset;
  
 // wire [5:0] JOYSTICK2;          //Variable temporal hasta que se meta la señal de Joystick 2 en el .UCF
  //assign JOYSTICK2 = 6'b111111;  //Asignacion temporal al Joystick en Pullup
  //assign JOYSTICK2 = JOYSTICK;

  BUFG pclkbufg (.I(pllclk1), .O(pclk));

  //////////////////////////////////////////////////////////////////
  // 2x pclk is going to be used to drive OSERDES2
  // on the GCLK side
  //////////////////////////////////////////////////////////////////
  BUFG pclkx2bufg (.I(pllclk2), .O(pclkx2));

  //////////////////////////////////////////////////////////////////
  // 10x pclk is used to drive IOCLK network so a bit rate reference
  // can be used by OSERDES2
  //////////////////////////////////////////////////////////////////
  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(20),  //10 //set VCO to 10x of CLKIN
    .CLKOUT0_DIVIDE(4),  //2
    .CLKOUT1_DIVIDE(41), //20
    .CLKOUT2_DIVIDE(20), //10
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

  wire serdesstrobe;
  wire bufpll_lock;
  BUFPLL #(.DIVIDE(5)) ioclk_buf (.PLLIN(pllclk0), .GCLK(pclkx2), .LOCKED(pll_lckd),
           .IOCLK(pclkx10), .SERDESSTROBE(serdesstrobe), .LOCK(bufpll_lock));

  synchro #(.INITIALIZE("LOGIC1"))
  synchro_reset (.async(!pll_lckd),.sync(reset),.clk(pclk));

  assign O_NTSC = 1'b0;
  assign O_PAL = 1'b1;

  // PACMAN 
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
    
  assign ena_12 = delay_count[0];
  assign ena_6 = delay_count[0] & ~delay_count[1];
  
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
	
parameter joyType = 1; //0=Nada . 1=Jamma
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
  
  ACITYA pm (
    .O_VIDEO_R(M_VIDEO_R),
    .O_VIDEO_G(M_VIDEO_G),
    .O_VIDEO_B(M_VIDEO_B),
    .O_HSYNC(M_HSYNC),
    .O_VSYNC(M_VSYNC),
    .O_BLANKING(vga_blanking),
    .O_AUDIO_L(M_AUDIO_L),
    .O_AUDIO_R(M_AUDIO_R),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
    .JOYSTICK_A_GND(),
    .JOYSTICK_B_GND(),
	 .I_COIN(JCOIN),
	 .I_PLAYER({joystick2[7],joystick1[7]}), //Pendiente de la entrada de player desde el jamma mientras se dea a 1 los dos botones (sin pulsar)
	 .I_TABLE(1'b1),   //No se sabe si se utilizara una entrada para cambiar entre TABLE=0 y UP=1 (en la entrada del core esta a 1)
    .I_RESET(pm_reset),
    .I_CLK_REF(pclkx2),
    .I_CLK(pclk),
    .I_ENA_12(ena_12),
    .I_ENA_6(ena_6),
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
