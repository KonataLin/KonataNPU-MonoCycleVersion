package com.konatalin.npu.core.instructions.subcmd

import chisel3._
import com.konatalin.npu.KonataCore
import com.konatalin.npu.core.instructions.KonataInstruction
class EBreak extends KonataInstruction {
  val eBreak = Module(new com.konatalin.npu.core.blackbox.EBreak)
  when(io.MATCH_SIGNAL) {
    eBreak.io.clk := clock.asUInt
    eBreak.io.signal := "b10".U(2.W)

    io.result := 0.U
    io.targetRegister := 0.U
    io.nextPC := 0.U
    io.jmp := false.B

    if (KonataCore.DEBUG_ON_EBREAK) {
      printf("Got in ebreak \n")
    }
  } .otherwise {
    eBreak.io.clk := clock.asUInt
    eBreak.io.signal := 0.U(2.W)
    if (KonataCore.DEBUG_ON_EBREAK) {
      printf("Out of ebreak \n")
    }
  }
}