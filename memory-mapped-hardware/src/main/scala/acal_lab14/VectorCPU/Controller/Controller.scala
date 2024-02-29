package acal_lab14.VectorCPU.Controller

import chisel3._
import chisel3.util._

import acal_lab14.AXILite._

import acal_lab14.VectorCPU.opcode_map._
import acal_lab14.VectorCPU.condition._
import acal_lab14.VectorCPU.inst_type._

class Controller(memAddrWidth: Int, memDataWidth: Int) extends Module {
  val io = IO(new Bundle {
    val Inst = Input(UInt(32.W))
    val BrEq = Input(Bool())
    val BrLT = Input(Bool())

    // AXI Bus
    val writeAddr = Decoupled(new AXILiteAddress(memAddrWidth))
    val writeData = Decoupled(new AXILiteWriteData(memDataWidth))
    val writeResp = Flipped(Decoupled(UInt(2.W)))
    val readAddr  = Decoupled(new AXILiteAddress(memAddrWidth))
    val readData  = Flipped(Decoupled(new AXILiteReadData(memDataWidth)))

    val PCSel  = Output(UInt(2.W))
    val ImmSel = Output(UInt(3.W))
    val RegWEn = Output(Bool())
    val BrUn   = Output(Bool())
    val ASel   = Output(UInt(1.W))
    val BSel   = Output(UInt(2.W))
    val ALUSel = Output(UInt(15.W))
    val MemRW  = Output(Bool())
    val MemSel = Output(UInt(1.W))
    val WBSel  = Output(UInt(2.W))

    val Lui = Output(Bool())
    val Hcf = Output(Bool())

  })

  val opcode = io.Inst(6, 0)
  val funct3 = io.Inst(14, 12)
  val funct6 = io.Inst(31, 26)
  val funct7 = io.Inst(31, 25)
  val rs2    = io.Inst(24, 20)
  val alu_op = Wire(UInt(15.W))

  val sNormal :: sAXIReadSend :: sAXIReadWait :: sAXIWriteSend :: sAXIWriteWait :: Nil = Enum(5)

  val DataMemAccessState = RegInit(sNormal)

  val isDataLoad  = Wire(Bool())
  val isDataStore = Wire(Bool())
  isDataLoad  := (opcode === LOAD)
  isDataStore := (opcode === STORE)

  // DataMemAccessState - next state decoder
  switch(DataMemAccessState) {
    is(sNormal) {
      when(isDataLoad) {
        DataMemAccessState := Mux(io.readAddr.ready, sAXIReadWait, sAXIReadSend)
      }.elsewhen(isDataStore) {
        DataMemAccessState := Mux((io.writeAddr.ready & io.writeData.ready), sAXIWriteWait, sAXIWriteSend)
      }.otherwise {
        DataMemAccessState := sNormal
      }
    }
    is(sAXIReadSend) {
      DataMemAccessState := Mux(io.readAddr.ready, sAXIReadWait, sAXIReadSend)
    }
    is(sAXIReadWait) {
      DataMemAccessState := Mux(io.readData.valid, sNormal, sAXIReadWait)
    }
    is(sAXIWriteSend) {
      DataMemAccessState := Mux((io.writeAddr.ready & io.writeData.ready), sAXIWriteWait, sAXIWriteSend)
    }
    is(sAXIWriteWait) {
      DataMemAccessState := Mux(io.writeResp.valid, sNormal, sAXIWriteWait)
    }
  }

  // AXI output gnenrator
  io.readAddr.valid      := false.B
  io.readAddr.bits.addr  := 0.U
  io.readData.ready      := false.B
  io.writeAddr.valid     := false.B
  io.writeAddr.bits.addr := 0.U
  io.writeData.valid     := false.B
  io.writeData.bits.data := 0.U
  io.writeData.bits.strb := 0.U
  io.writeResp.ready     := false.B

  switch(DataMemAccessState) {
    is(sNormal) {
      io.readAddr.valid  := isDataLoad
      io.writeAddr.valid := (isDataStore & io.writeAddr.ready & io.writeData.ready)
      io.writeData.valid := (isDataStore & io.writeAddr.ready & io.writeData.ready)
    }
    is(sAXIReadSend) {
      io.readAddr.valid := Mux(io.readAddr.ready, true.B, false.B)
    }
    is(sAXIReadWait) {
      io.readData.ready := true.B
    }
    is(sAXIWriteSend) {
      io.writeAddr.valid := (isDataStore & io.writeAddr.ready & io.writeData.ready)
      io.writeData.valid := (isDataStore & io.writeAddr.ready & io.writeData.ready)
    }
    is(sAXIWriteWait) {
      io.writeResp.ready := true.B
    }
  }

