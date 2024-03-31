package acal_lab14.SystolicArray

import chisel3._
import chisel3.util._

import acal_lab14.AXI._
import Config._

/** topSA module
  *
  * includes one Memory_Mapped module and one SA module
  *
  * pure wiring between these two modules and I/O interface
  */
class topSA(s_id_width: Int, addr_width: Int, data_width: Int, reg_width: Int, sa_mem_size: Int) extends Module {
  val io = IO(new Bundle {
    // slave interface for connecting to AXI bus
    val slave = new Axi4SlaveIF(s_id_width, addr_width, data_width)
    val tb_slave = new Axi4SlaveIF(s_id_width, addr_width, data_width)
    val tb_en = Input(Bool())
  })

  // module declaration
  val sa = Module(new SA(SA_config.dimX, SA_config.dimY, addr_width, data_width, reg_width))
  val mm = Module(new Memory_Mapped(sa_mem_size, s_id_width, addr_width, data_width, reg_width))

  // module wiring
  io.slave <> mm.io.slave
  mm.io.mmio <> sa.io.mmio

  // for internal buffer (local mem) >>>>>
  mm.io.raddr <> sa.io.raddr
  mm.io.rdata <> sa.io.rdata
  mm.io.waddr <> sa.io.waddr
  mm.io.wdata <> sa.io.wdata
  mm.io.wstrb <> sa.io.wstrb
  mm.io.wen <> sa.io.wen

  // testbench
  io.tb_slave <> mm.io.tb_slave
  mm.io.tb_en := io.tb_en
}
