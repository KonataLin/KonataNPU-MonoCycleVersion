package com.konatalin.npu.core.utils

import chisel3._
import chisel3.experimental.hierarchy.{instantiable, public}
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

     /**
      * 由于分块管理，这个pc可能要被删掉，这里只是方便测试。
      */
     val pc = Output(UInt(KonataCore.ADDRESS_WIDTH.W))
}

@instantiable
class Cpu extends Module {
     val io = IO(new InstructionBundle)
     val registerGroup = dontTouch(RegInit(VecInit(Seq.fill(32)
           (0.U(KonataCore.REGISTER_WIDTH.W)))))
     val pcCounterMain = RegInit(UInt(KonataCore.ADDRESS_WIDTH.W),
          KonataCore.PC_BEGIN_POSITION.U(KonataCore.ADDRESS_WIDTH.W));

     if (KonataCore.DEBUG_ON_REIGSTER_GROUP) {
          printf(cf"Value: $registerGroup(1) \n")
     }
     /** Invoke for cmds */

     RegisterTree.register()

     for ((bag, dos) <- KonataInstructionCenter.hashMap) {
          if (KonataCore.DEBUG_CODEGEN) {
               println(bag.pattern)
          }
          dos.io.rs1 := registerGroup(io.inst(KonataCore.LEFT_BOUNDARY_OF_RS1
               , KonataCore.RIGHT_BOUNDARY_OF_RS1))

          dos.io.rs2 := registerGroup(io.inst(KonataCore.LEFT_BOUNDARY_OF_RS2
               , KonataCore.RIGHT_BOUNDARY_OF_RS2))

          dos.io.rd := io.inst(KonataCore.LEFT_BOUNDARY_OF_RD
               , KonataCore.RIGHT_BOUNDARY_OF_RD)
          dos.io.MATCH_SIGNAL := false.B
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
               dos.io.MATCH_SIGNAL := true.B
               if (bag.instructionType == InstructionType.B_TYPE) {

               } else if (bag.instructionType == InstructionType.U_TYPE) {

               } else if (bag.instructionType == InstructionType.S_TYPE) {

               } else if (bag.instructionType == InstructionType.R_TYPE) {
                    registerGroup(dos.io.targetRegister) := dos.io.result
               } else if (bag.instructionType == InstructionType.I_TYPE) {
                    registerGroup(dos.io.targetRegister) := dos.io.result
               } else if (bag.instructionType == InstructionType.J_TYPE) {

               }
          }
     }



     pcCounterMain := pcCounterMain + KonataCore.PC_JUMP.U
     io.pc := pcCounterMain
}
object EmitCpuProgrammer_App extends App {
     emitVerilog(new Cpu)
}