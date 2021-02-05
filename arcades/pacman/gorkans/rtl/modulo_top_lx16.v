//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of MikeJ
//-- Based on the decrypt romgen of FelixV
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module gorkans_top (
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
    .CLKFBOUT_MULT(20),  //Multiplica el Reloj de entrada para todos
    .CLKOUT0_DIVIDE(4),  //Divide el valor multiplicado para OUT0
    .CLKOUT1_DIVIDE(41), //Divide el valor multiplicado para OUT1
    .CLKOUT2_DIVIDE(20), //Divide el valor multiplicado para OUT2
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
    .CLKIN(clk50mhz),
    .RST(1'b0)
  );

  wire serdesstrobe;
  wire bufpll_lock;
  BUFPLL #(.DIVIDE(5)) ioclk_buf (.PLLIN(pllclk0), .GCLK(pclkx2), .LOCKED(pll_lckd),
           .IOCLK(pclkx10), .SERDESSTROBE(serdesstrobe), .LOCK(bufpll_lock));

  synchro #(.INITIALIZE("LOGIC1"))
  synchro_reset (.async(!pll_lckd),.sync(reset),.clk(pclk));

  // Divisor de relojes
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
  assign ena_6 = delay_count[0] & ~delay_count[1];
  assign ena_x = delay_count[4];
  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign resetHW = resetKey | !joystick1[11] | !BTN[1]; //Reset de la maquina arcade
 assign LED[0] = scanSW[9];                            //Led modo de teclas
 assign LED[1] = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA
 
wire ext_rst;
assign ext_rst = joystick2[11]; //1'b1;
reg [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
reg M_HSYNC,M_VSYNC,M_AUDIO_L,M_AUDIO_R;
assign red     = {M_VIDEO_R}; 
assign green   = {M_VIDEO_G};
assign blue    = {M_VIDEO_B};
assign hsync   = M_HSYNC;
assign vsync   = M_VSYNC;
assign audio_l = M_AUDIO_L;
assign audio_r = M_AUDIO_R;
   
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

  
  PACMAN pm (
    .O_VIDEO_R(M_VIDEO_R),
    .O_VIDEO_G(M_VIDEO_G),
    .O_VIDEO_B(M_VIDEO_B),
    .O_HSYNC(M_HSYNC),
    .O_VSYNC(M_VSYNC),
    .O_BLANKING(),
    .O_AUDIO_L(M_AUDIO_L),
    .O_AUDIO_R(M_AUDIO_R),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
    .JOYSTICK_A_GND(),
    .JOYSTICK_B_GND(),
    .I_COIN({joystick2[9],joystick1[9] & BTN[0]}),
    .I_PLAYER({joystick2[8],joystick1[8]}), //Pendiente de la entrada de player desde el jamma mientras se dea a 1 los dos botones (sin pulsar)
    .I_TABLE(1'b1),   //No se sabe si se utilizara una entrada para cambiar entre TABLE=0 y UP=1 (en la entrada del core esta a 1)
    .I_RESET(resetHW),
    .I_CLK_REF(pclkx2),
    .I_CLK(pclk),
    .I_ENA_12(ena_12),
    .I_ENA_6(ena_6),
    .scanSW(scanSW),
    .resetKey(resetHW),
    .scandblctrl(scandblctrl)
  );
  

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 assign sram_addr = 19'b000001000111111010101;  
 assign scandblctrl = sram_data[1:0];  
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
