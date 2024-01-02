package com.konatalin.npu

/**
 * KonataNPU Config class
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */
object KonataCore {
     /** the width of register */
     val REGISTER_WIDTH = 32;
     /** the width of single address */
     val ADDRESS_WIDTH = 32;
     /** determine how long pc will jump per clk */
     val PC_JUMP = 4;
     /** the head of pc */
     val PC_BEGIN_POSITION : String = "b01000000000000000000000000000000"; //0x80000000
     /** size of instruction memory */
     val MEM_INST_SIZE = 1024
     /** size of rs1 rs2 rd */
     val REGISTER_SOURCE_DISTANCE_WIDTH = 5


     /** Magic value of some register */
     val LEFT_BOUNDARY_OF_RS1 = 19
     val RIGHT_BOUNDARY_OF_RS1 = 15

     val LEFT_BOUNDARY_OF_RS2 = 24
     val RIGHT_BOUNDARY_OF_RS2 = 20

     val LEFT_BOUNDARY_OF_RD = 11
     val RIGHT_BOUNDARY_OF_RD = 7


}