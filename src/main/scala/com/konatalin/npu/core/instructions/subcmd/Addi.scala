package com.konatalin.npu.core.instructions.subcmd

import chisel3._
import com.konatalin.npu.core.instructions.KonataInstruction
class Addi(registerGroup: Vec[UInt]) extends KonataInstruction(registerGroup) {
     io.result := io.rs1 + io.imm
     io.targetRegister := io.rd

     /**
      * Init default values(Unused)
      */
     io.nextPC := 0.U
     io.jmp := false.B
}
