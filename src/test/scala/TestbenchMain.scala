import chisel3._
import chiseltest.{ChiselScalatestTester, testableClock, testableData}
import com.konatalin.npu.core.utils.{Cpu}
import org.scalatest.flatspec.AnyFlatSpec

class KonataCPUTest_TestBench extends AnyFlatSpec with ChiselScalatestTester {
  "KonataCPUTest" should "pass" in {
    test(new Cpu) { dut =>
        dut.io.inst.poke("b00000000001100000000000010010011".U)
        dut.clock.step()
        dut.io.inst.poke("b00000000001100001000000010010011".U)
        dut.clock.step()
        dut.io.inst.poke("b00000000001100001000000010010011".U)
        dut.clock.step()
        dut.io.inst.poke("b00000000000000000000000000000000".U)
        dut.clock.step()
        dut.clock.step()
        dut.io.inst.poke("b00000000000100000000000001110011".U)
        dut.clock.step()
        dut.io.inst.poke("b00000000000000000000000000000000".U)
        dut.clock.step()
        //println("Value(1): " + dut.registerGroup(1).asUInt.toPrintable)
    }
  }
}