/******************************************************************************
 This Source Code Form is subject to the terms of the
 Open Hardware Description License, v. 1.0. If a copy
 of the OHDL was not distributed with this file, You
 can obtain one at http://juliusbaxter.net/ohdl/ohdl.txt

 Description: True dual port ram with single clock

 Copyright (C) 2013 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>

 ******************************************************************************/

module spram
  #(
    parameter widthad_a = 15,
    parameter DATA_WIDTH = 8
    )
   (
    input 		    clock,
    input [widthad_a-1:0]  address,
    input [DATA_WIDTH-1:0]  data,
	input 		    wren,
    output reg [DATA_WIDTH-1:0] q
    );

   reg [DATA_WIDTH-1:0]     mem[(1<<widthad_a)-1:0];

   always @(posedge clock) begin
      if (wren) begin
	 mem[address] <= data;
      end else begin
	 q <= mem[address];
      end
   end

endmodule
