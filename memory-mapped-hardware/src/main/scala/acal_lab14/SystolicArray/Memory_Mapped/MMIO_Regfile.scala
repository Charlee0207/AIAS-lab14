package acal_lab14.SystolicArray

import chisel3._
import chisel3.util._

import acal_lab14.AXILite._

/** MMIO_regfile module
  *
  * has totally 15 registers inside
  *
  * @param reg_width
  *   bit width of data in each registers
  */
class MMIO(val reg_width: Int) extends Bundle {
  // For computing
  val ENABLE_OUT     = Output(Bool())
  val STATUS_OUT     = Output(Bool())
  val MATA_SIZE      = Output(UInt(reg_width.W))
  val MATB_SIZE      = Output(UInt(reg_width.W))
  val MATC_SIZE      = Output(UInt(reg_width.W))
  val MATA_MEM_ADDR  = Output(UInt(reg_width.W))
  val MATB_MEM_ADDR  = Output(UInt(reg_width.W))
  val MATC_MEM_ADDR  = Output(UInt(reg_width.W))
  val MAT_MEM_STRIDE = Output(UInt(reg_width.W))  // [23:16]: MATC_MEM_STRIDE, [15:8]: MATB_MEM_STRIDE, [7:0]: MATA_MEM_STRIDE
  val MAT_BUF        = Output(UInt(reg_width.W))

  // For loading data
  val LOAD_EN       = Output(Bool())            // Set to 1 by CPU to enable transfer data
  val LOAD_DONE     = Output(Bool())            // Set to 1 by MM to indicate transfer is completed
  val SRC_INFO      = Output(UInt(reg_width.W)) // Source address
  val DST_INFO      = Output(UInt(reg_width.W)) // Destination address
  val SIZE_CFG      = Output(UInt(reg_width.W)) // [31:24]: SRC byte stride, [23:16]: DST byte stride, [15:8]: tensor byte width, [7:0]: tensor byte height

  // For writing
  val WEN       = Input(Bool())
  val ENABLE_IN = Input(Bool())
  val STATUS_IN = Input(Bool())

  override def clone = { new MMIO(reg_width).asInstanceOf[this.type] }
}

class MMIO_Regfile(addr_width: Int, reg_width: Int) extends Module {
  val io = IO(new Bundle {
    // for SystolicArray MMIO
    val mmio = new MMIO(reg_width)

    // for Memory Mapped to r/w reg value
    val raddr = Input(UInt(addr_width.W))
    val rdata = Output(UInt(reg_width.W))

    val wen   = Input(Bool())
    val waddr = Input(UInt(addr_width.W))
    val wdata = Input(UInt(reg_width.W))

    val transfer_done = Input(Bool())
  })

  // this initial_table is used for lab testing
  // it may become useless when doing your homework
  val initial_table = Seq(
    // For computing
    0.U(reg_width.W),           // ENABLE
    0.U(reg_width.W),           // STATUS
    "h00030003".U(reg_width.W), // MATA_SIZE
    "h00030003".U(reg_width.W), // MATB_SIZE
    "h00030003".U(reg_width.W), // MATC_SIZE
    0.U(reg_width.W),           // MATA_MEM_ADDR
    16.U(reg_width.W),          // MATB_MEM_ADDR
    32.U(reg_width.W),          // MATC_MEM_ADDR
    "h010101".U(reg_width.W),   // MAT_MEM_STRIDE
    48.U(reg_width.W),          // MAT_BUF
    // For loading
    0.U(reg_width.W),           // LOAD_EN
    0.U(reg_width.W),           // LOAD_DONE
    0.U(reg_width.W),           // SRC_INFO
    0.U(reg_width.W),           // DST_INFO
    0.U(reg_width.W),           // SIZE_CFG
  )

  // totally 15 registers
  val RegFile = RegInit(VecInit(initial_table))

  // MMIO circuit declaration
  // Output
  io.mmio.ENABLE_OUT     := RegNext(RegFile(0)(0).asBool)
  io.mmio.STATUS_OUT     := RegNext(RegFile(1)(0).asBool)
  io.mmio.MATA_SIZE      := RegNext(RegFile(2))
  io.mmio.MATB_SIZE      := RegNext(RegFile(3))
  io.mmio.MATC_SIZE      := RegNext(RegFile(4))
  io.mmio.MATA_MEM_ADDR  := RegNext(RegFile(5))
  io.mmio.MATB_MEM_ADDR  := RegNext(RegFile(6))
  io.mmio.MATC_MEM_ADDR  := RegNext(RegFile(7))
  io.mmio.MAT_MEM_STRIDE := RegNext(RegFile(8))
  io.mmio.MAT_BUF        := RegNext(RegFile(9))
  io.mmio.LOAD_EN        := RegNext(RegFile(10)(0).asBool)
  io.mmio.LOAD_DONE      := RegNext(RegFile(11)(0).asBool)
  io.mmio.SRC_INFO       := RegNext(RegFile(12))
  io.mmio.DST_INFO       := RegNext(RegFile(13))
  io.mmio.SIZE_CFG       := RegNext(RegFile(14))

  // when io.mmio.WEN === true.B -> SA attempt to write MMIO_RegFIle
  when(io.mmio.WEN) {
    RegFile(1) := io.mmio.STATUS_IN.asUInt
    RegFile(0) := io.mmio.ENABLE_IN.asUInt
  }

  when(io.transfer_done) {
    RegFile(10) := 0.U
    RegFile(11) := 1.U
  }

  // when io.wen === true.B -> some master send request(except for SA) to r/w MMIO_RegFIle
  // SA will r/w MMIO_Regfile cross MMIO interface, not io.wen
  io.rdata := RegFile(io.raddr)
  when(io.wen) { RegFile(io.waddr) := io.wdata }
}

object MMIO_Regfile extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(
    new MMIO_Regfile(32, 32),
    args
  )
}
