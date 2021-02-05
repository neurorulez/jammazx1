//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of Darfpga 
//-- Trick to use less BRAM by Geoshock

`timescale 1 ps / 1 ps

module colony7_top (
  input  wire clk50mhz,
  input  wire [5:0] JOYSTICK,
  output [2:0] vga_red, 
  output [2:0] vga_green, 
  output [2:0] vga_blue,
  output vga_hsync,
  output vga_vsync,
  
  output [20:0] sram_addr,
  inout  [7:0]  sram_data,
  output sram_we_n,

  input  wire	spi_miso,
  output wire	spi_mosi,
  output wire	spi_clk,
  output wire	spi_cs,

  output O_NTSC,
  output O_PAL,
  
  output wire audio_l,
  output wire audio_r,
  
  input wire ps2_clk,
  input wire ps2_data,
  
  output wire LED,

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
  wire pll_lckd;
  wire clkfbout;
  wire reset;
  
 // wire [5:0] JOYSTICK2;          //Variable temporal hasta que se meta la señal de Joystick 2 en el .UCF
  //assign JOYSTICK2 = 6'b111111;  //Asignacion temporal al Joystick en Pullup
  //assign JOYSTICK2 = JOYSTICK;

  BUFG pclkbufg  (.I(pllclk0), .O(clk12));
  BUFG pclkbufg1 (.I(pllclk1), .O(clk7p12));
  BUFG pclkbufg2 (.I(pllclk2), .O(clkldr));

  //////////////////////////////////////////////////////////////////
  // 10x pclk is used to drive IOCLK network so a bit rate reference
  // can be used by OSERDES2
  //////////////////////////////////////////////////////////////////
  PLL_BASE # (
    .CLKIN_PERIOD(20),
    .CLKFBOUT_MULT(12),  //Multiplica el Reloj de entrada para todos
    .CLKOUT0_DIVIDE(50),    //12 Mhz
    .CLKOUT1_DIVIDE(84.26), // 7.16 hay que dividirlo entre 2 para que de 3.58hz
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


  assign O_NTSC = 1'b0;
  assign O_PAL = 1'b1;

  // Relojes 12 y 6Mhz
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_12;
  
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

  wire pwon_reset_n;
  wire resetKey, master_reset, resetHW;
  wire [20:0]scanSW;

reg rom_load;  
reg rom_loaded = 0;
always @(posedge clkldr) begin
	rom_loaded <= sram_we; //rom_load;
end 

 assign resetHW =  resetKey | !JTEST | rom_loaded | pm_reset | !pwon_reset_n;// | !BTN[1]; //Reset de la maquina arcade
 
// assign resetHW = resetKey | !JTEST | sram_we | pm_reset;; 
 assign LED = scanSW[9];  

wire ext_rst;
assign ext_rst = JSERVICE; 
reg [2:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B;
wire M_HSYNC,M_VSYNC,M_AUDIO,VGA_HS,VGA_VS;
wire [7:0]AUDIO;
assign vga_red   = M_VIDEO_R;
assign vga_green = M_VIDEO_G;
assign vga_blue  = M_VIDEO_B;
assign vga_hsync = M_HSYNC;
assign vga_vsync = M_VSYNC;
assign audio_l = M_AUDIO;
assign audio_r = M_AUDIO;
assign JR = {M_VIDEO_R,1'b0}; 
assign JG = {M_VIDEO_G,1'b0};
assign JB = {M_VIDEO_B,1'b0};
assign JHSYNC = M_HSYNC;
assign JVSYNC = M_VSYNC;
assign JAUDIO = M_AUDIO;
	
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;
	
parameter joyType = 0; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin 
   assign JSELECT = joy_split;
   always @(posedge clk12) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge clk12) begin 
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
  
  defender pm (
	 .reset(resetHW),
    .clock_12(clk12),
    .clk_0p89(clk0p89),

    .video_r(M_VIDEO_R),
    .video_g(M_VIDEO_G),
    .video_b(M_VIDEO_B),
    .video_hsync(M_HSYNC),
    .video_vsync(M_VSYNC),
	 .VGA_HS(VGA_HS),
	 .VGA_VS(VGA_VS),
	 .tv15Khz_mode(!scandblctrl[0] ^ scanSW[6]),
	 .audio_out(AUDIO),
	 .roms_addr(sram_addr_r),
	 .roms_do(sram_data_r),

    .I_JOYSTICK_A(joystick1[5:0]),
    .I_JOYSTICK_B(joystick2[5:0]),
	 .I_COIN(JCOIN),
	 .I_PLAYER({joystick2[7],joystick1[7]}), //Pendiente de la entrada de player desde el jamma mientras se dea a 1 los dos botones (sin pulsar)
	 .I_TABLE(1'b1),   //No se sabe si se utilizara una entrada para cambiar entre TABLE=0 y UP=1 (en la entrada del core esta a 1)

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
 //assign sram_addr = 21'b000001000111111010101; 	
 //assign scandblctrl = sram_dq[1:0];  
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
		.reset_n(pwon_reset_n),
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
