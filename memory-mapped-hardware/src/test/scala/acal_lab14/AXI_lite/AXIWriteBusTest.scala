package acal_lab14.AXILite

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import acal_lab14.AXI._
import Config._

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

    "Master" should "Write data to each slave according to different address" in {
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

            println("----START TEST----")

            fork{
                dut.io.slave(0).writeAddr.expectDequeue(genAXIawSignals(BigInt("9000", 16)))
                dut.io.slave(0).writeAddr.expectDequeue(genAXIawSignals(BigInt("9008", 16)))
            }.fork{
                dut.io.slave(1).writeAddr.expectDequeue(genAXIawSignals(BigInt("19000", 16)))
                dut.io.slave(1).writeAddr.expectDequeue(genAXIawSignals(BigInt("19008", 16)))
            }.fork{
                dut.io.slave(0).writeData.expectDequeue(genAXIwSignals(BigInt("00010203", 16)))
                dut.io.slave(0).writeData.expectDequeue(genAXIwSignals(BigInt("04050607", 16)))
            }.fork{
                dut.io.slave(1).writeData.expectDequeue(genAXIwSignals(BigInt("08090a0b", 16)))
                dut.io.slave(1).writeData.expectDequeue(genAXIwSignals(BigInt("0c0d0e0f", 16)))
            }.fork{
                dut.io.master.writeResp.expectDequeue(genAXIbSignals())
                dut.io.master.writeResp.expectDequeue(genAXIbSignals())
                dut.io.master.writeResp.expectDequeue(genAXIbSignals())
                dut.io.master.writeResp.expectDequeue(genAXIbSignals())
            }.fork{
                dut.io.master.writeAddr.enqueue(genAXIawSignals(BigInt("9000", 16)))
                dut.io.master.writeAddr.enqueue(genAXIawSignals(BigInt("9008", 16)))
                dut.io.master.writeAddr.enqueue(genAXIawSignals(BigInt("19000", 16)))
                dut.io.master.writeAddr.enqueue(genAXIawSignals(BigInt("19008", 16)))
            }.fork{
                dut.io.master.writeData.enqueue(genAXIwSignals(BigInt("00010203", 16)))
                dut.io.master.writeData.enqueue(genAXIwSignals(BigInt("04050607", 16)))
                dut.io.master.writeData.enqueue(genAXIwSignals(BigInt("08090a0b", 16)))
                dut.io.master.writeData.enqueue(genAXIwSignals(BigInt("0c0d0e0f", 16)))
            }.fork{
                for(i <- 0 until 2){
                    fork.withRegion(Monitor){
                        while(!dut.io.slave(0).writeAddr.valid.peek().litToBoolean || !dut.io.slave(0).writeData.valid.peek().litToBoolean)
                            dut.clock.step(1)
                    }.joinAndStep(dut.clock)
                    dut.io.slave(0).writeResp.enqueue(genAXIbSignals())
                }
            }.fork{
                for(i <- 0 until 2){
                    fork.withRegion(Monitor){
                        while(!dut.io.slave(1).writeAddr.valid.peek().litToBoolean || !dut.io.slave(1).writeData.valid.peek().litToBoolean)
                            dut.clock.step(1)
                    }.joinAndStep(dut.clock)
                    dut.io.slave(1).writeResp.enqueue(genAXIbSignals())
                }
            }.join()
            dut.clock.step(2)
            
            println("----TEST END----")
        }
    }
}