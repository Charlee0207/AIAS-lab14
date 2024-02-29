package Bus

import chisel3._
import chisel3.util._
import AXI._

class readMaster(val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Bundle {
  val readAddr = Flipped(Decoupled(new Axi4Request(idWidth, addrWidth, dataWidth)))
  val readData = Decoupled(new Axi4ReadData(idWidth, dataWidth))
}

class readSlave(val idWidth: Int, val addrWidth: Int, val dataWidth: Int) extends Bundle {
  val readAddr = Decoupled(new Axi4Request(idWidth, addrWidth, dataWidth))
  val readData = Flipped(Decoupled(new Axi4ReadData(idWidth, dataWidth)))
}

class AXIReadBus(val mSlaves: Int, val idWidth: Int, val addrWidth: Int, val dataWidth: Int, val addrMap: Seq[(Int,Int)]) extends Module {
  val io = IO(new Bundle {
    val master = new readMaster(idWidth, addrWidth, dataWidth)
    val slave = Vec(mSlaves, new readSlave(idWidth, addrWidth, dataWidth))
  })

  val read_port = MuxCase(0.U, addrMap.zipWithIndex.map { case ((startAddress, size), index) =>
    (io.master.readAddr.bits.addr >= startAddress.U && io.master.readAddr.bits.addr < (startAddress + size).U) -> index.U
  })
  val read_port_reg = RegInit(0.U(addrMap.length.W))
  val read_addr_reg = RegInit(0.U((addrWidth).W))
  val read_addr_reg_valid = RegInit(false.B)
  val outstanding = RegInit(false.B) // outstanding request refers to a data request that has not been resolved or serviced yet



  for (i <- 0 until mSlaves) {
    io.slave(i).readAddr.valid := false.B
    io.slave(i).readAddr.bits.addr := 0.U
    io.slave(i).readAddr.bits.id := DontCare
    io.slave(i).readAddr.bits.region := DontCare
    io.slave(i).readAddr.bits.len := DontCare
    io.slave(i).readAddr.bits.size := DontCare
    io.slave(i).readAddr.bits.burst := DontCare
    io.slave(i).readAddr.bits.lock := DontCare
    io.slave(i).readAddr.bits.cache := DontCare
    io.slave(i).readAddr.bits.prot := DontCare
    io.slave(i).readAddr.bits.qos := DontCare
    io.slave(i).readData.ready := false.B
  }

  io.master.readData.valid := false.B
  io.master.readData.bits.data := 0.U
  io.master.readData.bits.resp := 0.U
  io.master.readData.bits.id := DontCare
  io.master.readData.bits.last := DontCare
  io.master.readAddr.ready := ~outstanding

  when(io.master.readAddr.fire) {
    outstanding := true.B
    read_port_reg := read_port
    read_addr_reg := io.master.readAddr.bits.addr
    read_addr_reg_valid := true.B
  }

  when(read_addr_reg_valid) {
    when(io.slave(read_port_reg).readAddr.ready) {
      read_addr_reg_valid := false.B
    }
  }

  when(outstanding) {
    io.master.readData.valid := io.slave(read_port_reg).readData.valid
    io.master.readData.bits.data := io.slave(read_port_reg).readData.bits.data
    io.master.readData.bits.resp := io.slave(read_port_reg).readData.bits.resp
    io.slave(read_port_reg).readAddr.bits.addr := read_addr_reg
    io.slave(read_port_reg).readAddr.valid := read_addr_reg_valid
    io.slave(read_port_reg).readData.ready := io.master.readData.ready
    when(io.master.readData.fire) {
      outstanding := false.B
    }
  }


}
