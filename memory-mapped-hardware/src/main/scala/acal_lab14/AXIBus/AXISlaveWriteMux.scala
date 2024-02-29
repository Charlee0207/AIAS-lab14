package AXIBus

import chisel3._
import chisel3.util._
import AXI._

class writeOut(val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Bundle {
  val writeResp = Flipped(Decoupled(new Axi4WriteResp(idWidth))) // response from slave to check write status
  val writeAddr = Decoupled(new Axi4Request(idWidth, addrWidth, dataWidth)) // output address to slave for writing data
  val writeData = Decoupled(new Axi4WriteData(dataWidth)) // output data to write into slave
}
class writeIn(val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Bundle {
  val writeAddr = Flipped(Decoupled(new Axi4Request(idWidth, addrWidth, dataWidth))) // input address from writebus
  val writeData = Flipped(Decoupled(new Axi4WriteData(dataWidth))) // input write data from  writebus
  val writeResp = Decoupled(new Axi4WriteResp(idWidth)) // output write response(response from slave) to writebus
}

class AXISlaveWriteMux(val nMasters: Int, val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Module {
  val io = IO(new Bundle {
    val out = new writeOut(idWidth, addrWidth, dataWidth)
    val in = Vec(nMasters, new writeIn(idWidth, addrWidth, dataWidth))
  })

  val arbiter = Module(new RRArbiter(new Axi4Request(idWidth, addrWidth, dataWidth), nMasters))

  for (i <- 0 until nMasters) {
    arbiter.io.in(i) <> io.in(i).writeAddr
  }

  // arbiter.io.in <> io.in
  io.out.writeAddr <> arbiter.io.out

  for (i <- 0 until nMasters) {
    io.in(i).writeData.ready := false.B
    io.in(i).writeResp.valid := false.B
    io.in(i).writeResp.bits.resp := 0.U
  }

  io.out.writeData <> io.in(arbiter.io.chosen.asUInt).writeData
  io.in(arbiter.io.chosen.asUInt).writeResp <> io.out.writeResp
}
