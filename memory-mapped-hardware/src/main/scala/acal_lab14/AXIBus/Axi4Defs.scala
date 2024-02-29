package AXI

import chisel3._
import chisel3.util._

class Axi4Request(val id_width: Int, val addr_width: Int, val data_width: Int) extends Bundle {
  val id     = UInt(id_width.W)
  val addr   = UInt(addr_width.W)
  val region = UInt(4.W)
  val len    = UInt(8.W)
  val size   = UInt((log2Ceil(data_width / 8)).W)
  val burst  = UInt(2.W)
  val lock   = UInt(1.W)
  val cache  = UInt(4.W)
  val prot   = UInt(3.W)
  val qos    = UInt(4.W)

  override def clone: Axi4Request = {
    new Axi4Request(id_width, addr_width, data_width).asInstanceOf[this.type]
  }
}

class Axi4WriteData(val data_width: Int) extends Bundle {
  val data = UInt(data_width.W)
  val strb = UInt((data_width / 8).W)
  val last = Bool()

  override def clone: Axi4WriteData = {
    new Axi4WriteData(data_width).asInstanceOf[this.type]
  }
}

class Axi4ReadData(val id_width: Int, val data_width: Int, val resp_width: Int = 2) extends Bundle {
  val id   = UInt(id_width.W)
  val data = UInt(data_width.W)
  val resp = UInt(resp_width.W)
  val last = Bool()

  override def clone: Axi4ReadData = {
    new Axi4ReadData(id_width, data_width, resp_width).asInstanceOf[this.type]
  }
}

class Axi4WriteResp(val id_width: Int, val resp_width: Int = 2) extends Bundle {
  val id   = UInt(id_width.W)
  val resp = UInt(resp_width.W)

  override def clone: Axi4WriteResp = {
    new Axi4WriteResp(id_width, resp_width).asInstanceOf[this.type]
  }
}

class Axi4MasterIF(
    val id_width: Int,
    val addr_width: Int,
    val data_width: Int,
    val resp_width: Int = 2
) extends Bundle {
  // write request channel
  val aw = Decoupled(new Axi4Request(id_width, addr_width, data_width))

  // write data channel
  val w = Decoupled(new Axi4WriteData(data_width))

  // write response channel
  val b = Flipped(Decoupled(new Axi4WriteResp(id_width, resp_width)))

  // read request channel
  val ar = Decoupled(new Axi4Request(id_width, addr_width, data_width))

  // read data channel
  val r = Flipped(Decoupled(new Axi4ReadData(id_width, data_width, resp_width)))

  override def clone: Axi4MasterIF = {
    new Axi4MasterIF(id_width, addr_width, data_width, resp_width).asInstanceOf[this.type]
  }
}

class Axi4SlaveIF(
    val id_width: Int,
    val addr_width: Int,
    val data_width: Int,
    val resp_width: Int = 2
) extends Bundle {
  // write request channel
  val aw = Flipped(Decoupled(new Axi4Request(id_width, addr_width, data_width)))

  // write data channel
  val w = Flipped(Decoupled(new Axi4WriteData(data_width)))

  // write response channel
  val b = Decoupled(new Axi4WriteResp(id_width, resp_width))

  // read request channel
  val ar = Flipped(Decoupled(new Axi4Request(id_width, addr_width, data_width)))

  // read data channel
  val r = Decoupled(new Axi4ReadData(id_width, data_width, resp_width))

  override def clone: Axi4SlaveIF = {
    new Axi4SlaveIF(id_width, addr_width, data_width, resp_width).asInstanceOf[this.type]
  }
}
