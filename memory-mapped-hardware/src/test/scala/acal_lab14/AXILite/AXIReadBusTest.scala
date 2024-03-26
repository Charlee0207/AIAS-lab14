package acal_lab14.AXILite

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import acal_lab14.AXI._
import Config._

class AXIReadBusTest extends AnyFlatSpec with ChiselScalatestTester{
    // Functions for generating test vectors
    def genAXIarSignals(addr: BigInt): Axi4Request = {
        var res = (new Axi4Request(AXI_Config.s_id_width, AXI_Config.addr_width, AXI_Config.data_width)).Lit(
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
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated writeResp signals : ${res}")
        res
    }

    def genAXIrSignals(rdata: BigInt): Axi4ReadData = {
        var res = (new Axi4ReadData(AXI_Config.s_id_width, AXI_Config.data_width)).Lit(
            _.id -> 1.U, // avoid using zero id
            _.data -> rdata.U,
            _.resp -> 0.U,
            _.last -> true.B,
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated r signals : ${res}")
        res
    }

    def genAXIarNull(): Axi4Request = {
        var res = (new Axi4Request(AXI_Config.s_id_width, AXI_Config.addr_width, AXI_Config.data_width)).Lit(
           _.addr -> 0.U,
            _.burst -> 0.U, // burst mode : FIXED
            _.cache -> 0.U,
            _.id    -> 0.U, // avoid using zero
            _.len   -> 0.U, // one beat for burst
            _.lock  -> 0.U,
            _.prot  -> 0.U,
            _.qos   -> 0.U,
            _.region -> 0.U,
            _.size  -> 0.U // 4 bytes for one beats
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated writeResp signals : ${res}")
        res
    }

    "Master" should "Read data from each slave according to different address" in {
        test(new AXIReadBus(
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
                dut.io.master.readAddr.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.master.readData.initSink().setSinkClock(dut.clock)
            }
            //* slave
            for (i <- 0 until AXI_Config.slave_num) {
                // input port
                dut.io.slave(i).readData.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.slave(i).readAddr.initSink().setSinkClock(dut.clock)
            }

            println("----START TEST----")

            fork{
                dut.io.slave(0).readAddr.expectDequeue(genAXIarSignals(BigInt("9000", 16)))
                dut.io.slave(0).readAddr.expectDequeue(genAXIarSignals(BigInt("9008", 16)))
            }.fork{
                dut.io.slave(1).readAddr.expectDequeue(genAXIarSignals(BigInt("19000", 16)))
                dut.io.slave(1).readAddr.expectDequeue(genAXIarSignals(BigInt("19008", 16)))
            }.fork{
                dut.io.master.readData.expectDequeue(genAXIrSignals(BigInt("00010203", 16)))
                dut.io.master.readData.expectDequeue(genAXIrSignals(BigInt("04050607", 16)))
                dut.io.master.readData.expectDequeue(genAXIrSignals(BigInt("08090a0b", 16)))
                dut.io.master.readData.expectDequeue(genAXIrSignals(BigInt("0c0d0e0f", 16)))
            }.fork{
                dut.io.slave(0).readData.enqueue(genAXIrSignals(BigInt("00010203", 16)))
                dut.io.slave(0).readData.enqueue(genAXIrSignals(BigInt("04050607", 16)))
            }.fork{
                dut.io.slave(1).readData.enqueue(genAXIrSignals(BigInt("08090a0b", 16)))
                dut.io.slave(1).readData.enqueue(genAXIrSignals(BigInt("0c0d0e0f", 16)))
            }.fork{
                dut.io.master.readAddr.enqueue(genAXIarSignals(BigInt("9000", 16)))
                dut.io.master.readAddr.enqueue(genAXIarSignals(BigInt("9008", 16)))
                dut.io.master.readAddr.enqueue(genAXIarSignals(BigInt("19000", 16)))
                dut.io.master.readAddr.enqueue(genAXIarSignals(BigInt("19008", 16)))
            }.join()
            dut.clock.step(2)
            
            println("----TEST END----")
        }
    }
}