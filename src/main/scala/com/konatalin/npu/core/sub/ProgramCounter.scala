package com.konatalin.npu.core.sub

import chisel3._
import com.konatalin.npu.KonataCore

/**
 * Pc Update class
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */

/**
 * TODO JMP COMMAND AND SO ON
 */
class ProgramCounterDLC extends Bundle {
     val Pc_Now = Output(UInt(KonataCore.ADDRESS_WIDTH.W))
}
class ProgramCounter extends Module {
     val io = IO(new ProgramCounterDLC)

     val pcCounterMain = RegInit(UInt(KonataCore.ADDRESS_WIDTH.W),
          KonataCore.PC_BEGIN_POSITION.U);
     pcCounterMain := pcCounterMain + KonataCore.PC_JUMP.U

     io.Pc_Now := pcCounterMain
}
