// package acal_lab14.AXILite

// import chisel3._
// import chiseltest._
// import org.scalatest.flatspec.AnyFlatSpec
// import chiseltest.ChiselScalatestTester

// import chiseltest.simulator.WriteVcdAnnotation
// import chisel3.experimental.BundleLiterals._

// import acal_lab14.AXI._

// object Config {
//     val master_num = 2,     // number of masters
//     val slave_num = 2,      // number of slaves
//     val s_id_width = 17
//     val addr_width = 32,
//     val data_width = 32
//     val addr_map = List(("h8000".U, "h10000".U), ("h10000".U, "h20000".U))
// }

// // allocation of 2 slaves in memory space


// class AXILiteXBarTest extends AnyFlatSpec with ChiselScalatestTester{
//       // Functions for generating test vectors
//     def genAXIawSignals(addr: BigInt): Axi4Request = {
//         var res = (new Axi4Request(Config.s_id_width, Config.addr_width, Config.data_width)).Lit(
//             _.addr -> addr.U,
//             _.burst -> 0.U, // Burst mode : FIXED
//             _.cache -> 0.U,
//             _.id    -> 1.U, // Avoid using zero id
//             _.len   -> 0.U, // one beat in a burst
//             _.lock  -> 0.U,
//             _.prot  -> 0.U,
//             _.qos   -> 0.U,
//             _.region -> 0.U,
//             _.size  -> "b010".U // 4 bytes per beat
//         )
//         println(s"[DEBUG] the generated aw signals : ${res}")
//         res
//     }

//     def genAXIwSignals(wdata: BigInt): Axi4WriteData = {
//         var res = (new Axi4WriteData(Config.data_width)).Lit(
//             _.data -> wdata.U,
//             _.strb -> "h0F".U,
//             _.last   -> true.B,
//         )
//         println(s"[DEBUG] the generated w signals : ${res}")
//         res
//     }

//     def genAXIarSignals(addr: BigInt): Axi4Request = {
//         var res = (new Axi4Request(Config.s_id_width, Config.addr_width, Config.data_width)).Lit(
//            _.addr -> addr.U,
//             _.burst -> 0.U, // burst mode : FIXED
//             _.cache -> 0.U,
//             _.id    -> 1.U, // avoid using zero
//             _.len   -> 0.U, // one beat for burst
//             _.lock  -> 0.U,
//             _.prot  -> 0.U,
//             _.qos   -> 0.U,
//             _.region -> 0.U,
//             _.size  -> "b010".U // 4 bytes for one beats
//         )
//         println(s"[DEBUG] the generated ar signals : ${res}")
//         res
//     }

//     def genAXIrSignals(rdata: BigInt): Axi4ReadData = {
//         var res = (new Axi4ReadData(Config.s_id_width, Config.data_width)).Lit(
//             _.id -> 1.U, // avoid using zero id
//             _.data -> rdata.U,
//             _.resp -> 0.U,
//             _.last -> true.B,
//         )
//         println(s"[DEBUG] the generated r signals : ${res}")
//         res
//     }

//     def genAXIbSignals(): Axi4WriteResp = {
//         var res = (new Axi4WriteResp(Config.s_id_width)).Lit(
//             _.id -> 1.U,
//             _.resp -> 0.U
//         )
//         res
//     }
  
//     "Masters" should "send/read data to each Slaves according to addr" in {
//         test(new AXILiteXBar(
//             Config.master_num,
//             Config.slave_num,
//             Config.s_id_width,
//             Config.addr_width,
//             Config.data_width,
//             Config.addr_map
//         )).withAnnotations(Seq(
//             WriteVcdAnnotation,
//         )){ dut =>
//             /* Initialize IO ports */
//             //* masters
//             for (i <- 0 until Config.master_num) {
//                 // input port
//                 dut.io.masters(i).r.initSink().setSourceClock(dut.clock)
//                 dut.io.masters(i).b.initSink().setSourceClock(dut.clock)

//                 // output ports
//                 dut.io.masters(i).ar.initSource().setSinkClock(dut.clock)
//                 dut.io.masters(i).aw.initSource().setSinkClock(dut.clock)
//                 dut.io.masters(i).w.initSource().setSinkClock(dut.clock)
//             }
//             //* slaves
//             for (i <- 0 until Config.slave_num) {
//                 // input port
//                 dut.io.slaves(i).ar.initSource().setSourceClock(dut.clock)
//                 dut.io.slaves(i).aw.initSource().setSourceClock(dut.clock)
//                 dut.io.slaves(i).w.initSource().setSourceClock(dut.clock)

