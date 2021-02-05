//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Darfpga
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module mpatrol_top (
  input  wire clk50mhz,
  
  output [20:0] sram_addr,
  input  [7:0]  sram_data,
  output sram_we_n,

  input wire ps2_clk,
  input wire ps2_data,
  
  input wire  [1:0] BTN,
  output wire [1:0] LED,

  output wire [2:0] red,
  output wire [2:0] green,
  output wire [2:0] blue,
  output wire hsync,
  output wire vsync,
  output wire audio_l,
  output wire audio_r,

  output wire JOY_CLK,
  output wire JOY_LOAD,
  input  wire JOY_DATA
);

  wire [1:0] scandblctrl;

  wire clock_3p58, clk_pix, clk_sys, clk_vid, pll_lckd;
  wire reset;
  
   relojes relojes (
     .inclk0(clk50mhz),
     .clk3p58(clock_3p58),
	  .clk7p5(clk_pix),
	  .clk30(clk_sys),
	  .clk40(clk_vid),
	  .LOCKED(pll_lckd)
    );

 
//Gestion de Joystick
  reg [7:0] clkdivider = 8'h00;
  assign JOY_CLK = clkdivider[7];
  
  always @(posedge clk_sys)                     
    clkdivider <= clkdivider + 8'd1;
  wire clkenable = (clkdivider == 8'h00);

  wire [7:0] joystick1 , joystick2;
  reg  [7:0] joy1 = 8'hFF, joy2 = 8'hFF;

   reg [3:0] state = 4'd0;
  assign JOY_LOAD = ~(state == 4'd0);
  
  always @(posedge clk_sys) begin
    if (clkenable == 1'b1) begin
      state <= state + 4'd1;
      case (state)
        4'd0:  joy1[7] <= JOY_DATA; //joy1start
        4'd1:  joy1[6] <= JOY_DATA; //joy1fire3
        4'd2:  joy1[5] <= JOY_DATA; //joy1fire2
        4'd3:  joy1[4] <= JOY_DATA; //joy1fire1
        4'd4:  joy1[3] <= JOY_DATA; //joy1right
        4'd5:  joy1[2] <= JOY_DATA; //joy1left
        4'd6:  joy1[1] <= JOY_DATA; //joy1down
        4'd7:  joy1[0] <= JOY_DATA; //joy1up
        4'd8:  joy2[7] <= JOY_DATA; //joy2start
        4'd9:  joy2[6] <= JOY_DATA; //joy2fire3
        4'd10: joy2[5] <= JOY_DATA; //joy2fire2
        4'd11: joy2[4] <= JOY_DATA; //joy2fire1
        4'd12: joy2[3] <= JOY_DATA; //joy2right
        4'd13: joy2[2] <= JOY_DATA; //joy2left
        4'd14: joy2[1] <= JOY_DATA; //joy2down
        4'd15: joy2[0] <= JOY_DATA; //joy2up
      endcase
    end
  end
   assign joystick1 = joy1;
   assign joystick2 = joy2;
  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign resetHW = resetKey | !BTN[1]; //Reset de la maquina arcade
 assign LED[0] = scanSW[9];                            //Led modo de teclas
 assign LED[1] = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA

wire [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire [2:0]X_VIDEO_R, X_VIDEO_G, X_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO_L,M_AUDIO_R;
wire X_HSYNC,X_VSYNC;
wire tv15khz = scandblctrl[0] ^ scanSW[6]; //Valor por defecto de bios y cambia con Bloq Despl

  scandoubler sd (
	.clk_sys(clk_sys),
	.video_r_in(M_VIDEO_R),
	.video_g_in(M_VIDEO_G),
	.video_b_in(M_VIDEO_B),
	.hs_in(M_HSYNC),
	.vs_in(M_VSYNC),
	.video_r_out(X_VIDEO_R),
	.video_g_out(X_VIDEO_G),
	.video_b_out(X_VIDEO_B),
	.hs_out(X_HSYNC),
	.vs_out(X_VSYNC),
	.en_vid(clk_pix),
	.scanlines(1'b0)
   );

assign red =   tv15khz ? M_VIDEO_R : X_VIDEO_R;
assign green = tv15khz ? M_VIDEO_G : X_VIDEO_G;
assign blue =  tv15khz ? M_VIDEO_B : X_VIDEO_B;

assign hsync = tv15khz ? ~(M_HSYNC ^ M_VSYNC) : X_HSYNC;
assign vsync = tv15khz ? 1'b1 : X_VSYNC;
assign audio_l = M_AUDIO_L;
assign audio_r = M_AUDIO_R;
	
  
 mpatrol pm (
	 .clk50mhz(clk50mhz),
    .clock_3p58(clk3p58),
	 .clk_pix(clk_pix),
	 .clk_sys(clk_sys),
	 .clk_vid(clk_vid),
    .VIDEO_R(M_VIDEO_R),
    .VIDEO_G(M_VIDEO_G),
    .VIDEO_B(M_VIDEO_B),
    .VIDEO_HS(M_HSYNC),
    .VIDEO_VS(M_VSYNC),
    .AUDIO_L(M_AUDIO_L),
    .AUDIO_R(M_AUDIO_R),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
	 .I_PLAYER({joystick2[7],joystick1[7]}), 
	 .I_COIN({joystick2[6],joystick1[6] & BTN[0]}),
	 .scanSW(scanSW),
	 .reset(resetHW),
	 .tv15Khz_mode(scandblctrl[0] ^ scanSW[6]),
	 .scandblctrl(scandblctrl)
  );
  

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 assign sram_addr = 21'b000001000111111010101; 	
 assign scandblctrl = sram_data[1:0];  
 assign sram_we_n = 1'b1;

  keyboard keyb (
		.CLOCK(clk_pix),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);
  
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(clk_pix),
	  .REBOOT(master_reset)
	);  

endmodule
