module sid_voice (clock, reset, freq_lo, freq_hi, pw_lo, pw_hi,
                  control, att_dec, sus_rel, osc_msb_in,
                  wave__st, wave_p_t, wave_ps_, wave_pst,
                  outsaw, outtri,
                  osc_msb_out, signal_out, osc_out, env_out);

// Input Signals
input wire [0:0] clock;
input wire [0:0] reset;
input wire [7:0] freq_lo;
input wire [7:0] freq_hi;
input wire [7:0] pw_lo;
input wire [3:0] pw_hi;
input wire [7:0] control;
input wire [7:0] att_dec;
input wire [7:0] sus_rel;
input wire [0:0] osc_msb_in;
input wire [7:0] wave__st;
input wire [7:0] wave_p_t;
input wire [7:0] wave_ps_;
input wire [7:0] wave_pst;

// Output Signals
output wire [11:0] outsaw;
output wire [11:0] outtri;
output wire [ 0:0] osc_msb_out;
output wire [11:0] signal_out;
output wire [ 7:0] osc_out;
output wire [ 7:0] env_out;

// Internal Signals
reg  [23:0] oscillator;
reg  [ 0:0] osc_edge;
reg  [ 0:0] osc_msb_in_prv;
reg  [11:0] triangle;
reg  [11:0] sawtooth;
reg  [11:0] pulse;
reg  [11:0] noise;
reg  [22:0] lfsr_noise;
wire [ 7:0] envelope;
reg  [11:0] wave_out;
reg  [19:0] dca_out;

