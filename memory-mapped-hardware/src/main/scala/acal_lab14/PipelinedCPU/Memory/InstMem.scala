package acal_lab14.PipelinedCPU.Memory

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import firrtl.annotations.MemoryLoadFileType

class InstMem(bits: Int, binaryFile: String) extends Module {
  val io = IO(new Bundle {
    // 32kB -> bits = 15
    val raddr = Input(UInt(15.W))
    val inst  = Output(UInt(32.W))
  })
  println("================================================")
  println(s"InstMem: bits = $bits, binaryFile = $binaryFile")
  println("================================================")


  val memory = Mem((1 << 15), UInt(8.W))
  
  println("================================================")
  println(s"InstMem: memory size = ${memory.length}")
  println("================================================")

  loadMemoryFromFile(memory, binaryFile)

  val rdata = Wire(UInt(32.W))
  rdata := Cat(
    memory((io.raddr + 3.U)),
    memory((io.raddr + 2.U)),
    memory((io.raddr + 1.U)),
    memory((io.raddr + 0.U))
  )

  io.inst := rdata
}
