//---------------------------------------------------------------------------------
//-- Ports to ZX-UNO by Neuro
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module dkongjr_top (
  input  wire clk50mhz,

  output [18:0] sram_addr,
  inout  [7:0]  sram_data,
  output sram_we_n,
  
  inout wire ps2_clk,
  inout wire ps2_data,
  
  input wire  [1:0] BTN,
  output wire [1:0] LED,

  output wire [2:0] red,
  output wire [2:0] green,
  output wire [2:0] blue,
  output wire hsync,
  output wire vsync,
  output wire audio_l,
  output wire audio_r,
  
  output wire spi_clk,
  output wire spi_mosi,
  input wire  spi_miso,
  output wire spi_cs,

  output wire JOY_CLK,
  output wire JOY_LOAD,
  input  wire JOY_DATA
);

wire [1:0] scandblctrl;
wire clk_sys, pll_lckd;
  
  pll reloj (
      .CLK_IN1(clk50mhz),
      .CLK_OUT1(clk_sys),
		.CLK_OUT2(clkldr),
	  .LOCKED(pll_lckd)
    );


  // Divisor de relojes
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_x;
  wire ena_t;
 
  always @ (posedge clk_sys or negedge pll_lckd) begin
    if (!pll_lckd) begin
      delay_count <= 8'd0;
      pm_reset <= 1'b1;
    end else begin
      delay_count <= delay_count + 1'b1;
      if (delay_count == 8'hff) pm_reset <= 1'b0;        
    end
  end
	
  assign ena_x = delay_count[4];
  assign ena_t = delay_count[1];
  
  wire pwon_reset_n;
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;
 
 reg rom_loading;
 reg rom_loaded = 0;
 always @(posedge clkldr) begin
	rom_loaded <= rom_loading;
end 

//Gestion de Joystick
wire [11:0]boton_p1,boton_p2; //0:Up 1:down 2:left 3:right 4:f1 5:f2 6:f3 7:f4 8:start 9:ic 10:select 11:service/test

 joy_zx2 joy (
   .CLK_12M(ena_t),
   .scanSW(scanSW),
   .button_debounced_p1(boton_p1),
	.button_debounced_p2(boton_p2),
   .JOY_CLK(JOY_CLK),
   .JOY_LOAD(JOY_LOAD),
   .JOY_DATA(JOY_DATA)
 	);  

 assign resetHW =  resetKey | !boton_p1[11] | rom_loaded | pm_reset | !pwon_reset_n;// | !BTN[1]; //Reset de la maquina arcade

 assign LED[0] = !scandblctrl[0] ^ scanSW[6];
 //assign LED[1] = sram_we;
 assign LED[1] = 1'b1;
 
wire ext_rst = pm_reset ? 1'b1 : boton_p2[11]; //1'b1;
wire  [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire  [2:0]X_VIDEO_R, X_VIDEO_G, X_VIDEO_B;
wire  [6:0]X_NULO;
wire M_HSYNC,M_VSYNC,M_CYNC,M_AUDIO;
wire X_HSYNC,X_VSYNC;
wire HBlank,VBlank;
//wire [15:0]audio;
wire [7:0]audio;

wire tv15khz = !scandblctrl[0] ^ scanSW[6]; //! Negandolo para que por defecto sea RGB
wire scanlines = scandblctrl[1] ^ scanSW[8]; 

assign hsync = tv15khz ? !(!M_HSYNC ^ !M_VSYNC) : !X_HSYNC;
assign vsync = tv15khz ? 1'b1                   : !X_VSYNC;
assign red   = tv15khz ? M_VIDEO_R : X_VIDEO_R;  //(VBlank | HBlank) ? 3'b000 : 
assign green = tv15khz ? M_VIDEO_G : X_VIDEO_G;
assign blue  = tv15khz ? M_VIDEO_B : X_VIDEO_B;
assign audio_l = M_AUDIO;	
assign audio_r = M_AUDIO;

wire HBlank2 = hbl[8];
reg [8:0] hbl;
reg old_pix;
always @(posedge clk_sys) begin
	old_pix <= clk_pix;
	//ce_vid <= 0;
	if(~old_pix & clk_pix) begin
		//ce_vid <= 1;
		hbl <= (hbl<<1)|HBlank;
	end
end


   // Control module
  wire ps2k_clk_in, ps2k_clk_out, ps2k_dat_in, ps2k_dat_out;
 
  wire osd_window;
  wire osd_pixel;


// Host control signals, from the Control module
  wire host_reset, host_divert_sdcard, host_divert_keyboard;

	wire [31:0] cart_size;// = 32'h0;
	wire [31:0] file_ext;

	wire [18:0] sram_addr_r;
	wire [7:0]  sram_data_r;
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

	wire clk_pix,clk_pix_x2;
	
 dkongjr_main pm (
	.I_CLK_24576M(clk_sys),
	.I_RESETn(!resetHW),
	.ROM_A_SRAM(sram_addr_r),
	.ROM_D(sram_data_r),
	.I_U1(boton_p1[0]),
	.I_D1(boton_p1[1]),
	.I_L1(boton_p1[2]),
	.I_R1(boton_p1[3]),
	.I_J1(boton_p1[4]),
	
	.I_U2(boton_p2[0]),
	.I_D2(boton_p2[1]),
	.I_L2(boton_p2[2]),
	.I_R2(boton_p2[3]),
	.I_J2(boton_p2[4]),

	.I_S1(boton_p1[8]),
	.I_S2(boton_p2[8]),
	.I_C1(boton_p1[9]),
	.I_DIP_SW(8'b10000000),
	.O_PIX(clk_pix),
	.O_PIX2(clk_pix_x2),

	.O_VGA_R(M_VIDEO_R),
	.O_VGA_G(M_VIDEO_G),
	.O_VGA_B(M_VIDEO_B),
	.O_VGA_H_SYNCn(M_HSYNC),
	.O_VGA_V_SYNCn(M_VSYNC),
	.O_H_BLANK(HBlank),
	.O_V_BLANK(VBlank),

    .O_SOUND_DAT(audio)
  );
  
  keyboard keyb (
		.CLOCK(ena_t),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);

 vga_scandbl vga_scandbl (
	.CLK(clk_pix),
	.CLK_X2(clk_pix_x2),
	.I_HSYNC(M_HSYNC),
	.I_VSYNC(M_VSYNC),
	.O_HSYNC(X_HSYNC),
	.O_VSYNC(X_VSYNC),
	.I_VIDEO({7'b0000000,M_VIDEO_R,M_VIDEO_G,M_VIDEO_B}),
	.O_VIDEO({X_NULO,X_VIDEO_R,X_VIDEO_G,X_VIDEO_B}),
	.scanlines(scanlines)
	);

  dac wav_dac(
    .clk_i(clk_sys),
	 .res_n_i(!reserHW),
	 .dac_i(audio),
	 .dac_o(M_AUDIO)
	 );

/*
  sigma_delta_dac #(15,1) dac(
    .CLK(clk_sys),
	 .RESET(reserHW),
	 .DACin({~audio[15],audio}),
	 .DACout(M_AUDIO)
	 );
*/	 
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(ena_t),
	  .REBOOT(master_reset || !ext_rst)
	);  

CtrlModule MyCtrlModule 
(
		.clk(clkldr),
		.reset_n(pwon_reset_n),//1'b1),
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
		.rom_loading(rom_loading)
	);

endmodule
