//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of MikeJ
//-- Based on the decrypt romgen of FelixV
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps
`default_nettype wire

module pong_top (
  input  wire clk50mhz,
  
  output [20:0] sram_addr,
  input  [7:0]  sram_data,
  output sram_we_n,

  input wire ps2_clk,
  input wire ps2_data,
  
  output wire LED,

  output NTSC,
  output PAL,

  output wire [2:0] red,
  output wire [2:0] green,
  output wire [2:0] blue,
  output wire hsync,
  output wire vsync,
  output wire audio_l,
  output wire audio_r,

  input  wire [5:0] JOYSTICK,
  
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

  wire pllclk0;
  wire clkfbout;
  wire reset;
  wire clk_28M,CLK_50M;
  
 // wire [5:0] JOYSTICK2;          //Variable temporal hasta que se meta la señal de Joystick 2 en el .UCF
  //assign JOYSTICK2 = 6'b111111;  //Asignacion temporal al Joystick en Pullup
  //assign JOYSTICK2 = JOYSTICK;

  BUFG pclkbufg (.I(pllclk0), .O(clk_28M));
  BUFG pclkbufg2 (.I(pllclk1), .O(CLK_50M));

  //////////////////////////////////////////////////////////////////
  // 10x pclk is used to drive IOCLK network so a bit rate reference
  // can be used by OSERDES2
  //////////////////////////////////////////////////////////////////
  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(20),  //Multiplica el Reloj de entrada para todos
    .CLKOUT0_DIVIDE(34.92),  //// 28.636mhz
    .CLKOUT1_DIVIDE(20),
	.COMPENSATION("INTERNAL")
  ) PLL_OSERDES (
    .CLKFBOUT(clkfbout),
    .CLKOUT0(pllclk0),
    .CLKOUT1(pllclk1),
    .CLKOUT2(),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(pll_lckd),
    .CLKFBIN(clkfbout),
    .CLKIN(clk50mhz),
    .RST(1'b0)
  );

  assign NTSC = 1'b0;
  assign PAL  = 1'b1;

  // Divisor de relojes
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_7;
  wire ena_24;
  wire ena_x;
  
  always @ (posedge clk_28M or negedge pll_lckd) begin
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
  assign ena_x  = delay_count[4];
  assign ena_7  = delay_count[1];
 
  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
  
 assign resetHW =  resetKey | !JTEST;// | !BTN[1]; //Reset de la maquina arcade

 assign LED = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA
 
wire ext_rst;
assign ext_rst = JSERVICE; //1'b1;
wire [3:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire [2:0]X_VIDEO_R, X_VIDEO_G, X_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO;
wire X_HSYNC,X_VSYNC;
wire audio;
wire tv15khz = ~scandblctrl[0] ^ scanSW[6];    //Valor por defecto de bios y cambia con Bloq Despl
wire scanlines = scandblctrl[1] ^ scanSW[8];  //Valor por defecto de bios y cambia con - de bloqnum
assign red =   tv15khz ? M_VIDEO_R[3:1] : {X_VIDEO_R}; 
assign green = tv15khz ? M_VIDEO_G[3:1] : {X_VIDEO_G};
assign blue =  tv15khz ? M_VIDEO_B[3:1] : {X_VIDEO_B};
assign hsync = tv15khz ? !(M_HSYNC^M_VSYNC) : X_HSYNC;
assign vsync = tv15khz ?          1'b1      : X_VSYNC;

assign audio_l = M_AUDIO;
assign audio_r = M_AUDIO;

assign JR = tv15khz ? M_VIDEO_R : {X_VIDEO_R,1'b0};
assign JG = tv15khz ? M_VIDEO_G : {X_VIDEO_G,1'b0};
assign JB = tv15khz ? M_VIDEO_B : {X_VIDEO_B,1'b0};
assign JHSYNC = tv15khz ? !(M_HSYNC^M_VSYNC) : X_HSYNC;
assign JVSYNC = tv15khz ?          1'b1      : X_VSYNC;
assign JAUDIO = M_AUDIO;
   
//Gestion de Joystick
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1 = 8'hff, joy2 = 8'hff;
   reg joy_split;
	
parameter joyType = 1; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin 
   assign JSELECT = joy_split;
   always @(posedge ena_x) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge ena_x) begin 
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


reg [15:0] paddle_delay;
reg        clk_paddle;
reg [7:0] vpos1;
reg [7:0] vpos2;
always @(posedge ena_7) begin
  paddle_delay = paddle_delay + 1;
  clk_paddle   = paddle_delay[14];
end

always @(posedge clk_paddle) begin
if (pll_lckd)
 begin
  if (JCOIN[0] == 1'b0 | joystick1[7] == 1'b0 | scanSW[13] == 1'b1) begin
   vpos1 = 8'h00;
	vpos2 = 8'h00;
  end else begin
   if (joystick1[1] == 1'b0 | scanSW[1]  == 1'b1) vpos1 = vpos1 + 8'd1;
   if (joystick1[0] == 1'b0 | scanSW[0]  == 1'b1) vpos1 = vpos1 - 8'd1;
   if (joystick2[1] == 1'b0 | scanSW[15] == 1'b1) vpos2 = vpos2 + 8'd1;
   if (joystick2[0] == 1'b0 | scanSW[14] == 1'b1) vpos2 = vpos2 - 8'd1;
  end
 end
end

wire [7:0] paddle1_vpos;
assign paddle1_vpos = vpos1 + 8'h80; //8'h80; //joystick_analog_0[15:8] + 8'h80;

wire [7:0] paddle2_vpos;
assign paddle2_vpos = vpos2 + 8'h80; //joystick_analog_1[15:8] + 8'h80;


wire [7:0] m_dip = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; //0000000M=Max Points 11 o 15

pong pong
(
	.mclk(CLK_50M),
	.clk7_159(ena_7),
	.coin_sw(!JCOIN[0] | !joystick1[7] | scanSW[13]),
	.dip_sw(m_dip),
	.paddle1_vpos(paddle1_vpos),
	.paddle2_vpos(paddle2_vpos),
	
	.r(M_VIDEO_R),
	.g(M_VIDEO_G),
	.b(M_VIDEO_B),
	.hsync(M_HSYNC),
	.vsync(M_VSYNC),
	.hblank(),
	.vblank(),

	.sound_out(audio)
);

sigma_delta_dac #(7) dac
(
	.CLK(clk_28M),
	.RESET(resetHW),
	.DACin({audio,6'd0}),
	.DACout(M_AUDIO)
);

  scandoubler sd (
	.clk_sys(clk_28M),
	.video_r_in(M_VIDEO_R[3:1]),
	.video_g_in(M_VIDEO_G[3:1]),
	.video_b_in(M_VIDEO_B[3:1]),
	.hs_in(~M_HSYNC),
	.vs_in(~M_VSYNC),
	.video_r_out(X_VIDEO_R),
	.video_g_out(X_VIDEO_G),
	.video_b_out(X_VIDEO_B),
	.hs_out(X_HSYNC),
	.vs_out(X_VSYNC),
	.en_vid(ena_7),
	.scanlines(scanlines)
   );

/*
  scandoubler sd (
	.clk_sys(clk_48M),
	.r_in({2'b00,M_VIDEO_R}),
	.g_in({2'b00,M_VIDEO_G}),
	.b_in({2'b00,M_VIDEO_B}),
	.hs_in(~M_HSYNC),
	.vs_in(~M_VSYNC),
	.r_out(X_VIDEO_R),
	.g_out(X_VIDEO_G),
	.b_out(X_VIDEO_B),
	.hs_out(X_HSYNC),
	.vs_out(X_VSYNC),
	//.en_vid(PCLK),
	.scanlines({scanlines,scanlines})
	);
*/

  keyboard keyb (
      .CLOCK(ena_12),
      .PS2_CLK(ps2_clk),
      .PS2_DATA(ps2_data),
      .resetKey(resetKey),
      .MRESET(master_reset),
      .scanSW(scanSW)
   );
  
//-----------------Multiboot-------------
	  multiboot el_multiboot (
     .clk_icap(ena_12),
     .REBOOT(master_reset || !ext_rst)
   );  

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 assign sram_addr = 21'b000001000111111010101; 	
 assign scandblctrl = sram_data[1:0];  
 assign sram_we_n = 1'b1;


endmodule
