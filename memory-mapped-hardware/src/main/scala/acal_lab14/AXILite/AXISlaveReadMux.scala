package acal_lab14.AXILite

import chisel3._
import chisel3.util._
import chisel3.experimental.BundleLiterals._
import acal_lab14.AXI._

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

  val mask = WireDefault(VecInit(Seq.fill(nMasters)(1.U(1.W))))
  // state enum
  val sIdle :: sWaitResp :: sReturn :: Nil = Enum(3)
  // state register
  val state = RegInit(sIdle)

  val outstanding = WireDefault((0 until nMasters).map(i => io.in(i).readAddr.valid).reduce(_ | _))

  val arbiter = Module(new RRArbiter(Bool(), nMasters))
  val chosen_reg = RegInit(0.U)
  val ar_determined = RegInit(false.B) // true for read address determined
  val address_reg = RegInit(new Axi4Request(idWidth, addrWidth, dataWidth).Lit(
    _.addr -> 0.U,
    _.id    -> 0.U,
    _.size  -> 0.U
  ))
  val data_reg = RegInit((new Axi4ReadData(idWidth, dataWidth).Lit(
    _.id   -> 0.U,     // DontCare in AXILite
    _.data -> 0.U,
    _.resp -> 0.U,
    _.last -> false.B, // DontCare in AXILite
  )))

  io.out.readAddr.bits.qos := DontCare
  io.out.readAddr.bits.len := DontCare
  io.out.readAddr.bits.cache := DontCare
  io.out.readAddr.bits.lock := DontCare
  io.out.readAddr.bits.size := 0.U
  io.out.readAddr.bits.id := 0.U
  io.out.readAddr.bits.prot := DontCare
  io.out.readAddr.bits.region := DontCare
  io.out.readAddr.bits.burst := DontCare
  io.out.readData.ready := false.B
  arbiter.io.out.ready := true.B

  for (i <- 0 until nMasters) {
    io.in(i).readData.bits.data := 0.U
    io.in(i).readData.valid := false.B
    io.in(i).readData.bits.resp := 0.U
    io.in(i).readData.bits.id := 0.U
    io.in(i).readData.bits.last := true.B
  }

  for (i <- 0 until nMasters) {
    io.in(i).readAddr.ready := arbiter.io.in(i).ready & mask(i)
    arbiter.io.in(i).valid := io.in(i).readAddr.valid & mask(i)
    arbiter.io.in(i).bits := false.B  // DontCare
  }

  io.out.readAddr.valid := ar_determined

  switch(state){
    is(sIdle){
      when(outstanding){
        state := sWaitResp
      }
    }
    is(sWaitResp){
      when(io.out.readData.fire){
        state := sReturn
      }
    }
    is(sReturn){
      when(io.in(chosen_reg).readData.fire){
        state := sIdle
      }
    }
  }

  when(state === sIdle){
    mask.foreach(_ := 1.U)
    when(arbiter.io.out.valid){
      chosen_reg := arbiter.io.chosen
      address_reg <> io.in(arbiter.io.chosen).readAddr.bits
      ar_determined := true.B
    }
    io.out.readData.ready := false.B
  }
  .elsewhen(state === sWaitResp){
      mask.foreach(_ := 0.U)
      when(io.out.readAddr.fire){
        ar_determined := false.B
      }
      when(io.out.readData.fire){
        data_reg <> io.out.readData.bits
      }
      io.out.readData.ready := true.B
  }
  .elsewhen(state === sReturn){
    mask.foreach(_ := 0.U)
    io.in(chosen_reg).readData.valid := true.B
  }

  io.out.readAddr.bits <> address_reg
  io.in(chosen_reg).readData.bits <> data_reg
}
