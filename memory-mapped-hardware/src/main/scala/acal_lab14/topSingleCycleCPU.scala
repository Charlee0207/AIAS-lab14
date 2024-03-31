package acal_lab14.topSingleCycleCPU

import chisel3._
import chisel3.util._

import acal_lab14.SingleCycleCPU._
import acal_lab14.Memory._
import acal_lab14.AXI._
import acal_lab14.AXILite._
import Config._

/* -------------------------------------------------------------------------------------------+
 * topSingleCycleCPU consists of a single cycle CPU, SRAM, accelerator connected via AXI bus. |
 * This system demonstrates that CPU can access shared data memory via system bus. (Lab14-2-2)|
 * -------------------------------------------------------------------------------------------+
*/

class top extends Module {
 val io = IO(new Bundle {
   val pc          = Output(UInt(15.W))
   val regs        = Output(Vec(32, UInt(32.W)))
   val Hcf         = Output(Bool())

   val cycle_count = Output(UInt(32.W))
 })

  val cpu = Module(new SingleCycleCPU(Lab14_2_2_Config.s_id_width, Lab14_2_2_Config.addr_width, Lab14_2_2_Config.data_width, Lab14_2_2_Config.instr_hex_path))
  val dm  = Module(new DataMem(Lab14_2_2_Config.s_id_width, Lab14_2_2_Config.data_mem_size, Lab14_2_2_Config.addr_width, Lab14_2_2_Config.data_width, Lab14_2_2_Config.data_hex_path))
  val bus = Module(new AXILiteXBar(Lab14_2_2_Config.nMasters, Lab14_2_2_Config.nSlaves, Lab14_2_2_Config.s_id_width, Lab14_2_2_Config.addr_width, Lab14_2_2_Config.data_width, Lab14_2_2_Config.addr_map))

  // AXI Lite Bus
  bus.io.masters(0) <> cpu.io.master
  bus.io.slaves(0) <> dm.io.slave

  // System
  io.pc   := cpu.io.pc
  io.regs := cpu.io.regs
  io.Hcf  := cpu.io.Hcf

  val cycle_counter = RegInit(1.U(32.W))
  cycle_counter  := cycle_counter + 1.U
  io.cycle_count := cycle_counter
}

object top extends App {
 (new chisel3.stage.ChiselStage).emitVerilog(
   new top(),
   Array("-td", "generated/topSingleCycleCPU")
 )
}
