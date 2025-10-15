.data
mat_A:
.word 0x03040103 0x03040101 0x03020303 0x03030401
.word 0x04040403 0x02010204 0x04020202 0x04040101
.word 0x04020201 0x04010103 0x03030204 0x04040403
.word 0x02020302 0x03040304 0x04010301 0x03030101
.word 0x03020401 0x04020202 0x01020102 0x04040304
.word 0x03040104 0x03030201 0x04020404 0x02020202
.word 0x02040201 0x03020204 0x02020204 0x02030403
.word 0x04020304 0x01020401 0x04010203 0x01040201
.word 0x04040401 0x01010301 0x01010301 0x04010404
.word 0x04030303 0x01040303 0x01030102 0x03020104
.word 0x03010404 0x02010403 0x03020401 0x03040402
.word 0x03030103 0x01030203 0x01010203 0x03020303
.word 0x01030302 0x02040103 0x03040301 0x04010404
.word 0x02010303 0x01030301 0x04010403 0x03030204
.word 0x02020102 0x01010204 0x04040404 0x02020304
.word 0x02030401 0x03020101 0x01030201 0x04010103
mat_B:
.word 0x03040103 0x03040101 0x03020303 0x03030401
.word 0x04040403 0x02010204 0x04020202 0x04040101
.word 0x04020201 0x04010103 0x03030204 0x04040403
.word 0x02020302 0x03040304 0x04010301 0x03030101
.word 0x03020401 0x04020202 0x01020102 0x04040304
.word 0x03040104 0x03030201 0x04020404 0x02020202
.word 0x02040201 0x03020204 0x02020204 0x02030403
.word 0x04020304 0x01020401 0x04010203 0x01040201
.word 0x04040401 0x01010301 0x01010301 0x04010404
.word 0x04030303 0x01040303 0x01030102 0x03020104
.word 0x03010404 0x02010403 0x03020401 0x03040402
.word 0x03030103 0x01030203 0x01010203 0x03020303
.word 0x01030302 0x02040103 0x03040301 0x04010404
.word 0x02010303 0x01030301 0x04010403 0x03030204
.word 0x02020102 0x01010204 0x04040404 0x02020304
.word 0x02030401 0x03020101 0x01030201 0x04010103
mat_C:
.word 0x77756e6a 0x58655f69 0x78597765 0x826f7073
.word 0x83797b69 0x5e6a6468 0x7d587368 0x8b7c7b74
.word 0x7f78786a 0x5b6e6267 0x7363756c 0x8d747d86
.word 0x766e6f61 0x5a5b5f59 0x714f6d63 0x7870736c
.word 0x706d6d5a 0x6063515f 0x6d606968 0x836d707a
.word 0x7d7a7769 0x5d66646c 0x71547460 0x88737371
.word 0x7b727067 0x555d5f66 0x72596c6b 0x7e736d74
.word 0x6f6e6259 0x565e5860 0x6c496d64 0x776a7068
.word 0x686c6454 0x5a534865 0x6b60665e 0x7a666e66
.word 0x75796964 0x606b5560 0x72596967 0x7c6c6767
.word 0x7c727966 0x63686972 0x80617d6f 0x877d827e
.word 0x65685e5e 0x4f5c515b 0x6c4f665b 0x6d615f5d
.word 0x7d777867 0x5c626069 0x75677264 0x856c6e7a
.word 0x70706f5d 0x5b5f5b61 0x6b56745f 0x81667574
.word 0x7c727668 0x4e616764 0x68576d5e 0x7e6a6e75
.word 0x605c5e4a 0x514f4152 0x5551504c 0x6f59595e

ACCEL_REG_BASE_ADDR:
.word 0x100000

ACCEL_MEM_BASE_ADDR:
.word 0x200000

ACCEL_OFFSET_ENABLE:
.word 0x0

ACCEL_OFFSET_STATUS:
.word 0x4

ACCEL_OFFSET_MATA_MEM_ADDR:
.word 0x14

ACCEL_OFFSET_MATB_MEM_ADDR:
.word 0x18

ACCEL_OFFSET_MATC_MEM_ADDR:
.word 0x1c

ACCEL_OFFSET_MAT_MEM_STRIDE:
.word 0x20

ACCEL_OFFSET_ZERO_PSUM:
.word 0x24

ACCEL_OFFSET_LOAD_EN:
.word 0x28

ACCEL_OFFSET_LOAD_DONE:
.word 0x2c

ACCEL_OFFSET_SRC_INFO:
.word 0x30

ACCEL_OFFSET_DST_INFO:
.word 0x34

ACCEL_OFFSET_SIZE_CFG:
.word 0x38

.text
######################
##                  ##
##   Data Transfer  ##
##                  ##
######################

la s0, mat_A
la s1, mat_B
la s2, mat_C
la s3, ACCEL_MEM_BASE_ADDR
lw s3, 0(s3)

## --------------------------------------------------------------
## copy mat_A from shared data memory to local mem of accelerator.
## --------------------------------------------------------------
la t6, ACCEL_REG_BASE_ADDR
lw t0, 0(t6)

