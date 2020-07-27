//////////////////////////////////////////////////////////////////////////////////
//
// This file is part of the NextZ80 project
// http://www.opencores.org/cores/nextz80/
//
// Filename: NextZ80Regs.v
// Description: Implementation of Z80 compatible CPU - registers
// Version 1.0
// Creation date: 28Jan2011 - 18Mar2011
//
// Author: Nicolae Dumitrache 
// e-mail: ndumitrache@opencores.org
//
/////////////////////////////////////////////////////////////////////////////////
// 
// Copyright (C) 2011 Nicolae Dumitrache
// 
// This source file may be used and distributed without 
// restriction provided that this copyright statement is not 
// removed from the file and that any derivative work contains 
// the original copyright notice and the associated disclaimer.
// 
// This source file is free software; you can redistribute it 
// and/or modify it under the terms of the GNU Lesser General 
// Public License as published by the Free Software Foundation;
// either version 2.1 of the License, or (at your option) any 
// later version. 
// 
// This source is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied 
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
// PURPOSE. See the GNU Lesser General Public License for more 
// details. 
// 
// You should have received a copy of the GNU Lesser General 
// Public License along with this source; if not, download it 
// from http://www.opencores.org/lgpl.shtml 
// 
///////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ns

module Z80Reg(
	input wire [7:0]rstatus,	// 0=af-af', 1=exx, 2=hl-de, 3=hl'-de',4=hl-ixy, 5=ix-iy, 6=IFF1, 7=IFF2
	input wire M1,
	input wire [5:0]WE,			// 5 = flags, 4 = PC, 3 = SP, 2 = tmpHI, 1 = hi, 0 = lo
	input wire CLK,
	input wire [15:0]ALU8OUT,	// CPU data out bus (output of alu8)
	input wire [7:0]DI,			// CPU data in bus
	output reg [7:0]DO,			// CPU data out bus
	input wire [15:0]ADDR,		// CPU addr bus
	input wire [7:0]CONST,
	output reg [7:0]ALU80,
	output reg [7:0]ALU81,
	output reg [15:0]ALU160,
	output wire[7:0]ALU161,
	input wire [7:0]ALU8FLAGS,			
	output wire [7:0]FLAGS,
	
	input wire [1:0]DO_SEL,		// select DO betwen ALU8OUT lo and th register
	input wire ALU160_sel,		// 0=REG_RSEL, 1=PC
	input wire [3:0]REG_WSEL,	// rdow:    	[3:1] 0=BC, 1=DE, 2=HL, 3=A-TL, 4=I-x  ----- [0] = 0HI,1LO
	input wire [3:0]REG_RSEL,	// mux_rdor:   [3:1] 0=BC, 1=DE, 2=HL, 3=A-TL, 4=I-R, 5=SP, 7=tmpSP   ----- [0] = 0HI, 1LO
	input wire DINW_SEL,			// select RAM write data between (0)ALU8OUT, and 1(DI)
	input wire XMASK,				// 0 if REG_WSEL should not use IX, IY, even if rstatus[4] == 1
	input wire [2:0]ALU16OP,	// ALU16OP
	input wire WAIT				// wait
	);
	
// latch registers
	reg [15:0]pc=0;				// program counter
	reg [15:0]sp;					// stack pointer
	reg [7:0]r;						// refresh
	reg [15:0]flg = 0;
	reg [7:0]th;					// temp high

// internal wires	
	wire [15:0]rdor;		// R out from RAM
	wire [15:0]rdow;		// W out from RAM
	wire [3:0]SELW;		// RAM W port sel
	wire [3:0]SELR;		// RAM R port sel
	reg  [15:0]DIN;		// RAM W in data
	reg [15:0]mux_rdor;	// (3)A reversed mixed with TL, (4)I mixed with R (5)SP
	
