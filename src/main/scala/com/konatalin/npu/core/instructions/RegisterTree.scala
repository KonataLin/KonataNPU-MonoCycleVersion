package com.konatalin.npu.core.instructions

import chisel3._
import com.konatalin.npu.core.instructions.reflect.KonataInstructionCenter
import com.konatalin.npu.core.instructions.subcmd.{Addi, EBreak}


/**
 * The location where riscv cmds are registered
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */
object RegisterTree {
     def register(registerGroup : Vec[UInt]): Unit = {
          KonataInstructionCenter.
            registerInstruction(InstructionType.I_TYPE, "??????? ????? ????? 000 ????? 00100 11"
                 , Module(new Addi(registerGroup)));
         KonataInstructionCenter.
           registerInstruction(InstructionType.I_TYPE, "0000000 00001 00000 000 00000 11100 11"
                 , Module(new EBreak(registerGroup)));
     }

}
