package acal_lab14.HW14_2

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import Config._
import Utils.AXITester

class topTest extends AnyFlatSpec
    with ChiselScalatestTester
    with AXITester {
        val idWidth = HW14_2_Config.s_id_width
        val addrWidth = HW14_2_Config.addr_width
        val dataWidth = HW14_2_Config.data_width
    "HW14_2 Masters" should "send/read data to each Slaves according to addr" in {
        test(new top()).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>
            /* Initialize IO ports */
            //* masters
            for (i <- 0 until HW14_2_Config.nMasters) {
                // input port
                dut.io.masters(i).ar.initSource().setSourceClock(dut.clock)
                dut.io.masters(i).aw.initSource().setSourceClock(dut.clock)
                dut.io.masters(i).w.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.masters(i).r.initSink().setSinkClock(dut.clock)
                dut.io.masters(i).b.initSink().setSinkClock(dut.clock)
            }
            //* slaves
            for (i <- 0 until HW14_2_Config.nSlaves) {
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

            // Generate two random addresses for later test using seed 42
            val rand    = new scala.util.Random(42)
            println(s"[DEBUG] rand: ${rand}")
            val range   = BigInt("100000", 16)              // 0x100000
            println(s"[DEBUG] range: ${range}")

            def genAddr(n: Int = 2): Seq[Seq[BigInt]] =
                Seq.tabulate(3){ i =>
                    val base = range * i
                    Seq.fill(n)(BigInt(20, rand)%range + base)
            }
            def genData(n: Int = 2): Seq[Seq[BigInt]] =
                Seq.fill(3)(Seq.fill(n)(BigInt(32, rand)))
                

            var test_addr = genAddr(2)
            println(s"[DEBUG] test_addr: ${test_addr}")
            var test_data = genData(2)
            println(s"[DEBUG] test_data: ${test_data}")


            fork{
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(0)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(1)))
                }.fork{
                    dut.io.slaves(1).ar.expectDequeue(genAXIAddr(test_addr(1)(0)))
                    dut.io.slaves(1).ar.expectDequeue(genAXIAddr(test_addr(1)(1)))
                }.fork{
                    dut.io.slaves(2).ar.expectDequeue(genAXIAddr(test_addr(2)(0)))
                    dut.io.slaves(2).ar.expectDequeue(genAXIAddr(test_addr(2)(1)))
                }.fork{
                    dut.io.masters(0).r.expectDequeue(genAXIReadData(0, test_data(0)(0), true))
                    dut.io.masters(0).r.expectDequeue(genAXIReadData(0, test_data(0)(1), true))
                }.fork{
                    dut.io.masters(1).r.expectDequeue(genAXIReadData(0, test_data(1)(0), true))
                    dut.io.masters(1).r.expectDequeue(genAXIReadData(0, test_data(1)(1), true))
                }.fork{
                    dut.io.masters(2).r.expectDequeue(genAXIReadData(0, test_data(2)(0), true))
                    dut.io.masters(2).r.expectDequeue(genAXIReadData(0, test_data(2)(1), true))
                }.fork{
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(0), true))
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(1), true))
                }.fork{
                    dut.io.slaves(1).r.enqueue(genAXIReadData(0, test_data(1)(0), true))
                    dut.io.slaves(1).r.enqueue(genAXIReadData(0, test_data(1)(1), true))
                }.fork{
                    dut.io.slaves(2).r.enqueue(genAXIReadData(0, test_data(2)(0), true))
                    dut.io.slaves(2).r.enqueue(genAXIReadData(0, test_data(2)(1), true))
                }.fork{
                    dut.io.masters(0).ar.enqueue(genAXIAddr(test_addr(0)(0)))
                    dut.io.masters(0).ar.enqueue(genAXIAddr(test_addr(0)(1)))
                }.fork{
                    dut.io.masters(1).ar.enqueue(genAXIAddr(test_addr(1)(0)))
                    dut.io.masters(1).ar.enqueue(genAXIAddr(test_addr(1)(1)))
                }.fork{
                    dut.io.masters(2).ar.enqueue(genAXIAddr(test_addr(2)(0)))
                    dut.io.masters(2).ar.enqueue(genAXIAddr(test_addr(2)(1)))
                }.join()        

            dut.clock.step(1)

            println("--------")
            println("[Test 2] AXI cross bar WRITE test")
            println("[Test 2]: Masters write data to each slave according to addr")
            println("[Test 2]: Slaves respond after handshake")
            
            test_addr = genAddr(2)
            println(s"[DEBUG] test_addr: ${test_addr}")
            test_data = genData(2)
            println(s"[DEBUG] test_data: ${test_data}")

            fork{
                    dut.io.slaves(0).aw.expectDequeue(genAXIAddr(test_addr(0)(0)))
                    dut.io.slaves(0).aw.expectDequeue(genAXIAddr(test_addr(0)(1)))
                }.fork{
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(0)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(1)))
                }.fork{
                    dut.io.slaves(2).aw.expectDequeue(genAXIAddr(test_addr(2)(0)))
                    dut.io.slaves(2).aw.expectDequeue(genAXIAddr(test_addr(2)(1)))
                }.fork{
                    dut.io.slaves(0).w.expectDequeue(genAXIWriteData(0, test_data(0)(0), "b1111", true))
                    dut.io.slaves(0).w.expectDequeue(genAXIWriteData(0, test_data(0)(1), "b1111", true))
                }.fork{
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(0), "b1111", true))
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(1), "b1111", true))
                }.fork{
                    dut.io.slaves(2).w.expectDequeue(genAXIWriteData(0, test_data(2)(0), "b1111", true))
                    dut.io.slaves(2).w.expectDequeue(genAXIWriteData(0, test_data(2)(1), "b1111", true))
                }.fork{
                    dut.io.masters(0).b.expectDequeue(genAXIWriteResp(0))
                    dut.io.masters(0).b.expectDequeue(genAXIWriteResp(0))
                }.fork{
                    dut.io.masters(1).b.expectDequeue(genAXIWriteResp(0))
                    dut.io.masters(1).b.expectDequeue(genAXIWriteResp(0))
                }.fork{
                    dut.io.masters(2).b.expectDequeue(genAXIWriteResp(0))
                    dut.io.masters(2).b.expectDequeue(genAXIWriteResp(0))
                }.fork{
                    dut.io.masters(0).aw.enqueue(genAXIAddr(test_addr(0)(0)))
                    dut.io.masters(0).aw.enqueue(genAXIAddr(test_addr(0)(1)))
                }.fork{
                    dut.io.masters(1).aw.enqueue(genAXIAddr(test_addr(1)(0)))
                    dut.io.masters(1).aw.enqueue(genAXIAddr(test_addr(1)(1)))
                }.fork{
                    dut.io.masters(2).aw.enqueue(genAXIAddr(test_addr(2)(0)))
                    dut.io.masters(2).aw.enqueue(genAXIAddr(test_addr(2)(1)))
                }.fork{
                    dut.io.masters(0).w.enqueue(genAXIWriteData(0, test_data(0)(0), "b1111", true))
                    dut.io.masters(0).w.enqueue(genAXIWriteData(0, test_data(0)(1), "b1111", true))
                }.fork{
                    dut.io.masters(1).w.enqueue(genAXIWriteData(0, test_data(1)(0), "b1111", true))
                    dut.io.masters(1).w.enqueue(genAXIWriteData(0, test_data(1)(1), "b1111", true))
                }.fork{
                    dut.io.masters(2).w.enqueue(genAXIWriteData(0, test_data(2)(0), "b1111", true))
                    dut.io.masters(2).w.enqueue(genAXIWriteData(0, test_data(2)(1), "b1111", true))
                }.fork{
                    for(i <- 0 until 2){
                        fork.withRegion(Monitor){
                            while(!dut.io.slaves(0).aw.valid.peek().litToBoolean || !dut.io.slaves(0).w.valid.peek().litToBoolean)
                                dut.clock.step(1)
                        }.joinAndStep(dut.clock)
                        dut.io.slaves(0).b.enqueue(genAXIWriteResp(0))
                    }
                }.fork{
                    for(i <- 0 until 2){
                        fork.withRegion(Monitor){
                            while(!dut.io.slaves(1).aw.valid.peek().litToBoolean || !dut.io.slaves(1).w.valid.peek().litToBoolean)
                                dut.clock.step(1)
                        }.joinAndStep(dut.clock)
                        dut.io.slaves(1).b.enqueue(genAXIWriteResp(0))
                    }
                }.fork{
                    for(i <- 0 until 2){
                        fork.withRegion(Monitor){
                            while(!dut.io.slaves(2).aw.valid.peek().litToBoolean || !dut.io.slaves(2).w.valid.peek().litToBoolean)
                                dut.clock.step(1)
                        }.joinAndStep(dut.clock)
                        dut.io.slaves(2).b.enqueue(genAXIWriteResp(0))
                    }
                }.join()

            dut.clock.step(1)

            println("--------")
            println("[Test 3] AXI cross bar READ arbitration test")
            println("[Test 3]: Masters read data to same slave (slave0)")
            println("[Test 3]: Slave 0 respond data to each master accordingly")

            test_addr = genAddr(6)
            println(s"[DEBUG] test_addr: ${test_addr}")
            test_data = genData(6)
            println(s"[DEBUG] test_data: ${test_data}")

            fork{
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(1)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(2)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(0)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(4)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(5)))
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(3)))
                }.fork{
                    dut.io.masters(0).r.expectDequeue(genAXIReadData(0, test_data(0)(0), true))
                    dut.io.masters(0).r.expectDequeue(genAXIReadData(0, test_data(0)(3), true))
                }.fork{
                    dut.io.masters(1).r.expectDequeue(genAXIReadData(0, test_data(0)(1), true))
                    dut.io.masters(1).r.expectDequeue(genAXIReadData(0, test_data(0)(4), true))
                }.fork{
                    dut.io.masters(2).r.expectDequeue(genAXIReadData(0, test_data(0)(2), true))
                    dut.io.masters(2).r.expectDequeue(genAXIReadData(0, test_data(0)(5), true))
                }.fork{
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(1), true))
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(2), true))
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(0), true))
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(4), true))
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(5), true))
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(3), true))
                }.fork{
                    dut.io.masters(0).ar.enqueue(genAXIAddr(test_addr(0)(0)))
                    dut.io.masters(0).ar.enqueue(genAXIAddr(test_addr(0)(3)))
                }.fork{
                    dut.io.masters(1).ar.enqueue(genAXIAddr(test_addr(0)(1)))
                    dut.io.masters(1).ar.enqueue(genAXIAddr(test_addr(0)(4)))
                }.fork{
                    dut.io.masters(2).ar.enqueue(genAXIAddr(test_addr(0)(2)))
                    dut.io.masters(2).ar.enqueue(genAXIAddr(test_addr(0)(5)))
                }.join()        

            println("--------")
            println("[Test 4] AXI cross bar WRITE arbitration test")
            println("[Test 4]: Masters write data to same slave (slave1)")
            println("[Test 4]: Slave 1 respond after handshake accordingly")

            test_addr = genAddr(6)
            println(s"[DEBUG] test_addr: ${test_addr}")
            test_data = genData(6)
            println(s"[DEBUG] test_data: ${test_data}")

            fork{
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(2)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(0)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(1)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(5)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(3)))
                    dut.io.slaves(1).aw.expectDequeue(genAXIAddr(test_addr(1)(4)))
                }.fork{
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(2), "b1111", true))
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(0), "b1111", true))
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(1), "b1111", true))
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(5), "b1111", true))
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(3), "b1111", true))
                    dut.io.slaves(1).w.expectDequeue(genAXIWriteData(0, test_data(1)(4), "b1111", true))
                }.fork{
                    dut.io.masters(0).b.expectDequeue(genAXIWriteResp(0))
                    dut.io.masters(0).b.expectDequeue(genAXIWriteResp(0))
                }.fork{
                    dut.io.masters(1).b.expectDequeue(genAXIWriteResp(0))
                    dut.io.masters(1).b.expectDequeue(genAXIWriteResp(0))
                }.fork{
                    dut.io.masters(2).b.expectDequeue(genAXIWriteResp(0))
                    dut.io.masters(2).b.expectDequeue(genAXIWriteResp(0))
                }.fork{
                    dut.io.masters(0).aw.enqueue(genAXIAddr(test_addr(1)(0)))
                    dut.io.masters(0).aw.enqueue(genAXIAddr(test_addr(1)(3)))
                }.fork{
                    dut.io.masters(1).aw.enqueue(genAXIAddr(test_addr(1)(1)))
                    dut.io.masters(1).aw.enqueue(genAXIAddr(test_addr(1)(4)))
                }.fork{
                    dut.io.masters(2).aw.enqueue(genAXIAddr(test_addr(1)(2)))
                    dut.io.masters(2).aw.enqueue(genAXIAddr(test_addr(1)(5)))
                }.fork{
                    dut.io.masters(0).w.enqueue(genAXIWriteData(0, test_data(1)(0), "b1111", true))
                    dut.io.masters(0).w.enqueue(genAXIWriteData(0, test_data(1)(3), "b1111", true))
                }.fork{
                    dut.io.masters(1).w.enqueue(genAXIWriteData(0, test_data(1)(1), "b1111", true))
                    dut.io.masters(1).w.enqueue(genAXIWriteData(0, test_data(1)(4), "b1111", true))
                }.fork{
                    dut.io.masters(2).w.enqueue(genAXIWriteData(0, test_data(1)(2), "b1111", true))
                    dut.io.masters(2).w.enqueue(genAXIWriteData(0, test_data(1)(5), "b1111", true))
                }.fork{
                    for(i <- 0 until 6){
                        fork.withRegion(Monitor){
                            while(!dut.io.slaves(1).aw.valid.peek().litToBoolean || !dut.io.slaves(1).w.valid.peek().litToBoolean)
                                dut.clock.step(1)
                        }.joinAndStep(dut.clock)
                        dut.io.slaves(1).b.enqueue(genAXIWriteResp(0))
                    }
                }.join()     

            dut.clock.step(1)

            println("--------")
            println("[Test 5] AXI cross bar READ & WRITE same slave at the same time")
            println("[Test 5]: Master0 read data from slave0")
            println("[Test 5]: Master1 write data to slave0")
            println("[Test 5]: Slave 0 respond at the same time")

            test_addr = genAddr(2)
            println(s"[DEBUG] test_addr: ${test_addr}")
            test_data = genData(2)
            println(s"[DEBUG] test_data: ${test_data}")

            fork{
                    dut.io.slaves(0).ar.expectDequeue(genAXIAddr(test_addr(0)(0)))
                }.fork{
                    dut.io.slaves(0).aw.expectDequeue(genAXIAddr(test_addr(0)(1)))
                }.fork{
                    dut.io.slaves(0).w.expectDequeue(genAXIWriteData(0, test_data(0)(1), "b1111", true))
                }.fork{
                    dut.io.masters(0).r.expectDequeue(genAXIReadData(0, test_data(0)(0), true))
                }.fork{
                    dut.io.masters(1).b.expectDequeue(genAXIWriteResp(0))
                }.fork{
                    dut.io.masters(0).ar.enqueue(genAXIAddr(test_addr(0)(0)))
                }.fork{
                    dut.io.slaves(0).r.enqueue(genAXIReadData(0, test_data(0)(0), true))
                }.fork{
                    dut.io.masters(1).aw.enqueue(genAXIAddr(test_addr(0)(1)))
                }.fork{
                    dut.io.masters(1).w.enqueue(genAXIWriteData(0, test_data(0)(1), "b1111", true))
                }.fork{
                    fork.withRegion(Monitor){
                        while(!dut.io.slaves(0).aw.valid.peek().litToBoolean || !dut.io.slaves(0).w.valid.peek().litToBoolean)
                            dut.clock.step(1)
                    }.joinAndStep(dut.clock)
                    dut.io.slaves(0).b.enqueue(genAXIWriteResp(0))
                }.join()     

            dut.clock.step(1)

            println("----TEST END----")
        }
    }
}