## 1. Program SRC_INFO reg
la t6, ACCEL_OFFSET_SRC_INFO
lw t1, 0(t6)
add t1, t1, t0
sw s0, 0(t1)

## 2. Program DST_INFO reg
la t6, ACCEL_OFFSET_DST_INFO
lw t1, 0(t6)
add t1, t1, t0
sw s3, 0(t1)

## 3. Program SIZE_CFG reg
la t6, ACCEL_OFFSET_SIZE_CFG
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10101010
sw t2, 0(t1)

## 4. Enable ACCEL to move data
la t6, ACCEL_OFFSET_LOAD_EN
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
wait_accel_transfer_a:
la t6, ACCEL_OFFSET_LOAD_DONE
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_a

## reset LOAD_DONE reg in ACCEL
sw x0, 0(t1)


## --------------------------------------------------------------+
## copy mat_B from shared data memory to local mem of accelerator|
## --------------------------------------------------------------+
la t6, ACCEL_REG_BASE_ADDR
lw t0, 0(t6)

## 1. Program SRC_INFO reg
la t6, ACCEL_OFFSET_SRC_INFO
lw t1, 0(t6)
add t1, t1, t0
sw s1, 0(t1)

## 2. Program DST_INFO reg
la t6, ACCEL_OFFSET_DST_INFO
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x100
sw t2, 0(t1)

## 3. Program SIZE_CFG reg
la t6, ACCEL_OFFSET_SIZE_CFG
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10101010
sw t2, 0(t1)

## 4. Enable ACCEL to move data
la t6, ACCEL_OFFSET_LOAD_EN
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
wait_accel_transfer_b:
la t6, ACCEL_OFFSET_LOAD_DONE
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_b

## reset LOAD_DONE reg in accel
sw x0, 0(t1)


######################
##                  ##
##    Accelerator   ##
##                  ##
######################

la t6, ACCEL_REG_BASE_ADDR
lw t0, 0(t6)

## -------------------------------------------------------------------------+
## Compute (i=0, j=0, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x100
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x200
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_0_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=0, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x140
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x200
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_0_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=0, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x180
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x200
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_0_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=0, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x200
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_0_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=1, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x104
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x204
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_1_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=1, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x144
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x204
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_1_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=1, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x184
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x204
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_1_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=1, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c4
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x204
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_1_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=2, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x108
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x208
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_2_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=2, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x148
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x208
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_2_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=2, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x188
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x208
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_2_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=2, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c8
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x208
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_2_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=3, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x20c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_3_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=3, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x14c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x20c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_3_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=3, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x18c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x20c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_3_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=0, j=3, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1cc
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x20c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_0_3_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=0, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x40
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x100
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x240
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_0_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=0, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x44
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x140
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x240
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_0_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=0, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x48
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x180
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x240
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_0_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=0, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x240
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_0_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=1, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x40
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x104
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x244
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_1_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=1, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x44
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x144
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x244
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_1_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=1, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x48
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x184
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x244
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_1_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=1, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c4
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x244
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_1_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=2, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x40
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x108
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x248
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_2_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=2, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x44
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x148
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x248
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_2_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=2, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x48
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x188
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x248
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_2_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=2, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c8
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x248
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_2_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=3, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x40
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x24c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_3_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=3, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x44
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x14c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x24c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_3_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=3, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x48
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x18c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x24c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_3_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=1, j=3, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x4c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1cc
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x24c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_1_3_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=0, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x80
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x100
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x280
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_0_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=0, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x84
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x140
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x280
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_0_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=0, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x88
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x180
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x280
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_0_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=0, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x280
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_0_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=1, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x80
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x104
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x284
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_1_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=1, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x84
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x144
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x284
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_1_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=1, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x88
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x184
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x284
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_1_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=1, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c4
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x284
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_1_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=2, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x80
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x108
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x288
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_2_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=2, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x84
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x148
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x288
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_2_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=2, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x88
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x188
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x288
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_2_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=2, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c8
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x288
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_2_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=3, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x80
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x28c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_3_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=3, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x84
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x14c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x28c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_3_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=3, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x88
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x18c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x28c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_3_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=2, j=3, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x8c
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1cc
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x28c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_2_3_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=0, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x100
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c0
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_0_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=0, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x140
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c0
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_0_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=0, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x180
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c0
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_0_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=0, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xcc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c0
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_0_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=1, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x104
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c4
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_1_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=1, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x144
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c4
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_1_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=1, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x184
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c4
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_1_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=1, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xcc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c4
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c4
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_1_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=2, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x108
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c8
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_2_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=2, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x148
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c8
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_2_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=2, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x188
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c8
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_2_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=2, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xcc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1c8
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2c8
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_2_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=3, k=0) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc0
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2cc
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_3_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=3, k=1) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc4
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x14c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2cc
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_3_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=3, k=2) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xc8
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x18c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2cc
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_3_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (i=3, j=3, k=3) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0xcc
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x1cc
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2cc
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x101010
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000000
sw t2, 0(t1)

## 6. Enable accelerator
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x00000001
sw t2, 0(t1)

## ... executing matmul ...
wait_sa_3_3_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)

hcf
