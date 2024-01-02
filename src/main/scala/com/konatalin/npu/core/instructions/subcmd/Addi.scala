package com.konatalin.npu.core.instructions.subcmd

import com.konatalin.npu.core.instructions.KonataInstruction
class Addi extends KonataInstruction {
     io.result := io.rs1 + io.imm
}
