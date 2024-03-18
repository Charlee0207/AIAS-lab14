package acal_lab14.AXILite

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import acal_lab14.AXI._
import Config._

// allocation of 2 slaves in memory space


class AXISlaveWriteMuxTest extends AnyFlatSpec with ChiselScalatestTester{
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

    "Master" should "Write addr to bus & Write data to slave device" in {
        test(new AXISlaveWriteMux(
            AXI_Config.master_num,
            AXI_Config.s_id_width,
            AXI_Config.addr_width,
            AXI_Config.data_width,
        )).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>
            /* Initialize IO ports */
            for (i <- 0 until AXI_Config.master_num) {
                // input port
                dut.io.in(i).writeAddr.initSource().setSourceClock(dut.clock)
                dut.io.in(i).writeData.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.in(i).writeResp.initSink().setSinkClock(dut.clock)
            }
            dut.io.out.writeResp.initSource().setSourceClock(dut.clock)
            dut.io.out.writeAddr.initSink().setSinkClock(dut.clock)
            dut.io.out.writeData.initSink().setSinkClock(dut.clock)
            
            println("----START TEST----")

            println("[Test 1] Input from master 0")
            println("[Test 1]: Send address 0x1234 & data 0x4321 from master 0 to slave")
            
            dut.clock.step(1)
            fork{
                dut.io.out.writeAddr.expectDequeue(genAXIawSignals(BigInt("1234", 16)))
            }.fork{
                dut.io.out.writeData.expectDequeue(genAXIwSignals(BigInt("4321", 16)))
            }.fork{
                dut.io.in(0).writeResp.expectDequeue(genAXIbSignals())
            }.fork{
                dut.io.in(0).writeAddr.enqueue(genAXIawSignals(BigInt("1234", 16)))
            }.fork{
                dut.io.in(0).writeData.enqueue(genAXIwSignals(BigInt("4321", 16)))
            }.fork{
                fork.withRegion(Monitor){
                    while(!dut.io.out.writeAddr.valid.peek().litToBoolean || !dut.io.out.writeData.valid.peek().litToBoolean){
                        dut.clock.step(1)
                    }
                }.joinAndStep(dut.clock)
                dut.io.out.writeResp.enqueue(genAXIbSignals())
            }.join()
            dut.clock.step(1)

            println("--------")
            println("[Test 2] Input from master 1")
            println("[Test 2]: Send address 0x5678 & data 0x8765 from master 1 to slave")

            fork{
                dut.io.out.writeAddr.expectDequeue(genAXIawSignals(BigInt("5678", 16)))
            }.fork{
                dut.io.out.writeData.expectDequeue(genAXIwSignals(BigInt("8765", 16)))
            }.fork{
                dut.io.in(0).writeResp.expectDequeue(genAXIbSignals())
            }.fork{
                dut.io.in(0).writeAddr.enqueue(genAXIawSignals(BigInt("5678", 16)))
            }.fork{
                dut.io.in(0).writeData.enqueue(genAXIwSignals(BigInt("8765", 16)))
            }.fork{
                fork.withRegion(Monitor){
                    while(!dut.io.out.writeAddr.valid.peek().litToBoolean || !dut.io.out.writeData.valid.peek().litToBoolean){
                        dut.clock.step(1)
                    }
                }.joinAndStep(dut.clock)
                dut.io.out.writeResp.enqueue(genAXIbSignals())
            }.join()
            dut.clock.step(1)

            println("--------")
            println("[Test 3] Input address from master 1 & 2 at the same time")
            println("[Test 3]: Send address 0xaaaa & 0xcccc from master 0 to slave")
            println("[Test 3]: Send address 0xbbbb & 0xdddd from master 1 to slave")
            println("[Test 3]: Send data 0x6666, 0x7777 from master 0 to slave")
            println("[Test 3]: Send data 0x8888, 0x9999 from master 1 to slave")
            println("[Test 3]: Respond writeResp from slave")
            println("[Test 3]: Observe address read from slave & data read from master")

            dut.io.out.writeAddr.ready.poke(true.B)
            dut.io.out.writeData.ready.poke(true.B)

            fork{
                dut.io.in(0).writeAddr.enqueue(genAXIawSignals(BigInt("aaaa", 16)))
                dut.io.in(0).writeAddr.enqueue(genAXIawSignals(BigInt("cccc", 16)))
            }.fork{
                dut.io.in(1).writeAddr.enqueue(genAXIawSignals(BigInt("bbbb", 16)))
                dut.io.in(1).writeAddr.enqueue(genAXIawSignals(BigInt("dddd", 16)))
            }.fork{
                dut.io.in(0).writeData.enqueue(genAXIwSignals(BigInt("6666", 16)))
                dut.io.in(0).writeData.enqueue(genAXIwSignals(BigInt("7777", 16)))
            }.fork{
                dut.io.in(1).writeData.enqueue(genAXIwSignals(BigInt("8888", 16)))
                dut.io.in(1).writeData.enqueue(genAXIwSignals(BigInt("9999", 16)))
            }.fork{
                dut.io.in(0).writeResp.expectDequeue(genAXIbSignals())
                dut.io.in(0).writeResp.expectDequeue(genAXIbSignals())
            }.fork{
                dut.io.in(1).writeResp.expectDequeue(genAXIbSignals())
                dut.io.in(1).writeResp.expectDequeue(genAXIbSignals())
            }.fork{
                for(i <- 0 until 4){
                    fork.withRegion(Monitor){
                        while(!(dut.io.in(0).writeAddr.valid.peek().litToBoolean | dut.io.in(1).writeData.valid.peek().litToBoolean))
                            {
                            dut.clock.step(1)
                        }
                    }.joinAndStep(dut.clock)
                    dut.io.out.writeResp.enqueue(genAXIbSignals())
                }
            }.fork
                .withRegion(Monitor){
                    while(!(dut.io.out.writeAddr.valid.peek().litToBoolean & dut.io.out.writeData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] First try") 
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.writeAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Slave observe data 0x" + dut.io.out.writeData.bits.data.peek().litValue.toString(16))
                    dut.clock.step(1)

                    while(!(dut.io.out.writeAddr.valid.peek().litToBoolean & dut.io.out.writeData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] Second try") 
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.writeAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Slave observe data 0x" + dut.io.out.writeData.bits.data.peek().litValue.toString(16))
                    dut.clock.step(1)

                    while(!(dut.io.out.writeAddr.valid.peek().litToBoolean & dut.io.out.writeData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] Third try")
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.writeAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Slave observe data 0x" + dut.io.out.writeData.bits.data.peek().litValue.toString(16))
                    dut.clock.step(1)

                    while(!(dut.io.out.writeAddr.valid.peek().litToBoolean & dut.io.out.writeData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] Fourth try")
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.writeAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Slave observe data 0x" + dut.io.out.writeData.bits.data.peek().litValue.toString(16))
                }
                .joinAndStep(dut.clock)
            println("----TEST END----")
        }
    }
}
