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
 
 reg rom_load;
 reg rom_loaded = 0;
 always @(posedge clkldr) begin
	rom_loaded <= sram_we; //rom_load;
end 

 assign resetHW =  resetKey | !joystick1[11] | rom_loaded | pm_reset | !pwon_reset_n;// | !BTN[1]; //Reset de la maquina arcade

 assign LED[0] = !scandblctrl[0] ^ scanSW[6];
 //assign LED[1] = sram_we;
 assign LED[1] = 1'b1;
 
wire ext_rst;
assign ext_rst = joystick2[11]; //1'b1;
wire  [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_CYNC,M_AUDIO_L,M_AUDIO_R;
reg [7:0]X_VIDEO;
wire X_HSYNC,X_VSYNC;
wire VGA_INT;
wire tv15khz = !scandblctrl[0] ^ scanSW[6]; //! Negandolo para que por defecto sea RGB

assign hsync = tv15khz ? M_CSYNC : M_HSYNC;
assign vsync = tv15khz ? 1'b1    : M_VSYNC;
assign red   = M_VIDEO_R;
assign green = M_VIDEO_G;
assign blue  = M_VIDEO_B;
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

 dkong_main pm (
	.I_CLK_24576M(clk_sys),
	.I_RESETn(!resetHW),
	.O_ROM_AB(sram_addr_r),
	.I_ROM_DB(sram_data_r),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
	 .I_PLAYER({joystick2[8],joystick1[8]}),
	 .I_COIN({joystick2[9],joystick1[9]}),
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
		.rom_load(rom_load),
		//-- Control signals
		.host_divert_keyboard(host_divert_keyboard),
		.host_divert_sdcard(host_divert_sdcard),
		.host_reset(host_reset)
	);

endmodule
