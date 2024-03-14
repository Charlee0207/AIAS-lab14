package acal_lab14.topSystolicArray

import chisel3._
import chisel3.util._

import acal_lab14.SingleCycleCPU._
import acal_lab14.Memory._
import acal_lab14.SystolicArray._
import acal_lab14.AXILite._

object config {
  val nMasters       = 1 //  number of master
  val id_width       = 2  // id width
  val addr_width     = 32 // address width on bus
  val data_width     = 64 // data width on bus
  val reg_width      = 32 // reg width of MMIO_Regfile
  val addr_map       = Seq((8000, 8000), (100000, 200000))   // addr_map -> a list contains 2 allocation in memory space -> means there are 2 slaves
  val nSlaves        = addr_map.length
  val instr_hex_path = "src/main/resource/SystolicArray/m_code.hex"
  val data_mem_size  = 16 // power of 2 in byte (2^16 bytes DataMem)
  val data_hex_path  = "src/main/resource/SystolicArray/data.hex"
}

import config._

class top extends Module {
  val io = IO(new Bundle {
    val pc          = Output(UInt(15.W))
    val regs        = Output(Vec(32, UInt(32.W)))
    val Hcf         = Output(Bool())

    val cycle_count = Output(UInt(32.W))
  })

  val cpu = Module(new SingleCycleCPU(id_width, addr_width, data_width, instr_hex_path))
  val dm  = Module(new DataMem(id_width, data_mem_size, addr_width, data_width, data_hex_path))
  val sa  = Module(new topSA(id_width, addr_width, data_width, reg_width))
  // 1 master and 2 slaves
  val bus = Module(new AXILiteXBar(nMasters, nSlaves, id_width, addr_width, data_width, addr_map))

  // AXI Lite Bus
  bus.io.masters(0) <> cpu.io.bus_master
  bus.io.slaves(0) <> dm.io.bus_slave
  bus.io.slaves(1) <> sa.io.slave

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
    Array("-td", "generated/topSystolicArray")
  )
}
