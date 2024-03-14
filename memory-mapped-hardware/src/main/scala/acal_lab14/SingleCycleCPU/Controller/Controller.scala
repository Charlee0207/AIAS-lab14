package acal_lab14.SingleCycleCPU.Controller

import chisel3._
import chisel3.util._

import acal_lab14.AXI._

import acal_lab14.SingleCycleCPU.opcode_map._
import acal_lab14.SingleCycleCPU.condition._
import acal_lab14.SingleCycleCPU.inst_type._

class Controller(mIdWidth: Int , memAddrWidth: Int, memDataWidth: Int) extends Module {
  val io = IO(new Bundle {
    val Inst = Input(UInt(32.W))
    val BrEq = Input(Bool())
    val BrLT = Input(Bool())

    // AXI master interface signals
    val aw = Decoupled(new Axi4Request(mIdWidth, memAddrWidth, memDataWidth))
    val w = Decoupled(new Axi4WriteData(memDataWidth))
    val b = Flipped(Decoupled(new Axi4WriteResp(mIdWidth)))
    val ar  = Decoupled(new Axi4Request(mIdWidth, memAddrWidth, memDataWidth))
    val r  = Flipped(Decoupled(new Axi4ReadData(mIdWidth, memDataWidth)))

    val PCSel  = Output(UInt(2.W))
    val ImmSel = Output(UInt(3.W))
    val RegWEn = Output(Bool())
    val BrUn   = Output(Bool())
    val ASel   = Output(UInt(1.W))
    val BSel   = Output(UInt(2.W))
    val ALUSel = Output(UInt(15.W))
    val WBSel  = Output(UInt(2.W))

   val Lui = Output(Bool())
   val Hcf = Output(Bool())

 })

  // alu_op signals
  val alu_op = Wire(UInt(15.W))

  // instruction decoder
  val opcode = io.Inst(6, 0)
  val funct3 = io.Inst(14, 12)
  val funct7 = io.Inst(31, 25)
  val rs2    = io.Inst(24, 20)

  // ------------------------------------------------
  // --------- FSM for AXI master interface ---------
  // ------------------------------------------------

  // state enum
  val sNormal :: sAXIReadSend :: sAXIReadWait :: sAXIWriteSend :: sAXIWriteWait :: Nil = Enum(5)

  // state register
  val DataMemAccessState = RegInit(sNormal)

  // input signals
  val isDataLoad  = Wire(Bool())
  val isDataStore = Wire(Bool())
  isDataLoad  := (opcode === LOAD)
  isDataStore := (opcode === STORE)

  // Default assignment of AXI master interface signals
  // ---- ar channel ----
  io.ar.valid       := false.B
  io.ar.bits.id     := 0.U
  io.ar.bits.addr   := 0.U
  io.ar.bits.region := 0.U
  io.ar.bits.len    := 0.U     // 1 beat in a burst
  io.ar.bits.size   := "b10".U // 4 bytes per beat
  io.ar.bits.burst  := "b00".U // fixed burst type
  io.ar.bits.lock   := 0.U
  io.ar.bits.cache  := 0.U
  io.ar.bits.prot   := 0.U
  io.ar.bits.qos    := 0.U
  // ---- r channel ----
  io.r.ready      := false.B
  // ---- aw channel ----
  io.aw.valid       := false.B
  io.aw.bits.id     := 0.U
  io.aw.bits.addr   := 0.U
  io.aw.bits.region := 0.U
  io.aw.bits.len    := 0.U     // 1 beat in a burst
  io.aw.bits.size   := "b10".U // 4 bytes per beat
  io.aw.bits.burst  := "b00".U // fixed burst type
  io.aw.bits.lock   := 0.U
  io.aw.bits.cache  := 0.U
  io.aw.bits.prot   := 0.U
  io.aw.bits.qos    := 0.U
  // ---- w channel ----
  io.w.valid     := false.B
  io.w.bits.data := 0.U
  io.w.bits.strb := 0.U
  io.w.bits.last := false.B
  // ---- b channel ----
  io.b.ready     := false.B



  // DataMemAccessState - next state decoder
  switch(DataMemAccessState) {
    is(sNormal) {
      when(isDataLoad) {
        DataMemAccessState := Mux(io.ar.ready, sAXIReadWait, sAXIReadSend)
      }.elsewhen(isDataStore) {
        DataMemAccessState := Mux((io.aw.ready & io.w.ready), sAXIWriteWait, sAXIWriteSend)
      }.otherwise {
        DataMemAccessState := sNormal
      }
    }
    is(sAXIReadSend) {
      DataMemAccessState := Mux(io.ar.ready, sAXIReadWait, sAXIReadSend)
    }
    is(sAXIReadWait) {
      DataMemAccessState := Mux(io.r.valid, sNormal, sAXIReadWait)
    }
    is(sAXIWriteSend) {
      DataMemAccessState := Mux((io.aw.ready & io.w.ready), sAXIWriteWait, sAXIWriteSend)
    }
    is(sAXIWriteWait) {
      DataMemAccessState := Mux(io.b.valid, sNormal, sAXIWriteWait)
    }
  }



  switch(DataMemAccessState) {
    is(sNormal) {
      io.ar.valid  := isDataLoad
      io.aw.valid := isDataStore
      io.w.valid := isDataStore
    }
    is(sAXIReadSend) {
      io.ar.valid := true.B
    }
    is(sAXIReadWait) {
      io.r.ready := true.B
    }
    is(sAXIWriteSend) {
      io.aw.valid := true.B
      io.w.valid :=true.B
    }
    is(sAXIWriteWait) {
      io.b.ready := true.B
    }
  }

  // --------------------------------------------
  // -------------- ALU_OP Decoder --------------
  // --------------------------------------------

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
  // ---------------------------
  // --- Control signal - PC ---
  // ---------------------------
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
                EQ -> io.BrEq.asUInt,
                NE -> ~io.BrEq.asUInt,
                LT -> io.BrLT.asUInt,
                GE -> ~io.BrLT.asUInt,
                LTU -> io.BrLT.asUInt,
                GEU -> ~io.BrLT.asUInt
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
      io.PCSel := Mux(io.r.valid, 0.U, 2.U)
    }
    is(sAXIWriteSend) {
      io.PCSel := 2.U
    }
    is(sAXIWriteWait) {
      io.PCSel := Mux(io.b.valid, 0.U, 2.U)
    }
  }

  // ------------------------------------------------
  // ------ Control signal - Branch comparator ------
  // ------------------------------------------------
  io.BrUn := (io.Inst(13) === 1.U)

  // --------------------------------------------------
  // ------ Control signal - Immediate generator ------
  // --------------------------------------------------
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
  // --------------------------------------
  // ---- Control signal - Scalar ALU  ----
  // --------------------------------------
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
      io.RegWEn := Mux((io.r.valid & (opcode === LOAD)), true.B, false.B)
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
