package acal_lab14.AXILite

import chisel3._
import chisel3.util._
import acal_lab14.AXI._

class AXILiteXBar(val nMasters: Int, val mSlaves: Int, val idWidth: Int, val addrWidth: Int, val dataWidth: Int, val addrMap: Seq[(Int, Int)]) extends Module {
  val io = IO(new Bundle {
    val masters = Flipped(Vec(nMasters, new Axi4MasterIF(idWidth, addrWidth, dataWidth)))
    val slaves = Flipped(Vec(mSlaves, new Axi4SlaveIF(idWidth, addrWidth, dataWidth)))
  })

  // read channels
  val readBuses = List.fill(nMasters) {
    Module(new AXIReadBus(mSlaves, idWidth, addrWidth, dataWidth, addrMap))
  }
  val readMuxes = List.fill(mSlaves) {
    Module(new AXISlaveReadMux(nMasters, idWidth, addrWidth, dataWidth))
  }

  // write channels
  val writeBuses = List.fill(nMasters) {
    Module(new AXIWriteBus(mSlaves, idWidth, addrWidth, dataWidth, addrMap))
  }

  val writeMuxes = List.fill(mSlaves) {
    Module(new AXISlaveWriteMux(nMasters, idWidth, addrWidth, dataWidth))
  }

  (io.masters zip readBuses.map(_.io.master)).foreach { case (master, readBus) =>
    master.ar <> readBus.readAddr
    master.r <> readBus.readData
  }

  (io.masters zip writeBuses.map(_.io.master)).foreach { case (master, writeBus) =>
    master.aw <> writeBus.writeAddr
    master.w <> writeBus.writeData
    master.b <> writeBus.writeResp
  }
  (io.slaves zip readMuxes.map(_.io.out)).foreach {
    case (slave, readMuxOut) =>
      slave.ar <> readMuxOut.readAddr
      slave.r <> readMuxOut.readData
  }

  (io.slaves zip writeMuxes.map(_.io.out)).foreach {
    case (slave, writeMuxOut) =>
      slave.aw <> writeMuxOut.writeAddr
      slave.w <> writeMuxOut.writeData
      slave.b <> writeMuxOut.writeResp
  }

  for (m <- 0 until nMasters; s <- 0 until mSlaves) yield {
    readBuses(m).io.slave(s) <> readMuxes(s).io.in(m)
  }

  for (m <- 0 until nMasters; s <- 0 until mSlaves) yield {
    writeBuses(m).io.slave(s) <> writeMuxes(s).io.in(m)
  }

}



