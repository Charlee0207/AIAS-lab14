package acal_lab14.topVectorCPU

import chisel3._
import chisel3.util._

import acal_lab14.VectorCPU._
import acal_lab14.Memory._
import acal_lab14.AXIBus._

object config {
  val nMasters       = 1
  val id_width       = 2
  val addr_width     = 32
  val data_width     = 32
  val addr_map       = Seq((8000, 8000)) // First element specify the starting address and second element specify memory space size
  val nSlaves        = addr_map.length
  val instr_hex_path = "src/main/resource/VectorCPU/m_code.hex"
  val data_mem_size  = 16 // power of 2 in byte
  val data_hex_path  = "src/main/resource/VectorCPU/data.hex"
}

import config._

class top extends Module {
  val io = IO(new Bundle {
    val pc          = Output(UInt(15.W))
    val regs        = Output(Vec(32, UInt(32.W)))
    val Hcf         = Output(Bool())

    val cycle_count = Output(UInt(32.W))
  })

  val cpu = Module(new VectorCPU(id_width, addr_width, data_width, instr_hex_path))
  val dm  = Module(new DataMem(data_mem_size, addr_width, data_width, data_hex_path))
  val bus = Module(new AXILiteXBar(nMasters, nSlaves, id_width, addr_width, data_width, addr_map))

  // AXI Lite Bus
  bus.io.masters(0) <> cpu.io.bus_master
  bus.io.slaves(0) <> dm.io.bus_slave

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
    Array("-td", "generated/topVectorCPU")
  )
}