`define noise_ctrl   control[7]
`define pulse_ctrl   control[6]
`define saw_ctrl     control[5]
`define tri_ctrl     control[4]
`define test_ctrl    control[3]
`define ringmod_ctrl control[2]
`define sync_ctrl    control[1]

// Signal Assignments
assign osc_msb_out = oscillator[23];
assign signal_out  = dca_out[19:8];
assign osc_out     = wave_out[11:4];
assign env_out     = envelope;

// Digital Controlled Amplifier
always @(posedge clock)
begin
  dca_out <= wave_out * envelope;
end

// Envelope Instantiation
 sid_envelope adsr (.clock(clock), .reset(reset), .gate(control[0]),
                   .att_dec(att_dec), .sus_rel(sus_rel), .envelope(envelope));

// Phase Accumulating Oscillator
always @(posedge clock)
begin
  osc_msb_in_prv <= osc_msb_in;
  if (reset || `test_ctrl ||
     ((`sync_ctrl) && (!osc_msb_in) && (osc_msb_in != osc_msb_in_prv)))
    oscillator <= 24'h000000;
  else
    oscillator <= oscillator + {freq_hi, freq_lo};
end

// Waveform Generator
always @(posedge clock)
begin
  if (reset)
    begin
      triangle   <= 12'h000;
      sawtooth   <= 12'h000;
      pulse      <= 12'h000;
      noise      <= 12'h000;
      osc_edge   <= 1'b0;
      lfsr_noise <= 23'h7fffff;
    end
  else
    begin
      triangle <= (`ringmod_ctrl) ?
                  {({11{osc_msb_in}} ^
                  {{11{oscillator[23]}}}) ^ oscillator[22:12], 1'b0} :
                  {{11{oscillator[23]}} ^ oscillator[22:12], 1'b0};
      sawtooth <= oscillator[23:12];
      pulse <= (`test_ctrl) ? 12'hfff :
               (oscillator[23:12] >= {pw_hi, pw_lo}) ? {12{1'b1}} : {12{1'b0}};
      noise <= {lfsr_noise[21], lfsr_noise[19], lfsr_noise[15],
               lfsr_noise[12], lfsr_noise[10], lfsr_noise[6],
               lfsr_noise[3], lfsr_noise[1], 4'b0000};
      osc_edge <= (oscillator[19] && !osc_edge) ? 1'b1 :
                  (!oscillator[19] && osc_edge) ? 1'b0 : osc_edge;
      lfsr_noise <= (oscillator[19] && !osc_edge) ?
                    {lfsr_noise[21:0], (lfsr_noise[22] | `test_ctrl) ^
                    lfsr_noise[17]} : lfsr_noise;
    end
end

// Waveform Output Selector
always @(posedge clock)
begin
  case (control[7:4])
    4'b0001:
      wave_out <= triangle;
    4'b0010:
      wave_out <= sawtooth;
    4'b0011:
      wave_out <= {wave__st, 4'b0000};
    4'b0100:
      wave_out <= pulse;
    4'b0101:
      wave_out <= {wave_p_t, 4'b0000} & pulse;
    4'b0110:
      wave_out <= {wave_ps_, 4'b0000} & pulse;
    4'b0111:
      wave_out <= {wave_pst, 4'b0000} & pulse;
    4'b1000:
      wave_out <= noise;
    default:
      wave_out <= 12'h000;
  endcase
end

assign outsaw = sawtooth;
assign outtri = triangle[11:1];
endmodule

module lut_wave (
  input wire clk32,
  input wire [11:0] saw1,
  input wire [11:0] tr1,
  input wire [11:0] saw2,
  input wire [11:0] tr2,
  input wire [11:0] saw3,
  input wire [11:0] tr3,
  output reg [7:0] wave_st_1,
  output reg [7:0] wave_st_2,
  output reg [7:0] wave_st_3,
  output reg [7:0] wave_ps_1,
  output reg [7:0] wave_ps_2,
  output reg [7:0] wave_ps_3,
  output reg [7:0] wave_pt_1,
  output reg [7:0] wave_pt_2,
  output reg [7:0] wave_pt_3,
  output reg [7:0] wave_pst_1,
  output reg [7:0] wave_pst_2,
  output reg [7:0] wave_pst_3
  );

  reg [7:0] lut_ps[0:4095];
  reg [7:0] lut_st[0:4095];
  reg [7:0] lut_pt[0:4095];
  reg [7:0] lut_pst[0:4095];
  initial begin
    $readmemh ("wave_ps_.hex", lut_ps);
    $readmemh ("wave__st.hex", lut_st);
    $readmemh ("wave_p_t.hex", lut_pt);
    $readmemh ("wave_pst.hex", lut_pst);
  end

  reg [5:0] turno = 6'b000001;
  reg [11:0] dir_ps, dir_st, dir_pt, dir_pst;
  reg [7:0] dato_ps, dato_st, dato_pt, dato_pst;

  always @(posedge clk32) begin
    turno <= {turno[4:0], turno[5]};
    dato_ps  <= lut_ps [dir_ps];
    dato_st  <= lut_st [dir_st];
    dato_pt  <= lut_pt [dir_pt];
    dato_pst <= lut_pst[dir_pst];

    case (1'b1)
      turno[1] :
        begin
          wave_ps_1  <= dato_ps;
          wave_st_1  <= dato_st;
          wave_pt_1  <= dato_pt;
          wave_pst_1 <= dato_pst;
        end
      turno[3] :
        begin
          wave_ps_2  <= dato_ps;
          wave_st_2  <= dato_st;
          wave_pt_2  <= dato_pt;
          wave_pst_2 <= dato_pst;
        end
      turno[5] :
        begin
          wave_ps_3  <= dato_ps;
          wave_st_3  <= dato_st;
          wave_pt_3  <= dato_pt;
          wave_pst_3 <= dato_pst;
        end
    endcase
  end

  always @* begin
    case (1'b1)
      turno[0], turno[1]:
        begin
          dir_ps  = saw1;
          dir_st  = saw1;
          dir_pt  = tr1;
          dir_pst = saw1;
        end
      turno[2], turno[3]:
        begin
          dir_ps  = saw2;
          dir_st  = saw2;
          dir_pt  = tr2;
          dir_pst = saw2;
        end
      turno[4], turno[5]:
        begin
          dir_ps  = saw3;
          dir_st  = saw3;
          dir_pt  = tr3;
          dir_pst = saw3;
        end
      default:
        begin
          dir_ps  = 12'h000;
          dir_st  = 12'h000;
          dir_pt  = 12'h000;
          dir_pst = 12'h000;
        end
    endcase
  end
endmodule
