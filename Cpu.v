module Addi(
  input  [4:0]  io_rs1, // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  input  [4:0]  io_rd, // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  input  [31:0] io_imm, // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  output [31:0] io_result, // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
  output [31:0] io_targetRegister // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\KonataInstruction.scala 13:14]
);
  wire [31:0] _GEN_0 = {{27'd0}, io_rs1}; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\Addi.scala 6:26]
  assign io_result = _GEN_0 + io_imm; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\Addi.scala 6:26]
  assign io_targetRegister = {{27'd0}, io_rd}; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\Addi.scala 7:24]
endmodule
module EBreak_1(
  input   clock
);
  wire  eBreak_clk; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 6:22]
  wire [1:0] eBreak_signal; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 6:22]
  EBreak eBreak ( // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 6:22]
    .clk(eBreak_clk),
    .signal(eBreak_signal)
  );
  assign eBreak_clk = clock; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 7:26]
  assign eBreak_signal = 2'h2; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\subcmd\\EBreak.scala 8:20]
endmodule
module Cpu(
  input         clock,
  input         reset,
  input  [31:0] io_inst, // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 28:17]
  output [31:0] io_pc // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 28:17]
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
`endif // RANDOMIZE_REG_INIT
  wire [4:0] Addi_io_rs1; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [4:0] Addi_io_rd; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [31:0] Addi_io_imm; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [31:0] Addi_io_result; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire [31:0] Addi_io_targetRegister; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
  wire  EBreak_clock; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 20:26]
  reg [31:0] registerGroup_0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_1; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_2; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_3; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_4; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_5; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] registerGroup_6; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
  reg [31:0] pcCounterMain; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 31:33]
  wire [31:0] _GEN_1 = 3'h1 == io_inst[17:15] ? registerGroup_1 : registerGroup_0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 39:{22,22}]
  wire [31:0] _GEN_2 = 3'h2 == io_inst[17:15] ? registerGroup_2 : _GEN_1; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 39:{22,22}]
  wire [31:0] _GEN_3 = 3'h3 == io_inst[17:15] ? registerGroup_3 : _GEN_2; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 39:{22,22}]
  wire [31:0] _GEN_4 = 3'h4 == io_inst[17:15] ? registerGroup_4 : _GEN_3; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 39:{22,22}]
  wire [31:0] _GEN_5 = 3'h5 == io_inst[17:15] ? registerGroup_5 : _GEN_4; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 39:{22,22}]
  wire [31:0] _GEN_6 = 3'h6 == io_inst[17:15] ? registerGroup_6 : _GEN_5; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 39:{22,22}]
  wire [31:0] _GEN_15 = 3'h1 == io_inst[9:7] ? registerGroup_1 : registerGroup_0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{21,21}]
  wire [31:0] _GEN_16 = 3'h2 == io_inst[9:7] ? registerGroup_2 : _GEN_15; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{21,21}]
  wire [31:0] _GEN_17 = 3'h3 == io_inst[9:7] ? registerGroup_3 : _GEN_16; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{21,21}]
  wire [31:0] _GEN_18 = 3'h4 == io_inst[9:7] ? registerGroup_4 : _GEN_17; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{21,21}]
  wire [31:0] _GEN_19 = 3'h5 == io_inst[9:7] ? registerGroup_5 : _GEN_18; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{21,21}]
  wire [31:0] _GEN_20 = 3'h6 == io_inst[9:7] ? registerGroup_6 : _GEN_19; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:{21,21}]
  wire [19:0] _T_8 = io_inst[31] ? 20'hfffff : 20'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 56:38]
  wire [31:0] _T_11 = io_inst & 32'h707f; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:25]
  wire [31:0] _GEN_29 = 3'h1 == Addi_io_result[2:0] ? registerGroup_1 : registerGroup_0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:{58,58}]
  wire [31:0] _GEN_30 = 3'h2 == Addi_io_result[2:0] ? registerGroup_2 : _GEN_29; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:{58,58}]
  wire [31:0] _GEN_31 = 3'h3 == Addi_io_result[2:0] ? registerGroup_3 : _GEN_30; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:{58,58}]
  wire [31:0] _GEN_32 = 3'h4 == Addi_io_result[2:0] ? registerGroup_4 : _GEN_31; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:{58,58}]
  wire [31:0] _GEN_33 = 3'h5 == Addi_io_result[2:0] ? registerGroup_5 : _GEN_32; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:{58,58}]
  wire [31:0] _GEN_34 = 3'h6 == Addi_io_result[2:0] ? registerGroup_6 : _GEN_33; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:{58,58}]
  wire [31:0] _pcCounterMain_T_1 = pcCounterMain + 32'h4; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 80:37]
  Addi Addi ( // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 17:26]
    .io_rs1(Addi_io_rs1),
    .io_rd(Addi_io_rd),
    .io_imm(Addi_io_imm),
    .io_result(Addi_io_result),
    .io_targetRegister(Addi_io_targetRegister)
  );
  EBreak_1 EBreak ( // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\instructions\\RegisterTree.scala 20:26]
    .clock(EBreak_clock)
  );
  assign io_pc = pcCounterMain; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 81:12]
  assign Addi_io_rs1 = _GEN_6[4:0]; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 39:22]
  assign Addi_io_rd = _GEN_20[4:0]; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 45:21]
  assign Addi_io_imm = {_T_8,io_inst[31:20]}; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 56:33]
  assign EBreak_clock = clock;
  always @(posedge clock) begin
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_0 <= 32'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (!(32'h100073 == io_inst)) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
      if (32'h13 == _T_11) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
        if (3'h0 == Addi_io_targetRegister[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
          registerGroup_0 <= _GEN_34; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        end
      end
    end
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_1 <= 32'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_11) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
      if (3'h1 == Addi_io_targetRegister[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        if (3'h6 == Addi_io_result[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
          registerGroup_1 <= registerGroup_6; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        end else begin
          registerGroup_1 <= _GEN_33;
        end
      end
    end
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_2 <= 32'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_11) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
      if (3'h2 == Addi_io_targetRegister[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        if (3'h6 == Addi_io_result[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
          registerGroup_2 <= registerGroup_6; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        end else begin
          registerGroup_2 <= _GEN_33;
        end
      end
    end
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_3 <= 32'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_11) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
      if (3'h3 == Addi_io_targetRegister[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        if (3'h6 == Addi_io_result[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
          registerGroup_3 <= registerGroup_6; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        end else begin
          registerGroup_3 <= _GEN_33;
        end
      end
    end
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_4 <= 32'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_11) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
      if (3'h4 == Addi_io_targetRegister[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        if (3'h6 == Addi_io_result[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
          registerGroup_4 <= registerGroup_6; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        end else begin
          registerGroup_4 <= _GEN_33;
        end
      end
    end
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_5 <= 32'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_11) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
      if (3'h5 == Addi_io_targetRegister[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        if (3'h6 == Addi_io_result[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
          registerGroup_5 <= registerGroup_6; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        end else begin
          registerGroup_5 <= _GEN_33;
        end
      end
    end
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
      registerGroup_6 <= 32'h0; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 29:43]
    end else if (32'h13 == _T_11) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 61:56]
      if (3'h6 == Addi_io_targetRegister[2:0]) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
        if (!(3'h6 == Addi_io_result[2:0])) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 71:58]
          registerGroup_6 <= _GEN_33;
        end
      end
    end
    if (reset) begin // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 31:33]
      pcCounterMain <= 32'h40000000; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 31:33]
    end else begin
      pcCounterMain <= _pcCounterMain_T_1; // @[D:\\ChiselWorkspace\\KonataNPU\\src\\main\\scala\\com\\konatalin\\npu\\core\\utils\\Cpu.scala 80:20]
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
  pcCounterMain = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
