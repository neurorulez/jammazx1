//
// scandoubler.v
// 
// Copyright (c) 2015 Till Harbaum <till@harbaum.org> 
// 
// This source file is free software: you can redistribute it and/or modify 
// it under the terms of the GNU General Public License as published 
// by the Free Software Foundation, either version 3 of the License, or 
// (at your option) any later version. 
// 
// This source file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License 
// along with this program.  If not, see <http://www.gnu.org/licenses/>. 

// TODO: Delay vsync one line

// Mods by Quest for the ZX-Uno port

module scandoubler
(
	// system interface
	input       clk_sys,

	// scanlines
	input       scanlines,

	// shifter video interface
	input          hs_in,
	input          vs_in,
	input  wire    [3:0] r_in,
	input  wire    [3:0] g_in,
	input  wire    [3:0] b_in,

	// output interface
	output reg hs_out,
	output     vs_out,
	output reg [2:0] r_out,
	output reg [2:0] g_out,
	output reg [2:0] b_out,
	input en_vid
);

reg ce_x1, ce_x2;

/////////////////////////
always @(negedge clk_sys) 
begin : B0
	reg old_ce;
	reg [7:0] cnt   = 0;
	reg [7:0] pixsz = 0;
	old_ce <= en_vid;

	if(~&cnt) cnt <= cnt + 1'd1;

	ce_x2 <= 0;
	ce_x1 <= 0;
	if(~old_ce & en_vid) begin
		pixsz <= {1'b0, cnt[7:1]};
		ce_x1 <= 1;
		ce_x2 <= 1;
		cnt   <= 0;
	end
	
	if(cnt == pixsz) ce_x2 <= 1;
end
/////////////////////////

assign vs_out = vs_in;

// --------------------- create output signals -----------------
// latch everything once more to make it glitch free and apply scanline effect
reg scanline;
always @(posedge clk_sys) begin
	if(ce_x2) begin
		hs_out <= hs_sd;
//		vs_out <= vs_in;

		// reset scanlines at every new screen
		if(vs_out != vs_in) scanline <= 0;

		// toggle scanlines at begin of every hsync
		if(hs_out && !hs_sd) scanline <= !scanline;

		// if no scanlines or not a scanline
		if(!scanline || !scanlines) begin
			r_out <= { sd_out[8:6] };
			g_out <= { sd_out[5:3] };
			b_out <= { sd_out[2:0] };
		end else begin
			if (scanlines) begin
					r_out <= {1'b0, sd_out[8:7]};
					g_out <= {1'b0, sd_out[5:4]};
					b_out <= {1'b0, sd_out[2:1]};
			end
		end
	end
end

// scan doubler output register
reg [8:0] sd_out;

// ==================================================================
// ======================== the line buffers ========================
// ==================================================================
reg [8:0] sd_buffer[2047:0];

// use alternating sd_buffers when storing/reading data   
reg        line_toggle;

// total hsync time
reg  [9:0] hs_max;
reg  [9:0] hs_rise;
reg  [9:0] hcnt;

always @(posedge clk_sys) 
begin :B00
	reg hsD, vsD;

	if(ce_x1) begin
		hsD <= hs_in;

		// falling edge of hsync indicates start of line
		if(hsD && !hs_in) begin
			hs_max <= hcnt;
			hcnt <= 0; //9'd0;
		end else begin
			hcnt <= hcnt + 'd1; //9'd1;
		end

		// save position of rising edge
		if(!hsD && hs_in) hs_rise <= hcnt;

		vsD <= vs_in;
		if(vsD != vs_in) line_toggle <= 0;

		// begin of incoming hsync
		if(hsD && !hs_in) line_toggle <= !line_toggle;

		sd_buffer[{line_toggle, hcnt}] <= {r_in[3:1], g_in[3:1], b_in[3:1]};
	end
end

// ==================================================================
// ==================== output timing generation ====================
// ==================================================================

reg  [9:0] sd_hcnt;
reg        hs_sd;

// timing generation runs twice the input signal analysis speed
always @(posedge clk_sys) 
begin :B1
	reg hsD;

	if(ce_x2) begin
		hsD <= hs_in;

		// output counter synchronous to input and at twice the rate
		sd_hcnt <= sd_hcnt + 1'd1; 
		if(hsD && !hs_in)     sd_hcnt <= hs_max;
		if(sd_hcnt == hs_max) sd_hcnt <= 0;

		// replicate horizontal sync at twice the speed
		if(sd_hcnt == hs_max)  hs_sd <= 0;
		if(sd_hcnt == hs_rise) hs_sd <= 1;

		// read data from line sd_buffer
		sd_out <= sd_buffer[{~line_toggle, sd_hcnt}];
	end
end

endmodule
