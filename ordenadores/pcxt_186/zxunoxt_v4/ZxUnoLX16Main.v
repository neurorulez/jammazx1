`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:31 11/20/2014 
// Design Name: 
// Module Name:    PapilioProMain 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//
// En el foro, Jepalza coment� que para enga�ar a los programas para que piensen
// que es un 286 hay que cambiar en el Next186_CPU.v (linea 1646 aprox)
// el valor de ISIZE = 0, por ISIZE = 1 (
//				end else begin
//					MREQ = 1'b0;
//					ISIZE = 0;
//					IRQ = 1'b1;
//				end
// --------------------------------  SALC --------------------------------

module ZxUno_lx16_Next186Soc
	(
		input CLK_50MHZ,
		output [5:0]VGA_R,
		output [5:0]VGA_G,
		output [5:0]VGA_B,
		output VGA_HSYNC,
		output VGA_VSYNC,
		output SDRAM_CLK,
		output SDRAM_CKE,
		output SDRAM_nCAS,
		output SDRAM_nRAS,
		output SDRAM_nCS,
		output SDRAM_nWE,
		output [1:0]SDRAM_BA,
		output [12:0]SDRAM_ADDR,
		inout [15:0]SDRAM_DATA,
		output SDRAM_DQML,
		output SDRAM_DQMH,
		output [1:0]LED,
		input [1:0]BTN,
		//input BTN_SOUTH,
		//input BTN_WEST,
		//input RX,
		//output TX,
		input RX_EXT,
		output TX_EXT,
		output AUDIO_L,
		output AUDIO_R,
		inout PS2CLKA,
		inout PS2CLKB,
		inout PS2DATA,
		inout PS2DATB,
		output SD_nCS,
		output SD_DI,
		output SD_CK,
		input SD_DO,
		inout [3:0]GPIO
	);

  wire [7:0] LED_int;
  assign LED = {~LED_int[1], LED_int[0]};
	assign SDRAM_CKE = 1'b1;
	wire SDR_CLK;

   ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) ODDR2_inst 
	(
      .Q(SDRAM_CLK), // 1-bit DDR output data
      .C0(SDR_CLK),  // 1-bit clock input
      .C1(!SDR_CLK), // 1-bit clock input
      .CE(1'b1), 		// 1-bit clock enable input
      .D0(1'b1), 		// 1-bit data input (associated with C0)
      .D1(1'b0), 		// 1-bit data input (associated with C1)
      .R(1'b0),   	// 1-bit reset input
      .S(1'b0)    	// 1-bit set input
   );


	system sys_inst
	(
		.CLK_50MHZ(CLK_50MHZ),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.VGA_HSYNC(VGA_HSYNC),
		.VGA_VSYNC(VGA_VSYNC),
		.sdr_CLK_out(SDR_CLK),
		.sdr_n_CS_WE_RAS_CAS({SDRAM_nCS, SDRAM_nWE, SDRAM_nRAS, SDRAM_nCAS}),
		.sdr_BA(SDRAM_BA),
		.sdr_ADDR(SDRAM_ADDR),
		.sdr_DATA(SDRAM_DATA),
		.sdr_DQM({SDRAM_DQMH, SDRAM_DQML}),
		.LED(LED_int),
		.BTN_RESET(!BTN[0]),
		.BTN_NMI(!BTN[1]),
		.RS232_DCE_RXD(),
		.RS232_DCE_TXD(),
		.SD_n_CS(SD_nCS),
		.SD_DI(SD_DI),
		.SD_CK(SD_CK),
		.SD_DO(SD_DO),
		.AUD_L(AUDIO_L),
		.AUD_R(AUDIO_R),
	 	.PS2_CLK1(PS2CLKA),
		.PS2_CLK2(PS2CLKB),
		.PS2_DATA1(PS2DATA),
		.PS2_DATA2(PS2DATB),
		.RS232_EXT_RXD(RX_EXT),
		.RS232_EXT_TXD(TX_EXT),
		.RS232_HOST_RXD(),
		.RS232_HOST_TXD(),
		.RS232_HOST_RST(),
		.GPIO() //		.GPIO(GPIO) //GPIO(0-3)
	);

endmodule
