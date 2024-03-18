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


class AXISlaveReadMuxTest extends AnyFlatSpec with ChiselScalatestTester{
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

    "Master" should "Read addr from bus & Read data from slave device" in {
        test(new AXISlaveReadMux(
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
                dut.io.in(i).readAddr.initSource().setSourceClock(dut.clock)

                // output ports
                dut.io.in(i).readData.initSink().setSinkClock(dut.clock)
            }
            dut.io.out.readData.initSource().setSourceClock(dut.clock)
            dut.io.out.readAddr.initSink().setSinkClock(dut.clock)

            println("----START TEST----")

            println("[Test 1] Input address from master 0")
            println("[Test 1]: Send address 0x1234 from master 0 to slave")
            println("[Test 1]: Respond data 0x4321 from slave")
            
            fork{
                // Check if the address read from slave is the same as the address from master0
                dut.io.out.readAddr.expectDequeue(genAXIarSignals(BigInt("1234", 16)))
                // Check if the data read from master 0 is the same as the data from slave
                dut.io.in(0).readData.expectDequeue(genAXIrSignals(BigInt("4321", 16)))
            }.fork{
                dut.io.in(0).readAddr.enqueue(genAXIarSignals(BigInt("1234", 16)))
                dut.io.out.readData.enqueue(genAXIrSignals(BigInt("4321", 16)))   // Gen resp data from slave
            }.join()

            dut.clock.step(1)

            println("--------")
            println("[Test 2] Input address from master 1")
            println("[Test 2]: Send address 0x5678 from master 1 to slave")
            println("[Test 2]: Respond data 0x8765 from slave")

            fork{
                // Check if the address read from slave is the same as the address from master0
                dut.io.out.readAddr.expectDequeue(genAXIarSignals(BigInt("5678", 16)))
                // Check if the data read from master 0 is the same as the data from slave
                dut.io.in(1).readData.expectDequeue(genAXIrSignals(BigInt("8765", 16)))
            }.fork{
                dut.io.in(1).readAddr.enqueue(genAXIarSignals(BigInt("5678", 16)))
                dut.io.out.readData.enqueue(genAXIrSignals(BigInt("8765", 16)))   // Gen resp data from slave
            }.join()

            dut.clock.step(1)

            println("--------")
            println("[Test 3] Input address from master 1 & 2 at the same time")
            println("[Test 3]: Send address 0xaaaa & 0xcccc from master 0 to slave")
            println("[Test 3]: Send address 0xbbbb & 0xdddd from master 1 to slave")
            println("[Test 3]: Respond data 0x6666, 0x7777, 0x8888, 0x9999 from slave")
            println("[Test 3]: Observe address read from slave & data read from master")

            dut.io.out.readAddr.ready.poke(true.B)
            dut.io.in(0).readData.ready.poke(true.B)
            dut.io.in(1).readData.ready.poke(true.B)

            fork{
                dut.io.in(0).readAddr.enqueue(genAXIarSignals(BigInt("aaaa", 16)))
                dut.io.in(0).readAddr.enqueue(genAXIarSignals(BigInt("cccc", 16)))
            }.fork{
                dut.io.in(1).readAddr.enqueue(genAXIarSignals(BigInt("bbbb", 16)))
                dut.io.in(1).readAddr.enqueue(genAXIarSignals(BigInt("dddd", 16)))
            }.fork{
                dut.io.out.readData.enqueue(genAXIrSignals(BigInt("6666", 16)))
                dut.io.out.readData.enqueue(genAXIrSignals(BigInt("7777", 16)))
                dut.io.out.readData.enqueue(genAXIrSignals(BigInt("8888", 16)))
                dut.io.out.readData.enqueue(genAXIrSignals(BigInt("9999", 16)))
            }.fork
                .withRegion(Monitor){
                    while(!(dut.io.in(0).readData.valid.peek().litToBoolean | dut.io.in(1).readData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] First try") 
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.readAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Master 0 observe data 0x" + dut.io.in(0).readData.bits.data.peek().litValue.toString(16))
                    println("[Test 3]: Master 1 observe data 0x" + dut.io.in(1).readData.bits.data.peek().litValue.toString(16))
                    dut.clock.step(1)

                    while(!(dut.io.in(0).readData.valid.peek().litToBoolean | dut.io.in(1).readData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] Second try") 
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.readAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Master 0 observe data 0x" + dut.io.in(0).readData.bits.data.peek().litValue.toString(16))
                    println("[Test 3]: Master 1 observe data 0x" + dut.io.in(1).readData.bits.data.peek().litValue.toString(16))
                    dut.clock.step(1)

                    while(!(dut.io.in(0).readData.valid.peek().litToBoolean | dut.io.in(1).readData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] Third try")
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.readAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Master 0 observe data 0x" + dut.io.in(0).readData.bits.data.peek().litValue.toString(16))
                    println("[Test 3]: Master 1 observe data 0x" + dut.io.in(1).readData.bits.data.peek().litValue.toString(16))
                    dut.clock.step(1)

                    while(!(dut.io.in(0).readData.valid.peek().litToBoolean | dut.io.in(1).readData.valid.peek().litToBoolean))
                        dut.clock.step(1)
                    println("[Test 3] Fourth try")
                    println("[Test 3]: Slave observe address 0x" + dut.io.out.readAddr.bits.addr.peek().litValue.toString(16))
                    println("[Test 3]: Master 0 observe data 0x" + dut.io.in(0).readData.bits.data.peek().litValue.toString(16))
                    println("[Test 3]: Master 1 observe data 0x" + dut.io.in(1).readData.bits.data.peek().litValue.toString(16))
                }
                .joinAndStep(dut.clock)
            println("----TEST END----")
        }

    }
}
