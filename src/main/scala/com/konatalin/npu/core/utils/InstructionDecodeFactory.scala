package com.konatalin.npu.core.utils

import chisel3._
import chisel3.util.{BitPat, Cat, Fill}
import com.konatalin.npu.KonataCore
import com.konatalin.npu.core.instructions.{InstructionIO, InstructionType, RegisterTree}
import com.konatalin.npu.core.instructions.reflect.KonataInstructionCenter

/**
 * Instruction Decode;Fetch out rs1 rs2 rd and imm
 * Notice: the size of imm is equal to REGISTER_WIDTH in KonataCore
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */

class InstructionBundle extends Bundle {
     val inst = Input(UInt(KonataCore.REGISTER_WIDTH.W))
     val result = Output(UInt(32.W))
}

class InstructionDecodeFactory extends Module {
     val io = IO(new InstructionBundle)
     /** Invoke for cmds */

     val resultSaver = WireDefault(0.U(32.W))

     RegisterTree.register()

     for ((bag, dos) <- KonataInstructionCenter.hashMap) {
          dos.io.rs1 := io.inst(KonataCore.LEFT_BOUNDARY_OF_RS1
               , KonataCore.RIGHT_BOUNDARY_OF_RS1)

          dos.io.rs2 := io.inst(KonataCore.LEFT_BOUNDARY_OF_RS2
               , KonataCore.RIGHT_BOUNDARY_OF_RS2)

          dos.io.rd := io.inst(KonataCore.LEFT_BOUNDARY_OF_RD
               , KonataCore.RIGHT_BOUNDARY_OF_RD)

          if (bag.instructionType == InstructionType.B_TYPE) {
               dos.io.imm := Cat(Fill(20, io.inst(31)), io.inst(7), io.inst(30, 25), io.inst(11, 8), 0.U(1.W))
          } else if (bag.instructionType == InstructionType.U_TYPE) {
               dos.io.imm := Cat(io.inst(31, 12), Fill(12, 0.U))
          } else if (bag.instructionType == InstructionType.S_TYPE) {
               dos.io.imm := Cat(Fill(20, io.inst(31)), io.inst(31, 25), io.inst(11, 7))
          } else if (bag.instructionType == InstructionType.R_TYPE) {
               dos.io.imm := Cat(Fill(32, 0.U))
          } else if (bag.instructionType == InstructionType.I_TYPE) {
               dos.io.imm := Cat(Fill(20, io.inst(31)), io.inst(31, 20))
          } else if (bag.instructionType == InstructionType.J_TYPE) {
               dos.io.imm := Cat(Fill(12, io.inst(31)), io.inst(31), io.inst(19, 12), io.inst(20), io.inst(30, 21), Fill(1, 0.U))
          }
          when (io.inst === BitPat("b" + bag.pattern)) {
               resultSaver := dos.io.result
          }
     }

     io.result := resultSaver
}
object InstructionDecodeFactory_App extends App {
     emitVerilog(new InstructionDecodeFactory)
}