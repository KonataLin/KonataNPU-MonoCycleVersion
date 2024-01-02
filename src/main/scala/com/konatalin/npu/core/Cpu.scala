package com.konatalin.npu.core

import chisel3._
class Cpu extends Module {
     val io = IO(new Bundle{
    
     })
}
object Cpu_App extends App {
     emitVerilog(new Cpu)
}