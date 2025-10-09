package acal_lab14.PipelinedCPU

import chisel3._
import chisel3.util._

import acal_lab14.AXI._
import acal_lab14.PipelinedCPU.wide._

class CPU_AXI_IF(val mIdWidth: Int,val memAddrWidth: Int,val memDataWidth: Int) extends Module {
    val io = IO(new Bundle {
        // Original Memory Interface Signals
        val Mem_R = Input(Bool())
        val Mem_W = Input(Bool())
        val Length = Input(UInt(4.W))
        val Valid = Output(Bool())

        val raddr = Input(UInt(memAddrWidth.W))
        val rdata = Output(UInt(memDataWidth.W))

        val waddr = Input(UInt(memAddrWidth.W))
        val wdata = Input(UInt(memDataWidth.W))

        // AXI Master Interface
        val master = new Axi4MasterIF(mIdWidth, memAddrWidth, memDataWidth)

    })
    // FSM signals
    val mIdle :: mReadSend :: mReadResp :: mWriteSend :: mWriteResp :: Nil = Enum(5)
    val cstate = RegInit(mIdle)
    val nstate = WireDefault(mIdle)
    
    val awDone = RegInit(false.B)
    val wDone = RegInit(false.B)
    val arDone = Wire(Bool())
    val rDone = Wire(Bool())
    val bDone = Wire(Bool())

    // Mask signals
    val rMaskData = Wire(UInt(memDataWidth.W))
    val wMaskData = Wire(UInt(memDataWidth.W))
    val wStrb = Wire(UInt(4.W))
    
    // Fire signals
    // We need to consider the situation that AW and W are fired in different cycles
    awDone := Mux(cstate===mWriteSend, io.master.aw.ready, false.B)
    wDone := Mux(cstate===mWriteSend, io.master.w.ready, false.B)

    arDone := io.master.ar.ready
    rDone := io.master.r.valid
    bDone := io.master.b.valid

    // Output signals
    io.Valid := nstate===mIdle
    io.rdata := rMaskData

    // FSM
    switch(cstate){
        is(mIdle){
            when(io.Mem_R)        {nstate:=mReadSend}
            .elsewhen(io.Mem_W)   {nstate:=mWriteSend}
            .otherwise            {nstate:=mIdle}
        }
        is(mReadSend){  // Assert ARVLD
            nstate := Mux(arDone, mReadResp, mReadSend)
        }
        is(mReadResp){  // Assert RRDY
            nstate := Mux(rDone, mIdle, mReadResp)
        }
        is(mWriteSend){ // Assert AWVLD, WVLD
            nstate := Mux(awDone&&wDone, mWriteResp, mWriteSend)
        }
        is(mWriteResp){ // Assert BRDY
            nstate := Mux(bDone, mIdle, mWriteResp)
        }
    }
    cstate := nstate

    // Strb and mask data
    wStrb := MuxLookup(io.Length, 0.U, Seq(
        "b0000".U -> "b0001".U, // Byte
        "b0001".U -> "b0011".U, // Half
        "b0010".U -> "b1111".U  // Word
    ))
    wMaskData := MuxLookup(io.Length, io.wdata, Seq(
        "b0000".U -> Cat(0.U(24.W), io.wdata(7, 0)),    // Byte data
        "b0001".U -> Cat(0.U(16.W), io.wdata(15, 0)),   // Half data
        "b0010".U -> io.wdata                           // Word data
    ))
    rMaskData := MuxLookup(io.Length, io.master.r.bits.data, Seq(
        "b0000".U -> Cat(Fill(24, io.master.r.bits.data(7)), io.master.r.bits.data(7, 0)),      // Load byte signed data
        "b0001".U -> Cat(Fill(16, io.master.r.bits.data(15)), io.master.r.bits.data(15, 0)),    // Load half signed data
        "b0010".U -> io.master.r.bits.data,                                                     // Load word data
        "b0100".U -> Cat(0.U(24.W), io.master.r.bits.data(7, 0)),                               // Load byte unsigned data
        "b0101".U -> Cat(0.U(16.W), io.master.r.bits.data(15, 0))                               // Load half unsigned data
    ))


    // ========== ar channel ==========
    io.master.ar.valid       := cstate===mReadSend
    io.master.ar.bits.id     := 0.U
    io.master.ar.bits.addr   := Mux(cstate===mReadSend, Cat(0.U(16.W), io.raddr), 0.U)  // TODO: check if this is correct
    io.master.ar.bits.region := 0.U
    io.master.ar.bits.len    := 0.U // 1 beat in a burst
    io.master.ar.bits.size   := 2.U // 4 bytes per beat
    io.master.ar.bits.burst  := 0.U // fixed burst type
    io.master.ar.bits.lock   := 0.U
    io.master.ar.bits.cache  := 0.U
    io.master.ar.bits.prot   := 0.U
    io.master.ar.bits.qos    := 0.U
    // ========== r channel ==========
    io.master.r.ready := cstate===mReadResp
    // ========== aw channel ==========
    io.master.aw.valid       := (cstate===mWriteSend && ~awDone)
    io.master.aw.bits.id     := 0.U
    io.master.aw.bits.addr   := Mux(cstate===mWriteSend, Cat(0.U(16.W), io.waddr), 0.U)  // TODO: check if this is correct
    io.master.aw.bits.region := 0.U
    io.master.aw.bits.len    := 0.U // 1 beat in a burst
    io.master.aw.bits.size   := 2.U // 4 bytes per beat
    io.master.aw.bits.burst  := 0.U // fixed burst type
    io.master.aw.bits.lock   := 0.U
    io.master.aw.bits.cache  := 0.U
    io.master.aw.bits.prot   := 0.U
    io.master.aw.bits.qos    := 0.U
    // ========== w channel ==========
    io.master.w.valid     := (cstate===mWriteSend && ~wDone)
    io.master.w.bits.data := Mux(cstate===mWriteSend, wMaskData, 0.U)
    io.master.w.bits.strb := wStrb
    io.master.w.bits.last := true.B
    // ========== b channel ==========
    io.master.b.ready := cstate===mWriteResp
}
