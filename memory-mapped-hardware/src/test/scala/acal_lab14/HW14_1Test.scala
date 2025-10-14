package acal_lab14.HW14_1

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
        val idWidth = HW14_1_Config.s_id_width
        val addrWidth = HW14_1_Config.addr_width
        val dataWidth = HW14_1_Config.data_width
    "HW14_1 CPU" should "program SA to compute matrix multiplication" in {
        test(new top()).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>

            dut.clock.setTimeout(0)

            val lines    = Source.fromFile(HW14_1_Config.instr_asm_path).getLines.toList

            /* Initialize IO ports */
            dut.io.tb_slave.ar.initSource().setSourceClock(dut.clock)
            dut.io.tb_slave.aw.initSource().setSourceClock(dut.clock)
            dut.io.tb_slave.w.initSource().setSourceClock(dut.clock)
            dut.io.tb_slave.r.initSink().setSinkClock(dut.clock)
            dut.io.tb_slave.b.initSink().setSinkClock(dut.clock)

            /* Performance counter */
            // var Cycle_Count = 0
            var Inst_Count = 0
            var Conditional_Branch_Count = 0
            var Unconditional_Branch_Count = 0
            var Conditional_Branch_Hit_Count = 0
            var Unconditional_Branch_Hit_Count = 0
            var Flush_Count = 0
            /* Performance counter */

            while (!dut.io.Hcf.peek().litToBoolean) {
                var Cycle_Count = dut.io.Cycle_Count.peek().litValue.toInt
                var PC_IF = dut.io.IF_PC.peek().litValue.toInt
                var PC_ID = dut.io.ID_PC.peek().litValue.toInt
                var PC_EXE = dut.io.EXE_PC.peek().litValue.toInt
                var PC_MEM = dut.io.MEM_PC.peek().litValue.toInt
                var PC_WB = dut.io.WB_PC.peek().litValue.toInt

                var E_BT = dut.io.E_Branch_taken.peek().litValue.toInt
                var Flush = dut.io.Flush.peek().litValue.toInt
                var Stall_MA = dut.io.Stall_MA.peek().litValue.toInt
                var Stall_DH = dut.io.Stall_DH.peek().litValue.toInt
                var alu_out = (dut.io.EXE_alu_out.peek().litValue.toInt.toHexString).replace(' ', '0')
                var EXE_src1 = (dut.io.EXE_src1.peek().litValue.toInt.toHexString).replace(' ', '0')
                var EXE_src2 = (dut.io.EXE_src2.peek().litValue.toInt.toHexString).replace(' ', '0')
                var ALU_src1 = (dut.io.ALU_src1.peek().litValue.toInt.toHexString).replace(' ', '0')
                var ALU_src2 = (dut.io.ALU_src2.peek().litValue.toInt.toHexString).replace(' ', '0')
                var DM_rdata = (dut.io.rdata.peek().litValue.toInt.toHexString).replace(' ', '0')
                var DM_raddr = (dut.io.raddr.peek().litValue.toInt.toHexString).replace(' ', '0')
                var WB_reg = dut.io.WB_rd.peek().litValue.toInt
                var WB_wdata = (dut.io.WB_wdata.peek().litValue.toInt.toHexString).replace(' ', '0')

                var EXE_Jump = dut.io.EXE_Jump.peek().litValue.toInt
                var EXE_Branch = dut.io.EXE_Branch.peek().litValue.toInt

                println(
                    s"[Cycle_Count] = ${Cycle_Count}"
                )
                println(
                s"[PC_IF ]${"%8d".format(PC_IF)} [Inst] ${"%-25s".format(lines(PC_IF >> 2))} "
                )
                println(
                s"[PC_ID ]${"%8d".format(PC_ID)} [Inst] ${"%-25s".format(lines(PC_ID >> 2))} "
                )
                println(
                s"[PC_EXE]${"%8d".format(PC_EXE)} [Inst] ${"%-25s".format(lines(PC_EXE >> 2))} " +
                    s"[EXE src1]${"%8s".format(EXE_src1)} [EXE src2]${"%8s".format(EXE_src2)} " +
                    s"[Br taken] ${"%1d".format(E_BT)} "
                )
                println(
                s"                                                  " +
                    s"[ALU src1]${"%8s".format(ALU_src1)} [ALU src2]${"%8s".format(ALU_src2)} " +
                    s"[ALU Out]${"%8s".format(alu_out)}"
                )
                println(
                s"[PC_MEM]${"%8d".format(PC_MEM)} [Inst] ${"%-25s".format(lines(PC_MEM >> 2))} " +
                    s"[DM Raddr]${"%8s".format(DM_raddr)} [DM Rdata]${"%8s".format(DM_rdata)}"
                )
                println(
                s"[PC_WB ]${"%8d".format(PC_WB)} [Inst] ${"%-25s".format(lines(PC_WB >> 2))} " +
                    s"[ WB reg ]${"%8d".format(WB_reg)} [WB  data]${"%8s".format(WB_wdata)}"
                )
                println(s"[Flush ] ${"%1d".format(Flush)} [Stall_MA ] ${"%1d"
                    .format(Stall_MA)} [Stall_DH ] ${"%1d".format(Stall_DH)} ")
                println("==============================================")

                /* Performance counter */
                if (Stall_MA == 0 && Stall_DH == 0) {
                    Inst_Count += 1 // Not Stall, read inst

                    if (EXE_Branch == 1) {
                        Conditional_Branch_Count += 1
                        if (Flush == 0) {
                        Conditional_Branch_Hit_Count += 1
                        } else {
                        Flush_Count += 1
                        }
                    }
                    if (EXE_Jump == 1) {
                        Unconditional_Branch_Count += 1
                        if (Flush == 0) {
                        Unconditional_Branch_Hit_Count += 1
                        } else {
                        Flush_Count += 1
                        }
                    }
                }
                /* Performance counter */

                dut.clock.step(1)
            }

            println("Cycle: " + dut.io.Cycle_Count.peek().toString)
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
                dut.io.tb_slave.ar.enqueue(genAXIAddr(BigInt(HW14_1_Config.Mem_Base_ADDR + 4 * i)))
                val addr = (HW14_1_Config.Mem_Base_ADDR + 4 * i).toHexString
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