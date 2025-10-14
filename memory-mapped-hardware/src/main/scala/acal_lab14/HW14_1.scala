package acal_lab14.HW14_1

import chisel3._
import chisel3.util._

import acal_lab14.PipelinedCPU._
import acal_lab14.Memory._
import acal_lab14.SystolicArray._
import acal_lab14.AXI._
import acal_lab14.AXILite._
import acal_lab14.DMA._
import Config._

/* ---------------------------------------------------------------------------------------------+
 * HW14_1 consists of a single cycle CPU, SRAM, and accelerator connected via AXI bus.          |
 * This system demonstrates that CPU can program accelerator through system bus and move data   |
 * from SRAM to local buffer in accelerator. (HW14-1)                                           |
 * ---------------------------------------------------------------------------------------------+
*/

class top extends Module {
    val io = IO(new Bundle {
        val regs        = Output(Vec(32, UInt(32.W)))
        val Hcf         = Output(Bool())
        val tb_slave    = new Axi4SlaveIF(HW14_1_Config.s_id_width, HW14_1_Config.addr_width, HW14_1_Config.data_width)
        val tb_en       = Input(Bool())

        // To monitor CPU and memory 
        // val inst = Output(UInt(32.W))
        val rdata = Output(UInt(32.W))
        val wdata  = Output(UInt(32.W))

        // val Dump_Mem = Input(Bool())
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
    })

    val cpu = Module(new PipelinedCPU(HW14_1_Config.s_id_width, HW14_1_Config.addr_width, HW14_1_Config.data_width, HW14_1_Config.instr_hex_path))
    val cpu_axi_if = Module(new CPU_AXI_IF(HW14_1_Config.s_id_width, HW14_1_Config.addr_width, HW14_1_Config.data_width))
    val dm  = Module(new DataMem(HW14_1_Config.s_id_width, HW14_1_Config.data_mem_size, HW14_1_Config.addr_width, HW14_1_Config.data_width, HW14_1_Config.data_hex_path))
    val sa  = Module(new topSA(HW14_1_Config.s_id_width, HW14_1_Config.addr_width, HW14_1_Config.data_width, HW14_1_Config.reg_width, SA_config.sa_mem_size))
    // 2 master and 2 slaves
    val bus = Module(new AXILiteXBar(HW14_1_Config.nMasters, HW14_1_Config.nSlaves, HW14_1_Config.s_id_width, HW14_1_Config.addr_width, HW14_1_Config.data_width, HW14_1_Config.addr_map))

    /* System architecture 
    *
    *               CPU
    *                ↕
    *            CPU_AXI_IF
    *                ↕
    *  ========== AXI BUS ==========
    *       ↕                 ↕
    *    DataMem        Systolic Array
    *
    */

    // CPU ↔ CPU_AXI_IF
    cpu_axi_if.io.Mem_R         := cpu.io.DataMem.Mem_R
    cpu_axi_if.io.Mem_W         := cpu.io.DataMem.Mem_W
    cpu_axi_if.io.Length        := cpu.io.DataMem.Length
    cpu_axi_if.io.raddr         := cpu.io.DataMem.raddr
    cpu_axi_if.io.waddr         := cpu.io.DataMem.waddr
    cpu_axi_if.io.wdata         := cpu.io.DataMem.wdata
    cpu.io.DataMem.Valid        := cpu_axi_if.io.Valid
    cpu.io.DataMem.rdata        := cpu_axi_if.io.rdata

    // CPU_AXI_IF ↔ AXI BUS
    bus.io.masters(0) <> cpu_axi_if.io.master

    // DataMem ↔ AXI BUS
    bus.io.slaves(0) <> dm.io.slave

    // Systolic Array ↔ AXI BUS
    bus.io.masters(1) <> sa.io.master
    bus.io.slaves(1) <> sa.io.slave
    


    // System
    io.regs := cpu.io.regs
    io.Hcf := cpu.io.Hcf
    // io.inst := cpu.im.io.inst
    io.rdata := cpu_axi_if.io.rdata
    io.wdata := cpu_axi_if.io.wdata
    
    // Memory dump
    // dm.io.dump := io.Dump_Mem

    // Testbench
    io.tb_slave <> sa.io.tb_slave
    sa.io.tb_en := io.tb_en

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