//---------------------------------------------------------------------------------
//-- Arcade Ports to ZX-UNO by Neuro
//-- Based on the code of MikeJ
//-- Based on the decrypt romgen of FelixV
//---------------------------------------------------------------------------------
//

`timescale 1 ps / 1 ps

module msx_top (
  input  wire clk50mhz,
  
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
	inout sd_spi_miso,
   output sd_spi_cs_n,
   output sd_spi_mosi,
   output sd_spi_sclk,

  input wire ps2_clk,
  input wire ps2_data,
  input wire ps2_mouse_clk,
  input wire ps2_mouse_data,
  
  input  wire [1:0] BTN,
  output wire [1:0] LED,

  output wire [5:0] red,
  output wire [5:0] green,
  output wire [5:0] blue,
  output wire hsync,
  output wire vsync,
  output wire audio_l,
  output wire audio_r,

  output wire JOY_CLK,
  output wire JOY_LOAD,
  input  wire JOY_DATA
);

	wire clk_sys;
	wire memclk;
	wire SDR_CLK;
	wire pll_lckd;
	
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

	//BUFG clk_sysbufg (.I(clk21), .O(clk_sys));

	relojes relojes
	(
		.CLK_IN1(clk50mhz), 
		.CLK_OUT1(memclk),  
		.CLK_OUT2(SDR_CLK),
		.CLK_OUT3(clk_sys),   //21mhz
		.LOCKED(pll_lckd)
    );

   
  // Divisor de relojes
  reg [7:0] delay_count;
  reg pm_reset;
  wire ena_x;
  wire ena_m;
  
  always @ (posedge clk_sys or negedge pll_lckd) begin
    if (!pll_lckd) begin
      delay_count <= 8'd0;
      pm_reset <= 1'b1;
    end else begin
      delay_count <= delay_count + 1'b1;
      if (delay_count == 8'hff)
        pm_reset <= 1'b0;        
    end
  end
    
  assign ena_x = delay_count[4];
  assign ena_m = delay_count[0];
  
  wire master_reset;
  wire led0,led1;
  
 assign LED[0] = led0;          
 assign LED[1] = led1;           
 
wire reset;
assign reset = !BTN[0]; //1'b1;
reg [5:0]M_VIDEO_R, M_VIDEO_G, M_VIDEO_B,X_VIDEO_R, X_VIDEO_G, X_VIDEO_B;
wire [5:0]S_VIDEO_R, S_VIDEO_G, S_VIDEO_B;
reg M_HSYNC,M_VSYNC,X_HSYNC,X_VSYNC,M_AUDIO_L,M_AUDIO_R;
reg ce_pix = 0;
wire scandoubler;
reg VideoKey;
reg [1:0] scanlines = 2'b11;

assign scandoubler = 1'b0 ^ VideoKey;  //Por defecto 0=RGB

always @(posedge clk_sys) begin
	if(scandoubler) ce_pix <= 1;
	else ce_pix <= ~ce_pix;

	if(ce_pix) begin
		X_VIDEO_R <= M_VIDEO_R;
		X_VIDEO_G <= M_VIDEO_G;
		X_VIDEO_B <= M_VIDEO_B;
		X_HSYNC   <= M_HSYNC;
		X_VSYNC   <= M_VSYNC;
	end
end

scanlines_gen scanlines_gen
(
	.scanlines(scanlines),
	.din({X_VIDEO_R,X_VIDEO_G,X_VIDEO_B}),
	.dout({S_VIDEO_R,S_VIDEO_G,S_VIDEO_B}),
	.hs(X_HSYNC),
	.vs(X_VSYNC)
);

assign red     = S_VIDEO_R;//|scanlines[1:0] ? S_VIDEO_R : X_VIDEO_R; 
assign green   = S_VIDEO_G;//|scanlines[1:0] ? S_VIDEO_G : X_VIDEO_G;
assign blue    = S_VIDEO_B;//|scanlines[1:0] ? S_VIDEO_B : X_VIDEO_B;
assign hsync   = scandoubler ? X_HSYNC : !(!X_HSYNC ^ !X_VSYNC); 
assign vsync   = scandoubler ? X_VSYNC : 1'b1; 
   
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

wire [5:0] mdata;
wire       mstrobe;

ps2mouse mouse
(
	.clk(clk_sys),
	.reset(reset),
	.strobe(mstrobe),
	.data(mdata),
	.ps2_mouse_data(ps2_mouse_data),
	.ps2_mouse_clk(ps2_mouse_clk)
);

reg use_mouse = 0;
always @(posedge clk_sys) begin
	if(reset) use_mouse <= 0;
	
	if(~ps2_mouse_clk)  use_mouse <= 1;
	if(!joystick1[5:0]) use_mouse <= 0;
end

wire [13:0] audioOPLL;
wire  [9:0] audioPSG;
wire [15:0] audioPCM;
wire [15:0] fm    = {audioOPLL, 2'b00} + {1'b0, audioPSG, 5'b00000};
wire [16:0] audio = {audioPCM[15], audioPCM} + {fm[15], fm};
wire [15:0] compr[7:0] = { {1'b1, audio[13:0], 1'b0}, 16'h8000, 16'h8000, 16'h8000, 16'h7FFF, 16'h7FFF, 16'h7FFF,  {1'b0, audio[13:0], 1'b0}};
wire [15:0] AUDIO_DAC;
wire        audio_pwm;
assign AUDIO_DAC = compr[audio[16:14]];

sigma_delta_dac dac
(
  .CLK(clk_sys),
  .RESET(reset),
  .DACin({!AUDIO_DAC[15],AUDIO_DAC[14:2]}), //{!AUDIO_DAC[15],AUDIO_DAC[14:0]}
  .DACout(audio_pwm)
);

assign audio_l = audio_pwm;
assign audio_r = audio_pwm;

  
  emsx_top msx (
	//Clock, Reset ports
    .clk21m(clk_sys),          // VDP Clock   .. 21.47727MHz
    .memclk(memclk),           // SDRAM clock .. 85.90908MHz
    .pReset(reset),            //1'b0),//!BTN[0]),
    .pColdReset(!BTN[1]),      //1'b0),

	//SD-RAM ports
	 .pMemCke(SDRAM_CKE),       // SD-RAM Clock enable
    .pMemCs_n(SDRAM_nCS),      // SD-RAM Chip select
    .pMemRas_n(SDRAM_nRAS),    // SD-RAM Row/RAS
    .pMemCas_n(SDRAM_nCAS),    // SD-RAM /CAS
    .pMemWe_n(SDRAM_nWE),      // SD-RAM /WE
    .pMemUdq(SDRAM_DQMH),      // SD-RAM UDQM
    .pMemLdq(SDRAM_DQML),      // SD-RAM LDQM
    .pMemBa1(SDRAM_BA[1]),     // SD-RAM Bank select address 1
    .pMemBa0(SDRAM_BA[0]),     // SD-RAM Bank select address 0
    .pMemAdr(SDRAM_ADDR),      // SD-RAM Address
    .pMemDat(SDRAM_DATA),      // SD-RAM Data

   //PS/2 keyboard ports
    .pPs2Clk(ps2_clk),
    .pPs2Dat(ps2_data),
    .pCaps(led0),              //(Led de Bloq Mayusculas)

	//RTC Settings
    .rtc_setup(reset),        //1'b0),
    .rtc_time(65'b0),        //   std_logic_vector( 64 downto 0); //Reloj RTC

   //Joystick ports (Port_A, Port_B)
    .pJoyA(use_mouse ? mdata : joystick1[5:0]),
    .pStrA(mstrobe),
    .pJoyB(joystick2[5:0]),
    .pStrB(),

   //SD/MMC slot ports
    .mmc_sck(sd_spi_sclk),
    .mmc_cs(sd_spi_cs_n),
    .mmc_mosi(sd_spi_mosi),
    .mmc_miso(sd_spi_miso),

   //DIP switch, Lamp ports
    .pDip({1'b0,1'b0,2'b10,1'b1,2'b00,1'b0}),            // 8=Mega_Sd / 7=Interal_Mapper / 6:5=Slot2 / 4=Slot1 / 3:2=Video (No se usa) / 1:Turbo-- 0=On,    1=Off (default on shipment)
    .pLed(),            //   std_logic_vector(  7 downto 0);     -- 0=Off,   1=On  (green)
    .pLedPwr(led1),    //  -- 0=Off,   1=On  (red)

   //Video, Audio/CMT ports
     .pDac_VR(M_VIDEO_R),  
     .pDac_VG(M_VIDEO_G),
     .pDac_VB(M_VIDEO_B),
     .pVideoDE(),
     .pVideoHS(M_HSYNC),
     .pVideoVS(M_VSYNC),
     .pScandoubler(scandoubler),  
	  .pVideoKey(VideoKey),
     .pAudioPSG(audioPSG),       //: out   std_logic_vector(  9 downto 0);
     .pAudioOPLL(audioOPLL),      //(audioOPLL), //: out   std_logic_vector( 13 downto 0);
     .pAudioPCM(audioPCM)       //: out   std_logic_vector( 15 downto 0)
  );
 
  
endmodule
