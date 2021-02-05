//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Darfpga/Geoshock
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module sbagman_top (
  input  wire clk50mhz,

  input  wire [5:0] JOYSTICK,
  
  output [20:0] sram_addr,
  inout  [7:0]  sram_data,
  output sram_we_n,

  input  wire	spi_miso,
  output wire	spi_mosi,
  output wire	spi_clk,
  output wire	spi_cs,

  output NTSC,
  output PAL,

  input wire ps2_clk,
  input wire ps2_data,
  
  output wire LED,

  output wire [2:0] red,
  output wire [2:0] green,
  output wire [2:0] blue,
  output wire hsync,
  output wire vsync,
  output wire audio_l,
  output wire audio_r,

  	output wire [3:0] JR,
   output wire [3:0] JG,
   output wire [3:0] JB,
   output wire JHSYNC,
   output wire JVSYNC,
   output wire JAUDIO,
	output wire JSELECT,
	input  wire [7:0] JJOY,
	input  wire [1:0] JCOIN,
	input  wire JTEST,
	input  wire JSERVICE
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

  wire pwon_reset_n;
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;

 //reg rom_load;
 reg rom_loaded = 0;  
 always @(posedge pclkx2) begin
	rom_loaded <= sram_we; //rom_load;
 end 
 assign resetHW =  resetKey | !JTEST | rom_loaded | pm_reset | !pwon_reset_n; //Reset de la maquina arcade
 assign LED = scandblctrl[0] ^ scanSW[6];           //Led de modo RGB-VGA

wire ext_rst;
assign ext_rst = JSERVICE; //1'b1;
reg [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
reg M_HSYNC,M_VSYNC,M_AUDIO_L,M_AUDIO_R;
assign red     = {M_VIDEO_R}; 
assign green   = {M_VIDEO_G};
assign blue    = {M_VIDEO_B};
assign hsync   = M_HSYNC;
assign vsync   = M_VSYNC;
assign audio_l = M_AUDIO_L;
assign audio_r = M_AUDIO_R;
assign JR = {M_VIDEO_R,1'b0}; 
assign JG = {M_VIDEO_G,1'b0};
assign JB = {M_VIDEO_B,1'b0};
assign JHSYNC = M_HSYNC;
assign JVSYNC = M_VSYNC;
assign JAUDIO = M_AUDIO_L;
assign NTSC = 1'b0;
assign PAL = 1'b1;
	
//Gestion de Joystick
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;
	
parameter joyType = 0; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin 
   assign JSELECT = joy_split;
   always @(posedge ena_12) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge ena_12) begin 
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

wire [18:0] sram_addr_r;
wire [7:0]  sram_data_r;

  bagman pm (
	 .clock_12(ena_12),
	 .reset(resetHW),
	 .tv15Khz_mode(!scandblctrl[0] ^ scanSW[6]),
    .video_r(M_VIDEO_R),
    .video_g(M_VIDEO_G),
    .video_b(M_VIDEO_B),
    .video_hs(M_HSYNC),
    .video_vs(M_VSYNC),
    .audio_out_l(M_AUDIO_L),
    .audio_out_r(M_AUDIO_R),
	 .roms_addr(sram_addr_r),
	 .roms_do(sram_data_r),
    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
    .JOYSTICK_A_GND(),
    .JOYSTICK_B_GND(),
	 .I_PLAYER({joystick2[7],joystick1[7]}),
	 .I_COIN(JCOIN),
	 .scanSW(scanSW),
	 .scandblctrl(scandblctrl)
  );

 // 0x8FD5 SRAM (SCANDBLCTRL ZXUNO REG)  
 //assign sram_addr = 21'b000001000111111010101; 	
 //assign scandblctrl = sram_data[1:0];  
 //assign sram_we_n = 1'b1;

  keyboard keyb (
		.CLOCK(ena_12),
		.PS2_CLK(ps2_clk),
		.PS2_DATA(ps2_data),
		.resetKey(resetKey),
		.MRESET(master_reset),
		.scanSW(scanSW)
	);
  
//-----------------Multiboot-------------
	multiboot el_multiboot (
	  .clk_icap(ena_12),
	  .REBOOT(master_reset || !ext_rst)
	);  

  reg [7:0] videoconfig = 8'h00;
  reg [63:0] shift_master_reset = 64'd0;
  
  always @(posedge pclkx2) begin
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
		.clk(pclkx2),
		.reset_n(pwon_reset_n), //1'b1 no hace reset.
	   .vga_hsync(M_HSYNC),
		.vga_vsync(M_VSYNC),
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
