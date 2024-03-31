package acal_lab14.Memory

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

import acal_lab14.AXI._

class DataMem(id_width: Int, size: Int, addrWidth: Int, dataWidth: Int, binaryFile: String) extends Module {
    val io = IO(new Bundle {
        val slave = new Axi4SlaveIF(id_width, addrWidth, dataWidth)
    })
    /*
        state declaration
        1. sIdle
        2. sReadResp -> send readResp to the bus
        3. sWriteResp -> send writeResp to the bus
    */
    val sIdle :: sReadResp :: sWriteResp :: Nil = Enum(3)
    // state reg
    val stateReg = RegInit(sIdle)

    val memory = Mem((1 << (size)), UInt(8.W))

    val write_addr_reg = RegInit(0.U(addrWidth.W))
    val write_addr_reg_valid = RegInit(false.B)
    val write_addr_reg_id = RegInit(0.U(id_width.W))
    val write_addr_reg_size = RegInit(0.U(3.W))

    val write_data_reg = RegInit(0.U(dataWidth.W))
    val write_data_reg_valid = RegInit(false.B)
    val write_data_reg_strb = RegInit(0.U((dataWidth / 8).W))
    val write_data_reg_last = RegInit(false.B)

    // Pre-load data into mem
    loadMemoryFromFile(memory, binaryFile)

    // Next state decoder
    switch(stateReg) {
        is(sIdle) {
            when(io.slave.ar.valid) {
                stateReg := sReadResp
            }.elsewhen(write_data_reg_valid & write_addr_reg_valid) {
                stateReg := sWriteResp
            }.otherwise {
                stateReg := sIdle
            }
        }
        is(sReadResp) {
            stateReg := Mux((io.slave.r.ready), sIdle, sReadResp)
        }
        is(sWriteResp) {
            stateReg := Mux((io.slave.b.ready), sIdle, sWriteResp)
        }
    }

    // AXI slave interface output - ready / valid
    io.slave.ar.ready  := false.B
    io.slave.r.valid  := false.B
    io.slave.r.bits.last := true.B
    io.slave.r.bits.id := 0.U       // always assign 0, don't care in AXI4 Lite protocol
    io.slave.r.bits.resp := 0.U

    io.slave.aw.ready := false.B
    io.slave.w.ready := false.B
    io.slave.b.valid := false.B
    io.slave.b.bits.resp := 0.U
    io.slave.b.bits.id := 0.U

    when(io.slave.aw.fire) {
        write_addr_reg := io.slave.aw.bits.addr
        write_addr_reg_valid := true.B
        write_addr_reg_id := io.slave.aw.bits.id
        write_addr_reg_size := io.slave.aw.bits.size
    }
    when(io.slave.w.fire) {
        write_data_reg := io.slave.w.bits.data
        write_data_reg_valid := true.B
        write_data_reg_strb := io.slave.w.bits.strb
        write_data_reg_last := io.slave.w.bits.last
    }

    switch(stateReg) {
        is(sIdle) {
            // Idle -> ready to accept request from master
            io.slave.ar.ready  := true.B
            io.slave.aw.ready := true.B
            io.slave.w.ready := true.B
        }
        is(sReadResp) {
            // read request done -> set io.slave.readData.valid to HIGH
            io.slave.r.valid := true.B
        }
        is(sWriteResp) {
            // write request done -> set io.slave.writeResp.valid to HIGH
            io.slave.b.valid := true.B
            write_addr_reg_valid := false.B     // reset write address register
            write_data_reg_valid := false.B     // reset write data register
        }
    }

    // Handle request
    val addrReg = RegInit(0.U(addrWidth.W))

    when(stateReg === sIdle) {
        addrReg := Mux(io.slave.ar.valid, io.slave.ar.bits.addr - "h8000".U, addrReg)
        when(write_data_reg_valid & write_addr_reg_valid) {
            for (i <- 0 until (dataWidth / 8)) {
                memory((write_addr_reg - "h8000".U) + i.U) := Mux(
                    (write_data_reg_strb(i) === 1.U),
                    write_data_reg(8 * (i + 1) - 1, 8 * i),
                    memory((write_addr_reg - "h8000".U) + i.U)
                )
            }
        }
    }.otherwise{
        addrReg := addrReg
    }

    io.slave.r.bits.data := Cat(
        memory(addrReg + 7.U),
        memory(addrReg + 6.U),
        memory(addrReg + 5.U),
        memory(addrReg + 4.U),
        memory(addrReg + 3.U),
        memory(addrReg + 2.U),
        memory(addrReg + 1.U),
        memory(addrReg)
    )
}