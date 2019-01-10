`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: M-x Butterfly
// Engineer: Peter Pearson
// 
// Create Date: 10/29/2015 03:59:30 PM
// Design Name: 
// Module Name: POKEY
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module POKEY
  (
   input [7:0] Din,
   output [7:0] Dout,
   input [3:0] A,
   input [7:0] P,
   input 	     phi2,
   input  	     readHighWriteLow,
   input  	     cs0Bar,
   output       aud,
	output  [3:0] audio,
   //This clk is the 100 MHz clock, and is not a pin on the POKEY DIP
   input  	     clk
   );


   reg [7:0] 	      audf1, audf2, audf3, audf4, audc1, audc2, audc3, audc4, audCtl, allPot, skCtl;
   wire [7:0] 	      dataIn;
	reg [7:0] 	      dataOut;
   wire 	      clr;
   reg 	      baseClkWave;
   wire 	      pulse15k, pulse64k, pulse179m;
	wire			wave15k, wave64k, wave179m; 
   reg 	      reduce9;
	wire        rand4, rand5, rand17; 
   wire [7:0] 	      rngRead;
   wire 	      phi2Rising;
   reg [3:0] 	      bypassMask1, bypassMask2, bypassMask3, bypassMask4;

   //Outputs of the divide-by-N blocks for each channel
   wire [3:0] 	      divOut;

   //Base clock fed to each channel
   reg [3:0] 	      baseClks;

   //High pass filter clocks fed to each channel
   wire [3:0] 	      hpfClks;

   //Output waveform of each channel
   wire [3:0] 	      rawWave;
   
   assign clr = (skCtl[1:0] == 2'b00);


//   tristateDriver #(8) triDrv(.i(dataOut), .o(D), .en(readHighWriteLow));
   assign dataIn = Din;
   assign Dout = dataOut;


   wave15kGen w15k(.clk(clk), .clr(clr), .wave(wave15k), .pulse(pulse15k));
   wave64kGen w64k(.clk(clk), .clr(clr), .wave(wave64k), .pulse(pulse64k));
   wave179mGen w179m(.clk(clk), .clr(clr), .wave(wave179m), .pulse(pulse179m));   

   polyCounter4 pc4(.clk(clk), .pulse179m(pulse179m), .rand4(rand4), .clr(clr));
   polyCounter5 pc5(.clk(clk), .pulse179m(pulse179m), .rand5(rand5), .clr(clr));
   polyCounter17 pc17(.clk(clk), .pulse179m(pulse179m), .reduce9(reduce9), .rand17(rand17), .rngVal(rngRead), .clr(clr));


   risingDetector risingPhi(.clk(clk), .clr(clr), .signalIn(phi2), .risingEdge(phi2Rising));


   audioChannelDigital channel1(.clk(clk), .clr(clr), .baseClkWave(baseClks[0]), .audf(audf1), .audc(audc1), .rand4(rand4), .rand5(rand5), .rand17(rand17), .hpfClk(hpfClks[0]), .bypassMask(bypassMask1), .rawWave(rawWave[0]), .divOut(divOut[0]));
   audioChannelDigital channel2(.clk(clk), .clr(clr), .baseClkWave(baseClks[1]), .audf(audf2), .audc(audc2), .rand4(rand4), .rand5(rand5), .rand17(rand17), .hpfClk(hpfClks[1]), .bypassMask(bypassMask2), .rawWave(rawWave[1]), .divOut(divOut[1]));
   audioChannelDigital channel3(.clk(clk), .clr(clr), .baseClkWave(baseClks[2]), .audf(audf3), .audc(audc3), .rand4(rand4), .rand5(rand5), .rand17(rand17), .hpfClk(hpfClks[2]), .bypassMask(bypassMask3), .rawWave(rawWave[2]), .divOut(divOut[2]));
   audioChannelDigital channel4(.clk(clk), .clr(clr), .baseClkWave(baseClks[3]), .audf(audf4), .audc(audc4), .rand4(rand4), .rand5(rand5), .rand17(rand17), .hpfClk(hpfClks[3]), .bypassMask(bypassMask4), .rawWave(rawWave[3]), .divOut(divOut[3]));

	assign audio = {4{aud}};
   volumeMixer finalMix(.clk(clk), .clr(clr), .audc1(audc1), .audc2(audc2), .audc3(audc3), .audc4(audc4), .digitalWave(rawWave), .pwmWave(aud));
   

   assign hpfClks = {{divOut[2]},{divOut[3]},{2'b00}};
   

   //AUDCTL and bypass mask reg
   always @*
     begin
	reduce9 = audCtl[7];

	baseClks[0] = (audCtl[6] ? wave179m : baseClkWave);
	baseClks[2] = (audCtl[5] ? wave179m : baseClkWave);
	baseClks[1] = (audCtl[4] ? divOut[0] : baseClkWave);
	baseClks[3] = (audCtl[3] ? divOut[2] : baseClkWave);

	bypassMask1 = {{audCtl[2]},{3'b000}};
	bypassMask2 = {{audCtl[1]},{3'b000}};
	bypassMask3 = 4'h8;
	bypassMask4 = 4'h8;
	
	baseClkWave = (audCtl[0] ? wave15k : wave64k);
     end
   
   
   always @(posedge clk)
     begin
	if(phi2Rising & !cs0Bar)
	  begin
	     if(clr)
	       begin
		  audf1 <= 8'd0;
		  audf2 <= 8'd0;
		  audf3 <= 8'd0;
		  audf4 <= 8'd0;
		  audc1 <= 8'd0;
		  audc2 <= 8'd0;
		  audc3 <= 8'd0;
		  audc4 <= 8'd0;
		  audCtl <= 8'd0;
		  allPot <= 8'd0;
		  dataOut <= 8'd0;
		  if(!readHighWriteLow & (A == 4'hF))
		    begin
		       skCtl <= dataIn;
		    end
	       end
	     else
	       begin
		  if(readHighWriteLow)
		    begin
		       case(A)
			 4'h8: dataOut <= allPot;
			 4'hA: dataOut <= rngRead;
		       endcase
		    end
		  else
		    begin
		       case(A)
			 4'h0: audf1 <= dataIn;
			 4'h1: audc1 <= dataIn;
			 4'h2: audf2 <= dataIn;
			 4'h3: audc2 <= dataIn;
			 4'h4: audf3 <= dataIn;
			 4'h5: audc3 <= dataIn;
			 4'h6: audf4 <= dataIn;
			 4'h7: audc4 <= dataIn;
			 4'h8: audCtl <= dataIn;
			 4'hB: allPot <= P;
			 4'hF: skCtl <= dataIn;
		       endcase // case (A)
		    end // else: !if(readHighWriteLow)
	       end
	  end
     end
   

endmodule: POKEY

module volumeMixer
  (
   input  	     clk, clr,
   input [7:0] audc1, audc2, audc3, audc4,
   input [3:0] digitalWave,
   output       pwmWave
   );

   wire [5:0] 		  volume;
   wire [5:0] 		  pwmCnt;
   
   assign volume =
		  ((digitalWave[3] | audc4[4]) ? audc4[3:0] : 0) +
		  ((digitalWave[2] | audc3[4]) ? audc3[3:0] : 0) +
		  ((digitalWave[1] | audc2[4]) ? audc2[3:0] : 0) +
		  ((digitalWave[0] | audc1[4]) ? audc1[3:0] : 0);

   m_counter #(6) pwmClk(.Q(pwmCnt), .D(6'd0), .clk(clk), .clr(clr), .load(1'b0), .en(1'b1), .up(1'b1));

   assign pwmWave = (pwmCnt < volume);
   
endmodule: volumeMixer

module audioChannelDigital
  (
   input  	     clk, clr,
   input  	     baseClkWave,
   input  [7:0] audf, audc,
   input  	     rand4, rand5, rand17,
   input  	     hpfClk,
   input  [3:0] bypassMask,
   output       rawWave, divOut, noiseOut, arbDiv2Out
   );


   wire 	     noise;

   wire [3:0] 	     sigIn;
	wire [3:0]		  sigOut;
   
   divideByN stage1(.signalIn(sigIn[0]), .clk(clk), .clr(clr), .N(audf), .signalOut(sigOut[0]));
   noiseGen rng(.rand4(rand4), .rand5(rand5), .rand17(rand17), .noise(noise), .randSel(audc[7:5]));
   randomMixer randMix(.clk(clk), .clr(clr), .randomIn(noise), .signalIn(sigIn[1]), .signalOut(sigOut[1]));
   arbDivBy2 adb2(.clk(clk), .clr(clr), .signalIn(sigIn[2]), .signalOut(sigOut[2]));
   highPassFilter hpf(.hpfClk(hpfClk), .clk(clk), .clr(clr), .inputSignal(sigIn[3]), .outputSignal(sigOut[3]));


   assign sigIn[0] = baseClkWave;
   assign sigIn[1] = bypassMask[0] ? sigIn[0] : sigOut[0];
   assign sigIn[2] = bypassMask[1] ? sigIn[1] : sigOut[1];
   assign sigIn[3] = bypassMask[2] ? sigIn[2] : sigOut[2];
   assign rawWave = bypassMask[3] ? sigIn[3] : sigOut[3];   
   assign divOut = sigOut[0];
   assign noiseOut = sigOut[1];
   assign arbDiv2Out = sigOut[2];
   
endmodule: audioChannelDigital

module highPassFilter
  (
   input  	clk, clr,
   input  	hpfClk,
   input  	inputSignal,
   output   outputSignal
   );

   wire 	ffOut;
   
   m_register #(1) filterReg(.Q(ffOut), .D(inputSignal), .clr(clr), .clk(clk), .en(hpfClk));
   assign outputSignal = (inputSignal ^ ffOut);

endmodule: highPassFilter


module noiseGen
  (
   input  	     rand4, rand5, rand17,
   input [2:0] randSel,
   output reg     noise
   );

   always @*
     begin
	casex(randSel)
	  3'b000:
	    begin
	       noise = rand5 & rand17;
	    end
	  3'b0?1:
	    begin
	       noise = rand5;
	    end
	  3'b010:
	    begin
	       noise = rand4 & rand5;
	    end
	  3'b100:
	    begin
	       noise = rand17;
	    end
	  3'b1?1:
	    begin
	       noise = 1'b1;
	    end
	  3'b110:
	    begin
	       noise = rand4;
	    end
	  default:
	    begin
	       noise = 1'b1;
	    end
	endcase // casex (randSel)
	
     end
   

endmodule: noiseGen

module edgeDetector
  (
   input  	clk, clr,
   input  	signal,
   output   edgeFound
   );

   wire 	prevSignal;

   m_register #(1) edgeRegister(.Q(prevSignal), .D(signal), .clk(clk), .clr(clr), .en(1'b1));
   
   assign edgeFound = signal ^ prevSignal;
   
endmodule: edgeDetector


module divideByN
  (
   input  	     signalIn, clk, clr,
   input  [7:0] N,
   output       signalOut    
   );
   
   wire [7:0] 	     countOut;
   wire 	     rollover;
	wire 	     edgeFound;
   
   edgeDetector edgeChecker(.clk(clk), .clr(clr), .signal(signalIn), .edgeFound(edgeFound));
   m_counter #(8) divCounter(.D(8'd0), .Q(countOut), .clk(clk), .en(edgeFound), .up(1'b1), .clr(clr), .load(rollover));
   m_register #(1) waveTracker(.Q(signalOut), .D(!signalOut), .clk(clk), .en(rollover), .clr(clr));
   
   assign rollover = (countOut >= N) & edgeFound;
   
endmodule: divideByN


module wave15kGen
  (
   input clk, clr,
   output wave, pulse
   );
   
   wire [11:0] parallel15k;
   
   m_counter #(12) counter15k(.D(12'd0), .Q(parallel15k), .clk(clk), .en(1'b1), .up(1'b1), .clr(clr), .load(pulse));
   m_register #(1) waveTracker(.D(!wave), .Q(wave), .clk(clk), .en(pulse), .clr(clr));
   
   assign pulse = (parallel15k == 12'd3333);

endmodule: wave15kGen

module wave64kGen
  (
   input   clk, clr,
   output  wave, pulse
   );
   
   wire [9:0] 	parallel64k;
   
   m_counter #(10) counter64k(.D(10'd0), .Q(parallel64k), .clk(clk), .en(1'b1), .up(1'b1), .clr(clr), .load(pulse));
   m_register #(1) waveTracker(.D(!wave), .Q(wave), .clk(clk), .en(pulse), .clr(clr));
   
   assign pulse = (parallel64k == 10'd781);

endmodule: wave64kGen

module wave179mGen
  (
   input  	clk, clr,
   output  wave, pulse
   );
   
   wire [4:0] 	parallel179m;
   
   m_counter #(5) counter64k(.D(5'd0), .Q(parallel179m), .clk(clk), .en(1'b1), .up(1'b1), .clr(clr), .load(pulse));
   m_register #(1) waveTracker(.D(!wave), .Q(wave), .clk(clk), .en(pulse), .clr(clr));
   
   assign pulse = (parallel179m == 5'd28);

endmodule: wave179mGen


module polyCounter4
  (
   input  	clk, pulse179m, clr,
   output  rand4    
   );
   
   wire [3:0] 	regValue;
   wire 	feedbackVal;
   
   m_shift_register #(4) polyShifter(.Q(regValue), .clk(clk), .en(pulse179m), .left(1'b0), .s_in(feedbackVal), .clr(clr));
   
   assign feedbackVal = !(regValue[3] ^ regValue[2]);
   assign rand4 = regValue[3];
   
endmodule: polyCounter4


module polyCounter5
  (
   input  	clk, pulse179m, clr,
   output  rand5    
   );
   
   wire [4:0] 	regValue;
   wire 	feedbackVal;
   
   m_shift_register #(5) polyShifter(.Q(regValue), .clk(clk), .en(pulse179m), .left(1'b1), .s_in(feedbackVal), .clr(clr));
   
   assign feedbackVal = !(regValue[4] ^ regValue[2]);
   assign rand5 = regValue[4];
   
endmodule: polyCounter5


module polyCounter17
  (
   input  	clk, pulse179m, clr,
   input  	reduce9,
   output  rand17,
   output  [7:0] rngVal
   );
   
   wire [16:0] regValue;
   wire 	feedbackVal;
   
   m_shift_register #(9) polyShifterUpper(.Q(regValue[16:8]), .clk(clk), .en(pulse179m), .left(1'b1), .s_in(reduce9 ? feedbackVal : regValue[7]), .clr(clr));
   m_shift_register #(8) polyShifterLower(.Q(regValue[7:0]), .clk(clk), .en(pulse179m), .left(1'b1), .s_in(feedbackVal), .clr(clr));
   
   assign feedbackVal = !(regValue[16] ^ regValue[11]);
   assign rand17 = regValue[16];
   assign rngVal = regValue[16:9];
   
endmodule: polyCounter17

module risingDetector
  (
   input  	clk, clr,
   input  	signalIn,
   output  risingEdge
   );

   wire 	prevSignal;
   
   m_register #(1) risingRegister(.Q(prevSignal), .D(signalIn), .en(1'b1), .clk(clk), .clr(clr));
   assign risingEdge = signalIn & ~prevSignal;

endmodule: risingDetector

module randomMixer
  (
   input  	clk, clr,
   input  	signalIn,
   input  	randomIn,
   output signalOut
   );

   wire 	risingEdge;

   wire 	waveWideRandom;
   
   //This instance name made sense at 4AM when I typed it
   risingDetector rayfall(.clk(clk), .clr(clr), .signalIn(signalIn), .risingEdge(risingEdge));

   m_register #(1) randomCapture(.Q(waveWideRandom), .D(randomIn), .en(risingEdge), .clk(clk), .clr(clr));

   assign signalOut = signalIn & waveWideRandom;

endmodule: randomMixer

module arbDivBy2
  (
   input  	clk, clr,
   input  	signalIn,
   output   signalOut
   );

   wire 	risingEdge;
   
   risingDetector risingCheck(.clk(clk), .clr(clr), .signalIn(signalIn), .risingEdge(risingEdge));

   m_register #(1) waveTracker(.Q(signalOut), .D(~signalOut), .en(risingEdge), .clk(clk), .clr(clr));

endmodule: arbDivBy2



