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
    parameter ADDR_WIDTH = 15,
    parameter DATA_WIDTH = 8
    )
   (
    input 		    clock_a,
    input [ADDR_WIDTH-1:0]  address_a,
    input [DATA_WIDTH-1:0]  data_a,
	input 		    enable_a,
	input 		    wren_a,
    output reg [DATA_WIDTH-1:0] q_a
    );

   reg [DATA_WIDTH-1:0]     mem[(1<<ADDR_WIDTH)-1:0];

   always @(posedge clock_a) begin
	if(enable_a) begin
      if (wren_a) begin
	 mem[address_a] <= data_a;
      end else begin
	 q_a <= mem[address_a];
      end
    end
   end

endmodule
