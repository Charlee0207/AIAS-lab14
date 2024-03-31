package acal_lab14.AXILite

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.ChiselScalatestTester

import chiseltest.simulator.WriteVcdAnnotation
import chisel3.experimental.BundleLiterals._

import Config._
import Utils.AXITester

class AXISlaveReadMuxTest extends AnyFlatSpec
    with ChiselScalatestTester
    with AXITester {
        val idWidth = AXI_TestConfig.s_id_width
        val addrWidth = AXI_TestConfig.addr_width
        val dataWidth = AXI_TestConfig.data_width
    "Master" should "Read addr from bus & Read data from slave device" in {
        test(new AXISlaveReadMux(
            AXI_TestConfig.nMasters,
            AXI_TestConfig.s_id_width,
            AXI_TestConfig.addr_width,
            AXI_TestConfig.data_width,
        )).withAnnotations(Seq(
            WriteVcdAnnotation,
        )){ dut =>
            /* Initialize IO ports */
            for (i <- 0 until AXI_TestConfig.nMasters) {
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
                dut.io.out.readAddr.expectDequeue(genAXIAddr(BigInt("1234", 16)))
                // Check if the data read from master 0 is the same as the data from slave
                dut.io.in(0).readData.expectDequeue(genAXIReadData(0, BigInt("4321", 16), true))
            }.fork{
                dut.io.in(0).readAddr.enqueue(genAXIAddr(BigInt("1234", 16)))
                dut.io.out.readData.enqueue(genAXIReadData(0, BigInt("4321", 16), true))   // Gen resp data from slave
            }.join()

            dut.clock.step(1)

            println("--------")
            println("[Test 2] Input address from master 1")
            println("[Test 2]: Send address 0x5678 from master 1 to slave")
            println("[Test 2]: Respond data 0x8765 from slave")

            fork{
                // Check if the address read from slave is the same as the address from master0
                dut.io.out.readAddr.expectDequeue(genAXIAddr(BigInt("5678", 16)))
                // Check if the data read from master 0 is the same as the data from slave
                dut.io.in(1).readData.expectDequeue(genAXIReadData(0, BigInt("8765", 16), true))
            }.fork{
                dut.io.in(1).readAddr.enqueue(genAXIAddr(BigInt("5678", 16)))
                dut.io.out.readData.enqueue(genAXIReadData(0, BigInt("8765", 16), true))   // Gen resp data from slave
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
                dut.io.in(0).readAddr.enqueue(genAXIAddr(BigInt("aaaa", 16)))
                dut.io.in(0).readAddr.enqueue(genAXIAddr(BigInt("cccc", 16)))
            }.fork{
                dut.io.in(1).readAddr.enqueue(genAXIAddr(BigInt("bbbb", 16)))
                dut.io.in(1).readAddr.enqueue(genAXIAddr(BigInt("dddd", 16)))
            }.fork{
                dut.io.out.readData.enqueue(genAXIReadData(0, BigInt("6666", 16), true))
                dut.io.out.readData.enqueue(genAXIReadData(0, BigInt("7777", 16), true))
                dut.io.out.readData.enqueue(genAXIReadData(0, BigInt("8888", 16), true))
                dut.io.out.readData.enqueue(genAXIReadData(0, BigInt("9999", 16), true))
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
            dut.clock.step(2)

            println("----TEST END----")
        }

    }
}
