module Addi(
  input  [4:0]  io_rs1, // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  input  [4:0]  io_rd, // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  input  [31:0] io_imm, // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  input         io_MATCH_SIGNAL, // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  output [31:0] io_result, // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  output [31:0] io_targetRegister // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
);
  wire [31:0] _GEN_2 = {{27'd0}, io_rs1}; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\Addi.scala 8:31]
  wire [31:0] _io_result_T_1 = _GEN_2 + io_imm; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\Addi.scala 8:31]
  wire [4:0] _GEN_1 = io_MATCH_SIGNAL ? io_rd : 5'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 15:21 \\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\Addi.scala 7:28 9:29]
  assign io_result = io_MATCH_SIGNAL ? _io_result_T_1 : 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 14:13 \\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\Addi.scala 7:28 8:21]
  assign io_targetRegister = {{27'd0}, _GEN_1};
endmodule
module EBreak_1(
  input   clock,
  input   io_MATCH_SIGNAL // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
);
  wire  eBreak_clk; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 7:22]
  wire [1:0] eBreak_signal; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 7:22]
  EBreak eBreak ( // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 7:22]
    .clk(eBreak_clk),
    .signal(eBreak_signal)
  );
  assign eBreak_clk = io_MATCH_SIGNAL ? clock : clock; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 21:19 8:25 9:19]
  assign eBreak_signal = io_MATCH_SIGNAL ? 2'h2 : 2'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 10:22 22:22 8:25]
