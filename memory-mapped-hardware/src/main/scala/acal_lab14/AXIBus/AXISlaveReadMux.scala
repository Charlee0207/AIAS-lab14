package Bus

import chisel3._
import chisel3.util._
import AXI._

class readOut(val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Bundle {
  val readAddr = Decoupled(new Axi4Request(idWidth, addrWidth, dataWidth)) // output address(from read bus) to slave
  val readData = Flipped(Decoupled(new Axi4ReadData(idWidth, dataWidth))) // input read data from slave
}
class readIn(val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Bundle {
  val readAddr = Flipped(Decoupled(new Axi4Request(idWidth, addrWidth, dataWidth))) // input address from readbus
  val readData = Decoupled(new Axi4ReadData(idWidth, dataWidth)) // output read data(from slave) to readbus
}

class AXISlaveReadMux(val nMasters: Int, val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Module {
  val io = IO(new Bundle {
    val out = new readOut(idWidth, addrWidth, dataWidth)
    val in = Vec(nMasters, new readIn(idWidth, addrWidth, dataWidth))
  })

  val arbiter = Module(new RRArbiter(new Axi4Request(idWidth, addrWidth, dataWidth), nMasters))
  val chosen_reg = RegNext(arbiter.io.chosen.asUInt) // synchronous read will return data in the next cycle
  for (i <- 0 until nMasters) {
    arbiter.io.in(i) <> io.in(i).readAddr
  }

  // arbiter.io.in <> io.in.readAddr
  io.out.readAddr <> arbiter.io.out
  for (i <- 0 until nMasters) {
    io.in(i).readData.bits.data := io.out.readData.bits.data
    io.in(i).readData.valid := false.B
    io.in(i).readData.bits.resp := 0.U
  }
  io.in(chosen_reg).readData <> io.out.readData
}
