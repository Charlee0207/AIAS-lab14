import numpy as np

def gen_pattern_4x4():
    return np.random.randint(1, 5, (4, 4))

def gen_pattern_16x16():
    return np.random.randint(1, 5, (16, 16))

def gen_pattern_2x3():
    pattern_mask = np.zeros((4, 4))
    pattern_mask[0:2, 0:3] = 1

    pattern = gen_pattern_4x4()
    pattern = pattern * pattern_mask
    return pattern

def gen_pattern_3x2():
    pattern_mask = np.zeros((4, 4))
    pattern_mask[0:3, 0:2] = 1

    pattern = gen_pattern_4x4()
    pattern = pattern * pattern_mask
    return pattern

def gen_pattern_4x4():
    return np.random.randint(1, 5, (4, 4))

def gen_pattern_16x16():
    return np.random.randint(1, 5, (16, 16))

def write_mat(filename, mat_A, mat_B, mat_C):
    with open(filename, 'w') as f:
        def write_sub_mat(name, mat):
            f.write(f"{name}:\n")
            for row in mat:
                f.write(".word")
                count = 0
                for col in row:
                    if count == 0:
                        f.write(" 0x")

                    f.write(f"{int(col):02x}")
                    count = (count + 1) % 4
                
                f.write("\n")

        write_sub_mat("mat_A", mat_A)
        write_sub_mat("mat_B", mat_B)
        write_sub_mat("mat_C", mat_C)

def write_assem(mat_A, mat_B, mat_C):
    def write_sub_mat(name, mat):
        assem = []
        assem.append(f"{name}:")
        for row in mat:
            assem.append(".word")
            count = 0
            for col in row:
                if count == 0:
                    assem[-1] += (" 0x")

                assem[-1] +=(f"{int(col):02x}")
                count = (count + 1) % 4        

    assem = []
    assem.append(write_sub_mat("mat_A", mat_A))
    assem.append(write_sub_mat("mat_B", mat_B))
    assem.append(write_sub_mat("mat_C", mat_C))
    
    return assem

def write_assem_with_comment(filename, assem, comment):
    with open(filename, 'w') as f:
        for code in assem:
            f.write(code + "\n")

def gen_pattern_HW14_1():
    mat_A = gen_pattern_2x3().astype(np.uint8)
    mat_B = gen_pattern_3x2().astype(np.uint8)
    mat_C = np.matmul(mat_A, mat_B).astype(np.uint32)

    if np.any(mat_C > np.iinfo(np.uint8).max):
        print("Warning: Overflow detected! At least one element in mat_C exceeds uint8 range.")

    return mat_A, mat_B, mat_C

def gen_pattern_HW14_2():
    mat_A = gen_pattern_4x4().astype(np.uint8)
    mat_B = gen_pattern_4x4().astype(np.uint8)
    mat_C = np.matmul(mat_A, mat_B).astype(np.uint32)

    if np.any(mat_C > np.iinfo(np.uint8).max):
        print("Warning: Overflow detected! At least one element in mat_C exceeds uint8 range.")
    
    return mat_A, mat_B, mat_C

def gen_pattern_HW14_3():
    mat_A = gen_pattern_16x16().astype(np.uint8)
    mat_B = gen_pattern_16x16().astype(np.uint8)
    mat_C = np.matmul(mat_A, mat_B).astype(np.uint32)

    if np.any(mat_C > np.iinfo(np.uint8).max):
        print("Warning: Overflow detected! At least one element in mat_C exceeds uint8 range.")
    
    return mat_A, mat_B, mat_C

def main():
    mat_A, mat_B, mat_C = gen_pattern_HW14_1()
    write_mat("HW14_1.txt", mat_A, mat_B, mat_C)
    mat_A, mat_B, mat_C = gen_pattern_HW14_2()
    write_mat("HW14_2.txt", mat_A, mat_B, mat_C)
    mat_A, mat_B, mat_C = gen_pattern_HW14_3()
    write_mat("HW14_3.txt", mat_A, mat_B, mat_C)
    gen_pattern_HW14_3()

if __name__ == "__main__":
    main()