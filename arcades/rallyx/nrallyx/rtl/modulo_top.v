//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of MikeJ
//-- Based on the decrypt romgen of FelixV
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module nrally_x_top (
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
  
 // wire [5:0] JOYSTICK2;          //Variable temporal hasta que se meta la señal de Joystick 2 en el .UCF
  //assign JOYSTICK2 = 6'b111111;  //Asignacion temporal al Joystick en Pullup
  //assign JOYSTICK2 = JOYSTICK;

  BUFG pclkbufg (.I(pllclk0), .O(clk_24M));

  //////////////////////////////////////////////////////////////////
  // 10x pclk is used to drive IOCLK network so a bit rate reference
  // can be used by OSERDES2
  //////////////////////////////////////////////////////////////////
  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(20),  //Multiplica el Reloj de entrada para todos
    .CLKOUT0_DIVIDE(40.689655),  //Divide el valor multiplicado para OUT0
    .COMPENSATION("INTERNAL")
  ) PLL_OSERDES (
    .CLKFBOUT(clkfbout),
    .CLKOUT0(pllclk0),
    .CLKOUT1(),
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
  wire ena_12;
  wire ena_6;
  wire ena_x;
  
  always @ (posedge clk_24M or negedge pll_lckd) begin
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
  assign ena_x = delay_count[4];
  assign ena_6 = delay_count[0] & ~delay_count[1];
 
  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign resetHW = resetKey | !JTEST; //Reset de la maquina arcade
// assign LED[0] = scanSW[9];                            //Led modo de teclas
 assign LED = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA
 
wire ext_rst;
assign ext_rst = JSERVICE; //1'b1;
wire [3:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire [2:0]X_VIDEO_R, X_VIDEO_G, X_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO;
wire X_HSYNC,X_VSYNC;
wire tv15khz = ~scandblctrl[0] ^ scanSW[6];    //Valor por defecto de bios y cambia con Bloq Despl
wire scanlines = scandblctrl[1] ^ scanSW[8];  //Valor por defecto de bios y cambia con - de bloqnum
assign red =   tv15khz ? M_VIDEO_R[3:1] : {X_VIDEO_R,1'b0}; 
assign green = tv15khz ? M_VIDEO_G[3:1] : {X_VIDEO_G,1'b0};
assign blue =  tv15khz ? M_VIDEO_B[3:1] : {X_VIDEO_B,1'b0};
assign hsync = tv15khz ? !(M_HSYNC^M_VSYNC) : X_HSYNC; //
assign vsync = tv15khz ?          1'b1      : X_VSYNC;

assign audio_l = M_AUDIO;
assign audio_r = M_AUDIO;

assign JR = M_VIDEO_R; 
assign JG = M_VIDEO_G;
assign JB = M_VIDEO_B;
assign JHSYNC = M_HSYNC;
assign JVSYNC = M_VSYNC;
assign JAUDIO = M_AUDIO;
   
//Gestion de Joystick
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;
	
parameter joyType = 1; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin 
   assign JSELECT = joy_split;
   always @(posedge ena_12) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge ena_12) begin 
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
 
wire			PCLK;
wire  [8:0] HPOS,VPOS;
wire [11:0] POUT;
wire [15:0] AOUT;

HVGEN hvgen
(
	.HPOS(HPOS),.VPOS(VPOS),.PCLK(PCLK),.iRGB(POUT),
	.oRGB({M_VIDEO_B,M_VIDEO_G,M_VIDEO_R}),.HBLK(),.VBLK(),.HSYN(M_HSYNC),.VSYN(M_VSYNC)
);

wire        bCabinet = 1'b1;
wire			iRST  = resetHW;
wire  [7:0] iDSW  = ~{ 2'b00, 3'b111, 2'b00, 1'b0 }; //CC DDD VV S (Coinage, Dificultad,Vidas,Service Mode)
//                            coin                       start                        up                         down                        right                        left                        smoke   
wire  [7:0] iCTR1 = { JCOIN[0] & !scanSW[13], joystick1[7] & !scanSW[11], joystick1[0] & !scanSW[0],  joystick1[1] & !scanSW[1],   joystick1[3] & !scanSW[3],  joystick1[2] & !scanSW[2],  joystick1[4] & !scanSW[4],  1'b0 };
wire  [7:0] iCTR2 = { JCOIN[1] & !scanSW[20], joystick2[7] & !scanSW[12], joystick2[0] & !scanSW[14], joystick2[1] & !scanSW[15],  joystick2[3] & !scanSW[17], joystick2[2] & !scanSW[16], joystick2[4] & !scanSW[18], bCabinet };
wire  [7:0] oPIX;
wire  [7:0] oSND;


fpga_NRX GameCore ( 
	.RESET(iRST),.CLK24M(clk_24M),
	.HP(HPOS+7),.VP(VPOS),.PCLK(PCLK), //Ajuste horizontal de +7 hacia la izquierda
	.POUT(oPIX),.SND(oSND),
	.DSW(iDSW),.CTR1(iCTR1),.CTR2(iCTR2)
	//.ROMCL(clk_sys),.ROMAD(ioctl_addr),.ROMDT(ioctl_dout),.ROMEN(ioctl_wr)
);

assign POUT = {oPIX[7:6],2'b00,oPIX[5:3],1'b0,oPIX[2:0],1'b0};
assign AOUT = {oSND,8'h0};

sigma_delta_dac #(15) dac
(
	.CLK(ena_12),
	.RESET(resetHW),
	.DACin({~AOUT[15], AOUT[14:0]}),
	.DACout(M_AUDIO)
);

  scandoubler sd (
	.clk_sys(clk_24M),
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
	.en_vid(PCLK),
	.scanlines(scanlines)
   );

/*
  scandoubler sd (
	.clk_sys(clk_24M),
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
 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 assign sram_addr = 21'b000001000111111010101; 	 
 assign scandblctrl = sram_data[1:0];  
 assign sram_we_n = 1'b1;

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

endmodule