//                 // output ports
//                 dut.io.slaves(i).r.initSink().setSinkClock(dut.clock)
//                 dut.io.slaves(i).b.initSink().setSinkClock(dut.clock)
//             }
//         }
    
//     dut.io.masters(0).aw.enqueue(genAXIawSignals(BigInt("9000", 16)))
//     dut.io.masters(0).w.enqueue(genAXIwSignals(BigInt("01020304", 16)))
//     dut.io.masters(0).ar.enqueue(genAXIarSignals(BigInt("9008", 16)))
//     dut.clock.step(2)



//   poke(dut.io.masters(0).writeAddr.valid, true)
//   poke(dut.io.masters(0).writeAddr.bits.addr, 0x9000)
//   poke(dut.io.masters(0).writeData.valid, true)
//   poke(dut.io.masters(0).writeData.bits.data, 1)
//   poke(dut.io.masters(0).writeData.bits.strb, 0xf)
//   poke(dut.io.masters(0).writeResp.ready, true)
//   poke(dut.io.masters(0).readAddr.valid, true)
//   poke(dut.io.masters(0).readAddr.bits.addr, 0x9008)
//   poke(dut.io.masters(0).readData.ready, true)

//   poke(dut.io.slaves(0).writeAddr.ready, true)
//   poke(dut.io.slaves(0).writeData.ready, true)
//   poke(dut.io.slaves(0).readAddr.ready, true)
//   poke(dut.io.slaves(0).readData.valid, true)
//   poke(dut.io.slaves(0).readData.bits.data, 1)
//   poke(dut.io.slaves(0).writeResp.valid, true)
//   poke(dut.io.slaves(0).writeResp.bits, 0)


//   step(2)

//   poke(dut.io.masters(0).writeAddr.valid, true)
//   poke(dut.io.masters(0).writeAddr.bits.addr, 0x19000)
//   poke(dut.io.masters(0).writeData.valid, true)
//   poke(dut.io.masters(0).writeData.bits.data, 1)
//   poke(dut.io.masters(0).writeData.bits.strb, 0xf)
//   poke(dut.io.masters(0).writeResp.ready, true)
//   poke(dut.io.masters(0).readAddr.valid, true)
//   poke(dut.io.masters(0).readAddr.bits.addr, 0x19008)
//   poke(dut.io.masters(0).readData.ready, true)

//   poke(dut.io.slaves(1).writeAddr.ready, true)
//   poke(dut.io.slaves(1).writeData.ready, true)
//   poke(dut.io.slaves(1).readAddr.ready, true)
//   poke(dut.io.slaves(1).readData.valid, true)
//   poke(dut.io.slaves(1).readData.bits.data, 2)
//   poke(dut.io.slaves(1).writeResp.valid, true)
//   poke(dut.io.slaves(1).writeResp.bits, 0)

//   poke(dut.io.slaves(0).writeAddr.ready, false)
//   poke(dut.io.slaves(0).writeData.ready, false)
//   poke(dut.io.slaves(0).readAddr.ready, false)
//   poke(dut.io.slaves(0).readData.valid, false)
//   poke(dut.io.slaves(0).readData.bits.data, 1)
//   poke(dut.io.slaves(0).writeResp.valid, false)
//   poke(dut.io.slaves(0).writeResp.bits, 0)

//   step(2)

//   poke(dut.io.masters(1).writeAddr.valid, true)
//   poke(dut.io.masters(1).writeAddr.bits.addr, 0x19000)
//   poke(dut.io.masters(1).writeData.valid, true)
//   poke(dut.io.masters(1).writeData.bits.data, 1)
//   poke(dut.io.masters(1).writeData.bits.strb, 0xf)
//   poke(dut.io.masters(1).writeResp.ready, true)
//   poke(dut.io.masters(1).readAddr.valid, true)
//   poke(dut.io.masters(1).readAddr.bits.addr, 0x19008)
//   poke(dut.io.masters(1).readData.ready, true)

//   poke(dut.io.slaves(1).writeAddr.ready, true)
//   poke(dut.io.slaves(1).writeData.ready, true)
//   poke(dut.io.slaves(1).readAddr.ready, true)
//   poke(dut.io.slaves(1).readData.valid, true)
//   poke(dut.io.slaves(1).readData.bits.data, 2)
//   poke(dut.io.slaves(1).writeResp.valid, true)
//   poke(dut.io.slaves(1).writeResp.bits, 0)

//   step(4)

//     println("[DEBUG] END TEST ")
//     }
// }