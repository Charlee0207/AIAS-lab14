package acal_lab14.HW14_2

import chisel3._
import chisel3.util._

import acal_lab14.AXI._
import acal_lab14.AXILite._
import Config._

/* ---------------------------------------------------------------------------------------------+
 * HW14_2 consists of 3 masters and 3 slaves connected via AXI bus.                             |
 * This system demonstrates that AXI bus can handle multiple requests simultaneously. (HW14-2)  |
 * ---------------------------------------------------------------------------------------------+
*/

class top extends Module {
    val io = IO(new Bundle {
        val masters = Flipped(Vec(HW14_2_Config.nMasters, new Axi4MasterIF(HW14_2_Config.s_id_width, HW14_2_Config.addr_width, HW14_2_Config.data_width)))
        val slaves = Flipped(Vec(HW14_2_Config.nSlaves, new Axi4SlaveIF(HW14_2_Config.s_id_width, HW14_2_Config.addr_width, HW14_2_Config.data_width)))
    })

    // 3 master and 3 slaves
    val bus = Module(new AXILiteXBar(HW14_2_Config.nMasters, HW14_2_Config.nSlaves, HW14_2_Config.s_id_width, HW14_2_Config.addr_width, HW14_2_Config.data_width, HW14_2_Config.addr_map))

    /* System architecture 
    *
    *    master0  master1  master2            
    *       ↕        ↕        ↕
    *  ========== AXI BUS ==========
    *       ↕        ↕        ↕
    *    slave0   slave1   slave2
    *
    */

    // master0, master1, master2 ↔ AXI BUS
    bus.io.masters(0) <> io.masters(0)
    bus.io.masters(1) <> io.masters(1)
    bus.io.masters(2) <> io.masters(2)

    // slave0, slave1, slave2 ↔ AXI BUS
    bus.io.slaves(0) <> io.slaves(0)
    bus.io.slaves(1) <> io.slaves(1)
    bus.io.slaves(2) <> io.slaves(2)
}