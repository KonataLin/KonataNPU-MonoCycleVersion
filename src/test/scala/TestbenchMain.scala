import chisel3._
import chiseltest.{ChiselScalatestTester, testableClock, testableData}
import com.konatalin.npu.core.utils.InstructionDecodeFactory
import org.scalatest.flatspec.AnyFlatSpec

class TestbenchMain_TestBench extends AnyFlatSpec with ChiselScalatestTester {
  "TestbenchMain" should "pass" in {
    test(new InstructionDecodeFactory) { dut =>
        dut.io.inst.poke("b00000000001100001000000000010011".U)
        dut.clock.step()

        println(dut.io.result.peek())
    }
  }
}