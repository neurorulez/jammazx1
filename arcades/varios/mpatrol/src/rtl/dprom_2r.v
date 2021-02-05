/******************************************************************************
 This Source Code Form is subject to the terms of the
 Open Hardware Description License, v. 1.0. If a copy
 of the OHDL was not distributed with this file, You
 can obtain one at http://juliusbaxter.net/ohdl/ohdl.txt

 Description: True dual port ram with single clock

 Copyright (C) 2013 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>

 ******************************************************************************/

module dprom_2r
  #(
	parameter init_file  = ".",
	parameter widthad_a = 15,
	parameter widthad_b = 15,
    parameter DATA_WIDTH = 8
    )
   (
    input 		    clock,
    input [widthad_a-1:0]  address_a,
	 input [widthad_b-1:0]  address_b,
    output reg [DATA_WIDTH-1:0] q_a,
	 output reg [DATA_WIDTH-1:0] q_b
    );

   reg [DATA_WIDTH-1:0]     mem[(1<<widthad_a)-1:0];
   initial $readmemh(init_file, mem);
   //reg [DATA_WIDTH-1:0]     rdata_a;
   //reg [DATA_WIDTH-1:0]     rdata_b;

   //assign q_a = rdata_a;
   //rassign q_b = rdata_b;
   
   always @(posedge clock) begin
	 q_a <= mem[address_a];
	 q_b <= mem[address_b];
   end

endmodule