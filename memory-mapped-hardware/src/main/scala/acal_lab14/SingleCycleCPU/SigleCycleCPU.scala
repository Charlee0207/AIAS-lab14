package acal_lab14.SingleCycleCPU

import chisel3._
import chisel3.util._

import acal_lab14.AXI._

import acal_lab14.SingleCycleCPU.Memory._
import acal_lab14.SingleCycleCPU.Controller._
import acal_lab14.SingleCycleCPU.Datapath._

import acal_lab14.SingleCycleCPU.opcode_map._

class SingleCycleCPU(mIdWidth: Int, memAddrWidth: Int, memDataWidth: Int, instrBinaryFile: String) extends Module {
  val io = IO(new Bundle {
    // AXI
    val master = new Axi4MasterIF(mIdWidth, memAddrWidth, memDataWidth)

   // System
   val pc          = Output(UInt(15.W))
   val regs        = Output(Vec(32, UInt(32.W)))
   val Hcf         = Output(Bool())
 })

  // Module
  val im  = Module(new InstMem(15, instrBinaryFile))
  val ct  = Module(new Controller(mIdWidth, memAddrWidth, memDataWidth))
  val pc  = Module(new PC())
  val ig  = Module(new ImmGen())
  val rf  = Module(new RegFile(2))
  val alu = Module(new ALU())
  val bc  = Module(new BranchComp())


 // wire
 val opcode    = Wire(UInt(7.W))
 val rd        = Wire(UInt(5.W))
 val rs1       = Wire(UInt(5.W))
 val rs2       = Wire(UInt(5.W))
 val funct3    = Wire(UInt(3.W))
 val inst_31_7 = Wire(UInt(25.W))

  opcode    := im.io.inst(6, 0)
  rd        := im.io.inst(11, 7)
  rs1       := im.io.inst(19, 15)
  rs2       := im.io.inst(24, 20)
  funct3    := im.io.inst(14, 12)
  inst_31_7 := im.io.inst(31, 7)

  // PC
  pc.io.PCSel   := ct.io.PCSel
  pc.io.alu_out := alu.io.out
  pc.io.Hcf     := ct.io.Hcf

 // Insruction Memory
 im.io.raddr := pc.io.pc

 // ImmGen
 ig.io.ImmSel    := ct.io.ImmSel
 ig.io.inst_31_7 := inst_31_7

  // RegFile
  rf.io.raddr(0) := rs1
  rf.io.raddr(1) := rs2
  rf.io.wen      := ct.io.RegWEn
  rf.io.waddr    := rd
  rf.io.wdata := MuxLookup(
    ct.io.WBSel,
    0.U,
    Seq(
      0.U -> MuxLookup(
        funct3,
        io.master.r.bits.data(31, 0),
        Seq(
          "b000".U(3.W) -> Cat(Fill(24, io.master.r.bits.data(7)), io.master.r.bits.data(7, 0)),
          "b001".U(3.W) -> Cat(Fill(16, io.master.r.bits.data(15)), io.master.r.bits.data(15, 0)),
          "b010".U(3.W) -> io.master.r.bits.data(31, 0),
          "b100".U(3.W) -> Cat(0.U(24.W), io.master.r.bits.data(7, 0)),
          "b101".U(3.W) -> Cat(0.U(16.W), io.master.r.bits.data(15, 0))
        )
      ),
      1.U -> alu.io.out,      // from ALU
      2.U -> (pc.io.pc + 4.U) // from (PC + 4)
    )
  )


 // ALU
 val rdata_or_zero = Mux(ct.io.Lui, 0.U(32.W), rf.io.rdata(0))
 alu.io.src1 := MuxLookup(
   ct.io.ASel,
   0.U,
   Seq(
     0.U -> rdata_or_zero,
     1.U -> pc.io.pc
   )
 )
 alu.io.src2 := MuxLookup(
   ct.io.BSel,
   0.U,
   Seq(
     0.U -> rf.io.rdata(1),
     1.U -> ig.io.imm,
   )
 )
 alu.io.ALUSel := ct.io.ALUSel


 // Branch Comparator
 bc.io.BrUn := ct.io.BrUn
 bc.io.src1 := rf.io.rdata(0)
 bc.io.src2 := rf.io.rdata(1)

 // Controller
 ct.io.Inst := im.io.inst
 ct.io.BrEq := bc.io.BrEq
 ct.io.BrLT := bc.io.BrLT

  // AXI Bus
  io.master.aw <> ct.io.aw
  io.master.w <> ct.io.w
  io.master.b <> ct.io.b
  io.master.ar <> ct.io.ar
  io.master.r <> ct.io.r

  io.master.ar.bits.addr  := alu.io.out
  io.master.aw.bits.addr := alu.io.out
  io.master.w.bits.data := rf.io.rdata(1)
  io.master.w.bits.strb := MuxLookup(opcode, 0.U,
  Seq(
    STORE -> (MuxLookup(
        funct3,
        0.U,
        Seq(
          "b000".U(3.W) -> "b1".U,
          "b001".U(3.W) -> "b11".U,
          "b010".U(3.W) -> "b1111".U
        )
      )),
    )
  )

 // System
 io.pc          := pc.io.pc
 io.regs        := rf.io.regs
 io.Hcf         := ct.io.Hcf
}
