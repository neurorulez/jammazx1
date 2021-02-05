/******************************************************************************
 This Source Code Form is subject to the terms of the
 Open Hardware Description License, v. 1.0. If a copy
 of the OHDL was not distributed with this file, You
 can obtain one at http://juliusbaxter.net/ohdl/ohdl.txt

 Description: True dual port ram with single clock

 Copyright (C) 2013 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>

 ******************************************************************************/

module dpram
  #(
    parameter widthad_a = 15,
    parameter DATA_WIDTH = 8
    )
   (
    input 		    clock_a,
	input 		    clock_b,
    input [widthad_a-1:0]  address_a,
	input [widthad_a-1:0]  address_b,
    input [DATA_WIDTH-1:0]  data_a,
	input [DATA_WIDTH-1:0]  data_b,
	input 		    wren_a,
	input 		    wren_b,
    output [DATA_WIDTH-1:0] q_a,
    output [DATA_WIDTH-1:0] q_b
    );

   reg [DATA_WIDTH-1:0]     mem[(1<<widthad_a)-1:0];

   reg [DATA_WIDTH-1:0]     rdata_a;
   reg [DATA_WIDTH-1:0]     rdata_b;

   assign q_a = rdata_a;
   assign q_b = rdata_b;

   always @(posedge clock_a) begin
      if (wren_a) begin
	 mem[address_a] <= data_a;
	 rdata_a <= data_a;
      end else begin
	 rdata_a <= mem[address_a];
      end
   end

   always @(posedge clock_b) begin
      if (wren_b) begin
	 mem[address_b] <= data_b;
	 rdata_b <= data_b;
      end else begin
	 rdata_b <= mem[address_b];
      end
   end

endmodule
