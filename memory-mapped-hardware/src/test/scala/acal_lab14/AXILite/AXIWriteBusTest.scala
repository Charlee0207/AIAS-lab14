package acal_lab14.AXILite

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import Config._
import Utils.AXITester

class AXIWriteBusTest extends AnyFlatSpec
    with ChiselScalatestTester
    with AXITester {
        val idWidth = AXI_TestConfig.s_id_width
        val addrWidth = AXI_TestConfig.addr_width
        val dataWidth = AXI_TestConfig.data_width
    "Master" should "Write data to each slave according to different address" in {
        test(new AXIWriteBus(
            AXI_TestConfig.nSlaves,
            AXI_TestConfig.s_id_width,
            AXI_TestConfig.addr_width,
            AXI_TestConfig.data_width,
            AXI_TestConfig.addr_map
        )).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>
            /* Initialize IO ports */
            //* master
            for (i <- 0 until AXI_TestConfig.nMasters) {
                // input port
                dut.io.master.writeAddr.initSource().setSourceClock(dut.clock)
                dut.io.master.writeData.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.master.writeResp.initSink().setSinkClock(dut.clock)
            }
            //* slave
            for (i <- 0 until AXI_TestConfig.nSlaves) {
                // input port
                dut.io.slave(i).writeResp.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.slave(i).writeAddr.initSink().setSinkClock(dut.clock)
                dut.io.slave(i).writeData.initSink().setSinkClock(dut.clock)
            }

            println("----START TEST----")

            fork{
                dut.io.slave(0).writeAddr.expectDequeue(genAXIAddr(BigInt("9000", 16)))
                dut.io.slave(0).writeAddr.expectDequeue(genAXIAddr(BigInt("9008", 16)))
            }.fork{
                dut.io.slave(1).writeAddr.expectDequeue(genAXIAddr(BigInt("19000", 16)))
                dut.io.slave(1).writeAddr.expectDequeue(genAXIAddr(BigInt("19008", 16)))
            }.fork{
                dut.io.slave(0).writeData.expectDequeue(genAXIWriteData(0, BigInt("00010203", 16), "b1111", true))
                dut.io.slave(0).writeData.expectDequeue(genAXIWriteData(0, BigInt("04050607", 16), "b1111", true))
            }.fork{
                dut.io.slave(1).writeData.expectDequeue(genAXIWriteData(0, BigInt("08090a0b", 16), "b1111", true))
                dut.io.slave(1).writeData.expectDequeue(genAXIWriteData(0, BigInt("0c0d0e0f", 16), "b1111", true))
            }.fork{
                dut.io.master.writeResp.expectDequeue(genAXIWriteResp(0))
                dut.io.master.writeResp.expectDequeue(genAXIWriteResp(0))
                dut.io.master.writeResp.expectDequeue(genAXIWriteResp(0))
                dut.io.master.writeResp.expectDequeue(genAXIWriteResp(0))
            }.fork{
                dut.io.master.writeAddr.enqueue(genAXIAddr(BigInt("9000", 16)))
                dut.io.master.writeAddr.enqueue(genAXIAddr(BigInt("9008", 16)))
                dut.io.master.writeAddr.enqueue(genAXIAddr(BigInt("19000", 16)))
                dut.io.master.writeAddr.enqueue(genAXIAddr(BigInt("19008", 16)))
            }.fork{
                dut.io.master.writeData.enqueue(genAXIWriteData(0, BigInt("00010203", 16), "b1111", true))
                dut.io.master.writeData.enqueue(genAXIWriteData(0, BigInt("04050607", 16), "b1111", true))
                dut.io.master.writeData.enqueue(genAXIWriteData(0, BigInt("08090a0b", 16), "b1111", true))
                dut.io.master.writeData.enqueue(genAXIWriteData(0, BigInt("0c0d0e0f", 16), "b1111", true))
            }.fork{
                for(i <- 0 until 2){
                    fork.withRegion(Monitor){
                        while(!dut.io.slave(0).writeAddr.valid.peek().litToBoolean || !dut.io.slave(0).writeData.valid.peek().litToBoolean)
                            dut.clock.step(1)
                    }.joinAndStep(dut.clock)
                    dut.io.slave(0).writeResp.enqueue(genAXIWriteResp(0))
                }
            }.fork{
                for(i <- 0 until 2){
                    fork.withRegion(Monitor){
                        while(!dut.io.slave(1).writeAddr.valid.peek().litToBoolean || !dut.io.slave(1).writeData.valid.peek().litToBoolean)
                            dut.clock.step(1)
                    }.joinAndStep(dut.clock)
                    dut.io.slave(1).writeResp.enqueue(genAXIWriteResp(0))
                }
            }.join()
            dut.clock.step(2)
            
            println("----TEST END----")
        }
    }
}