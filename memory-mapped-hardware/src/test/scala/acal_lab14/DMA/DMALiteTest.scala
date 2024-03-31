package acal_lab14.DMA

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

import Config._
import Utils.AXITester

class DMALiteTest
    extends AnyFlatSpec
    with ChiselScalatestTester
    with AXITester {
        val idWidth = AXI_TestConfig.s_id_width
        val addrWidth = AXI_TestConfig.addr_width
        val dataWidth = AXI_TestConfig.data_width
        val baseAddr = 0
    "Test 1" should "receive and send correct axi commands" in {
        test(
        new DMA(
            AXI_TestConfig.s_id_width,
            AXI_TestConfig.addr_width,
            AXI_TestConfig.data_width,
            baseAddr
        )
        ).withAnnotations(
        Seq(WriteVcdAnnotation)
        ) { dut =>
        // init clocks
        dut.io.slave.aw.initSource().setSourceClock(dut.clock)
        dut.io.slave.w.initSource().setSourceClock(dut.clock)
        dut.io.slave.ar.initSource().setSourceClock(dut.clock)
        dut.io.slave.r.initSink().setSinkClock(dut.clock)
        dut.io.slave.b.initSink().setSinkClock(dut.clock)
        dut.io.master.aw.initSink().setSinkClock(dut.clock)
        dut.io.master.w.initSink().setSinkClock(dut.clock)
        dut.io.master.ar.initSink().setSinkClock(dut.clock)
        dut.io.master.r.initSource().setSourceClock(dut.clock)
        dut.io.master.b.initSource().setSourceClock(dut.clock)

        // make requests
        val prog_source_aw = genAXIAddr(4)
        val prog_source_w = genAXIWriteData(0, 0, "b1111", true)
        val prog_source_b = genAXIWriteResp(0)

        val prog_dest_aw = genAXIAddr(8)
        val prog_dest_w = 
            genAXIWriteData(0, BigInt("8000", 16), "b1111", true)
        val prog_dest_b = genAXIWriteResp(0)

        val prog_size_aw = genAXIAddr(12)
        val prog_size_w =
            genAXIWriteData(0, BigInt("04040202", 16), "b1111", true)
        val prog_size_b = genAXIWriteResp(0)

        val prog_enable_aw = genAXIAddr(0)
        val prog_enable_w = genAXIWriteData(0, 1, "b1111", true)
        val prog_enable_b = genAXIWriteResp(0)

        val prog_done_ar = genAXIAddr(20)
        val prog_done_r = genAXIReadData(0, 1, true)

        val arReqAddrs = for (i <- 0 until 2) yield i * 4
        val arReqSeq = arReqAddrs.map { case x =>
            genAXIAddr(x)
        }

        val awReqAddrs = for (i <- 0 until 2) yield i * 4 + BigInt("8000", 16)
        val awReqSeq = awReqAddrs.map { case x =>
            genAXIAddr(x)
        }

        def transform(x: Int): Int = {
            x * 5 + 1
        }

        val wReqData = for (i <- 0 until 2) yield transform(i)
        val wReqSeq = wReqData.map { case x =>
            genAXIWriteData(0, x, "b0011", true)
        }

        val rRespData = for (i <- 0 until 2) yield transform(i)
        val rRespSeq = rRespData.map { case x =>
            genAXIReadData(0, x, true)
        }

        val bRespSeq = for (i <- 0 until 2) yield genAXIWriteResp(0)

        // Program Start address 0
        fork {
            dut.io.slave.aw.enqueue(prog_source_aw)
        }.fork {
            dut.io.slave.w.enqueue(prog_source_w)
        }.fork {
            dut.io.slave.b.expectDequeue(prog_source_b)
        }.join()

        // Program Dest address 0x8000
        fork {
            dut.io.slave.aw.enqueue(prog_dest_aw)
        }.fork {
            dut.io.slave.w.enqueue(prog_dest_w)
        }.fork {
            dut.io.slave.b.expectDequeue(prog_dest_b)
        }.join()

        // Program Size
        // SS : 4 (bytes)
        // DS : 4 (bytes)
        // TH : 2 (bytes)
        // TW : 2 (bytes)
        fork {
            dut.io.slave.aw.enqueue(prog_size_aw)
        }.fork {
            dut.io.slave.w.enqueue(prog_size_w)
        }.fork {
            dut.io.slave.b.expectDequeue(prog_size_b)
        }.join()

        // Program start and monitor AR, AW, W, drive R, B
        fork {
            dut.io.slave.aw.enqueue(prog_enable_aw)
        }.fork {
            dut.io.slave.w.enqueue(prog_enable_w)
        }.fork {
            dut.io.slave.b.expectDequeue(prog_enable_b)
        }.join()

        fork {
            var i = 0
            while (i < 2) {
            fork {
                dut.io.master.ar.expectDequeue(arReqSeq(i))
            }.join()
            dut.io.master.r.enqueue(rRespSeq(i))
            i += 1
            }
        }.fork {
            var j = 0
            while (j < 2) {
            fork {
                dut.io.master.aw.expectDequeue(awReqSeq(j))
            }.fork {
                dut.io.master.w.expectDequeue(wReqSeq(j))
            }.join()
            dut.io.master.b.enqueue(bRespSeq(j))
            j += 1
            }
        }.join()

        // Read DONE bit
        fork {
            dut.io.slave.ar.enqueue(prog_done_ar)
        }.fork {
            dut.io.slave.r.expectDequeue(prog_done_r)
        }.join()
        }
    }
}
