package com.konatalin.npu.core.sub

import chisel3._
import com.konatalin.npu.KonataCore

import scala.math.{ceil, log}

/**
 * Fetch cmd from memory
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */

/**
 * TODO Change the source of memory
 */
class MemoryCmdInvokerIO extends Bundle {
     val addr = Input(UInt(KonataCore.ADDRESS_WIDTH.W))
     val inst = Output(UInt(KonataCore.REGISTER_WIDTH.W))
}

class MemoryCmdInvoker extends Module {
     val io = IO(new MemoryCmdInvokerIO())

     val memory = Mem(KonataCore.MEM_INST_SIZE
          , UInt(KonataCore.REGISTER_WIDTH.W))

     val targetAddress = (io.addr >> ceil(log(KonataCore.REGISTER_WIDTH) / log(2)).toInt.U)

     io.inst := memory.read(targetAddress)
}
