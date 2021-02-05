//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Darfpga
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module travrusa_top (
  input  wire clk50mhz,

  output [18:0] sram_addr,
  inout  [7:0]  sram_data,
  output sram_we_n,

  input  wire	spi_miso,
  output wire	spi_mosi,
  output wire	spi_clk,
  output wire	spi_cs,
  
  inout wire ps2_clk,
  inout wire ps2_data,
  
  input wire  BTN,
  output wire LED,

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


wire clk_sys, clk7p16, clk_3p58, pll_lckd;
  
  BUFG pclkbufg  (.I(pllclk0), .O(clk_sys));
  BUFG pclkbufg1 (.I(pllclk1), .O(clk7p16));
  BUFG pclkbufg2 (.I(pllclk2), .O(clkldr));

  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(12),  //Multiplica el Reloj de entrada para todos
    .CLKOUT0_DIVIDE(16.27),    //36.875 Mhz
    .CLKOUT1_DIVIDE(83.79), // 7.16 hay que dividirlo entre 2 para que de 3.58hz
    .CLKOUT2_DIVIDE(12),  //50Mhz
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


  // Divisor de relojes
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_x;
  
  always @ (posedge clk7p16 or negedge pll_lckd) begin
    if (!pll_lckd) begin
      delay_count <= 8'd0;
      pm_reset <= 1'b1;
    end else begin
      delay_count <= delay_count + 1'b1;
      if (delay_count == 8'hff) pm_reset <= 1'b0;        
    end
  end
  assign clk_3p58 = delay_count[0];
  assign ena_x = delay_count[3];
  
 wire [20:0]scanSW;
 wire [1:0] scandblctrl;
 wire resetKey, master_reset;
 wire resetHW;

 reg rom_loaded = 0;
always @(posedge clkldr) begin
	rom_loaded <= sram_we; //rom_load;
end 
 assign resetHW =  resetKey | !joystick1[11] | rom_loaded | pm_reset | !pwon_reset_n;// | !BTN[1]; //Reset de la maquina arcade

 wire ext_rst = joystick2[11]; //1'b1;
 wire  [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
 wire  [2:0]X_VIDEO_R, X_VIDEO_G, X_VIDEO_B;
 wire  [7:0]X_VIDEO;
 wire M_HSYNC,M_VSYNC,M_CSYNC,M_HBLANK,M_VBLANK,M_AUDIO_L,M_AUDIO_R;
 wire X_HSYNC,X_VSYNC;
 wire VIDEO_ENA;
 wire tv15khz = !scandblctrl[0] ^ scanSW[6]; //Valor por defecto de bios y cambia con Bloq Despl
 assign LED = tv15khz;                            //Led modo de video

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
	.en_vid(VIDEO_ENA),
	.scanlines(scandblctrl[0] ^ scanSW[8])
   );
	
assign red =   tv15khz ? M_VIDEO_R : X_VIDEO_R;
assign green = tv15khz ? M_VIDEO_G : X_VIDEO_G;
assign blue =  tv15khz ? M_VIDEO_B : X_VIDEO_B;

assign hsync = tv15khz ? M_CSYNC : X_HSYNC;
assign vsync = tv15khz ? 1'b1 : X_VSYNC;
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

wire [18:0] sram_addr_r;
wire [7:0]  sram_data_r;

  traverse_usa pm (
	 .clock_36(clk_sys),
	 .clock_3p58(clk_3p58),
	 .reset(resetHW),
	 .cpu_rom_addr(sram_addr_r),
	 .cpu_rom_do(sram_data_r),
	 .tv15Khz_mode(tv15khz),
    .video_r(M_VIDEO_R),
    .video_g(M_VIDEO_G),
    .video_b(M_VIDEO_B),
	 .video_csync(M_CSYNC),
    .video_hs(M_HSYNC),
    .video_vs(M_VSYNC),
	 .video_hblank(M_HBLANK),
	 .video_vblank(M_VBLANK),
	 .video_ena(VIDEO_ENA),
    .audio_out_l(M_AUDIO_L),
    .audio_out_r(M_AUDIO_R),	
   .I_JOYSTICK_A(joystick1[5:0]),
   .I_JOYSTICK_B(joystick2[5:0]),
	.I_PLAYER({joystick2[8],joystick1[8]}),
	.I_COIN({joystick2[9],joystick1[9]}),
	.scanSW(scanSW)
  );
 
 
 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 //assign sram_addr = 21'b000001000111111010101; 	
 //assign scandblctrl = sram_data[1:0];  
 //assign sram_we_n = 1'b1;

  keyboard keyb (
		.CLOCK(clk7p16),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);
  
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(clk7p16),
	  .REBOOT(master_reset || !ext_rst)
	);  

	  reg [7:0] videoconfig = 8'h00;
  reg [63:0] shift_master_reset = 64'd0;
  
  always @(posedge clkldr) begin
    shift_master_reset <= {shift_master_reset[62:0], 1'b1};
    if (shift_master_reset[32:31] == 2'b01)
      videoconfig <= sram_data;
  end
  assign pwon_reset_n = shift_master_reset[63];
  assign scandblctrl = videoconfig[1:0];
  
	wire [18:0] sram_addr_w;
   wire [7:0]  sram_data_w;
   wire sram_we;
   assign sram_we_n   = (pwon_reset_n == 1'b0)? 1'b1       : !sram_we;
	assign sram_addr   = (pwon_reset_n == 1'b0)? 21'h008FD5 : sram_we ? sram_addr_w : sram_addr_r;
	assign sram_data   = sram_we ? sram_data_w : 8'bz; 
	assign sram_data_r = sram_we ? 8'b0 : sram_data;

CtrlModule MyCtrlModule 
	(
		.clk(clkldr),
		.reset_n(pwon_reset_n), //1'b1 no hace reset.
	   .vga_hsync(X_HSYNC),
		.vga_vsync(X_VSYNC),
		//-- SRAM card signals
		.sram_addr_w(sram_addr_w),
      .sram_data_w(sram_data_w),
		.sram_we(sram_we),
		//-- SD card signals
		.spi_clk(spi_clk),
		.spi_mosi(spi_mosi),
		.spi_miso(spi_miso),
		.spi_cs(spi_cs),
		//--ROM size & Ext
		.rom_size(),
		.extension(),
		.rom_load(),
		//-- Control signals
		.host_divert_keyboard(host_divert_keyboard),
		.host_divert_sdcard(host_divert_sdcard),
		.host_reset(host_reset)
	);

endmodule
