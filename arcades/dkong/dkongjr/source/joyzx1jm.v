module joy_zx1jm (
  input  wire CLK_12M,
  input  wire [20:0]scanSW,
  output wire [11:0]button_debounced_p1,
  output wire [11:0]button_debounced_p2,  
  input  wire [5:0]JOYSTICK,
  input  wire [7:0]JJOY,
  input  wire [3:0]JBTN, //TEST, SERVICE, COIN2, COIN1
  output  wire JSELECT
);


//Gestion de Joystick
  wire [7:0] joystick1, joystick2;
   reg [7:0] joy1, joy2;
   reg joy_split;

   reg [4:0]JCLOCKS;   
   always @(posedge CLK_12M) begin 
      JCLOCKS <= JCLOCKS +5'd1;
   end
assign JOY_CLK = JCLOCKS[2]; 

parameter joyType = 1; //0=Nada . 1=Jamma
generate //generar segun joyType
 if (joyType == 1) begin //Joy Splitter Jamma
   assign JSELECT = joy_split;
   always @(posedge JOY_CLK) begin  
      if(joy_split == 1) begin 
	    joy_split <= 1'b0; 
	   end else begin 
	    joy_split <= 1'b1; 
	   end
   end
   always @(posedge JOY_CLK) begin 
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

//INPUT
wire [11:0] button_p1_in,button_p2_in;
wire [11:0] button_p1,button_p2;

                                                       // Player 1
  assign button_p1_in[11]  = JBTN[2];                     // Service
  assign button_p1_in[10]  = 1'b1;                        // Select
  assign button_p1_in[9]   = JBTN[0]       & !scanSW[13]; // Insert Coin
  assign button_p1_in[8]   = joystick1[7]  & !scanSW[11]; // Start Player
  assign button_p1_in[7]   = 1'b1;    			             // fire4
  assign button_p1_in[6]   = joystick1[6];  			       // fire3
  assign button_p1_in[5]   = joystick1[5]  & !scanSW[5];  // fire2
  assign button_p1_in[4]   = joystick1[4]  & !scanSW[4];  // fire1
  assign button_p1_in[3]   = joystick1[3]  & !scanSW[3];  // right
  assign button_p1_in[2]   = joystick1[2]  & !scanSW[2];  // left
  assign button_p1_in[1]   = joystick1[1]  & !scanSW[1];  // down
  assign button_p1_in[0]   = joystick1[0]  & !scanSW[0];  // up

                                                        // Player 2
  assign button_p2_in[11] = JBTN[3];                     // Test
  assign button_p2_in[10] = 1'b1;                        // Select
  assign button_p2_in[9]  = JBTN[0]      & !scanSW[20];  // Insert Coin
  assign button_p2_in[8]  = joystick2[7] & !scanSW[12];  // Start Player
  assign button_p2_in[7]  = 1'b1;  		      		      // fire4
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