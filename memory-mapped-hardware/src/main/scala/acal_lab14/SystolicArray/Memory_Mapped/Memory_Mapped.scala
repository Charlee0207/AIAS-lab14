// package acal_lab14.SystolicArray

// import chisel3._
// import chisel3.util._

// import acal_lab14.AXIBus._

// /** Memory_Mapped module
//   *
//   * includes LocalMem, MMIO_Regfile and control logics of whole Memory_Mapped
//   *
//   * @param mem_size
//   *   the size of LocalMem
//   * @param reg_width
//   *   the data size of mmio regs
//   */
// class Memory_Mapped(mem_size: Int, id_width: Int, addr_width: Int, data_width: Int, reg_width: Int) extends Module {
//   val io = IO(new Bundle {
//     // for CPU to access the Reg and Memory
//     val slave = new Axi4SlaveIF(id_width, addr_width, data_width)

//     /*
//       mmio source: SA
//       mmio destination: MMIO_Regfile
//      */
//     val mmio = new MMIO(reg_width)

//     // for SA to read/write LocalMem when it still a slave
//     val raddr = Input(UInt(addr_width.W))
//     val rdata = Output(UInt(data_width.W))

//     val wen   = Input(Bool())
//     val waddr = Input(UInt(addr_width.W))
//     val wdata = Input(UInt(data_width.W))
//     val wstrb = Input(UInt((data_width >> 3).W))
//   })

//   // module declaration
//   val rf = Module(new MMIO_Regfile(addr_width, reg_width))
//   val lm = Module(new LocalMem(mem_size, addr_width, data_width))


//   val ACCEL_REG_BASE_ADDR = 0x100000 // MMIO reg base address
//   val ACCEL_MEM_BASE_ADDR = 0x200000 // Local mem base address
//   // byte to bits
//   val byte = 8

//   // AXI signals default assignment
//   // ------ ar channel ------
//   io.slave.ar.ready   := false.B
//   // ------ r channel ------
//   io.slave.r.valid     := false.B
//   io.slave.r.bits.id   := 0.U    // always assign 0, don't care in AXI4 Lite protocol
//   io.slave.r.bits.data := 0.U
//   io.slave.r.bits.resp := 0.U    // "b00".U -> OKAY
//   io.slave.r.bits.last := true.B /* do not support burst mode in AXI4 Lite protocol,
//                                   * so each beat would be the last beat in a burst.
//                                   */
//   // ------ aw channel ------
//   io.slave.aw.ready := false.B
//   // ------ w channel ------
//   io.slave.w.ready := false.B
//   // ------ b channel ------
//   io.slave.b.valid     := false.B
//   io.slave.b.bits.id   := 0.U // always assign 0, don't care in AXI4 Lite protocol
//   io.slave.b.bits.resp := 0.U // "b00".U -> OKAY

//   // rf wiring and default value
//   rf.io.mmio <> io.mmio
//   rf.io.raddr := 0.U
//   rf.io.waddr := 0.U
//   rf.io.wdata := 0.U
//   rf.io.wen   := false.B

//   // lm wiring and default value
//   lm.io.raddr := 0.U
//   lm.io.waddr := 0.U
//   lm.io.wdata := 0.U
//   lm.io.wstrb := 0.U
//   lm.io.wen   := false.B

//   // r/w port default value
//   io.rdata := 0.U

//   // the registers used for CPU dominated
//   val RAReg      = RegInit(0.U(addr_width.W)) // readAddr.bits.addr reg
//   val RAReadyReg = RegInit(false.B)           // readAddr.ready reg
//   val RDReg      = RegInit(0.U(data_width.W)) // readData.bits.data reg
//   val RRReg      = RegInit(false.B)           // readData.bits.resp reg
//   val RDValidReg = RegInit(false.B)           // readData.valid reg

//   // canDoRead -> master has sent request while slave has not been ready
//   // DoRead -> complete handshaking -> do read
//   val canDoRead = WireDefault(io.slave.ar.valid && !RAReadyReg)
//   // io.slave.readAddr.valid && io.slave.readAddr.ready -> handshaking
//   val DoRead = RegNext(io.slave.ar.valid && io.slave.ar.ready && !RDValidReg)

//   //// seems weird because read behavior of reg and SyncReadMem through AXI are different...

//   val WAReg      = RegInit(0.U(addr_width.W))        // writeAddr.bits.addr reg
//   val WAReadyReg = RegInit(false.B)                  // writeAddr.ready reg
//   val WDReg      = RegInit(0.U(data_width.W))        // writeData.bits.data reg
//   val WSReg      = RegInit(0.U((data_width >> 3).W)) // writeData.bits.strb reg
//   val WDReadyReg = RegInit(false.B)                  // writeData.ready reg
//   val WRValidReg = RegInit(false.B)                  // writeResp.valid reg

