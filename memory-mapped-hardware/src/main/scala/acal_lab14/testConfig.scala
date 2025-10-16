package Config

import chisel3._

/* ----------------------------------------------------------------------+
 * testConfig.scala list the hardware configuration for all test scripts.|
 * Meaning of each configuration is explained in Lab14_2_3_Config.       |
 * ----------------------------------------------------------------------+
*/

object Constants {
    final val DEBUG = false
}

object AXI_TestConfig {
    val addr_map = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                        (Integer.parseInt("10000",16), Integer.parseInt("20000",16)))
    val nMasters   = 2
    val nSlaves    = addr_map.length
    val s_id_width = 17
    val addr_width = 32
    val data_width = 32
}

object Mem_config {
    val s_id_width      = 17
    val addr_width      = 32
    val data_width      = 32
    val data_hex_path   = "src/main/resource/Lab14-2-2/data.hex"
    val data_mem_size   = 10
}

object SA_config {
    val sa_mem_size         = 0x8000    // Local mem size of SA, should consistent with `addr_map` setting
    val dimX                = 4         // X dimension of SA
    val dimY                = 4         // Y dimension of SA
    val ACCEL_REG_BASE_ADDR = 0x100000  // MMIO reg base address
    val ACCEL_MEM_BASE_ADDR = 0x200000  // Local mem base address
}

/* ---------------------------+
 * Configuration for Lab14-2-2|
 * ---------------------------+
 */
object Lab14_2_2_Config {
    val addr_map       = Seq((8000, 8000))
    val nMasters       = 1
    val nSlaves        = addr_map.length
    val s_id_width     = 2
    val addr_width     = 32
    val data_width     = 32
    // val instr_asm_path = "src/main/resource/Lab14-2-2/inst.asm"
    // val instr_hex_path = "src/main/resource/Lab14-2-2/m_code.hex"
    // val data_hex_path  = "src/main/resource/Lab14-2-2/data.hex"

    // val instr_asm_path = "src/main/resource/Lab9-fib/inst.asm"
    // val instr_hex_path = "src/main/resource/Lab9-fib/m_code.hex"
    // val data_hex_path  = "src/main/resource/Lab9-fib/data.hex"

    val instr_asm_path = "src/main/resource/Lab9-kadane/inst.asm"
    val instr_hex_path = "src/main/resource/Lab9-kadane/m_code.hex"
    val data_hex_path  = "src/main/resource/Lab9-kadane/data.hex"
    val data_mem_size  = 16
}

/* ---------------------------+
 * Configuration for Lab14-2-3|
 * ---------------------------+
 */
object Lab14_2_3_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 2                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/Lab14-2-3/inst.asm"
    val instr_hex_path = "src/main/resource/Lab14-2-3/m_code.hex"
    val data_hex_path  = "src/main/resource/Lab14-2-3/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* ---------------------------+
 * Configuration for HW14-1   |
 * ---------------------------+
 */
object HW14_1_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000    (DataMem)
    // 0x100000 + 0x100000 = 0x200000   (SA RegFile)
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)))
    val nMasters       = 2                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_1/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_1/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_1/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    // val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* ---------------------------+
 * Configuration for HW14-2   |
 * ---------------------------+
 */
object HW14_2_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x000000 + 0x100000 = 0x100000   (slave 0)
    // 0x100000 + 0x100000 = 0x200000   (slave 1)
    // 0x200000 + 0x100000 = 0x300000   (slave 2)
    val addr_map       = List((Integer.parseInt("0"     ,16), Integer.parseInt("100000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("100000",16)),
                              (Integer.parseInt("200000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
}


/* ------------------------------+
 * Configuration for HW14_3_1_SA |
 * ------------------------------+
 */
object HW14_3_1_SA_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_3_1_SA/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_3_1_SA/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_3_1_SA/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* -------------------------------+
 * Configuration for HW14_3_1_DMA |
 * -------------------------------+
 */
object HW14_3_1_DMA_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_3_1_DMA/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_3_1_DMA/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_3_1_DMA/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* ------------------------------+
 * Configuration for HW14_3_2_SA |
 * ------------------------------+
 */
object HW14_3_2_SA_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_3_2_SA/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_3_2_SA/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_3_2_SA/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* -------------------------------+
 * Configuration for HW14_3_2_DMA |
 * -------------------------------+
 */
object HW14_3_2_DMA_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_3_2_DMA/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_3_2_DMA/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_3_2_DMA/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* ------------------------------+
 * Configuration for HW14_3_3_SA |
 * ------------------------------+
 */
object HW14_3_3_SA_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_3_3_SA/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_3_3_SA/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_3_3_SA/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* -------------------------------+
 * Configuration for HW14_3_3_DMA |
 * -------------------------------+
 */
object HW14_3_3_DMA_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_3_3_DMA/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_3_3_DMA/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_3_3_DMA/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}


/* ----------------------------+
 * Configuration for HW14_4_SA |
 * ----------------------------+
 */
object HW14_4_SA_Config {
    // addr_map -> a list contains 3 allocation in memory space -> means there are 3 slaves
    // 0x8000   + 0x8000   = 0x10000
    // 0x100000 + 0x100000 = 0x200000
    // 0x200000 + 0x100000 = 0x300000
    val addr_map       = List((Integer.parseInt("8000",16), Integer.parseInt("8000",16)),
                              (Integer.parseInt("100000",16), Integer.parseInt("200000",16)),
                              (Integer.parseInt("300000",16), Integer.parseInt("100000",16)))
    val nMasters       = 3                  // number of master
    val nSlaves        = addr_map.length    // number of slave
    val s_id_width     = 17                 // id width
    val addr_width     = 32                 // address width on bus
    val data_width     = 32                 // data width on bus
    val reg_width      = 32                 // reg width of MMIO_Regfile
    val instr_asm_path = "src/main/resource/HW14_4_SA/inst.asm"
    val instr_hex_path = "src/main/resource/HW14_4_SA/m_code.hex"
    val data_hex_path  = "src/main/resource/HW14_4_SA/data.hex"
    val data_mem_size  = 16                 // power of 2 in byte (2^16 bytes DataMem)
    val Mem_Base_ADDR  = 0x200000           // Local mem base address
    val Dma_Base_ADDR  = 0x300000           // DMA base address
}