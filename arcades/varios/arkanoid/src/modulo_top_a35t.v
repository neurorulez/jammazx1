//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Darfpga
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module arkanoid_top (
  input  wire clk50mhz,
  
  output [18:0] sram_addr,
  input  [7:0]  sram_data,
  output sram_we_n,

  input wire ps2_clk,
  input wire ps2_data,

  inout wire mouse_clk,
  inout wire mouse_data,
  
  input wire  BTN,
  output wire LED,

  output wire [3:0] red,
  output wire [3:0] green,
  output wire [3:0] blue,
  output wire hsync,
  output wire vsync,
  output wire audio_l,
  output wire audio_r,

  output wire JOY_CLK,
  output wire JOY_LOAD,
  input  wire JOY_DATA
);

  wire [1:0] scandblctrl;

  wire clk2p4, clk4p8, clk9p6, clk12, clk24 , pll_lckd;
  
  wire pllclk0, pllclk1, pllclk2, pllclk3;
  wire clkfbout;
  
  BUFG pclkbufg  (.I(pllclk0), .O(clk12));
  BUFG pclkbufg1 (.I(pllclk1), .O(clk24));
  BUFG pclkbufg2 (.I(pllclk2), .O(clk9p6));
   
  //////////////////////////////////////////////////////////////////
  // 2x pclk is going to be used to drive OSERDES2
  // on the GCLK side
  //////////////////////////////////////////////////////////////////
  //BUFG pclkx2bufg (.I(pllclk2), .O(pclkx2));

  //////////////////////////////////////////////////////////////////
  // 10x pclk is used to drive IOCLK network so a bit rate reference
  // can be used by OSERDES2
  //////////////////////////////////////////////////////////////////
  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(12),    //Multiplica el Reloj de entrada para todos
    .CLKOUT0_DIVIDE(50),   // 12 Mhz
    .CLKOUT1_DIVIDE(25),   // 24 Mhz
    .CLKOUT2_DIVIDE(62.5),  // 9.6Mhzx3 = 9.6
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

/*
clk_wiz_0 clk_wiz_0
(
    .clk_in1(clk50mhz),
    .clk_out1(clk12),
    .clk_out2(clk24),
    .clk_out3(clk4p8),
    .locked(pll_lckd)
);
*/
/*
clk_wiz_1 clk_wiz_1
(
    .clk_in1(clk50mhz),
    .clk_out1(clk12),
    .clk_out2(clk24),
    .clk_out3(clk9p6),
    .locked(pll_lckd)
);
*/

  // Divisor de relojes
  reg [11:0] delay_count;

  wire ena_x;
  
  
  always @ (posedge clk9p6 or negedge pll_lckd) begin
    if (!pll_lckd) begin
      delay_count <= 8'd0;
    end else begin
      delay_count <= delay_count + 1'b1;
    end
  end
  //assign clk2p4 = delay_count[0];
  assign clk2p4 = delay_count[1];
  assign ena_x  = delay_count[2];

  
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 assign resetHW = resetKey | !joystick1[11]; //Reset de la maquina arcade
 //assign LED = scanSW[9];                            //Led modo de teclas
 assign LED = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA


