package com.konatalin.npu.core.instructions.reflect

import com.konatalin.npu.core.instructions.InstructionType.InstructionType
import com.konatalin.npu.core.instructions.KonataInstruction

import scala.collection.mutable

/**
 * Refer to RegisterTree class
 * @author Konata_Lin
 * @version 1.0.0-SNAPSHOT
 */
object KonataInstructionCenter {
  var hashMap = mutable.HashMap[InstructionBag,KonataInstruction]()
  def registerInstruction(instructionType: InstructionType, pattern : String
                          , instruction : KonataInstruction): Unit = {
    val patternNew = pattern.replace(" ", "")
    val bag = new InstructionBag
    bag.instructionType = instructionType
    bag.pattern = patternNew

    hashMap.put(bag, instruction)
  }
}
