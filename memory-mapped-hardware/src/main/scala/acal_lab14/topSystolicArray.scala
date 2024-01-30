package acal_lab14.topSystolicArray

import chisel3._
import chisel3.util._

import acal_lab14.VectorCPU._
import acal_lab14.Memory._
import acal_lab14.SystolicArray._
import acal_lab14.AXILite._

object config {
  val addr_width = 32 // address width on bus
  val data_width = 64 // data width on bus
  val reg_width  = 32 // reg width of MMIO_Regfile
  // addr_map -> a list contains 2 allocation in memory space -> means there are 2 slaves
  val addr_map       = List(("h8000".U, "h10000".U), ("h100000".U, "h2FFFFF".U))
  val instr_hex_path = "src/main/resource/SystolicArray/m_code.hex"
  val data_mem_size  = 16 // power of 2 in byte (2^16 bytes DataMem)
  val data_hex_path  = "src/main/resource/SystolicArray/data.hex"
}

import config._

class top extends Module {
  val io = IO(new Bundle {
    val pc          = Output(UInt(15.W))
    val regs        = Output(Vec(32, UInt(32.W)))
    val vector_regs = Output(Vec(32, UInt(64.W)))
    val Hcf         = Output(Bool())

    val cycle_count = Output(UInt(32.W))
  })

  val cpu = Module(new VectorCPU(addr_width, data_width, instr_hex_path))
  val dm  = Module(new DataMem(data_mem_size, addr_width, data_width, data_hex_path))
  val sa  = Module(new topSA(addr_width, data_width, reg_width))
  // 1 master and 2 slaves
  val bus = Module(new AXILiteXBar(1, addr_map.length, addr_width, data_width, addr_map))

  // AXI Lite Bus
  bus.io.masters(0) <> cpu.io.bus_master
  bus.io.slaves(0) <> dm.io.bus_slave
  bus.io.slaves(1) <> sa.io.slave

  // System
  io.pc   := cpu.io.pc
  io.regs := cpu.io.regs
  io.Hcf  := cpu.io.Hcf

  io.vector_regs := cpu.io.vector_regs

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
