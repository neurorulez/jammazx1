//---------------------------------------------------------------------------------
//-- Ports to ZX-UNO by Neuro
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module dkong (
  input  wire clk50mhz,

  output [18:0] sram_addr,
  inout  [7:0]  sram_data,
  output sram_we_n,
  
  inout wire ps2_clk,
  inout wire ps2_data,
  
  output wire LED,

  output wire [2:0] red,
  output wire [2:0] green,
  output wire [2:0] blue,
  output wire hsync,
  output wire vsync,
  output wire audio_l,
  output wire audio_r,

  output wire PAL,
  output wire NTSC,
  
  output wire spi_clk,
  output wire spi_mosi,
  input wire  spi_miso,
  output wire spi_cs,

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
  input  wire JSERVICE,
  input  wire JTEST
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
 
 reg rom_load;
 reg rom_loaded = 0;
 always @(posedge clkldr) begin
	rom_loaded <= sram_we; //rom_load;
end 

 assign resetHW =  resetKey | !JTEST | rom_loaded | pm_reset | !pwon_reset_n;// | !BTN[1]; //Reset de la maquina arcade
 assign LED = scandblctrl[0] ^ scanSW[6];
 
wire ext_rst;
assign ext_rst =  JSERVICE; //1'b1;
wire  [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO_L,M_AUDIO_R;
wire VGA_INT;
wire tv15khz = !scandblctrl[0] ^ scanSW[6]; 

assign hsync = tv15khz ? M_CSYNC : M_HSYNC;
assign vsync = tv15khz ? 1'b1    : M_VSYNC;
assign red   = M_VIDEO_R;
assign green = M_VIDEO_G;
assign blue  = M_VIDEO_B;
assign audio_l = M_AUDIO_L;	
assign audio_r = M_AUDIO_R;
assign JR = {M_VIDEO_R,1'b0};
assign JG = {M_VIDEO_G,1'b0};
assign JB = {M_VIDEO_B,1'b0};
assign JHSYNC = tv15khz ? M_CSYNC : M_HSYNC;
assign JVSYNC = tv15khz ? 1'b1    : M_VSYNC;
assign JAUDIO = M_AUDIO_L;

assign PAL = 1'b1;
assign NTSC = 1'b0;


  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;

parameter joyType = 1; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin //Joy Splitter Jamma
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

   // Control module
  wire ps2k_clk_in, ps2k_clk_out, ps2k_dat_in, ps2k_dat_out;
 
  wire osd_window;
  wire osd_pixel;


// Host control signals, from the Control module
  wire host_reset, host_divert_sdcard, host_divert_keyboard;


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
	
 dkong_main pm (
	.I_CLK_24576M(clk_sys),
	.I_RESETn(!resetHW),
	.O_ROM_AB(sram_addr_r),
	.I_ROM_DB(sram_data_r),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
	 .I_PLAYER({joystick2[7],joystick1[7]}),
	 .I_COIN(JCOIN),
	 .scanSW(scanSW),
	 .tv15khz(tv15khz),
	 .scanlines(scandblctrl[1] ^ scanSW[8]),
    .O_VGA_R(M_VIDEO_R),
    .O_VGA_G(M_VIDEO_G),
    .O_VGA_B(M_VIDEO_B),
    .O_VGA_INT(VGA_INT),
	.O_VGA_CSYNC(M_CSYNC),
    .O_VGA_HSYNC(M_HSYNC),
    .O_VGA_VSYNC(M_VSYNC),
    .O_SOUND_OUT_L(M_AUDIO_L),
	.O_SOUND_OUT_R(M_AUDIO_R)
  );
  
  keyboard keyb (
		.CLOCK(ena_t),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);


//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(ena_t),
	  .REBOOT(master_reset || !ext_rst)
	);  

CtrlModule MyCtrlModule 
(
		.clk(clkldr),
		.reset_n(pwon_reset_n),//1'b1),
		.vga_vsync(VGA_INT),
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
		//-- Control signals
		.host_divert_keyboard(host_divert_keyboard),
		.host_divert_sdcard(host_divert_sdcard),
		.host_reset(host_reset)
	);

endmodule
