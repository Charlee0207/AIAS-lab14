package acal_lab14.topPipelinedCPU

import chisel3._
import chisel3.util._

import acal_lab14.PipelinedCPU._
import acal_lab14.Memory._
import acal_lab14.AXI._
import acal_lab14.AXILite._
import Config._



class top extends Module {
    val io = IO(new Bundle {
        val regs        = Output(Vec(32, UInt(32.W)))
        val Hcf         = Output(Bool())
        
        //for sure that IM and DM will be synthesized
        // val inst = Output(UInt(32.W))
        val rdata = Output(UInt(32.W))
        val wdata  = Output(UInt(32.W))

        val Dump_Mem = Input(Bool())
        // Test
        val E_Branch_taken = Output(Bool())
        val Flush = Output(Bool())
        val Stall_MA = Output(Bool())
        val Stall_DH = Output(Bool())
        val IF_PC = Output(UInt(32.W))
        val ID_PC = Output(UInt(32.W))
        val EXE_PC = Output(UInt(32.W))
        val MEM_PC = Output(UInt(32.W))
        val WB_PC = Output(UInt(32.W))
        val EXE_alu_out = Output(UInt(32.W))
        val EXE_src1 = Output(UInt(32.W))
        val EXE_src2 = Output(UInt(32.W))
        val ALU_src1 = Output(UInt(32.W))
        val ALU_src2 = Output(UInt(32.W))
        val raddr = Output(UInt(32.W))
        val WB_rd = Output(UInt(5.W))
        val WB_wdata = Output(UInt(32.W))
        val EXE_Jump = Output(Bool())
        val EXE_Branch = Output(Bool())

        val Cycle_Count = Output(UInt(32.W))

        // val arDone = Output(Bool())
        // val rDone = Output(Bool())
        // val awDone = Output(Bool())
        // val wDone = Output(Bool())
        // val bDone = Output(Bool())
        // val byteMask = Output(UInt(4.W))
        // val bitMask = Output(UInt(32.W))
        // val rOffset = Output(UInt(5.W))
        // val wOffset = Output(UInt(5.W))
        // val rMaskData = Output(UInt(32.W))
        // val wMaskData = Output(UInt(32.W))
        // val wStrb = Output(UInt(4.W))
    })

    val cpu = Module(new PipelinedCPU(Lab14_2_2_Config.s_id_width, Lab14_2_2_Config.addr_width, Lab14_2_2_Config.data_width, Lab14_2_2_Config.instr_hex_path))
    val dm  = Module(new DataMem(Lab14_2_2_Config.s_id_width, Lab14_2_2_Config.data_mem_size, Lab14_2_2_Config.addr_width, Lab14_2_2_Config.data_width, Lab14_2_2_Config.data_hex_path))
    val bus = Module(new AXILiteXBar(Lab14_2_2_Config.nMasters, Lab14_2_2_Config.nSlaves, Lab14_2_2_Config.s_id_width, Lab14_2_2_Config.addr_width, Lab14_2_2_Config.data_width, Lab14_2_2_Config.addr_map))
    val cpu_axi_if = Module(new CPU_AXI_IF(Lab14_2_2_Config.s_id_width, Lab14_2_2_Config.addr_width, Lab14_2_2_Config.data_width))

    // CPU (MemIF) <=> CPU_AXI_IF <=> AXI BUS <=> DataMem
    // CPU (MemIF) <=> CPU_AXI_IF
    cpu_axi_if.io.Mem_R         := cpu.io.DataMem.Mem_R
    cpu_axi_if.io.Mem_W         := cpu.io.DataMem.Mem_W
    cpu_axi_if.io.Length        := cpu.io.DataMem.Length
    cpu_axi_if.io.raddr         := cpu.io.DataMem.raddr
    cpu_axi_if.io.waddr         := cpu.io.DataMem.waddr
    cpu_axi_if.io.wdata         := cpu.io.DataMem.wdata
    cpu.io.DataMem.Valid        := cpu_axi_if.io.Valid
    cpu.io.DataMem.rdata        := cpu_axi_if.io.rdata

    // CPU_AXI_IF <=> AXI BUS <=> DataMem
    bus.io.masters(0) <> cpu_axi_if.io.master
    bus.io.slaves(0) <> dm.io.slave


    //System
    io.regs := cpu.io.regs
    io.Hcf := cpu.io.Hcf
    // io.inst := cpu.im.io.inst
    io.rdata := cpu_axi_if.io.rdata
    io.wdata := cpu_axi_if.io.wdata

    // memory dump signal
    // dm.io.dump := io.Dump_Mem

    // Initialization
    io.Cycle_Count := cpu.io.Cycle_Count
    io.E_Branch_taken := cpu.io.E_Branch_taken
    io.Flush := cpu.io.Flush
    io.Stall_MA := cpu.io.Stall_MA
    io.Stall_DH := cpu.io.Stall_DH
    io.IF_PC := cpu.io.IF_PC
    io.ID_PC := cpu.io.ID_PC
    io.EXE_PC := cpu.io.EXE_PC
    io.MEM_PC := cpu.io.MEM_PC
    io.WB_PC := cpu.io.WB_PC
    io.EXE_alu_out := cpu.io.EXE_alu_out
    io.EXE_src1 := cpu.io.EXE_src1
    io.EXE_src2 := cpu.io.EXE_src2
    io.ALU_src1 := cpu.io.ALU_src1
    io.ALU_src2 := cpu.io.ALU_src2
    io.raddr := cpu.io.DataMem.raddr
    io.WB_rd := cpu.io.WB_rd
    io.WB_wdata := cpu.io.WB_wdata
    io.EXE_Jump := cpu.io.EXE_Jump
    io.EXE_Branch := cpu.io.EXE_Branch
}

object top extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(
        new top(),
        Array("-td", "generated/topPipelinedCPU")
    )
}
