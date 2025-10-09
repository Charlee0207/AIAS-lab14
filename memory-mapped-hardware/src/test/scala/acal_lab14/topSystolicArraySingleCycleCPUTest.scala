package acal_lab14.topSystolicArraySingleCycleCPU

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._
import scala.io.Source

import acal_lab14.AXI._
import acal_lab14.AXILite._
import Config._
import Utils.AXITester

class topTest extends AnyFlatSpec
    with ChiselScalatestTester
    with AXITester{
        val idWidth = Lab14_2_3_Config.s_id_width
        val addrWidth = Lab14_2_3_Config.addr_width
        val dataWidth = Lab14_2_3_Config.data_width
    "CPU" should "program DMA & SA to compute matrix multiplication" in {
        test(new top()).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>

            dut.clock.setTimeout(0)

            val lines    = Source.fromFile(Lab14_2_3_Config.instr_asm_path).getLines.toList

            /* Initialize IO ports */
            dut.io.tb_slave.ar.initSource().setSourceClock(dut.clock)
            dut.io.tb_slave.aw.initSource().setSourceClock(dut.clock)
            dut.io.tb_slave.w.initSource().setSourceClock(dut.clock)
            dut.io.tb_slave.r.initSink().setSinkClock(dut.clock)
            dut.io.tb_slave.b.initSink().setSinkClock(dut.clock)

            while (!dut.io.Hcf.peek().litToBoolean) {
                var current_pc = dut.io.pc.peek().litValue.toInt
                println("Cycle: " + dut.io.cycle_count.peek().toString)
                println("PC: " + dut.io.pc.peek().toString)
                println("Inst: " + lines(current_pc >> 2))
                println("==============================")
                dut.clock.step(1)
            }

            println("Cycle: " + dut.io.cycle_count.peek().toString)
            println("Inst: Hcf")
            println("This is the end of the program!!")
            println("==============================")
            println("")
            dut.clock.step(1)

            println("Value in the RegFile :")
            for (i <- 0 until 4) {
                var value_0 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 0).peek().litValue.toString(16))
                .replace(' ', '0')
                var value_1 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 1).peek().litValue.toString(16))
                .replace(' ', '0')
                var value_2 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 2).peek().litValue.toString(16))
                .replace(' ', '0')
                var value_3 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 3).peek().litValue.toString(16))
                .replace(' ', '0')
                var value_4 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 4).peek().litValue.toString(16))
                .replace(' ', '0')
                var value_5 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 5).peek().litValue.toString(16))
                .replace(' ', '0')
                var value_6 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 6).peek().litValue.toString(16))
                .replace(' ', '0')
                var value_7 = String
                .format("%" + 8 + "s", dut.io.regs(8 * i + 7).peek().litValue.toString(16))
                .replace(' ', '0')

                println(
                s"reg[${"%02d".format(8 * i + 0)}]：0x${value_0} " +
                    s"reg[${"%02d".format(8 * i + 1)}]：0x${value_1} " +
                    s"reg[${"%02d".format(8 * i + 2)}]：0x${value_2} " +
                    s"reg[${"%02d".format(8 * i + 3)}]：0x${value_3} " +
                    s"reg[${"%02d".format(8 * i + 4)}]：0x${value_4} " +
                    s"reg[${"%02d".format(8 * i + 5)}]：0x${value_5} " +
                    s"reg[${"%02d".format(8 * i + 6)}]：0x${value_6} " +
                    s"reg[${"%02d".format(8 * i + 7)}]：0x${value_7} "
                )
            }

            println("==============================")
            
            println("Value in Systolic Array Memory (in decimal)")
            dut.io.tb_en.poke(true.B)

            for(i <- 0 until 12) {
                if(i==0)
                    println("Matrix A :")
                else if(i==4)
                    println("Matrix B :")
                else if(i==8)
                    println("Output Matrix :")
                dut.io.tb_slave.r.ready.poke(true.B)
                dut.io.tb_slave.ar.enqueue(genAXIAddr(BigInt(Lab14_2_3_Config.Mem_Base_ADDR + 4 * i)))
                val addr = (Lab14_2_3_Config.Mem_Base_ADDR + 4 * i).toHexString
                while(!dut.io.tb_slave.r.valid.peek().litToBoolean) {
                    dut.clock.step(1)
                }
                var value : String = ""
                for(i <- 0 until 4) {
                    value += String
                    .format("%" + 2 + "s", dut.io.tb_slave.r.bits.data.peek()
                    .asUInt()(8 * i + 7, 8 * i)
                    .litValue.toString(10))
                    .replace(' ', '0')
                }
                println(s"mem[0x${addr}] = ${value}")
            }
        }
    }
}