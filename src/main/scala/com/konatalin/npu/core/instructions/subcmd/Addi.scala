package com.konatalin.npu.core.instructions.subcmd

import chisel3._
import com.konatalin.npu.KonataCore
import com.konatalin.npu.core.instructions.KonataInstruction
class Addi extends KonataInstruction {
     when(io.MATCH_SIGNAL) {
          io.result := io.rs1 + io.imm
          io.targetRegister := io.rd


          /**
           * Init default values(Unused)
           */
          io.nextPC := 0.U
          io.jmp := false.B

          if (KonataCore.DEBUG_ON_ADDI) {
               printf(cf"value $io \n")
          }
     }
}
