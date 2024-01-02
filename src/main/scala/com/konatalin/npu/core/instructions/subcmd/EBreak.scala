package com.konatalin.npu.core.instructions.subcmd

import chisel3._
import com.konatalin.npu.core.instructions.KonataInstruction
class EBreak(registerGroup: Vec[UInt]) extends KonataInstruction(registerGroup) {
  val eBreak = Module(new com.konatalin.npu.core.blackbox.EBreak)
  eBreak.io.clk := clock.asUInt
  eBreak.io.signal := "b10".U(2.W)

  io.result := 0.U
  io.targetRegister := 0.U
  io.nextPC := 0.U
  io.jmp := false.B
}