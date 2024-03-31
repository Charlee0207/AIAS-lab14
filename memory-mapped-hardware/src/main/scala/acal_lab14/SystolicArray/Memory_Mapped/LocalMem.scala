package acal_lab14.SystolicArray

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

import Config._

/** LocalMem module
  *
  * includes internal memory and systolic array, also the control logics
  *
  * @param mem_size
  *   the size of internal mem
  * @param addr_width
  *   bit width of address
  * @param data_width
  *   bit width of data
  */
class LocalMem(mem_size: Int, addr_width: Int, data_width: Int) extends Module {
  val io = IO(new Bundle {
    // from SA(slave) or CPU(master)
    val raddr = Input(UInt(addr_width.W))
    val rdata = Output(UInt(data_width.W))

    val wen   = Input(Bool())
    val waddr = Input(UInt(addr_width.W))
    val wdata = Input(UInt(data_width.W))
    val wstrb = Input(UInt((data_width >> 3).W))
  })
  val byte = 8 // constant

  // use SyncReadMem module from chisel.util
  val localMem = SyncReadMem(mem_size, UInt(data_width.W))
  // preload data from hex file (Comment this line for running acal_lab14.topSystolicArray.topTest)
//   loadMemoryFromFile(localMem, "src/main/resource/SystolicArray/LocalMem.hex")

  // wires declaration
  // address -> truncate lower 2 bits to transfer byte addr to word address
  val raddr_aligned = WireDefault(io.raddr >> log2Ceil(data_width>>3))
  val waddr_aligned = WireDefault(io.waddr >> log2Ceil(data_width>>3))
  val wdata_mask    = Wire(Vec(data_width >> 3, UInt(byte.W))) // write data after masked

  wdata_mask := DontCare // avoid compilation error when signal is not fully initialized

  // read port ==> refer to [SyncReadMem - One read port & one write port](https://www.chisel-lang.org/docs/explanations/memories#read-portwrite-port)
  io.rdata := localMem.read(raddr_aligned)

  // memory write
  when(io.wen) {
    // do byte mask
    List.range(0, data_width >> 3).map { index =>
      wdata_mask(index) := Mux(
        io.wstrb(index) === 1.U,
        io.wdata(byte * (index + 1) - 1, byte * index),
        0.U
      )
    }
    // write port ==> refer to [SyncReadMem - One read port & one write port](https://www.chisel-lang.org/docs/explanations/memories#read-portwrite-port)
    localMem.write(waddr_aligned, wdata_mask.asTypeOf(UInt(data_width.W)))
  }
}

object LocalMemTop extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(
    new LocalMem(SA_config.sa_mem_size, 32, 64),
    Array("-td", "generated/LocalMem")
  )
}
