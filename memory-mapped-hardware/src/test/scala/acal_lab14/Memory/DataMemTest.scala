package acal_lab14.Memory

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import acal_lab14.AXI._
import Config._

class DataMemTest extends AnyFlatSpec with ChiselScalatestTester{

    // Functions for generating test vectors
    def genAXIawSignals(addr: BigInt): Axi4Request = {
        var res = (new Axi4Request(Mem_config.s_id_width, Mem_config.addr_width, Mem_config.data_width)).Lit(
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
        if(Constants.DEBUG)
            println(s"[DEBUG] the generated aw signals : ${res}")
        res
    }

    def genAXIwSignals(wdata: BigInt): Axi4WriteData = {
        var res = (new Axi4WriteData(Mem_config.data_width)).Lit(
            _.data -> wdata.U,
            _.strb -> "h0F".U,
            _.last   -> true.B,
        )
        if(Constants.DEBUG)
            println(s"[DEBUG] the generated w signals : ${res}")
        res
    }

    def genAXIarSignals(addr: BigInt): Axi4Request = {
        var res = (new Axi4Request(Mem_config.s_id_width, Mem_config.addr_width, Mem_config.data_width)).Lit(
           _.addr -> addr.U,
            _.burst -> 0.U, // burst mode : FIXED
            _.cache -> 0.U,
            _.id    -> 1.U, // avoid using zero
            _.len   -> 0.U, // one beat for burst
            _.lock  -> 0.U,
            _.prot  -> 0.U,
            _.qos   -> 0.U,
            _.region -> 0.U,
            _.size  -> "b010".U // 4 bytes for one beats
        )
        if(Constants.DEBUG)
            println(s"[DEBUG] the generated ar signals : ${res}")
        res
    }

    def genAXIrSignals(rdata: BigInt): Axi4ReadData = {
        var res = (new Axi4ReadData(Mem_config.s_id_width, Mem_config.data_width)).Lit(
            _.id -> 1.U, // avoid using zero id
            _.data -> rdata.U,
            _.resp -> 0.U,
            _.last -> true.B,
        )
        if(Constants.DEBUG)
            println(s"[DEBUG] the generated r signals : ${res}")
        res
    }

    def genAXIbSignals(): Axi4WriteResp = {
        var res = (new Axi4WriteResp(Mem_config.s_id_width)).Lit(
            _.id -> 1.U,
            _.resp -> 0.U
        )
        res
    }

    "WRITE DataMem and READ DataMem" should "observe the correct value in DataMem" in {
        test(new DataMem(
            Mem_config.s_id_width,
            Mem_config.size,
            Mem_config.addr_width,
            Mem_config.data_width,
        )).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>

            /* Initialize IO ports */

            // input port
            dut.io.bus_slave.ar.initSource().setSourceClock(dut.clock)
            dut.io.bus_slave.aw.initSource().setSourceClock(dut.clock)
            dut.io.bus_slave.w.initSource().setSourceClock(dut.clock)

            // output ports
            dut.io.bus_slave.r.initSink().setSinkClock(dut.clock)
            dut.io.bus_slave.b.initSink().setSinkClock(dut.clock)

            /* test */
            // always ready to receive the write response
            dut.io.bus_slave.b.ready.poke(true.B)


            // Write data memory
            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("00", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("03020100", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("04", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("07060504", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("08", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("0b0a0908", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("0c", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("0f0e0d0c", 16)))
            dut.clock.step(5)

            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("010", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("03020100", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("14", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("07060504", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("18", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("0b0a0908", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.aw.enqueue(genAXIawSignals(BigInt("1c", 16)))
            dut.io.bus_slave.w.enqueue(genAXIwSignals(BigInt("0f0e0d0c", 16)))
            dut.clock.step(5)
            // read data memory

            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("00", 16))) // a3, a2, a1, a0
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("03020100", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("04", 16))) // a7, a6, a5, a4
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("07060504", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("08", 16))) // a11, a10, a9, a8
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("0b0a0908", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("0c", 16))) // a15, a14, a13, a12
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("0f0e0d0c", 16)))
            dut.clock.step(5)

            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("10", 16))) // b3, b2, b1, b0
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("03020100", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("14", 16))) // b7, b6, b5, b4
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("07060504", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("18", 16))) // b11, b10, b9, b8
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("0b0a0908", 16)))
            dut.clock.step(5)
            dut.io.bus_slave.ar.enqueue(genAXIarSignals(BigInt("1c", 16))) // b15, b14, b13, b12
            dut.io.bus_slave.r.expectDequeue(genAXIrSignals(BigInt("0f0e0d0c", 16)))
            dut.clock.step(5)

            println("[DEBUG] END TEST ")
        }
    }
}
