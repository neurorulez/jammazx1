module joy_zx2 (
  input  wire CLK_12M,
  input  wire [20:0]scanSW,
  output wire [11:0]button_debounced_p1,
  output wire [11:0]button_debounced_p2,  
  output wire JOY_CLK,
  output wire JOY_LOAD,
  input  wire JOY_DATA
);


//Gestion de Joystick
  wire [11:0] joystick1 , joystick2;
   reg [11:0] joy1  = 12'hFFF, joy2  = 12'hFFF;
   reg joy_renew = 1'b1;
   reg [4:0]joy_count = 5'd0;
   reg [4:0]JCLOCKS;
   
   always @(posedge CLK_12M) begin 
      JCLOCKS <= JCLOCKS +5'd1;
   end
	
	assign JOY_CLK = JCLOCKS[4]; 
   assign JOY_LOAD = joy_renew;
   always @(posedge JOY_CLK) begin 
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
	always @(posedge JOY_CLK) begin
		case (joy_count)
            5'd2  : joy1[8]  <= JOY_DATA;   //  1p start
            5'd3  : joy1[6]  <= JOY_DATA;   //  1p fire3
            5'd4  : joy1[5]  <= JOY_DATA;   //  1p fire2
            5'd5  : joy1[4]  <= JOY_DATA;   //  1p fire1
            5'd6  : joy1[3]  <= JOY_DATA;   //  1p right
            5'd7  : joy1[2]  <= JOY_DATA;   //  1p left
            5'd8  : joy1[1]  <= JOY_DATA;   //  1p down
            5'd9  : joy1[0]  <= JOY_DATA;   //  1p up
			
            5'd10 : joy2[8]  <= JOY_DATA;   //  2p start
            5'd11 : joy2[6]  <= JOY_DATA;   //  2p fire3
            5'd12 : joy2[5]  <= JOY_DATA;   //  2p fire2
            5'd13 : joy2[4]  <= JOY_DATA;   //  2p fire1
            5'd14 : joy2[3]  <= JOY_DATA;   //  2p right
            5'd15 : joy2[2]  <= JOY_DATA;   //  2p left
            5'd16 : joy2[1]  <= JOY_DATA;   //  2p down
            5'd17 : joy2[0]  <= JOY_DATA;   //  2p up
			
            5'd18 : joy2[10] <= JOY_DATA;   //  2p select
            5'd19 : joy2[11] <= JOY_DATA;   //  test
            5'd20 : joy2[9]  <= JOY_DATA;   //  2p coin
            5'd21 : joy2[7]  <= JOY_DATA;   //  2p fire4
            5'd22 : joy1[10] <= JOY_DATA;   //  1p select
            5'd23 : joy1[11] <= JOY_DATA;   //  service
            5'd24 : joy1[9]  <= JOY_DATA;   //  1p coin
            5'd25 : joy1[7]  <= JOY_DATA;   //  1p fire4
      endcase					
	  end
   assign joystick1 = joy1;
   assign joystick2 = joy2;

//INPUT
wire [11:0] button_p1_in,button_p2_in;
wire [11:0] button_p1,button_p2;

                                                       // Player 1
  assign button_p1_in[11]  = joystick1[11];               // Service
  assign button_p1_in[10]  = joystick1[10];               // Select
  assign button_p1_in[9]   = joystick1[9]  & !scanSW[13]; // Insert Coin
  assign button_p1_in[8]   = joystick1[8]  & !scanSW[11]; // Start Player
  assign button_p1_in[7]   = joystick1[7]; 			       // fire4
  assign button_p1_in[6]   = joystick1[6];  			       // fire3
  assign button_p1_in[5]   = joystick1[5]  & !scanSW[5];  // fire2
  assign button_p1_in[4]   = joystick1[4]  & !scanSW[4];  // fire1
  assign button_p1_in[3]   = joystick1[3]  & !scanSW[3];  // right
  assign button_p1_in[2]   = joystick1[2]  & !scanSW[2];  // left
  assign button_p1_in[1]   = joystick1[1]  & !scanSW[1];  // down
  assign button_p1_in[0]   = joystick1[0]  & !scanSW[0];  // up

                                                        // Player 2
  assign button_p2_in[11] = joystick2[11];               // Test
  assign button_p2_in[10] = joystick2[10];               // Select
  assign button_p2_in[9]  = joystick2[9] & !scanSW[20];  // Insert Coin
  assign button_p2_in[8]  = joystick2[8] & !scanSW[12];  // Start Player
  assign button_p2_in[7]  = joystick2[7];  				   // fire4
  assign button_p2_in[6]  = joystick2[6];  			      // fire3
  assign button_p2_in[5]  = joystick2[5] & !scanSW[19];  // fire2
  assign button_p2_in[4]  = joystick2[4] & !scanSW[18];  // fire1
  assign button_p2_in[3]  = joystick2[3] & !scanSW[17];  // right
  assign button_p2_in[2]  = joystick2[2] & !scanSW[16];  // left
  assign button_p2_in[1]  = joystick2[1] & !scanSW[15];  // down
  assign button_p2_in[0]  = joystick2[0] & !scanSW[14];  // up
  
  //Swap directions for horizontal screen help
  assign button_p1[0]     = scanSW[9]==1'b0 ? button_p1_in[0] : button_p1_in[2];
  assign button_p1[1]     = scanSW[9]==1'b0 ? button_p1_in[1] : button_p1_in[3];
  assign button_p1[2]     = scanSW[9]==1'b0 ? button_p1_in[2] : button_p1_in[1];
  assign button_p1[3]     = scanSW[9]==1'b0 ? button_p1_in[3] : button_p1_in[0];
  assign button_p1[11:4]  = button_p1_in[11:4];
  
  assign button_p2[0]     = scanSW[9]==1'b0 ? button_p2_in[0] : button_p2_in[2];
  assign button_p2[1]     = scanSW[9]==1'b0 ? button_p2_in[1] : button_p2_in[3];
  assign button_p2[2]     = scanSW[9]==1'b0 ? button_p2_in[2] : button_p2_in[1];
  assign button_p2[3]     = scanSW[9]==1'b0 ? button_p2_in[3] : button_p2_in[0];
  assign button_p2[11:4]  = button_p2_in[11:4];

    debounce #(.G_WIDTH(12)) debounce_p1 (
		.I_BUTTON(button_p1),
		.O_BUTTON(button_debounced_p1),
		.CLK(CLK_12M)
     );

    debounce #(.G_WIDTH(12)) debounce_p2 (
		.I_BUTTON(button_p2),
		.O_BUTTON(button_debounced_p2),
		.CLK(CLK_12M)
     );

endmodule