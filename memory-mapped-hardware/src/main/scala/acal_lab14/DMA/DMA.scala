package acal_lab14.DMA

import chisel3._
import chisel3.util._

import acal_lab14.AXI._

class DMA(idWidth: Int, addrWidth: Int, dataWidth: Int, baseAddr: BigInt)
    extends Module {
      val io = dontTouch(IO(new Bundle {
        val slave  = new Axi4SlaveIF(idWidth, addrWidth, dataWidth, 2) // programed by other masters(e.g CPU)
        val master = new Axi4MasterIF(idWidth, addrWidth, dataWidth, 2)
        val Hcf    = Output(Bool())
  }))

  // Master state machine
  val mIdle :: mReadSend :: mReadResp :: mWriteSend :: mWriteResp :: Nil = Enum(5)

  val mState  = RegInit(mIdle)

  // Slave state machine
  val sReadIdle :: sReadResp :: Nil                 = Enum(2)
  val sWriteIdle :: sWriteExec :: sWriteResp :: Nil = Enum(3)

  val sReadState  = RegInit(sReadIdle)
  val sWriteState = RegInit(sWriteIdle)

  val sReadAddrReg     = RegInit(0.U(addrWidth.W))
  val sReadIDReg       = RegInit(0.U(idWidth.W))
  val sWriteIDReg      = RegInit(0.U(idWidth.W))
  val sWriteDataRecv   = RegInit(false.B)
  val sWriteAddrRecv   = RegInit(false.B)
  val sWriteDataReg    = RegInit(0.U(dataWidth.W))
  val sWriteAddrReg    = RegInit(0.U(addrWidth.W))
  val sWriteAddrOffset = WireDefault(sWriteAddrReg - baseAddr.U)
  val sReadAddrOffset  = WireDefault(sReadAddrReg - baseAddr.U)

  val mWriteAddrSent = RegInit(false.B)
  val mWriteDataSent = RegInit(false.B)

  // Slave MMIO Regs
  val mmio_regs         = RegInit(VecInit(Seq.fill(6)(0.U(dataWidth.W))))
  val mmio_enable       = mmio_regs(0)
  val mmio_source_info   = mmio_regs(1)
  val mmio_dest_info    = mmio_regs(2)
  val mmio_size_cfg     = mmio_regs(3)
  val mmio_inst         = mmio_regs(4)
  val mmio_done         = mmio_regs(5)

  // Data buffer
  val data_buffer = RegInit(0.U(dataWidth.W))
  val rData_mask = WireDefault(0.U(4.W))
  val mask_width = WireDefault(0.U(4.W))
  val source_offset = RegInit(0.U(2.W))
  val rData  = WireDefault(VecInit(Seq.fill(4)(0.U(8.W))))

  val dest_offset = WireDefault(io.master.aw.bits.addr(1,0))
  // Total number of requests counter

  val request_counter = RegInit(0.U(32.W))

  val sReadData = WireDefault(MuxLookup(
    sReadAddrOffset,
    0.U,
    Seq(
      0.U  -> mmio_regs(0),
      4.U  -> mmio_regs(1),
      8.U -> mmio_regs(2),
      12.U -> mmio_regs(3),
      16.U -> mmio_regs(4),
      20.U -> mmio_regs(5)
    )
  ))

  // IO signals

  io.Hcf := mmio_done

  // Master
  io.master.aw.valid       := mState === mWriteSend && !mWriteAddrSent
  io.master.aw.bits.addr   := 0.U
  io.master.aw.bits.burst  := 0.U
  io.master.aw.bits.len    := 0.U
  io.master.aw.bits.size   := 2.U
  io.master.aw.bits.cache  := 0.U
  io.master.aw.bits.id     := 0.U
  io.master.aw.bits.prot   := 0.U
  io.master.aw.bits.lock   := 0.U
  io.master.aw.bits.qos    := 0.U
  io.master.aw.bits.region := 0.U

  io.master.ar.valid       := mState === mReadSend
  io.master.ar.bits.addr   := 0.U
  io.master.ar.bits.burst  := 0.U
  io.master.ar.bits.len    := 0.U
  io.master.ar.bits.size   := 2.U
  io.master.ar.bits.cache  := 0.U
  io.master.ar.bits.id     := 0.U
  io.master.ar.bits.prot   := 0.U
  io.master.ar.bits.lock   := 0.U
  io.master.ar.bits.qos    := 0.U
  io.master.ar.bits.region := 0.U

  io.master.w.valid     := mState === mWriteSend && !mWriteDataSent
  io.master.w.bits.data := data_buffer
  io.master.w.bits.strb := "b1111".U
  io.master.w.bits.last := true.B

  io.master.r.ready := mState === mReadResp

  io.master.b.ready := mState === mWriteResp

  // Slave
  io.slave.aw.ready := (sWriteState === sWriteIdle || sWriteState === sWriteExec) && !sWriteAddrRecv
  io.slave.w.ready := (sWriteState === sWriteIdle || sWriteState === sWriteExec) && !sWriteDataRecv

  io.slave.ar.ready := sReadState === sReadIdle

  io.slave.r.valid     := sReadState === sReadResp
  io.slave.r.bits.data := sReadData
  io.slave.r.bits.id   := sReadIDReg
  io.slave.r.bits.last := true.B
  io.slave.r.bits.resp := 0.U

  io.slave.b.valid     := sWriteState === sWriteResp
  io.slave.b.bits.id   := sWriteIDReg
  io.slave.b.bits.resp := 0.U

  // Mater State Controller

  switch(mState) {
    is(mIdle) {
      when(mmio_enable === 1.U) {
        mState := mReadSend
      }
    }
    is(mReadSend) {
      when(io.master.ar.ready) {
        mState := mReadResp
      }
    }
    is(mReadResp) {
      when(io.master.r.valid) {
        mState := mWriteSend
      }
    }
    is(mWriteSend) {
      when(mWriteAddrSent && mWriteDataSent) {
        mState := mWriteResp
      }
    }
    is(mWriteResp) {
      when(io.master.b.valid) {
        mState := mIdle
      }
    }
  }

  // Slave State Controller

  switch(sReadState) {
    is(sReadIdle) {
      when(io.slave.ar.valid) {
        sReadState := sReadResp
      }
    }
    is(sReadResp) {
      when(io.slave.r.ready) {
        sReadState := sReadIdle
      }
    }
  }

  switch(sWriteState) {
    is(sWriteIdle) {
      when(io.slave.aw.valid || io.slave.w.valid) {
        sWriteState := sWriteExec
      }
    }
    is(sWriteExec) {
      when(sWriteDataRecv&& sWriteAddrRecv) {
        sWriteState := sWriteResp
      }
    }
    is(sWriteResp) {
      when(io.slave.b.ready) {
        sWriteState := sWriteIdle
      }
    }
  }

  // Master State Datapath
  when(mState === mWriteSend) {
    when(io.master.aw.fire) {
      request_counter := request_counter + 1.U
    }
  }

  when(mState === mReadSend) {
    io.master.ar.bits.addr := mmio_source_info + (request_counter * mmio_size_cfg(31,24))
    source_offset := io.master.ar.bits.addr(1,0)
  }

  when(mState === mWriteSend) {
    io.master.aw.bits.addr := mmio_dest_info + (request_counter * mmio_size_cfg(23,16))
    mask_width := MuxLookup(mmio_size_cfg(15,8),"b1111".U,Seq(
      1.U -> "b0001".U,
      2.U -> "b0011".U,
      3.U -> "b0111".U,
      4.U -> "b1111".U
    ))
    io.master.w.bits.strb := mask_width << dest_offset
    io.master.w.bits.data := data_buffer << (dest_offset << 3.U)

  }

  when(mState === mReadResp && io.master.r.valid) {
    mask_width := MuxLookup(mmio_size_cfg(15,8),"b1111".U,Seq(
      1.U -> "b0001".U,
      2.U -> "b0011".U,
      3.U -> "b0111".U,
      4.U -> "b1111".U
    ))
    rData_mask := mask_width << source_offset
    List.range(0, 4).map { x =>
      when(rData_mask(x) === 1.U) {
        rData(x) := io.master.r.bits.data(x * 8 + 7, x * 8)
      }
      .otherwise {
        rData(x) := 0.U(8.W)
      }
    }
    data_buffer := rData.asUInt >> (source_offset << 3.U)
  }

  when(mState === mWriteResp && request_counter === mmio_size_cfg(7,0)) {
    request_counter := 0.U
    mmio_enable := 0.U
    mmio_done   := 1.U
  }
  when(mState === mWriteSend) {
    when(io.master.w.ready) {
      mWriteDataSent := true.B
    }
    when(io.master.aw.ready) {
      mWriteAddrSent := true.B
    }
  }.otherwise {
    mWriteAddrSent := false.B
    mWriteDataSent := false.B
  }


  // Slave State Datapath

  when(sWriteState === sWriteIdle || sWriteState === sWriteExec) {
    when(io.slave.aw.valid) {
      sWriteAddrRecv := true.B
      sWriteAddrReg   := Mux(
        sWriteAddrRecv,
        sWriteAddrReg,
        io.slave.aw.bits.addr
      )
      sWriteIDReg     := Mux(
        sWriteAddrRecv,
        sWriteIDReg,
        io.slave.aw.bits.id
      )
    }
    when(io.slave.w.valid) {
      sWriteDataRecv:= true.B
      sWriteDataReg := Mux(sWriteDataRecv, sWriteDataReg, io.slave.w.bits.data)
    }
  }.elsewhen(sWriteState === sWriteResp) {
    sWriteAddrRecv := false.B
    sWriteDataRecv:= false.B
  }

  when(sWriteState === sWriteResp && io.slave.b.ready) {
    switch(sWriteAddrOffset) {
      is(0.U) {
        mmio_regs(0) := sWriteDataReg
      }
      is(4.U) {
        mmio_regs(1) := sWriteDataReg
      }
      is(8.U) {
        mmio_regs(2) := sWriteDataReg
      }
      is(12.U) {
        mmio_regs(3) := sWriteDataReg
      }
      is(16.U) {
        mmio_regs(4) := sWriteDataReg
      }
      is(20.U) {
        mmio_regs(5) := sWriteDataReg
      }
    }
  }
  when(sReadState === sReadIdle && io.slave.ar.valid) {
    sReadAddrReg := io.slave.ar.bits.addr
    sReadIDReg   := io.slave.ar.bits.id
  }

}
