package com.konatalin.npu.core.instructions

import chisel3._
import com.konatalin.npu.KonataCore

/**
 * Instruction Main class, All instruction are required to extend KonataInstruction class
 * and register it in InstructionDecodeFactory!
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */
abstract class KonataInstruction extends Module {
  val io = IO(new InstructionIO)
}
class InstructionIO extends Bundle {
  val rs1 = Input(UInt(KonataCore.REGISTER_SOURCE_DISTANCE_WIDTH.W))
  val rs2 = Input(UInt(KonataCore.REGISTER_SOURCE_DISTANCE_WIDTH.W))
  val rd = Input(UInt(KonataCore.REGISTER_SOURCE_DISTANCE_WIDTH.W))
  val imm = Input(UInt(KonataCore.REGISTER_WIDTH.W))

  val result = Output(UInt(32.W))
}
