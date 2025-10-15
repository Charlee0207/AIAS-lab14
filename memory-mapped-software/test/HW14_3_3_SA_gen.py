import pattern_gen 

assem = []
def data_gen():
    # Matrix A, B, C
    assem.append(".data")
    mat_A, mat_B, mat_C = pattern_gen.gen_pattern_HW14_1()
    assem.append(write_mat(mat_A, mat_B, mat_C))
    mat_A, mat_B, mat_C = pattern_gen.gen_pattern_HW14_2()
    assem.append(write_mat(mat_A, mat_B, mat_C))
    mat_A, mat_B, mat_C = pattern_gen.gen_pattern_HW14_3()
    assem.append(write_mat(mat_A, mat_B, mat_C))

    # Accelerator address
    assem.append("")
    assem.append("ACCEL_REG_BASE_ADDR:")
    assem.append(".word 0x100000")
    assem.append("")
    assem.append("ACCEL_MEM_BASE_ADDR:")
    assem.append(".word 0x200000")
    assem.append("")
    assem.append("ACCEL_OFFSET_ENABLE:")
    assem.append(".word 0x0")
    assem.append("")
    assem.append("ACCEL_OFFSET_STATUS:")
    assem.append(".word 0x4")
    assem.append("")
    assem.append("ACCEL_OFFSET_MATA_MEM_ADDR:")
    assem.append(".word 0x14")
    assem.append("")
    assem.append("ACCEL_OFFSET_MATB_MEM_ADDR:")
    assem.append(".word 0x18")  
    assem.append("")
    assem.append("ACCEL_OFFSET_MATC_MEM_ADDR:")
    assem.append(".word 0x1c")
    assem.append("")
    assem.append("ACCEL_OFFSET_MAT_MEM_STRIDE:")
    assem.append(".word 0x20")
    assem.append("")
    assem.append("ACCEL_OFFSET_ZERO_PSUM:")
    assem.append(".word 0x24")
    assem.append("")
    assem.append("ACCEL_OFFSET_LOAD_EN:")
    assem.append(".word 0x28")
    assem.append("")
    assem.append("ACCEL_OFFSET_LOAD_DONE:")
    assem.append(".word 0x2c")
    assem.append("")
    assem.append("ACCEL_OFFSET_SRC_INFO:")      
    assem.append(".word 0x30")
    assem.append("")
    assem.append("ACCEL_OFFSET_DST_INFO:")
    assem.append(".word 0x34")
    assem.append("")
    assem.append("ACCEL_OFFSET_SIZE_CFG:")
    assem.append(".word 0x38")
    assem.append("")

def dma_assem_gen():
    # Move mat_A to local memory
    for i in range(4):
        




if __name__ == "__main__":
    data_gen()