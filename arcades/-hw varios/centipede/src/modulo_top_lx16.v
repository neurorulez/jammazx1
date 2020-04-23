//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-DOS by Neuro
//-- Based on the code of Gehstock
//---------------------------------------------------------------------------------
//
//

`timescale 1 ps / 1 ps

module centipede_top (
  input  wire clk50mhz,
  
  output [18:0] sram_addr,
  input  [7:0]  sram_data,
  output sram_we_n,

  input wire ps2_clk,
  input wire ps2_data,
  
  input  wire [1:0] BTN,
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
	.CLK_IN1(clk50mhz),
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
  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign resetHW = resetKey | !joystick1[11] | !BTN[1]; //Reset de la maquina arcade
 assign LED[0] = scanSW[9];                            //Led modo de teclas
 assign LED[1] = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA
 
wire ext_rst;
assign ext_rst = joystick2[11]; //1'b1;
wire [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO;
wire hblank,vblank,hsync_x2,vsync_x2,compsync;
wire [3:0] audio;
reg [2:0]rgb_r, rgb_g, rgb_b;
reg [2:0]vga_r, vga_g, vga_b;
assign red     = (scandblctrl[0] ^ scanSW[6]) ? vga_r : rgb_r;
assign green   = (scandblctrl[0] ^ scanSW[6]) ? vga_g : rgb_g;
assign blue    = (scandblctrl[0] ^ scanSW[6]) ? vga_b : rgb_b;
assign hsync   = (scandblctrl[0] ^ scanSW[6]) ? hsync_x2 : compsync;
assign vsync   = (scandblctrl[0] ^ scanSW[6]) ? vsync_x2 : 1'b1;
assign audio_l = M_AUDIO;
assign audio_r = M_AUDIO;
   
//Gestion de Joystick
  wire [11:0] joystick1 , joystick2;
   reg [11:0] joy1  = 12'hFFF, joy2  = 12'hFFF;
   reg joy_renew = 1'b1;
   reg [4:0]joy_count = 5'd0;
   
   assign JOY_CLK = ena_x;
   assign JOY_LOAD = joy_renew;
   always @(posedge ena_x) begin 
      if (joy_count == 5'd0) begin
         joy_renew = 1'b0;
      end else begin
         joy_renew = 1'b1;
      end
      if (joy_count == 5'd25) begin
        joy_count = 5'd0;
      end else begin
        joy_count = joy_count + 1'd1;
      end      
   end
   always @(posedge ena_x) begin
         case (joy_count)
            5'd2  : joy1[8]  <= JOY_DATA;
            5'd3  : joy1[6]  <= JOY_DATA;
            5'd4  : joy1[5]  <= JOY_DATA;
            5'd5  : joy1[4]  <= JOY_DATA;
            5'd6  : joy1[3]  <= JOY_DATA;
            5'd7  : joy1[2]  <= JOY_DATA;
            5'd8  : joy1[1]  <= JOY_DATA;
            5'd9  : joy1[0]  <= JOY_DATA;
            5'd10 : joy2[8]  <= JOY_DATA;
            5'd11 : joy2[6]  <= JOY_DATA;
            5'd12 : joy2[5]  <= JOY_DATA;
            5'd13 : joy2[4]  <= JOY_DATA;
            5'd14 : joy2[3]  <= JOY_DATA;
            5'd15 : joy2[2]  <= JOY_DATA;
            5'd16 : joy2[1]  <= JOY_DATA;
            5'd17 : joy2[0]  <= JOY_DATA;
            5'd18 : joy2[10] <= JOY_DATA;
            5'd19 : joy2[11] <= JOY_DATA;
            5'd20 : joy2[9]  <= JOY_DATA;
            5'd21 : joy2[7]  <= JOY_DATA;
            5'd22 : joy1[10] <= JOY_DATA;
            5'd23 : joy1[11] <= JOY_DATA;
            5'd24 : joy1[9]  <= JOY_DATA;
            5'd25 : joy1[7]  <= JOY_DATA;
         endcase              
      end
   assign joystick1 = joy1;
   assign joystick2 = joy2;

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

assign button_in[15] = joystick2[9] & !scanSW[20];          //ic2
assign button_in[8]  = joystick1[9] & !scanSW[13] & BTN[0]; //ic1
assign button_in[7]  = joystick2[8] & !scanSW[12]; //p2
assign button_in[6]  = joystick1[8] & !scanSW[11]; //p1
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
 assign sram_addr = 19'b000001000111111010101;  
 assign scandblctrl = sram_data[1:0];  
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
