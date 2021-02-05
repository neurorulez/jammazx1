//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//---------------------------------------------------------------------------------
// Copyright (c) James Sweet 2017
//

`timescale 1 ps / 1 ps

module superbreakout_top (
  input  wire SYS_CLK,

  output [2:0] O_VIDEO_R, 
  output [2:0] O_VIDEO_G, 
  output [2:0] O_VIDEO_B,
  output O_HSYNC,
  output O_VSYNC,
  
  output [18:0] sram_addr,
  inout  [7:0]  sram_dq,
  output sram_we_n,

 
  output wire O_AUDIO_L,
  output wire O_AUDIO_R,
  
  input wire ps2_clk,
  input wire ps2_data,
  
  output wire LED,

  output wire JOY_CLK,
  output wire JOY_LOAD,
  input  wire JOY_DATA
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
  
 
  // MODULO
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_12;
  wire ena_6;
  wire ena_x; 
  
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
  assign ena_x = delay_count[4];  
  assign ena_6 = delay_count[0] & ~delay_count[1];

  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign LED = scanSW[9];  
 assign resetHW = resetKey | !joystick1[11]; 
 
wire ext_rst;
assign ext_rst = joystick2[11]; 
reg [5:0] M_VIDEO_RGB; //2 bits de color del overlay
reg M_VIDEO_O; //Salida BW
reg M_HSYNC,M_VSYNC;

assign O_VIDEO_R = {M_VIDEO_RGB[5],M_VIDEO_RGB[4],M_VIDEO_RGB[4]};
assign O_VIDEO_G = {M_VIDEO_RGB[3],M_VIDEO_RGB[2],M_VIDEO_RGB[2]};
assign O_VIDEO_B = {M_VIDEO_RGB[1],M_VIDEO_RGB[0],M_VIDEO_RGB[0]};
/* Salida BW
assign O_VIDEO_R = {M_VIDEO_O,M_VIDEO_O,M_VIDEO_O};
assign O_VIDEO_G = {M_VIDEO_O,M_VIDEO_O,M_VIDEO_O};
assign O_VIDEO_B = {M_VIDEO_O,M_VIDEO_O,M_VIDEO_O};
*/
assign O_HSYNC=M_HSYNC;
assign O_VSYNC=M_VSYNC;

reg O_AUDIO_ML,O_AUDIO_MR;

assign O_AUDIO_L = O_AUDIO_MR;
assign O_AUDIO_R = O_AUDIO_MR;
  
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

//wire sram_we;  
//assign sram_we_n = !sram_we;
  
  super_breakout pm (
	 .Clk_50_I(SYS_CLK),
	 .clk_12(ena_12),
	 .Video_O(M_VIDEO_O),
    .Video_OUT(M_VIDEO_RGB),
    .Hsync_O(M_HSYNC),
    .Vsync_O(M_VSYNC),
	 .tv15Khz_mode(!scanSW[6]),
    .Audio_O(O_AUDIO_MR),
	 .Reset_n(!resetHW),
    .JOYSTICK_A_GND(),
    .JOYSTICK_B_GND(),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
	 .I_PLAYER({joystick2[8],joystick1[8]}),
	 .I_COIN({joystick2[9],joystick1[9]}),
	 .scanSW(scanSW),
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
