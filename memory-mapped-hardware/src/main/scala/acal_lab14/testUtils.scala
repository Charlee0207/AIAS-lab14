package Utils

import chisel3._
import chisel3.experimental.BundleLiterals._

import acal_lab14.AXI._
import Config._

// Functions for generating test vectors
trait AXITester {
    
    val idWidth: Int
    val addrWidth: Int
    val dataWidth: Int
    
    def genAXIAddr(addr: BigInt): Axi4Request = {
        val req = new Axi4Request(idWidth, addrWidth, dataWidth).Lit(
            _.addr -> addr.U,
            _.burst -> 0.U, // burst mode : FIXED
            _.cache -> 0.U,
            _.id    -> 0.U,
            _.len   -> 0.U, // one beat for burst
            _.lock  -> 0.U,
            _.prot  -> 0.U,
            _.qos   -> 0.U,
            _.region -> 0.U,
            _.size  -> 2.U
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated ar signals : ${req}")
        req
    }

    def genAXIReadData(id: Int, data: BigInt, last: Boolean): Axi4ReadData = {
        val ret = new Axi4ReadData(idWidth, dataWidth).Lit(
            _.id -> id.U,
            _.data -> data.U,
            _.resp -> 0.U,
            _.last -> last.B
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated ar signals : ${ret}")
        ret
    }

    def genAXIWriteData(id: Int, data: BigInt, strb: String, last: Boolean): Axi4WriteData = {
        val ret = new Axi4WriteData(dataWidth).Lit(
            _.data -> data.U,
            _.strb -> strb.U,
            _.last -> last.B
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated ar signals : ${ret}")
        ret
    }

    def genAXIWriteResp(id: Int): Axi4WriteResp = {
        val ret = new Axi4WriteResp(idWidth).Lit(
            _.id -> id.U,
            _.resp -> 0.U
        )
        if (Constants.DEBUG)
            println(s"[DEBUG] the generated ar signals : ${ret}")
        ret
    }
} 