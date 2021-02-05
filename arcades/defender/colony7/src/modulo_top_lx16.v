//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Darfpga 
//-- Trick to use less BRAM by Geoshock
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module colony7_top (
  input  wire clk50mhz,
  
  output wire [18:0] sram_addr,
  inout  wire [7:0]  sram_data,
  output wire sram_we_n,

  input  wire	spi_miso,
  output wire	spi_mosi,
  output wire	spi_clk,
  output wire	spi_cs,

  input wire ps2_clk,
  input wire ps2_data,
  
  input wire  [1:0] BTN,
  output wire [1:0] LED,

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

  wire pllclk0, pllclk1, pllclk2;
  wire clk0p89, pll_lckd;
  wire clkfbout;
  
  BUFG pclkbufg  (.I(pllclk0), .O(clk12));
  BUFG pclkbufg1 (.I(pllclk1), .O(clk7p12));
  BUFG pclkbufg2 (.I(pllclk2), .O(clkldr));
 
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
    .CLKFBOUT_MULT(12),  //Multiplica el Reloj de entrada para todos
    .CLKOUT0_DIVIDE(50),    //12 Mhz
    .CLKOUT1_DIVIDE(84.26), // 7.1208 / 7.16 hay que dividirlo entre 2 para que de 3.58hz
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

  //wire serdesstrobe;
  //wire bufpll_lock;
  //BUFPLL #(.DIVIDE(5)) ioclk_buf (.PLLIN(pllclk0), .GCLK(pclkx2), .LOCKED(pll_lckd),
//           .IOCLK(pclkx10), .SERDESSTROBE(serdesstrobe), .LOCK(bufpll_lock));

//  synchro #(.INITIALIZE("LOGIC1"))
//  synchro_reset (.async(!pll_lckd),.sync(reset),.clk(pclk));

  // Divisor de relojes
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_12;
  wire ena_x;
  
  always @ (posedge clk7p12 or negedge pll_lckd) begin
    if (!pll_lckd | !pwon_reset_n) begin
      delay_count <= 8'd0;
      pm_reset <= 1'b1;
    end else begin
      delay_count <= delay_count + 1'b1;
      if (delay_count == 8'hff)
        pm_reset <= 1'b0;        
    end
  end
    
  assign clk0p89 = delay_count[2];
  assign ena_x = delay_count[4];

  wire pwon_reset_n;
  wire resetKey, master_reset;
  wire [20:0]scanSW;
  wire resetHW;
//reg resetHW;
reg rom_load;
//reg rom_loadD = 0;
reg rom_loaded = 0;
//always @(posedge clkldr) begin
//	rom_loadD <= rom_load;
//	if (rom_loadD & ~rom_load) rom_loaded <= 1;
	//resetHW <= resetKey | !joystick1[11] | ~rom_loaded | pm_reset;
//end
//assign resetHW = resetKey | !joystick1[11] | ~rom_loaded | pm_reset;

always @(posedge clkldr) begin
	rom_loaded <= sram_we; //rom_load;
end 
 assign resetHW =  resetKey | !joystick1[11] | rom_loaded | pm_reset | !pwon_reset_n;// | !BTN[1]; //Reset de la maquina arcade
 //assign resetHW =  resetKey | !joystick1[11] | sram_we | pm_reset;// | !BTN[1]; //Reset de la maquina arcade OK
 //assign LED = scanSW[9];                            //Led modo de teclas
 assign LED = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA


wire ext_rst;
assign ext_rst = joystick2[11]; //1'b1;
wire [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO,VGA_HS,VGA_VS;
wire [7:0]AUDIO;

assign red     = {M_VIDEO_R,1'b0}; 
assign green   = {M_VIDEO_G,1'b0};
assign blue    = {M_VIDEO_B,1'b0};
assign hsync   = M_HSYNC;
assign vsync   = M_VSYNC;
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

wire [18:0] sram_addr_r;
wire [7:0]  sram_data_r;
  
  defender pm (
    .video_r(M_VIDEO_R),
    .video_g(M_VIDEO_G),
    .video_b(M_VIDEO_B),
    .video_hsync(M_HSYNC),
    .video_vsync(M_VSYNC),
    .tv15Khz_mode(!scandblctrl[0] ^ scanSW[6]),
	 .VGA_HS(VGA_HS),
	 .VGA_VS(VGA_VS),
	 .audio_out(AUDIO),
	 .roms_addr(sram_addr_r),
	 .roms_do(sram_data_r),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
	.I_COIN({joystick2[9],joystick1[9] & BTN}),
	.I_PLAYER({joystick2[8],joystick1[8]}), //Pendiente de la entrada de player desde el jamma mientras se dea a 1 los dos botones (sin pulsar)
	.I_TABLE(1'b1),   //No se sabe si se utilizara una entrada para cambiar entre TABLE=0 y UP=1 (en la entrada del core esta a 1)
    .reset(resetHW),
    .clock_12(clk12),
    .clk_0p89(clk0p89),
	.scanSW(scanSW),
	.scandblctrl(scandblctrl)
  );


sigma_delta_dac #(7) dac //15
(
	.CLK(clkldr),
	.RESET(resetHW),
	.DACin(AUDIO), 
	.DACout(M_AUDIO)
);

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 //assign sram_addr = 19'b0001000111111010101; 	
 //assign scandblctrl = sram_data[1:0];  
 //assign sram_we_n = 1'b1;

  keyboard keyb (
		.CLOCK(clk12),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);
  
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(clk12),
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
	   .vga_hsync(VGA_HS),
		.vga_vsync(VGA_VS),
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
		.rom_size(cart_size),
		.extension(file_ext),
		.rom_load(rom_load),
		//-- Control signals
		.host_divert_keyboard(host_divert_keyboard),
		.host_divert_sdcard(host_divert_sdcard),
		.host_reset(host_reset)
	);

endmodule
