//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Gehstock
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module centiped_top (
  input  wire SYS_CLK,
  input  wire [5:0] JOYSTICK,
  output [2:0] O_VIDEO_R, 
  output [2:0] O_VIDEO_G, 
  output [2:0] O_VIDEO_B,
  output O_HSYNC,
  output O_VSYNC,
  
  output [20:0] sram_addr,
  inout  [7:0]  sram_dq,
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

   // Divisor de relojes
  reg [7:0] delay_count;
  reg pm_reset;
  wire clk_24;
  wire clk_12;
  wire clk_6;
  wire pll_lckd;
  wire ena_x;

 relojes relojes
(
	.CLK_IN1(SYS_CLK),
	.CLK_OUT1(clk_24),
	.CLK_OUT2(clk_12),
	.CLK_OUT3(clk_6),
	.CLK_OUT4(clk_100mhz),
	.LOCKED(pll_lckd)
);
 
  always @ (posedge clk_24 or negedge pll_lckd) begin
    if (!pll_lckd) begin
      delay_count <= 8'd0;
      pm_reset <= 1'b1;
    end else begin
      delay_count <= delay_count + 1'b1;
      if (delay_count == 8'hff)
        pm_reset <= 1'b0;        
    end
  end

  assign ena_x = delay_count[4];
  
  assign O_NTSC = 1'b0;
  assign O_PAL = 1'b1;
  //assign sram_addr[20:17] = 4'b0000;
  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign LED = scanSW[9];  
 assign resetHW = resetKey | !JTEST; 
 
wire ext_rst;
assign ext_rst = JSERVICE; 
wire [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO;;
wire hblank,vblank,hsync_x2,vsync_x2,compsync;
wire [3:0] audio;
reg [2:0]rgb_r, rgb_g, rgb_b;
reg [2:0]vga_r, vga_g, vga_b;

assign O_VIDEO_R    = (scandblctrl[0] ^ scanSW[6]) ? vga_r : rgb_r;
assign O_VIDEO_G   = (scandblctrl[0] ^ scanSW[6]) ? vga_g : rgb_g;
assign O_VIDEO_B   = (scandblctrl[0] ^ scanSW[6]) ? vga_b : rgb_b;
assign O_HSYNC   = (scandblctrl[0] ^ scanSW[6]) ? hsync_x2 : compsync;
assign O_VSYNC   = (scandblctrl[0] ^ scanSW[6]) ? vsync_x2 : 1'b1;
assign O_AUDIO_L = M_AUDIO;
assign O_AUDIO_R = M_AUDIO;

assign JR  = (scandblctrl[0] ^ scanSW[6]) ? {vga_r,1'b0} : {rgb_r,1'b0};
assign JG  = (scandblctrl[0] ^ scanSW[6]) ? {vga_g,1'b0} : {rgb_g,1'b0};
assign JB  = (scandblctrl[0] ^ scanSW[6]) ? {vga_b,1'b0} : {rgb_b,1'b0};
assign JHSYNC    = (scandblctrl[0] ^ scanSW[6]) ? hsync_x2 : compsync;
assign JVSYNC    = (scandblctrl[0] ^ scanSW[6]) ? vsync_x2 : 1'b1;
assign JAUDIO = M_AUDIO;

  
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;

parameter joyType = 1; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin //Joy Splitter Jamma
   assign JSELECT = joy_split;
   always @(posedge clk_24) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge clk_24) begin 
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

 centipede centipede(
	.clk_100mhz(clk_100mhz),
	.clk_12mhz(clk_12),
 	.reset(resetHW),//!resetHW),
	.playerinput_i({button_debounced[8], 1'b1, button_debounced[15], 3'b111, button_debounced[7], button_debounced[6], button_debounced[10], button_debounced[4]}), //COIN_R        COIN_C            COIN_L       TEST  TABLE SLAM        START2              START1                    FIRE 2                FIRE 1
	.trakball_i(8'b11111111),
	.joystick_i({button_debounced[3:0], button_debounced[12:9]}), //m_right , m_left, m_down, m_up, m_right , m_left, m_down, m_up}),
	.sw1_i(8'b01010100), //credit minimum, difficulty, bonus, bonus, lives, lives, language, language
	.sw2_i(8'b00000010), //1 coin, 1 play, no bonus coins
	.rgb_o({M_VIDEO_B,M_VIDEO_G,M_VIDEO_R}),
	.sync_o(compsync),
	.hsync_o(M_HSYNC),
	.vsync_o(M_VSYNC),
	.hblank_o(hblank),
	.vblank_o(vblank),
	.audio_o(audio)
	);

dac #(
	.msbi_g(15))
dac (
	.clk_i(clk_24),
	.res_n_i(1),
	.dac_i({2{audio,audio}}),
	.dac_o(M_AUDIO)
	);
  
  always @(negedge clk_12) begin 
   if (hblank == 1'b0 && vblank == 1'b0) begin
	 rgb_r <= M_VIDEO_R;
	 rgb_g <= M_VIDEO_G;
	 rgb_b <= M_VIDEO_B;
	end else begin
	 rgb_r <= 3'b0;
	 rgb_g <= 3'b0;
	 rgb_b <= 3'b0;
	end
  end

// scan converter here
line_doubler (
	.clock_12mhz(clk_12),
	.video_i({rgb_b[2:1],rgb_g,rgb_r}),
	.hsync_i(M_HSYNC),
	.vsync_i(M_VSYNC),
	.vga_r_o(vga_r),
	.vga_g_o(vga_g),
	.vga_b_o(vga_b),
	.hsync_o(hsync_x2),
	.vsync_o(vsync_x2),
	.scanlines(scandblctrl[1] ^ scanSW[8])
);
  
//Joystick
wire [15:0] button_in,buttons,button_debounced;

assign button_in[15] = joystick2[6] & !scanSW[20] & JCOIN[1]; //ic2
assign button_in[8]  = joystick1[6] & !scanSW[13] & JCOIN[0]; //ic1
assign button_in[7]  = joystick2[7] & !scanSW[12]; //p2
assign button_in[6]  = joystick1[7] & !scanSW[11]; //p1
                                                   // Player 1
assign button_in[5]  = joystick1[5] & !scanSW[5]; // fire2 / x / lwin
assign button_in[4]  = joystick1[4] & !scanSW[4]; // fire1 / enter / z / space
assign button_in[3]  = joystick1[3] & !scanSW[3]; // right
assign button_in[2]  = joystick1[2] & !scanSW[2]; // left
assign button_in[1]  = joystick1[1] & !scanSW[1]; // down
assign button_in[0]  = joystick1[0] & !scanSW[0]; // up
																	 // Player 2
assign button_in[14] = joystick2[5] & !scanSW[19]; // fire2 / x / lwin
assign button_in[13] = joystick2[4] & !scanSW[18]; // fire1 / enter / z / space
assign button_in[12] = joystick2[3] & !scanSW[17]; // right
assign button_in[11] = joystick2[2] & !scanSW[16]; // left
assign button_in[10] = joystick2[1] & !scanSW[15]; // down
assign button_in[9]  = joystick2[0] & !scanSW[14]; // up
 
  //Swap directions for horizontal screen help
assign buttons[0]     = (scanSW[9] == 1'b0) ? button_in[0] : button_in[2];
assign buttons[1]     = (scanSW[9] == 1'b0) ? button_in[1] : button_in[3];
assign buttons[2]     = (scanSW[9] == 1'b0) ? button_in[2] : button_in[1];
assign buttons[3]     = (scanSW[9] == 1'b0) ? button_in[3] : button_in[0];
assign buttons[8:4]   = button_in[8:4];
assign buttons[9]     = (scanSW[9] == 1'b0) ? button_in[9]  : button_in[11];
assign buttons[10]    = (scanSW[9] == 1'b0) ? button_in[10] : button_in[12];
assign buttons[11]    = (scanSW[9] == 1'b0) ? button_in[11] : button_in[10];
assign buttons[12]    = (scanSW[9] == 1'b0) ? button_in[12] : button_in[9];
assign buttons[15:13] = button_in[15:13];

debounce #(
	.G_WIDTH(16))
debounce (
	.I_BUTTON(buttons),
	.O_BUTTON(button_debounced),
	.CLK(clk_24)
	);	

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 assign sram_addr = 21'b000001000111111010101; 	
 assign scandblctrl = sram_dq[1:0];  
 assign sram_we_n = 1'b1;

  keyboard keyb (
      .CLOCK(clk_24),
      .PS2_CLK(ps2_clk),
      .PS2_DATA(ps2_data),
      .resetKey(resetKey),
      .MRESET(master_reset),
      .scanSW(scanSW)
   );
  
//-----------------Multiboot-------------
   multiboot el_multiboot (
     .clk_icap(clk_24),
     .REBOOT(master_reset || !ext_rst)
   );  

endmodule
