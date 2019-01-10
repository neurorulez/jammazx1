`timescale 1ns / 1ps

module m_register
  #(parameter WIDTH = 6)
   (output reg [WIDTH-1:0] Q,
    input [WIDTH-1:0] D,
    input clr, en, clk);

   always @(posedge clk)
      if(clr)
	Q <= 0;
      else if(en)
	Q <= D;
   
endmodule: m_register

module m_counter
  #(parameter WIDTH = 6)
   (output reg [WIDTH-1:0] Q,
    input [WIDTH-1:0] D,
    input clk, clr, load, en, up);

   always @(posedge clk) begin
      if(clr)
	Q <= 0;
      else if(load)
	Q <= D;
      else if(en)
	Q <= (up ? Q + 1 : Q - 1);
      end
endmodule: m_counter

module m_shift_register
  #(parameter WIDTH = 6)
   (output reg [WIDTH-1:0] Q,
    input clk, en, left, s_in, clr);

   always @(posedge clk)
     if (clr) begin
	Q <= 'd0;
     end
     else if(en) begin
	if(left) begin
	   Q <= (Q << 1);
	   Q[0] <= s_in;
	end
	else begin
	   Q <= (Q >> 1);
	   Q[WIDTH-1] <= s_in;
	end
     end
endmodule: m_shift_register