wire ext_rst;
assign ext_rst = joystick2[11]; //1'b1;
wire [3:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO_L,M_AUDIO_R;
assign red     = M_VIDEO_R; 
assign green   = M_VIDEO_G;//4'b0000;//M_VIDEO_G;
assign blue    = M_VIDEO_B;
assign hsync   = M_HSYNC;
assign vsync   = M_VSYNC;
assign audio_l = M_AUDIO_L;
assign audio_r = M_AUDIO_R;
	
//Gestion de Joystick
 wire [1:0] spinner;
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

reg [1:0] spinner_encoder = 2'b11; //spinner encoder is a standard AB type encoder.  as it spins with will use the pattern 00, 01, 11, 10 and repeat.  when it spins the other way the pattern is reversed.

reg old_state;

wire signed [7:0] ps2_mouse_x, ps2_mouse_y, ps2_mouse_z;
//wire signed [8:0] mouse_x_in = $signed({ps2_mouse_x[7], 1'b0, ps2_mouse_x[6:0]});

wire ps2_mleft,ps2_mmidle,ps2_mright;
reg old_mouse_clk;
integer spin_counter;
reg signed  [7:0] mouse_x = 0;
reg signed [11:0] position = 0;

always @(posedge clk9p6)
begin 
  
    old_mouse_clk <= clk2p4;
    mouse_x <= ps2_mouse_x;
    
    if(position != 0) //we need to drive position to 0 still;
    begin
        if(clk2p4 & (old_mouse_clk != clk2p4))
        begin
            case({position[11] , spinner_encoder})
                {1'b1, 2'b00}: spinner_encoder <= 2'b01;
                {1'b1, 2'b01}: spinner_encoder <= 2'b11;
                {1'b1, 2'b11}: spinner_encoder <= 2'b10;
                {1'b1, 2'b10}: spinner_encoder <= 2'b00;
                {1'b0, 2'b00}: spinner_encoder <= 2'b10;
                {1'b0, 2'b10}: spinner_encoder <= 2'b11;
                {1'b0, 2'b11}: spinner_encoder <= 2'b01;
                {1'b0, 2'b01}: spinner_encoder <= 2'b00;
            endcase
            if(position[11])
            begin
                position = position + 1'b1;
            end
            else 
            begin
                position = position - 1'b1;
            end
        end
    end

    //old_state <= ps2_mouse_x[1]; 
    //if(ps2_mouse_x[1] & (old_state != ps2_mouse_x[1]))
    if(clk2p4 & (old_mouse_clk != clk2p4))
    begin
        //position = {ps2_mouse_x, ps2_mouse_x[7], ps2_mouse_x[7], ps2_mouse_x[7]} ;
        if({position[11], ps2_mouse_x[7]}) position = position + ps2_mouse_x;
        else position = ps2_mouse_x;
    end

	if (scanSW[2] | scanSW[3]) begin // 0.167us per cycle
		if (spin_counter == 'd48000) begin// roughly 8ms to emulate 125hz standard mouse poll rate
			position <= scanSW[3] ? (scanSW[5] ? 12'd9 : 12'd4) : (scanSW[5] ? -12'd9 : -12'd4);
			spin_counter <= 0;
		end else begin
			spin_counter <= spin_counter + 1'b1;
		end
	end else begin
		spin_counter <= 0;
	end
end

  arkanoid pm (
    .clk_24m(clk24),
    .clk_12m(clk12),
    .video_r_o(M_VIDEO_R),
    .video_g_o(M_VIDEO_G),
    .video_b_o(M_VIDEO_B),
    .video_hsync_o(M_HSYNC),
    .video_vsync_o(M_VSYNC),
    .tv15Khz_mode(!scanSW[6]),
    .audio_l(M_AUDIO_L),
    .audio_r(M_AUDIO_R),
    .spinner(spinner_encoder),
    .I_SHOT({joystick2[4] & ~ps2_mleft, joystick1[4] & ~ps2_mleft}),
	.I_COIN({joystick2[9], joystick1[9]}),
	.I_PLAYER({joystick2[8], joystick1[8]}), //Pendiente de la entrada de player desde el jamma mientras se dea a 1 los dos botones (sin pulsar)
    .reset(!resetHW),
	.scanSW(scanSW),
	.scandblctrl(scandblctrl)
  );

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 assign sram_addr = 19'b0001000111111010101; 	
 assign scandblctrl = sram_data[1:0];  
 assign sram_we_n = 1'b1;

  keyboard keyb (
		.CLOCK(clk12),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);
 
  ps2mouse mouse(
  .clk        (clk24),
  .clk7_en    (clk9p6),
  .reset      (resetHW),
  .ps2mdat    (mouse_data),
  .ps2mclk    (mouse_clk),
  .zcount     (ps2_mouse_z),
  .ycount     (ps2_mouse_y),
  .xcount     (ps2_mouse_x),
  ._mleft     (ps2_mleft),
  ._mthird    (ps2_mmidle),
  ._mright    (ps2_mright)
	);  
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(clk12),
	  .reboot(master_reset || !ext_rst)
	);  

endmodule