endmodule
module Cpu(
  input         clock,
  input         reset,
  input  [31:0] io_inst, // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 28:17]
  output [31:0] io_pc // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 28:17]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] Addi_io_rs1; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [4:0] Addi_io_rd; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [31:0] Addi_io_imm; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire  Addi_io_MATCH_SIGNAL; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [31:0] Addi_io_result; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [31:0] Addi_io_targetRegister; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire  EBreak_clock; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 20:26]
  wire  EBreak_io_MATCH_SIGNAL; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 20:26]
  reg [31:0] registerGroup_0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_1; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_2; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_3; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_4; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_5; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_6; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_7; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_8; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_9; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_10; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_11; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_12; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_13; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_14; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_15; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_16; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_17; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_18; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_19; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_20; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_22; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_23; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_24; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_25; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_26; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_27; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_28; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_29; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_30; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_31; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] pcCounterMain; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 31:33]
  wire [31:0] _GEN_97 = 32'h100073 == io_inst ? 32'h0 : registerGroup_0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43 68:56]
  wire [31:0] _GEN_130 = 5'h1 == io_inst[19:15] ? registerGroup_1 : registerGroup_0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_131 = 5'h2 == io_inst[19:15] ? registerGroup_2 : _GEN_130; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_132 = 5'h3 == io_inst[19:15] ? registerGroup_3 : _GEN_131; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_133 = 5'h4 == io_inst[19:15] ? registerGroup_4 : _GEN_132; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_134 = 5'h5 == io_inst[19:15] ? registerGroup_5 : _GEN_133; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_135 = 5'h6 == io_inst[19:15] ? registerGroup_6 : _GEN_134; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_136 = 5'h7 == io_inst[19:15] ? registerGroup_7 : _GEN_135; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_137 = 5'h8 == io_inst[19:15] ? registerGroup_8 : _GEN_136; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_138 = 5'h9 == io_inst[19:15] ? registerGroup_9 : _GEN_137; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_139 = 5'ha == io_inst[19:15] ? registerGroup_10 : _GEN_138; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_140 = 5'hb == io_inst[19:15] ? registerGroup_11 : _GEN_139; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_141 = 5'hc == io_inst[19:15] ? registerGroup_12 : _GEN_140; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_142 = 5'hd == io_inst[19:15] ? registerGroup_13 : _GEN_141; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_143 = 5'he == io_inst[19:15] ? registerGroup_14 : _GEN_142; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_144 = 5'hf == io_inst[19:15] ? registerGroup_15 : _GEN_143; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_145 = 5'h10 == io_inst[19:15] ? registerGroup_16 : _GEN_144; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_146 = 5'h11 == io_inst[19:15] ? registerGroup_17 : _GEN_145; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_147 = 5'h12 == io_inst[19:15] ? registerGroup_18 : _GEN_146; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_148 = 5'h13 == io_inst[19:15] ? registerGroup_19 : _GEN_147; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_149 = 5'h14 == io_inst[19:15] ? registerGroup_20 : _GEN_148; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_150 = 5'h15 == io_inst[19:15] ? registerGroup_21 : _GEN_149; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_151 = 5'h16 == io_inst[19:15] ? registerGroup_22 : _GEN_150; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_152 = 5'h17 == io_inst[19:15] ? registerGroup_23 : _GEN_151; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_153 = 5'h18 == io_inst[19:15] ? registerGroup_24 : _GEN_152; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_154 = 5'h19 == io_inst[19:15] ? registerGroup_25 : _GEN_153; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_155 = 5'h1a == io_inst[19:15] ? registerGroup_26 : _GEN_154; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_156 = 5'h1b == io_inst[19:15] ? registerGroup_27 : _GEN_155; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_157 = 5'h1c == io_inst[19:15] ? registerGroup_28 : _GEN_156; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_158 = 5'h1d == io_inst[19:15] ? registerGroup_29 : _GEN_157; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_159 = 5'h1e == io_inst[19:15] ? registerGroup_30 : _GEN_158; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [31:0] _GEN_160 = 5'h1f == io_inst[19:15] ? registerGroup_31 : _GEN_159; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{22,22}]
  wire [19:0] _T_16 = io_inst[31] ? 20'hfffff : 20'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 63:38]
  wire [31:0] _T_19 = io_inst & 32'h707f; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:25]
  wire [31:0] _registerGroup_T_21 = Addi_io_result; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:{58,58}]
  wire [31:0] _pcCounterMain_T_1 = pcCounterMain + 32'h4; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 88:37]
  Addi Addi ( // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
    .io_rs1(Addi_io_rs1),
    .io_rd(Addi_io_rd),
    .io_imm(Addi_io_imm),
    .io_MATCH_SIGNAL(Addi_io_MATCH_SIGNAL),
    .io_result(Addi_io_result),
    .io_targetRegister(Addi_io_targetRegister)
  );
  EBreak_1 EBreak ( // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 20:26]
    .clock(EBreak_clock),
    .io_MATCH_SIGNAL(EBreak_io_MATCH_SIGNAL)
  );
  assign io_pc = pcCounterMain; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 89:12]
  assign Addi_io_rs1 = _GEN_160[4:0]; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:22]
  assign Addi_io_rd = io_inst[11:7]; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 51:31]
  assign Addi_io_imm = {_T_16,io_inst[31:20]}; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 63:33]
  assign Addi_io_MATCH_SIGNAL = 32'h13 == _T_19; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:25]
  assign EBreak_clock = clock;
  assign EBreak_io_MATCH_SIGNAL = 32'h100073 == io_inst; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:25]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_0 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h0 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_0 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end else begin
        registerGroup_0 <= _GEN_97;
      end
    end else begin
      registerGroup_0 <= _GEN_97;
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_1 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h1 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_1 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_2 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h2 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_2 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_3 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h3 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_3 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_4 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h4 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_4 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_5 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h5 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_5 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_6 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h6 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_6 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_7 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h7 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_7 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_8 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h8 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_8 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_9 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h9 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_9 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_10 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'ha == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_10 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_11 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'hb == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_11 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_12 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'hc == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_12 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_13 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'hd == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_13 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_14 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'he == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_14 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_15 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'hf == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_15 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_16 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h10 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_16 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_17 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h11 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_17 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_18 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h12 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_18 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_19 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h13 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_19 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_20 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h14 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_20 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_21 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h15 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_21 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_22 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h16 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_22 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_23 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h17 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_23 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_24 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h18 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_24 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_25 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h19 == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_25 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_26 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h1a == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_26 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_27 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h1b == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_27 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_28 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h1c == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_28 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_29 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h1d == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_29 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_30 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h1e == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_30 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_31 <= 32'h0; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_19) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 68:56]
      if (5'h1f == Addi_io_targetRegister[4:0]) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
        registerGroup_31 <= _registerGroup_T_21; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 79:58]
      end
    end
    if (reset) begin // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 31:33]
      pcCounterMain <= 32'h40000000; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 31:33]
    end else begin
      pcCounterMain <= _pcCounterMain_T_1; // @[\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 88:20]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  registerGroup_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registerGroup_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registerGroup_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registerGroup_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registerGroup_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registerGroup_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registerGroup_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registerGroup_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registerGroup_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registerGroup_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registerGroup_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registerGroup_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registerGroup_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  registerGroup_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  registerGroup_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  registerGroup_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  registerGroup_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  registerGroup_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  registerGroup_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  registerGroup_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  registerGroup_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  registerGroup_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  registerGroup_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  registerGroup_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  registerGroup_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  registerGroup_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  registerGroup_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  registerGroup_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  registerGroup_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  registerGroup_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  registerGroup_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  registerGroup_31 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  pcCounterMain = _RAND_32[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
