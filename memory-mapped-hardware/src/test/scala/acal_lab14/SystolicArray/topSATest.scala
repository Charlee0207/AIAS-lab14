package acal_lab14.SystolicArray

import scala.io.Source
import chisel3.iotesters.{PeekPokeTester, Driver}
import scala.language.implicitConversions
import java.io._

class topSATest(dut: topSA) extends PeekPokeTester(dut) {

  implicit def bigint2bool(bi: BigInt) = if (bi != 0) true else false

  def mmul(a: Array[Array[Int]], b: Array[Array[Int]]): Array[Array[Int]] = {
    for (row_vec <- a) yield {
      for (col_vec <- b.transpose) yield {
        (row_vec zip col_vec).map { case (x, y) => x * y }.reduce(_ + _)
      }
    }
  }

  def matInit(n: Int, rseed: Int): Array[Array[Int]] = {
    val maxval = 5
    val rnd    = new scala.util.Random(rseed)
    // randomly generate the n*n matrix, the range of each element is 1~5
    Array.tabulate(n) { _ => Array.tabulate(n) { _ => rnd.nextInt(maxval) + 1 } }
  }

  def printmat(m: Array[Array[Int]]): Unit = {
    m.foreach { r =>
      r.foreach { v => print(f"$v%4d") }
      println()
    }
    println()
  }

  val mat_size = 4
  val rows     = 4
  val cols     = 4
  val a_mat    = matInit(mat_size, 4)
  val b_mat    = matInit(mat_size, 5)
  val c_mat    = mmul(a_mat, b_mat)

  print("==A_mat \n")
  printmat(a_mat)
  print("==B_mat \n")
  printmat(b_mat)
  print("==C_mat \n")
  printmat(c_mat)

  val localMem_writer     = new PrintWriter(new File("./src/main/resource/SystolicArray/LocalMem.hex"))
  val a_mat_flatten       = a_mat.flatten
  val b_mat_flatten       = b_mat.flatten
  var temp_string: String = ""

  // use Little-Endian
  for (i <- 0 until (rows * cols) by 8) {
    for (j <- i + 7 to i by -1) { temp_string += "%02x".format(a_mat_flatten(j)) }
    localMem_writer.println(temp_string)
    temp_string = ""
  }

  for (i <- 0 until (rows * cols) by 8) {
    for (j <- i + 7 to i by -1) { temp_string += "%02x".format(b_mat_flatten(j)) }
    localMem_writer.println(temp_string)
    temp_string = ""
  }

  localMem_writer.close

  // tester=========================================================

  poke(dut.io.slave.aw.bits.addr, 0x100000)
  poke(dut.io.slave.aw.valid, true)
  poke(dut.io.slave.w.bits.data, 0x1)
  poke(dut.io.slave.w.valid, true)
  poke(dut.io.slave.b.ready, true)
  step(2)
  poke(dut.io.slave.aw.bits.addr, 0x0)
  poke(dut.io.slave.aw.valid, false)
  poke(dut.io.slave.w.bits.data, 0x0)
  poke(dut.io.slave.w.valid, false)
  step(1)
  poke(dut.io.slave.b.ready, false)

  step(30)

}

object topSATest extends App {
  Driver.execute(
    Array("-tbn", "verilator"),
    () => new topSA(2, 32, 32, 32, 0x8000)
  ) { c: topSA =>
    new topSATest(c)
  }
}