  when(opcode === OP) {
    when((funct7 === "b0000100".U) & (funct3 === "b100".U)) {
      // ZEXT_H
      alu_op := Cat(funct7, 0.U(5.W), funct3)

    }.otherwise {
      // other R-type instructions (standard & bitmanip)
      alu_op := Cat(funct7, "b11111".U, funct3)
    }
  }.elsewhen(opcode === OP_IMM) {
    when((funct3 === "b101".U) & ((funct7 === "b0110000".U) | (funct7 === "b0100100".U))) {
      // bitmanip operation that have corresponding R-type instruction
      // RORI, BEXTI
      alu_op := Cat(funct7, "b11111".U, funct3)

    }.elsewhen((funct3 === "b001".U) & (funct7(2) === 1.U)) {
      // bitmanip operation that have corresponding R-type instruction
      // BCLRI, BSETI, BINVI
      alu_op := Cat(funct7, "b11111".U, funct3)

    }.elsewhen(((funct3 === "b001".U) | (funct3 === "b101".U)) & (funct7(4) === 1.U)) {
      // other bitmanip operations
      // CLZ, CTZ, CPOP, SEXT_B, SEXT_H, REV8, ORC_B
      alu_op := Cat(funct7, rs2, funct3)

    }.elsewhen((funct3 === "b001".U) | (funct3 === "b101".U)) {
      // standard I-type instructions with shamt
      // SLLI, SRLI, SRAI
      alu_op := Cat(funct7, "b11111".U, funct3)

    }.otherwise {
      // other I-type instructions
      alu_op := Cat(0.U(7.W), "b11111".U, funct3)
    }
  }.otherwise {
    // ADD
    alu_op := Cat(0.U(7.W), "b11111".U, 0.U(3.W))
  }

  // Control signal - PC
  io.PCSel := 0.U
  switch(DataMemAccessState) {
    is(sNormal) {
      when(isDataLoad | isDataStore) {
        io.PCSel := 2.U
      }.otherwise {
        io.PCSel := MuxLookup(
          opcode,
          0.U,
          Seq(
            BRANCH -> MuxLookup(
              funct3,
              0.U,
              Seq(
                "b000".U(3.W) -> io.BrEq.asUInt,
                "b001".U(3.W) -> ~io.BrEq.asUInt,
                "b100".U(3.W) -> io.BrLT.asUInt,
                "b101".U(3.W) -> ~io.BrLT.asUInt,
                "b110".U(3.W) -> io.BrLT.asUInt,
                "b111".U(3.W) -> ~io.BrLT.asUInt
              )
            ),
            JALR -> 1.U,
            JAL  -> 1.U
          )
        )
      }
    }
    is(sAXIReadSend) {
      io.PCSel := 2.U
    }
    is(sAXIReadWait) {
      io.PCSel := Mux(io.readData.valid, 0.U, 2.U)
    }
    is(sAXIWriteSend) {
      io.PCSel := 2.U
    }
    is(sAXIWriteWait) {
      io.PCSel := Mux(io.writeResp.valid, 0.U, 2.U)
    }
  }

  // Control signal - Branch comparator
  io.BrUn := (io.Inst(13) === 1.U)

  // Control signal - Immediate generator
  io.Lui := (opcode === LUI)
  io.ImmSel := MuxLookup(
    opcode,
    0.U,
    Seq(
      OP_IMM -> I_type,
      LOAD   -> I_type,
      STORE  -> S_type,
      BRANCH -> B_type,
      JALR   -> I_type,
      JAL    -> J_type,
      LUI    -> U_type,
      AUIPC  -> U_type
    )
  )

  // Control signal - Scalar ALU
  io.ASel := MuxLookup(
    opcode,
    0.U,
    Seq(
      BRANCH -> 1.U,
      JAL    -> 1.U,
      AUIPC  -> 1.U
    )
  )
  io.BSel := MuxLookup(
    opcode,
    1.U,
    Seq(
      OP -> 0.U,
    )
  )
  io.ALUSel := alu_op

  // Control signal - Memory
  io.MemRW := MuxLookup(
    opcode,
    false.B,
    Seq(
      STORE -> true.B,
    )
  )
  io.MemSel := MuxLookup(
    opcode,
    0.U,
    Seq(
      STORE -> 0.U,
    )
  )

  // Control signal - Scalar Write Back
  io.RegWEn := false.B
  switch(DataMemAccessState) {
    is(sNormal) {
      io.RegWEn := MuxLookup(
        opcode,
        false.B,
        Seq(
          JALR   -> true.B,
          JAL    -> true.B,
          OP_IMM -> true.B,
          OP     -> true.B,
          AUIPC  -> true.B,
          LUI    -> true.B
        )
      )
    }
    is(sAXIReadSend) {
      io.RegWEn := false.B
    }
    is(sAXIReadWait) {
      io.RegWEn := Mux((io.readData.valid & (opcode === LOAD)), true.B, false.B)
    }
    is(sAXIWriteSend) {
      io.RegWEn := false.B
    }
    is(sAXIWriteWait) {
      io.RegWEn := false.B
    }
  }

  io.WBSel := MuxLookup(
    opcode,
    1.U,
    Seq(
      LOAD -> 0.U,
      JALR -> 2.U,
      JAL  -> 2.U
    )
  )

  // Control signal - Others
  io.Hcf := (opcode === HCF)
}
