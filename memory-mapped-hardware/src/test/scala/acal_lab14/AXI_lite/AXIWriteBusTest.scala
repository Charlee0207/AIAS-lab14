package acal_lab14.AXILite

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import acal_lab14.AXI._
import Config._

// allocation of 2 slave in memory space


class AXIWriteBusTest extends AnyFlatSpec with ChiselScalatestTester{
      // Functions for generating test vectors
    def genAXIawSignals(addr: BigInt): Axi4Request = {
        var res = (new Axi4Request(AXI_Config.s_id_width, AXI_Config.addr_width, AXI_Config.data_width)).Lit(
            _.addr -> addr.U,
            _.burst -> 0.U, // Burst mode : FIXED
            _.cache -> 0.U,
            _.id    -> 1.U, // Avoid using zero id
            _.len   -> 0.U, // one beat in a burst
            _.lock  -> 0.U,
            _.prot  -> 0.U,
            _.qos   -> 0.U,
            _.region -> 0.U,
            _.size  -> "b010".U // 4 bytes per beat
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated writeAddr signals : ${res}")
        res
    }

    def genAXIwSignals(wdata: BigInt): Axi4WriteData = {
        var res = (new Axi4WriteData(AXI_Config.data_width)).Lit(
            _.data -> wdata.U,
            _.strb -> "h0F".U,
            _.last   -> true.B,
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated writeData signals : ${res}")
        res
    }

    def genAXIbSignals(): Axi4WriteResp = {
        var res = (new Axi4WriteResp(AXI_Config.s_id_width)).Lit(
            _.id -> 1.U,
            _.resp -> 0.U
        )
        res
    }

    "master" should "write data to each slave according to addr" in {
        test(new AXIWriteBus(
            AXI_Config.slave_num,
            AXI_Config.s_id_width,
            AXI_Config.addr_width,
            AXI_Config.data_width,
            AXI_Config.addr_map
        )).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>
            /* Initialize IO ports */
            //* master
            for (i <- 0 until AXI_Config.master_num) {
                // input port
                dut.io.master.writeAddr.initSource().setSourceClock(dut.clock)
                dut.io.master.writeData.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.master.writeResp.initSink().setSinkClock(dut.clock)
            }
            //* slave
            for (i <- 0 until AXI_Config.slave_num) {
                // input port
                dut.io.slave(i).writeResp.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.slave(i).writeAddr.initSink().setSinkClock(dut.clock)
                dut.io.slave(i).writeData.initSink().setSinkClock(dut.clock)
            }

            dut.io.slave(0).writeAddr.expectDequeue(genAXIawSignals(BigInt("9000", 16)))
            dut.io.slave(0).writeData.expectDequeue(genAXIwSignals(BigInt("01020304", 16)))
            dut.io.slave(0).writeResp.expectDequeue(genAXIbSignals())
            dut.io.slave(1).writeAddr.expectDequeue(genAXIawSignals(BigInt("0", 16)))
            dut.io.slave(1).writeData.expectDequeue(genAXIwSignals(BigInt("0", 16)))
            dut.io.master.writeAddr.enqueue(genAXIawSignals(BigInt("9000", 16)))
            dut.io.master.writeData.enqueue(genAXIwSignals(BigInt("01020304", 16)))
            dut.io.master.writeResp.enqueue(genAXIbSignals())
            dut.clock.step(2)

            dut.io.slave(0).writeAddr.expectDequeue(genAXIawSignals(BigInt("0", 16)))
            dut.io.slave(0).writeData.expectDequeue(genAXIwSignals(BigInt("0", 16))) 
            dut.io.slave(1).writeAddr.expectDequeue(genAXIawSignals(BigInt("19000", 16)))
            dut.io.slave(1).writeData.expectDequeue(genAXIwSignals(BigInt("0a0b0c0d", 16)))
            dut.io.slave(1).writeResp.expectDequeue(genAXIbSignals())
            dut.io.master.writeAddr.enqueue(genAXIawSignals(BigInt("19000", 16)))
            dut.io.master.writeData.enqueue(genAXIwSignals(BigInt("0a0b0c0d", 16)))
            dut.io.master.writeResp.enqueue(genAXIbSignals())

//   poke(dut.io.master(0).writeAddr.valid, true)
//   poke(dut.io.master(0).writeAddr.bits.addr, 0x9000)
//   poke(dut.io.master(0).writeData.valid, true)
//   poke(dut.io.master(0).writeData.bits.data, 1)
//   poke(dut.io.master(0).writeData.bits.strb, 0xf)
//   poke(dut.io.master(0).writeResp.ready, true)
//   poke(dut.io.master(0).readAddr.valid, true)
//   poke(dut.io.master(0).readAddr.bits.addr, 0x9008)
//   poke(dut.io.master(0).readData.ready, true)

//   poke(dut.io.slave(0).writeAddr.ready, true)
//   poke(dut.io.slave(0).writeData.ready, true)
//   poke(dut.io.slave(0).readAddr.ready, true)
//   poke(dut.io.slave(0).readData.valid, true)
//   poke(dut.io.slave(0).readData.bits.data, 1)
//   poke(dut.io.slave(0).writeResp.valid, true)
//   poke(dut.io.slave(0).writeResp.bits, 0)


//   step(2)

//   poke(dut.io.master(0).writeAddr.valid, true)
//   poke(dut.io.master(0).writeAddr.bits.addr, 0x19000)
//   poke(dut.io.master(0).writeData.valid, true)
//   poke(dut.io.master(0).writeData.bits.data, 1)
//   poke(dut.io.master(0).writeData.bits.strb, 0xf)
//   poke(dut.io.master(0).writeResp.ready, true)
//   poke(dut.io.master(0).readAddr.valid, true)
//   poke(dut.io.master(0).readAddr.bits.addr, 0x19008)
//   poke(dut.io.master(0).readData.ready, true)

//   poke(dut.io.slave(1).writeAddr.ready, true)
//   poke(dut.io.slave(1).writeData.ready, true)
//   poke(dut.io.slave(1).readAddr.ready, true)
//   poke(dut.io.slave(1).readData.valid, true)
//   poke(dut.io.slave(1).readData.bits.data, 2)
//   poke(dut.io.slave(1).writeResp.valid, true)
//   poke(dut.io.slave(1).writeResp.bits, 0)

//   poke(dut.io.slave(0).writeAddr.ready, false)
//   poke(dut.io.slave(0).writeData.ready, false)
//   poke(dut.io.slave(0).readAddr.ready, false)
//   poke(dut.io.slave(0).readData.valid, false)
//   poke(dut.io.slave(0).readData.bits.data, 1)
//   poke(dut.io.slave(0).writeResp.valid, false)
//   poke(dut.io.slave(0).writeResp.bits, 0)

//   step(2)

//   poke(dut.io.master(1).writeAddr.valid, true)
//   poke(dut.io.master(1).writeAddr.bits.addr, 0x19000)
//   poke(dut.io.master(1).writeData.valid, true)
//   poke(dut.io.master(1).writeData.bits.data, 1)
//   poke(dut.io.master(1).writeData.bits.strb, 0xf)
//   poke(dut.io.master(1).writeResp.ready, true)
//   poke(dut.io.master(1).readAddr.valid, true)
//   poke(dut.io.master(1).readAddr.bits.addr, 0x19008)
//   poke(dut.io.master(1).readData.ready, true)

//   poke(dut.io.slave(1).writeAddr.ready, true)
//   poke(dut.io.slave(1).writeData.ready, true)
//   poke(dut.io.slave(1).readAddr.ready, true)
//   poke(dut.io.slave(1).readData.valid, true)
//   poke(dut.io.slave(1).readData.bits.data, 2)
//   poke(dut.io.slave(1).writeResp.valid, true)
//   poke(dut.io.slave(1).writeResp.bits, 0)

//   step(4)

        println("[DEBUG] END TEST ")
        }
    }
}