//   // canDoWrite -> master has sent request to write while slave has not been ready
//   // DoWrite -> complete handshaking -> do write
//   val canDoWrite = WireDefault(
//     (io.slave.aw.valid && !WAReadyReg) &&
//       (io.slave.w.valid && !WDReadyReg)
//   )
//   // io.slave.writeAddr.valid && io.slave.writeAddr.ready -> handshaking of write addr channel
//   // io.slave.writeData.valid && io.slave.writeData.ready -> handshaking of write data channel
//   val DoWrite = WireDefault(
//     (io.slave.aw.valid && io.slave.aw.ready) &&
//       (io.slave.w.valid && io.slave.w.ready)
//   )
//   /* [Implicit Assumption]
//    * The condition we made here implies that aw channel and w channel
//    * would send the request at the same cycle for sake of simplicity.
//    * However, there are no rule requiring that two channel should issue
//    * request at the same cycle.
//    */

//   // * read/write will be divided into two parts -> CPU or SA dominated
//   // * CPU dominated -> when io.mmio.ENABLE_OUT := false.B -> SA is idle now
//   when(!io.mmio.ENABLE_OUT) {
//     // * read behavior
//     RAReadyReg              := canDoRead
//     io.slave.ar.ready       := RAReadyReg
//     RAReg                   := Mux(canDoRead, io.slave.ar.bits.addr, RAReg)

//     // if ACCEL_MEM_BASE_ADDR <= RAReg < ACCEL_MEM_BASE_ADDR -> CPU tend to read MMIO_Regfile
//     rf.io.raddr := Mux(
//       (ACCEL_REG_BASE_ADDR.U <= RAReg && RAReg < ACCEL_MEM_BASE_ADDR.U),
//       (RAReg - ACCEL_REG_BASE_ADDR.U) >> 2, // divided by 4 because of addr format of RegFile
//       0.U
//     )
//     // if ACCEL_MEM_BASE_ADDR <= RAReg -> CPU tend to read LocalMem
//     lm.io.raddr := Mux((ACCEL_MEM_BASE_ADDR.U <= RAReg), (RAReg - ACCEL_MEM_BASE_ADDR.U), 0.U)

//     // when DoRead === true.B -> RDValidReg HIGH -> complete read request
//     RDValidReg := DoRead

//     // wiring between regs and output signals of slave port
//     io.slave.r.valid     := RDValidReg
//     io.slave.r.bits.data := RDReg
//     io.slave.r.bits.resp := 0.U

//     when(RAReg < ACCEL_MEM_BASE_ADDR.U) {
//       RDReg := Mux(DoRead, Cat(0.U(32.W), rf.io.rdata), 0.U)
//     }.otherwise {
//       RDReg := Mux(DoRead, lm.io.rdata, 0.U)
//     }

//     // * write behavior
//     WAReadyReg := canDoWrite
//     WDReadyReg := canDoWrite

//     io.slave.aw.ready := WAReadyReg
//     io.slave.w.ready  := WDReadyReg

//     WAReg := Mux(canDoWrite, io.slave.aw.bits.addr, 0.U)
//     WDReg := Mux(canDoWrite, io.slave.w.bits.data, 0.U)
//     WSReg := Mux(canDoWrite, io.slave.w.bits.strb, 0.U)

//     when(DoWrite) {
//       rf.io.waddr := WAReg >> 2
//       lm.io.waddr := WAReg - ACCEL_MEM_BASE_ADDR.U

//       rf.io.wdata := WDReg(31, 0)
//       lm.io.wdata := WDReg(31, 0)

//       lm.io.wstrb := WSReg

//       rf.io.wen := Mux(io.slave.aw.bits.addr < ACCEL_MEM_BASE_ADDR.U, true.B, false.B)
//       lm.io.wen := Mux(io.slave.aw.bits.addr < ACCEL_MEM_BASE_ADDR.U, false.B, true.B)
//     }

//     WRValidReg               := DoWrite && !WRValidReg
//     io.slave.b.valid         := WRValidReg
//   }.otherwise {
//     // * SA dominated -> when io.mmio.ENABLE_OUT === false.B
//     // reset all registers for CPU dominated
//     RAReg      := 0.U
//     RAReadyReg := false.B
//     RDReg      := 0.U
//     RDValidReg := false.B
//     WAReg      := 0.U
//     WAReadyReg := false.B
//     WDReg      := 0.U
//     WDReadyReg := false.B
//     WRValidReg := false.B

//     // read value from localMem
//     lm.io.raddr := io.raddr // read addr from SA
//     io.rdata    := lm.io.rdata

//     // write value to localMem
//     lm.io.waddr := io.waddr // write addr from SA
//     lm.io.wdata := io.wdata // write data from SA
//     lm.io.wstrb := io.wstrb // write strb from SA
//     lm.io.wen   := io.wen   // write enable from SA

//     // write status and enable to Regfile (cross MMIO interface from SA to MMIO_Regfile)
//     rf.io.mmio.WEN       := io.mmio.WEN
//     rf.io.mmio.ENABLE_IN := io.mmio.ENABLE_IN
//     rf.io.mmio.STATUS_IN := io.mmio.STATUS_IN
//   }
// }
