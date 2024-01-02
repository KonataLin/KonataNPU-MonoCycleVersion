package com.konatalin.npu.core.instructions

/**
 * Enum of All Instruction Type Of Risc-V
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */
object InstructionType extends Enumeration {
     type InstructionType = Value
     val R_TYPE, I_TYPE, S_TYPE, B_TYPE, U_TYPE, J_TYPE, EMPTY = Value
}