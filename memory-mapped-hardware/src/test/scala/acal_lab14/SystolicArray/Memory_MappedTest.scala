package acal_lab14.SystolicArray

import scala.io.Source
import chisel3.iotesters.{PeekPokeTester, Driver}
import scala.language.implicitConversions

class Memory_MappedTest(dut: Memory_Mapped) extends PeekPokeTester(dut) {
  // Read the second value (STATUS) of localMem
  poke(dut.io.slave.ar.bits.addr, 0x100008)
  poke(dut.io.slave.ar.valid, true)
  poke(dut.io.slave.r.ready, true)
  step(2)
  poke(dut.io.slave.ar.bits.addr, 0x0)
  poke(dut.io.slave.ar.valid, false)
  step(1)
  poke(dut.io.slave.r.ready, false)
  step(1)

  // Read the second double-word value of localMem
  poke(dut.io.slave.ar.bits.addr, 0x200008)
  poke(dut.io.slave.ar.valid, true)
  poke(dut.io.slave.r.ready, true)
  step(2)
  poke(dut.io.slave.ar.bits.addr, 0x0)
  poke(dut.io.slave.ar.valid, false)
  step(1)
  poke(dut.io.slave.r.ready, false)
  step(1)

  // Write 1 to the first reg (ENABLE) of Regfile
  poke(dut.io.slave.aw.bits.addr, 0x00000)
  poke(dut.io.slave.aw.valid, true)
  poke(dut.io.slave.w.bits.data, 1)
  poke(dut.io.slave.w.valid, true)
  step(2)
  poke(dut.io.slave.aw.bits.addr, 0x00000)
  poke(dut.io.slave.aw.valid, false)
  poke(dut.io.slave.w.bits.data, 0)
  poke(dut.io.slave.w.valid, false)

  poke(dut.io.slave.b.ready, true)
  step(1)
  poke(dut.io.slave.b.ready, false)
  step(1)

  step(10)
}

object Memory_MappedTest extends App {
  Driver.execute(
    Array("-tbn", "verilator"),
    () => new Memory_Mapped(0x8000, 2, 32, 32, 32)
  ) { c: Memory_Mapped =>
    new Memory_MappedTest(c)
  }
}