//------------------------------------ RAM block registers ----------------------------------
// 0:BC, 1:DE, 2:HL, 3:A-x, 4:I-x, 5:IX, 6:IY, 7:x-x, 8:BC', 9:DE', 10:HL', 11:A'-x, 12: tmpSP, 13:zero
//   RAM16X1D #(
//      .INIT(16'h0000) 		// Initial contents of RAM
//   ) RAM16X1D_bit0 (
//      .DPO(rdor[0]),     	// Read-only 1-bit data output
//      .SPO(rdow[0]),     	// Rw/ 1-bit data output
//      .A0(SELW[0]),       	// Rw/ address[0] input bit
//      .A1(SELW[1]),       	// Rw/ address[1] input bit
//      .A2(SELW[2]),       	// Rw/ address[2] input bit
//      .A3(SELW[3]),       	// Rw/ address[3] input bit
//      .D(DIN[0]),         	// Write 1-bit data input
//      .DPRA0(SELR[0]), 		// Read-only address[0] input bit
//      .DPRA1(SELR[1]), 		// Read-only address[1] input bit
//      .DPRA2(SELR[2]), 		// Read-only address[2] input bit
//      .DPRA3(SELR[3]), 		// Read-only address[3] input bit
//      .WCLK(CLK),   			// Write clock input
//      .WE(WE[0] & !WAIT)        	// Write enable input
//   );
//
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit1 (.DPO(rdor[1]), .SPO(rdow[1]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[1]),  
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[0] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit2 (.DPO(rdor[2]), .SPO(rdow[2]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[2]),     
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[0] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit3 (.DPO(rdor[3]), .SPO(rdow[3]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[3]), 
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[0] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit4 (.DPO(rdor[4]), .SPO(rdow[4]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[4]), 
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[0] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit5 (.DPO(rdor[5]), .SPO(rdow[5]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[5]),    
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[0] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit6 (.DPO(rdor[6]), .SPO(rdow[6]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[6]),    
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[0] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit7 (.DPO(rdor[7]), .SPO(rdow[7]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[7]),
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[0] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit8 (.DPO(rdor[8]), .SPO(rdow[8]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[8]),
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit9 (.DPO(rdor[9]), .SPO(rdow[9]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[9]),    
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit10(.DPO(rdor[10]), .SPO(rdow[10]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[10]),   
//																 .DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit11(.DPO(rdor[11]), .SPO(rdow[11]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[11]),    
//																 .DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit12(.DPO(rdor[12]), .SPO(rdow[12]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[12]), 
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit13(.DPO(rdor[13]), .SPO(rdow[13]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[13]),
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit14(.DPO(rdor[14]), .SPO(rdow[14]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[14]), 
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));
//   RAM16X1D #(.INIT(16'h0000)) RAM16X1D_bit15(.DPO(rdor[15]), .SPO(rdow[15]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[15]),
//																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WE(WE[1] & !WAIT));

   RAM16X1 RAM16X1D_bit0 (
      .DPO(rdor[0]),     	// Read-only 1-bit data output
      .SPO(rdow[0]),     	// Rw/ 1-bit data output
      .A0(SELW[0]),       	// Rw/ address[0] input bit
      .A1(SELW[1]),       	// Rw/ address[1] input bit
      .A2(SELW[2]),       	// Rw/ address[2] input bit
      .A3(SELW[3]),       	// Rw/ address[3] input bit
      .D(DIN[0]),         	// Write 1-bit data input
      .DPRA0(SELR[0]), 		// Read-only address[0] input bit
      .DPRA1(SELR[1]), 		// Read-only address[1] input bit
      .DPRA2(SELR[2]), 		// Read-only address[2] input bit
      .DPRA3(SELR[3]), 		// Read-only address[3] input bit
      .WCLK(CLK),   			// Write clock input
      .WCLKE(!WAIT),
      .WE(WE[0])        	// Write enable input
   );

   RAM16X1 RAM16X1D_bit1 (.DPO(rdor[1]), .SPO(rdow[1]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[1]),  
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[0]));
   RAM16X1 RAM16X1D_bit2 (.DPO(rdor[2]), .SPO(rdow[2]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[2]),     
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[0]));
   RAM16X1 RAM16X1D_bit3 (.DPO(rdor[3]), .SPO(rdow[3]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[3]), 
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[0]));
   RAM16X1 RAM16X1D_bit4 (.DPO(rdor[4]), .SPO(rdow[4]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[4]), 
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[0]));
   RAM16X1 RAM16X1D_bit5 (.DPO(rdor[5]), .SPO(rdow[5]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[5]),    
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[0]));
   RAM16X1 RAM16X1D_bit6 (.DPO(rdor[6]), .SPO(rdow[6]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[6]),    
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[0]));
   RAM16X1 RAM16X1D_bit7 (.DPO(rdor[7]), .SPO(rdow[7]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[7]),
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[0]));
   RAM16X1 RAM16X1D_bit8 (.DPO(rdor[8]), .SPO(rdow[8]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[8]),
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));
   RAM16X1 RAM16X1D_bit9 (.DPO(rdor[9]), .SPO(rdow[9]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[9]),    
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));
   RAM16X1 RAM16X1D_bit10(.DPO(rdor[10]), .SPO(rdow[10]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[10]),   
															  .DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));
   RAM16X1 RAM16X1D_bit11(.DPO(rdor[11]), .SPO(rdow[11]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[11]),    
															  .DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));
   RAM16X1 RAM16X1D_bit12(.DPO(rdor[12]), .SPO(rdow[12]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[12]), 
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));
   RAM16X1 RAM16X1D_bit13(.DPO(rdor[13]), .SPO(rdow[13]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[13]),
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));
   RAM16X1 RAM16X1D_bit14(.DPO(rdor[14]), .SPO(rdow[14]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[14]), 
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));
   RAM16X1 RAM16X1D_bit15(.DPO(rdor[15]), .SPO(rdow[15]), .A0(SELW[0]), .A1(SELW[1]), .A2(SELW[2]), .A3(SELW[3]), .D(DIN[15]),
																.DPRA0(SELR[0]), .DPRA1(SELR[1]), .DPRA2(SELR[2]), .DPRA3(SELR[3]), .WCLK(CLK), .WCLKE(!WAIT), .WE(WE[1]));

	wire [15:0]ADDR1 = ADDR + {15'h0000,~ALU16OP[2]}; // address post increment
	wire [7:0]flgmux = {ALU8FLAGS[7:3], SELR[3:0] == 4'b0100 ? rstatus[7] : ALU8FLAGS[2], ALU8FLAGS[1:0]}; // LD A, I/R IFF2 flag on parity
	always @(posedge CLK)
		if(!WAIT) begin
			if(WE[2]) th <= DI;
			if(WE[3]) sp <= ADDR1;
			if(WE[4]) pc <= ADDR1;
			if({SELW[3:0], WE[0]} == 5'b01001) r <= ALU8OUT[7:0]; 
			else if(M1) r[6:0] <= r[6:0] + 7'b0000001;
			if(WE[5])
				if(rstatus[0]) flg[15:8] <= flgmux;
				else flg[7:0] <= flgmux;
		end
	
	assign ALU161 = th;
	assign FLAGS = rstatus[0] ? flg[15:8] : flg[7:0];
	wire aluopis4 = (ALU16OP == 3'd4);
  
	always @* begin
	  DIN = DINW_SEL ? {DI, DI} : ALU8OUT;
		ALU80 = REG_WSEL[0] ? rdow[7:0] : rdow[15:8];
  end

	always @* begin
		case({REG_WSEL[3], DO_SEL})
			0:	DO = ALU80;
			1:	DO = th;
			2: DO = FLAGS;
			3: DO = ALU8OUT[7:0];
			4: DO = pc[15:8];
			5: DO = pc[7:0];
			6:	DO = sp[15:8];
			7: DO = sp[7:0];
      default: DO = 8'h00;  // Added by mcleod_ideafix to avoid inferring latches
		endcase
  end

	always @* begin
		case({aluopis4, REG_RSEL[3:0]})
			5'b01001, 5'b11001:								mux_rdor = {rdor[15:8], r};
			5'b01010, 5'b01011: 							mux_rdor = sp;
			5'b01100, 5'b01101, 5'b11100, 5'b11101:	mux_rdor = {8'b0, CONST};
			default:		mux_rdor = rdor;
		endcase 
  end

	always @* begin
		ALU81 = REG_RSEL[0] ? mux_rdor[7:0] : mux_rdor[15:8];
		ALU160 = ALU160_sel ? pc : mux_rdor;
  end
 
	RegSelect WSelectW(.SEL(REG_WSEL[3:1]), .RAMSEL(SELW), .rstatus({rstatus[5], rstatus[4] & XMASK, rstatus[3:0]}));
	RegSelect WSelectR(.SEL(REG_RSEL[3:1]), .RAMSEL(SELR), .rstatus(rstatus[5:0]));

endmodule


module RegSelect(
	input wire [2:0]SEL,
	output reg [3:0]RAMSEL,
	input wire [5:0]rstatus			// 0=af-af', 1=exx, 2=hl-de, 3=hl'-de',4=hl-ixy, 5=ix-iy
	);
	
	always @* begin
		RAMSEL = 4'b0000;
		case(SEL)
			0: RAMSEL = {rstatus[1], 3'b000};	// BC
			1:  //DE
				if(rstatus[{1'b1, rstatus[1]}]) RAMSEL = {rstatus[1], 3'b010};		//	HL
				else RAMSEL = {rstatus[1], 3'b001};				// DE
			2:	// HL
				case({rstatus[5:4], rstatus[{1'b1, rstatus[1]}]})
					0,4: 	RAMSEL = {rstatus[1], 3'b010}; 		// HL
					1,5: 	RAMSEL = {rstatus[1], 3'b001};		// DE
					2,3:	RAMSEL = 4'b0101;  	//	IX
					6,7:	RAMSEL = 4'b0110;		// IY
				endcase
			3: RAMSEL = {rstatus[0], 3'b011}; // A-TL
			4:	RAMSEL = 4; // I-R
			5: RAMSEL = 12;	// tmp SP
			6: RAMSEL = 13;	// zero
			7: RAMSEL = 7;	// temp reg for BIT/SET/RES
		endcase
	end
endmodule	

module RAM16X1 (
  output wire DPO,     	// Read-only 1-bit data output
  output wire SPO,     	// Rw/ 1-bit data output
  input wire A0,       	// Rw/ address[0] input bit
  input wire A1,       	// Rw/ address[1] input bit
  input wire A2,       	// Rw/ address[2] input bit
  input wire A3,       	// Rw/ address[3] input bit
  input wire D,         	// Write 1-bit data input
  input wire DPRA0, 		// Read-only address[0] input bit
  input wire DPRA1, 		// Read-only address[1] input bit
  input wire DPRA2, 		// Read-only address[2] input bit
  input wire DPRA3, 		// Read-only address[3] input bit
  input wire WCLK,   			// Write clock input  
  input wire WCLKE,
  input wire WE        	// Write enable input
  );
  
  reg mem[0:15];
  wire [3:0] address_a = {A3,A2,A1,A0};
  wire [3:0] address_d = {DPRA3,DPRA2,DPRA1,DPRA0};
  assign DPO = mem[address_d];
  assign SPO = mem[address_a];
  
  always @(posedge WCLK) begin
    if (WCLKE)
      if (WE)
        mem[address_a] = D;
  end
endmodule
