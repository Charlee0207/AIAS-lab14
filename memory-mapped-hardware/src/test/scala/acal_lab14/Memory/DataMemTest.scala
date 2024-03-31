package acal_lab14.Memory

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import Config._
import Utils.AXITester

class DataMemTest extends AnyFlatSpec
    with ChiselScalatestTester
    with AXITester {
        val idWidth = Mem_config.s_id_width
        val addrWidth = Mem_config.addr_width
        val dataWidth = Mem_config.data_width
    "WRITE DataMem and READ DataMem" should "observe the correct value in DataMem" in {
        test(new DataMem(
            Mem_config.s_id_width,
            Mem_config.data_mem_size,
            Mem_config.addr_width,
            Mem_config.data_width,
            Mem_config.data_hex_path
        )).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>
            /* Initialize IO ports */
            // input port
            dut.io.slave.ar.initSource().setSourceClock(dut.clock)
            dut.io.slave.aw.initSource().setSourceClock(dut.clock)
            dut.io.slave.w.initSource().setSourceClock(dut.clock)

            // output ports
            dut.io.slave.r.initSink().setSinkClock(dut.clock)
            dut.io.slave.b.initSink().setSinkClock(dut.clock)

            println("----START TEST----")
            
            // always ready to receive the write response
            dut.io.slave.b.ready.poke(true.B)

            // Write data memory
            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("8000", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("03020100", 16), "b1111", true))
            dut.clock.step(5)
            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("8004", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("07060504", 16), "b1111", true))
            dut.clock.step(5)
            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("8008", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("0b0a0908", 16), "b1111", true))
            dut.clock.step(5)
            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("800c", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("0f0e0d0c", 16), "b1111", true))
            dut.clock.step(5)

            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("8010", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("03020100", 16), "b1111", true))
            dut.clock.step(5)
            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("8014", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("07060504", 16), "b1111", true))
            dut.clock.step(5)
            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("8018", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("0b0a0908", 16), "b1111", true))
            dut.clock.step(5)
            dut.io.slave.aw.enqueue(genAXIAddr(BigInt("801c", 16)))
            dut.io.slave.w.enqueue(genAXIWriteData(0, BigInt("0f0e0d0c", 16), "b1111", true))
            dut.clock.step(5)
            // read data memory

            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("03020100", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("8000", 16))) // a3, a2, a1, a0
            }.join()
            dut.clock.step(5)

            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("07060504", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("8004", 16))) // a7, a6, a5, a4
            }.join()
            dut.clock.step(5)

            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("0b0a0908", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("8008", 16))) // a11, a10, a9, a8
            }.join()
            dut.clock.step(5)

            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("0f0e0d0c", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("800c", 16))) // a15, a14, a13, a12
            }.join()
            dut.clock.step(5)

            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("03020100", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("8010", 16))) // b3, b2, b1, b0
            }.join()
            dut.clock.step(5)

            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("07060504", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("8014", 16))) // b7, b6, b5, b4
            }.join()
            dut.clock.step(5)

            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("0b0a0908", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("8018", 16))) // b11, b10, b9, b8
            }.join()
            dut.clock.step(5)
            
            fork{
                dut.io.slave.r.expectDequeue(genAXIReadData(0, BigInt("0f0e0d0c", 16), true))
            }.fork{
                dut.io.slave.ar.enqueue(genAXIAddr(BigInt("801c", 16))) // b15, b14, b13, b12
            }.join()
            dut.clock.step(5)

            println("----TEST END----")
        }
    }
}
