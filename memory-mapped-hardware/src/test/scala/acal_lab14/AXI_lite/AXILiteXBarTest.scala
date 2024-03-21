package acal_lab14.AXILite

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import acal_lab14.AXI._
import Config._

class AXILiteXBarTest extends AnyFlatSpec with ChiselScalatestTester{
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
            println(s"[DEBUG] the generated ar signals : ${res}")
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
        if(Constants.DEBUG)
            println(s"[DEBUG] the generated aw signals : ${res}")
        res
    }

    def genAXIwSignals(wdata: BigInt): Axi4WriteData = {
        var res = (new Axi4WriteData(AXI_Config.data_width)).Lit(
            _.data -> wdata.U,
            _.strb -> "h0F".U,
            _.last   -> true.B,
        )
        if(Constants.DEBUG)
            println(s"[DEBUG] the generated w signals : ${res}")
        res
    }

    def genAXIbSignals(): Axi4WriteResp = {
        var res = (new Axi4WriteResp(AXI_Config.s_id_width)).Lit(
            _.id -> 1.U,
            _.resp -> 0.U
        )
        if(Constants.DEBUG)
            println(s"[DEBUG] the generated b signals : ${res}")
        res
    }    

    "Masters" should "send/read data to each Slaves according to addr" in {
        test(new AXILiteXBar(
            AXI_Config.master_num,
            AXI_Config.slave_num,
            AXI_Config.s_id_width,
            AXI_Config.addr_width,
            AXI_Config.data_width,
            AXI_Config.addr_map
        )).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>
            /* Initialize IO ports */
            //* masters
            for (i <- 0 until AXI_Config.master_num) {
                // input port
                dut.io.masters(i).ar.initSource().setSourceClock(dut.clock)
                dut.io.masters(i).aw.initSource().setSourceClock(dut.clock)
                dut.io.masters(i).w.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.masters(i).r.initSink().setSinkClock(dut.clock)
                dut.io.masters(i).b.initSink().setSinkClock(dut.clock)
            }
            //* slaves
            for (i <- 0 until AXI_Config.slave_num) {
                // input port
                dut.io.slaves(i).r.initSource().setSourceClock(dut.clock)
                dut.io.slaves(i).b.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.slaves(i).ar.initSink().setSinkClock(dut.clock)
                dut.io.slaves(i).aw.initSink().setSinkClock(dut.clock)
                dut.io.slaves(i).w.initSink().setSinkClock(dut.clock)
            }

            println("----START TEST----")
        
            println("[Test 1] AXI cross bar READ test")
            println("[Test 1]: Masters read from each slave according to addr")
            println("[Test 1]: Slaves respond data to each master")

            fork{
                    dut.io.slaves(0).ar.expectDequeue(genAXIarSignals(BigInt("9000", 16)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIarSignals(BigInt("9008", 16)))
                }.fork{
                    dut.io.slaves(1).ar.expectDequeue(genAXIarSignals(BigInt("19000", 16)))
                    dut.io.slaves(1).ar.expectDequeue(genAXIarSignals(BigInt("19008", 16)))
                }.fork{
                    dut.io.masters(0).r.expectDequeue(genAXIrSignals(BigInt("00010203", 16)))
                    dut.io.masters(0).r.expectDequeue(genAXIrSignals(BigInt("04050607", 16)))
                }.fork{
                    dut.io.masters(1).r.expectDequeue(genAXIrSignals(BigInt("08090a0b", 16)))
                    dut.io.masters(1).r.expectDequeue(genAXIrSignals(BigInt("0c0d0e0f", 16)))
                }.fork{
                    dut.io.slaves(0).r.enqueue(genAXIrSignals(BigInt("00010203", 16)))
                    dut.io.slaves(0).r.enqueue(genAXIrSignals(BigInt("0c0d0e0f", 16)))
                }.fork{
                    dut.io.slaves(1).r.enqueue(genAXIrSignals(BigInt("08090a0b", 16)))
                    dut.io.slaves(1).r.enqueue(genAXIrSignals(BigInt("04050607", 16)))
                }.fork{
                    dut.io.masters(0).ar.enqueue(genAXIarSignals(BigInt("9000", 16)))
                    dut.io.masters(0).ar.enqueue(genAXIarSignals(BigInt("19008", 16)))
                }.fork{
                    dut.io.masters(1).ar.enqueue(genAXIarSignals(BigInt("19000", 16)))
                    dut.io.masters(1).ar.enqueue(genAXIarSignals(BigInt("9008", 16)))
                }.join()        

            dut.clock.step(1)

            println("--------")
            println("[Test 2] AXI cross bar WRITE test")
            println("[Test 2]: Masters write data to each slave according to addr")
            println("[Test 2]: Slaves respond after handshake")

            fork{
                    dut.io.slaves(0).aw.expectDequeue(genAXIawSignals(BigInt("9000", 16)))
                    dut.io.slaves(0).aw.expectDequeue(genAXIawSignals(BigInt("9008", 16)))
                }.fork{
                    dut.io.slaves(1).aw.expectDequeue(genAXIawSignals(BigInt("19000", 16)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIawSignals(BigInt("19008", 16)))
                }.fork{
                    dut.io.slaves(0).w.expectDequeue(genAXIwSignals(BigInt("00010203", 16)))
                    dut.io.slaves(0).w.expectDequeue(genAXIwSignals(BigInt("04050607", 16)))
                }.fork{
                    dut.io.slaves(1).w.expectDequeue(genAXIwSignals(BigInt("08090a0b", 16)))
                    dut.io.slaves(1).w.expectDequeue(genAXIwSignals(BigInt("0c0d0e0f", 16)))
                }.fork{
                    dut.io.masters(0).b.expectDequeue(genAXIbSignals())
                    dut.io.masters(0).b.expectDequeue(genAXIbSignals())
                }.fork{
                    dut.io.masters(1).b.expectDequeue(genAXIbSignals())
                    dut.io.masters(1).b.expectDequeue(genAXIbSignals())
                }.fork{
                    dut.io.masters(0).aw.enqueue(genAXIawSignals(BigInt("9000", 16)))
                    dut.io.masters(0).aw.enqueue(genAXIawSignals(BigInt("19008", 16)))
                }.fork{
                    dut.io.masters(1).aw.enqueue(genAXIawSignals(BigInt("19000", 16)))
                    dut.io.masters(1).aw.enqueue(genAXIawSignals(BigInt("9008", 16)))
                }.fork{
                    dut.io.masters(0).w.enqueue(genAXIwSignals(BigInt("00010203", 16)))
                    dut.io.masters(0).w.enqueue(genAXIwSignals(BigInt("0c0d0e0f", 16)))
                }.fork{
                    dut.io.masters(1).w.enqueue(genAXIwSignals(BigInt("08090a0b", 16)))
                    dut.io.masters(1).w.enqueue(genAXIwSignals(BigInt("04050607", 16)))
                }.fork{
                    for(i <- 0 until 2){
                        fork.withRegion(Monitor){
                            while(!dut.io.slaves(0).aw.valid.peek().litToBoolean || !dut.io.slaves(0).w.valid.peek().litToBoolean)
                                dut.clock.step(1)
                        }.joinAndStep(dut.clock)
                        dut.io.slaves(0).b.enqueue(genAXIbSignals())
                    }
                }.fork{
                    for(i <- 0 until 2){
                        fork.withRegion(Monitor){
                            while(!dut.io.slaves(1).aw.valid.peek().litToBoolean || !dut.io.slaves(1).w.valid.peek().litToBoolean)
                                dut.clock.step(1)
                        }.joinAndStep(dut.clock)
                        dut.io.slaves(1).b.enqueue(genAXIbSignals())
                    }
                }.join()

            println("--------")
            println("[Test 3] AXI cross bar READ arbitration test")
            println("[Test 3]: Masters read data to same slave (slave0)")
            println("[Test 3]: Slave 0 respond data to each master accordingly")

            fork{
                    dut.io.slaves(0).ar.expectDequeue(genAXIarSignals(BigInt("9000", 16)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIarSignals(BigInt("9016", 16)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIarSignals(BigInt("9008", 16)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIarSignals(BigInt("9024", 16)))
                }.fork{
                    dut.io.masters(0).r.expectDequeue(genAXIrSignals(BigInt("00010203", 16)))
                    dut.io.masters(0).r.expectDequeue(genAXIrSignals(BigInt("08090a0b", 16)))
                }.fork{
                    dut.io.masters(1).r.expectDequeue(genAXIrSignals(BigInt("04050607", 16)))
                    dut.io.masters(1).r.expectDequeue(genAXIrSignals(BigInt("0c0d0e0f", 16)))
                }.fork{
                    dut.io.slaves(0).r.enqueue(genAXIrSignals(BigInt("00010203", 16)))
                    dut.io.slaves(0).r.enqueue(genAXIrSignals(BigInt("04050607", 16)))
                    dut.io.slaves(0).r.enqueue(genAXIrSignals(BigInt("08090a0b", 16)))
                    dut.io.slaves(0).r.enqueue(genAXIrSignals(BigInt("0c0d0e0f", 16)))
                }.fork{
                    dut.io.masters(0).ar.enqueue(genAXIarSignals(BigInt("9000", 16)))
                    dut.io.masters(0).ar.enqueue(genAXIarSignals(BigInt("9008", 16)))
                }.fork{
                    dut.io.masters(1).ar.enqueue(genAXIarSignals(BigInt("9016", 16)))
                    dut.io.masters(1).ar.enqueue(genAXIarSignals(BigInt("9024", 16)))
                }.join()        

            dut.clock.step(1)

            println("--------")
            println("[Test 4] AXI cross bar WRITE arbitration test")
            println("[Test 4]: Masters write data to same slave (slave1)")
            println("[Test 4]: Slave 1 respond after handshake accordingly")

            fork{
                    dut.io.slaves(1).aw.expectDequeue(genAXIawSignals(BigInt("19016", 16)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIawSignals(BigInt("19000", 16)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIawSignals(BigInt("19024", 16)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIawSignals(BigInt("19008", 16)))
                }.fork{
                    dut.io.slaves(1).w.expectDequeue(genAXIwSignals(BigInt("08090a0b", 16)))
                    dut.io.slaves(1).w.expectDequeue(genAXIwSignals(BigInt("00010203", 16)))
                    dut.io.slaves(1).w.expectDequeue(genAXIwSignals(BigInt("0c0d0e0f", 16)))
                    dut.io.slaves(1).w.expectDequeue(genAXIwSignals(BigInt("04050607", 16)))
                }.fork{
                    dut.io.masters(0).b.expectDequeue(genAXIbSignals())
                    dut.io.masters(0).b.expectDequeue(genAXIbSignals())
                }.fork{
                    dut.io.masters(1).b.expectDequeue(genAXIbSignals())
                    dut.io.masters(1).b.expectDequeue(genAXIbSignals())
                }.fork{
                    dut.io.masters(0).aw.enqueue(genAXIawSignals(BigInt("19000", 16)))
                    dut.io.masters(0).aw.enqueue(genAXIawSignals(BigInt("19008", 16)))
                }.fork{
                    dut.io.masters(1).aw.enqueue(genAXIawSignals(BigInt("19016", 16)))
                    dut.io.masters(1).aw.enqueue(genAXIawSignals(BigInt("19024", 16)))
                }.fork{
                    dut.io.masters(0).w.enqueue(genAXIwSignals(BigInt("00010203", 16)))
                    dut.io.masters(0).w.enqueue(genAXIwSignals(BigInt("04050607", 16)))
                }.fork{
                    dut.io.masters(1).w.enqueue(genAXIwSignals(BigInt("08090a0b", 16)))
                    dut.io.masters(1).w.enqueue(genAXIwSignals(BigInt("0c0d0e0f", 16)))
                }.fork{
                    for(i <- 0 until 4){
                        fork.withRegion(Monitor){
                            while(!dut.io.slaves(1).aw.valid.peek().litToBoolean || !dut.io.slaves(1).w.valid.peek().litToBoolean)
                                dut.clock.step(1)
                        }.joinAndStep(dut.clock)
                        dut.io.slaves(1).b.enqueue(genAXIbSignals())
                    }
                }.join()     

            dut.clock.step(1)

            println("--------")
            println("[Test 5] AXI cross bar READ & WRITE same slave at the same time")
            println("[Test 5]: Master0 read data from slave0")
            println("[Test 5]: Master1 write data to slave0")
            println("[Test 5]: Slave 0 respond at the same time")

            fork{
                    dut.io.slaves(0).ar.expectDequeue(genAXIarSignals(BigInt("9000", 16)))
                }.fork{
                    dut.io.slaves(0).aw.expectDequeue(genAXIawSignals(BigInt("9000", 16)))
                }.fork{
                    dut.io.slaves(0).w.expectDequeue(genAXIwSignals(BigInt("DEADBEEF", 16)))
                }.fork{
                    dut.io.masters(0).r.expectDequeue(genAXIrSignals(BigInt("CAFEBABE", 16)))
                }.fork{
                    dut.io.masters(1).b.expectDequeue(genAXIbSignals())
                }.fork{
                    dut.io.masters(0).ar.enqueue(genAXIarSignals(BigInt("9000", 16)))
                }.fork{
                    dut.io.slaves(0).r.enqueue(genAXIrSignals(BigInt("CAFEBABE", 16)))
                }.fork{
                    dut.io.masters(1).aw.enqueue(genAXIawSignals(BigInt("9000", 16)))
                }.fork{
                    dut.io.masters(1).w.enqueue(genAXIwSignals(BigInt("DEADBEEF", 16)))
                }.fork{
                    fork.withRegion(Monitor){
                        while(!dut.io.slaves(0).aw.valid.peek().litToBoolean || !dut.io.slaves(0).w.valid.peek().litToBoolean)
                            dut.clock.step(1)
                    }.joinAndStep(dut.clock)
                    dut.io.slaves(0).b.enqueue(genAXIbSignals())
                }.join()     

            dut.clock.step(1)

            println("----TEST END----")
        }
    }
}