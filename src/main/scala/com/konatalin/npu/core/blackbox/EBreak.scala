package com.konatalin.npu.core.blackbox

import chisel3._
import chisel3.util.HasBlackBoxResource

class EBreakBundle extends Bundle {
     val clk = Input(Bool())
     val signal = Input(UInt(2.W))
}
class EBreak extends HasBlackBoxResource {
     val io = IO(new EBreakBundle)
     addResource("/EBreak.v");
}
