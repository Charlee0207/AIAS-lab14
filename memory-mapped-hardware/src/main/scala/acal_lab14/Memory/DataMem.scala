package acal_lab14.Memory

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

import AXI._

class DataMem(SIdWidth: Int, Size: Int, AddrWidth: Int, DataWidth: Int, MemoryFile: String = "") extends Module {
    val io = IO(new Bundle {
        val bus_slave = new Axi4SlaveIF(SIdWidth, AddrWidth, DataWidth)
    })
    // ========== assumption =============
    // No burst :
    // axlen = 0 (1 beat per burst)
    // axsize = 3 (8 bytes)
    // axburst = 0 (fixed mode)

    // ========== Configuration ==========

    val MEM_SIZE = (1 << (Size-log2Ceil(32/8))) // Data memory size, one row contains a word(4 bytes)
    // do not support un-aligned memory access

    // memory instantiation
    val syncRWMEM = SyncReadMem(MEM_SIZE, UInt(32.W)) // a word per row of mem
    if(MemoryFile.trim().nonEmpty){
        loadMemoryFromFile(syncRWMEM, MemoryFile)
    }
    // ---------------- wire and reg init ----------------
    val aw_shaked_reg = RegInit(false.B) // reg for recording the handshaking in aw channel
    val w_shaked_reg  = RegInit(false.B) // reg for recording the handshaking in w channel
    val rst_ackReg    = WireDefault(false.B) // signal to reset the shaked_reg
    val ar_shaked     = WireDefault(io.bus_slave.ar.fire) // signal indicating the ar handshaking
    val aw_shaked     = WireDefault(io.bus_slave.aw.fire) // signal indicating the aw handshaking
    val w_shaked      = WireDefault(io.bus_slave.w.fire)  // signal indicating the w handshaking
    val ridReg        = RegInit(0.U(SIdWidth.W))             // reg for read id
    val widReg        = RegInit(0.U(SIdWidth.W))             // reg for write id
    val waddrReg      = RegInit(0.U(AddrWidth.W))     // reg for write address
    val wdataReg      = RegInit(0.U(DataWidth.W))     // reg for write data
    val wstrbReg      = RegInit(0.U((DataWidth/8).W)) // reg for write strb
    // state declaration
    val sIdle :: sReadResp :: sWriteResp :: Nil = Enum(3)
    val stateReg = RegInit(sIdle)

    // ===================== Data Path ======================
    // ---------------- wiring ----------------
    // shaked_reg update
    aw_shaked_reg := Mux(rst_ackReg, false.B, Mux(aw_shaked, true.B, aw_shaked_reg))
    w_shaked_reg  := Mux(rst_ackReg, false.B, Mux(w_shaked, true.B, w_shaked_reg))

    // update the registers for buffering the memory read/write request information
    when(stateReg === sIdle){

        // read id update when the valid of ar channel is high.
        ridReg   := Mux(io.bus_slave.ar.valid, io.bus_slave.ar.bits.id, ridReg)

        // write id update when the valid of aw channel is high
        widReg   := Mux(io.bus_slave.aw.valid, io.bus_slave.aw.bits.id, widReg)
        // write address update when the valid of aw channel is high.
        waddrReg := Mux(io.bus_slave.aw.valid, io.bus_slave.aw.bits.addr, waddrReg)
        // write data update when the valid of w channel is high.
        wdataReg := Mux(io.bus_slave.w.valid, io.bus_slave.w.bits.data, wdataReg)
        // write strb update when the valid of w channel is high.
        wstrbReg := Mux(io.bus_slave.w.valid, io.bus_slave.w.bits.strb, wstrbReg)

    }.otherwise{
        // maintain the value when the stateReg =!= sIdle
        waddrReg := waddrReg
        wdataReg := wdataReg
        wstrbReg := wstrbReg
    }

    // ============== memory read/write ==============
    // ---------- memory port init ----------
    val mem_ren = WireDefault(ar_shaked)
    val mem_wen = WireDefault(aw_shaked_reg && w_shaked_reg)
    val mem_addr = WireDefault(0.U(AddrWidth.W))
    when(mem_ren)     { mem_addr := io.bus_slave.ar.bits.addr }
    .elsewhen(mem_wen){ mem_addr := waddrReg }
    val mem_dataOut = WireDefault(0.U(32.W))
    mem_dataOut := DontCare

    // assume that the wstrb always be "b00001111".U and the address

    when(mem_wen||mem_ren) {
        val rdwrPort = syncRWMEM(mem_addr(Size-1,2))
        when (aw_shaked_reg && w_shaked_reg) { rdwrPort := wdataReg(31,0) }
        .otherwise                           { mem_dataOut := rdwrPort    }
    }

    // r channel
    io.bus_slave.r.bits.id := ridReg
    io.bus_slave.r.bits.data := mem_dataOut
    io.bus_slave.r.bits.resp := 0.U

    // b channel
    io.bus_slave.b.bits.id := widReg
    io.bus_slave.b.bits.resp := 0.U


    // ===================== Controller =====================
    // -------------- Input signals --------------
    // io.bus_slave.ar.valid
    // io.bus_slave.aw.valid
    // io.bus_slave.w.valid
    // io.bus_slave.r.ready
    // io.bus_slave.b.ready
    // -------------- Output signals --------------
    io.bus_slave.ar.ready := false.B
    io.bus_slave.aw.ready := false.B
    io.bus_slave.w.ready  := false.B
    io.bus_slave.r.valid  := false.B
    io.bus_slave.b.valid  := false.B
    io.bus_slave.r.bits.last := false.B
    // -------------- FSM next state and output equation --------------
    switch(stateReg) {
        is(sIdle){
            // ******** Next state euqation ********
            when(io.bus_slave.ar.fire){
                stateReg := sReadResp
            }.elsewhen(aw_shaked_reg && w_shaked_reg) {
                stateReg := sWriteResp
            }.otherwise {
                stateReg := sIdle
            }
            // ******** Output equation ********
            io.bus_slave.ar.ready := true.B
            io.bus_slave.aw.ready := Mux(aw_shaked_reg, false.B, true.B)
            io.bus_slave.w.ready := Mux(w_shaked_reg, false.B, true.B)
        }
        is(sReadResp) {
            // ******** Next state equation ********
            stateReg := Mux((io.bus_slave.r.fire), sIdle, sReadResp)
            // ******** Output equation ********
            io.bus_slave.r.valid := true.B
            io.bus_slave.r.bits.last := true.B
            rst_ackReg := true.B
        }
        is(sWriteResp) {
            // ******** Next state equation ********
            stateReg := Mux(io.bus_slave.b.fire, sIdle, sWriteResp)
            // ******** Output equation ********
            io.bus_slave.b.valid := true.B
            rst_ackReg := true.B
        }
    }
}

