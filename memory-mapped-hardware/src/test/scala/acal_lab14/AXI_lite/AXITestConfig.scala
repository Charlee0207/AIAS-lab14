package acal_lab14.AXILite

import chisel3._

object Config {
    val master_num = 2
    val slave_num = 2
    val s_id_width = 17
    val addr_width = 32
    val data_width = 32
}

object Constants {
    final val DEBUG = false
}