## HW 14-3-2 Assembly code for verifying 
## cpu, bus, accelerator work properly.

## exexcution flow :
## (1) CPU program accelerator to move data from shared data memory to the local memory of accelerator.
## (2) After accelerator completing the movement, CPU program accelerator to start computing.
## (3) Accelerator start to compute matrixA(4x4) * matrixB(4x4).
## (4) Once CPU observe the done bit in Status reg of accelerator is high, halt the itself.

.data
## allocate memory space for Martix A, B, C data in shared data memory. (start from 0x8000)
mat_A:
.word 0x01040204
.word 0x03020303
.word 0x03020102
.word 0x02040402
mat_B:
.word 0x02040401
.word 0x02040202
.word 0x03030401
.word 0x04030303
mat_C:
.word 0x20262017
.word 0x1f262513
.word 0x151d1a0e
.word 0x202a2614

## allocate memory space for constant value in shared data memory for computation.
ACCEL_REG_BASE_ADDR:
.word 0x100000

ACCEL_MEM_BASE_ADDR:
.word 0x200000

ACCEL_OFFSET_ENABLE:
.word 0x0

ACCEL_OFFSET_STATUS:
.word 0x4

## Dismiss matrix size of A, B, C

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
##      Step 0      ##
##                  ##
######################

## s0 -> base address of Matrix A in shared data memory.
la s0, mat_A
## s1 -> base address of Matrix B in shared data memory.
la s1, mat_B
## s2 -> base address of Matrix C in shared data memory.
la s2, mat_C

## s3 -> address of ACCEL_MEM_BASE_ADDR
la s3, ACCEL_MEM_BASE_ADDR
lw s3, 0(s3)


######################
##                  ##
##      Step 1      ##
##                  ##
######################
## Program accelerator to move data from shared data memory to local mem of accelerator.

## --------------------------------------------------------------
## copy mat_A from shared data memory to local mem of accelerator.
## --------------------------------------------------------------
## SRC_INFO = 0x8000 + 0x0
## DST_INFO = 0x200000 + 0x0
## SIZE_CFG = (0x4 << 24) + (0x4 << 16) + (0x4 << 8) + 0x4

## t0 -> 0x100000 (Base address of ACCEL registers)
la t6, ACCEL_REG_BASE_ADDR
lw t0, 0(t6)


## 1. Program SRC_INFO reg
## t1 -> 0x04 (offset of SRC_INFO reg)
la t6, ACCEL_OFFSET_SRC_INFO
lw t1, 0(t6)
## t1 = 0x100000 + 0x30
add t1, t1, t0
## store 0x8000 into mem[0x100030]
sw s0, 0(t1)

## 2. Program DST_INFO reg
## t1 -> 0x34 (offset of DST_INFO reg)
la t6, ACCEL_OFFSET_DST_INFO
lw t1, 0(t6)
## t1 = 0x100000 + 0x34
add t1, t1, t0
## store 0x200000 into mem[0x100034]
sw s3, 0(t1)

## 3. Program SIZE_CFG reg
## t1 -> 0x38 (offset of SIZE_CFG reg)
la t6, ACCEL_OFFSET_SIZE_CFG
lw t1, 0(t6)
## t1 = 0x100000 + 0x38
add t1, t1, t0
## store 0x04040404 into mem[0x1000038]
li t2, 0x04040404
sw t2, 0(t1)

## 4. Enable ACCEL to move data
la t6, ACCEL_OFFSET_LOAD_EN
lw t1, 0(t6)
## t1 = 0x100000 + 0x28
add t1, t1, t0
## store 0x01 into mem[0x100028]
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
## wait ACCEL finish data movement
wait_accel_transfer1:
## t1 -> 0x2c (offset of LOAD_DONE reg)
la t6, ACCEL_OFFSET_LOAD_DONE
lw t1, 0(t6)
## t1 = 0x100000 + 0x2c
add t1, t1, t0
## load value of mem[0x10002c]
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer1

## reset LOAD_DONE reg in ACCEL
sw x0, 0(t1)

## --------------------------------------------------------------+
## copy mat_B from shared data memory to local mem of accelerator|
## --------------------------------------------------------------+
## SRC_INFO = 0x8000 + 0x4
## DST_INFO = 0x200000 + 0x4
## SIZE_CFG = (0x4 << 24) + (0x4 << 16) + (0x4 << 8) + 0x4

## t0 -> 0x100000 (Base address of ACCEL registers)
la t6, ACCEL_REG_BASE_ADDR
lw t0, 0(t6)

## 1. Program SRC_INFO reg
## t1 -> 0x30 (offset of SRC_INFO reg)
la t6, ACCEL_OFFSET_SRC_INFO
lw t1, 0(t6)
## t1 = 0x100000 + 0x30
add t1, t1, t0
## store 0x8010 into mem[0x100030]
sw s1, 0(t1)

## 2. Program DST_INFO reg
## t1 -> 0x34 (offset of DST_INFO reg)
la t6, ACCEL_OFFSET_DST_INFO
lw t1, 0(t6)
## t1 = 0x100000 + 0x34
add t1, t1, t0
## store 0x200010 into mem[0x100034]
addi t2, s3, 0x10
sw t2, 0(t1)

## 3. Program SIZE_CFG reg
## t1 -> 0x38 (offset of SIZE_CFG reg)
la t6, ACCEL_OFFSET_SIZE_CFG
lw t1, 0(t6)
## t1 = 0x100000 + 0x38
add t1, t1, t0
## store 0x04040404 into mem[0x100038]
li t2, 0x04040404
sw t2, 0(t1)

## 4. Enable ACCEL to move data
la t6, ACCEL_OFFSET_LOAD_EN
lw t1, 0(t6)
## t1 = 0x100000 + 0x28
add t1, t1, t0
## store 0x01 into mem[0x100028]
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
## wait ACCEL finish data movement
wait_accel_transfer2:
## t1 -> 0x2c (offset of DONE reg)
la t6, ACCEL_OFFSET_LOAD_DONE
lw t1, 0(t6)
## t1 = 0x100000 + 0x2c
add t1, t1, t0
## load value of mem[0x10002c]
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer2

## reset LOAD_DONE reg in accel
sw x0, 0(t1)
######################
##                  ##
##      Step 2      ##
##                  ##
######################
## Program accelerator to compute 4x4 matmul

## -------------------------------------------------+
## Compute 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------+
## systolic array directly read the local mem
## don't need to add the base address 0x200000
## MATA_MEM_ADDR = 0x000000
## MATB_MEM_ADDR = 0x000010
## MATC_MEM_ADDR = 0x000020
## MAT_MEM_STRIDE = 0x00040404

## t0 -> 0x100000 (Base address of accelerator registers)
la t6, ACCEL_REG_BASE_ADDR
lw t0, 0(t6)

## 1. Program MATA_MEM_ADDR reg
## t1 -> 0x14 (Base address of MATA_MEM_ADDR reg)
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
## t1 = 0x100000 + 0x14
add t1, t1, t0
## store 0x00 into mem[0x100014]
sw x0, 0(t1)

## 2. Program MATB_MEM_ADDR reg
## t1 -> 0x18 (Base address of MATB_MEM_ADDR reg)
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
## t1 = 0x100000 + 0x18
add t1, t1, t0
## store 0x10 into mem[0x100018]
li t2, 0x10
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
## t1 -> 0x1c (Base address of MATC_MEM_ADDR reg)
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
## t1 = 0x100000 + 0x1C
add t1, t1, t0
## store 0x20 into mem[0x10001C]
li t2, 0x20
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
## t1 -> 0x20 (Base address of MAT_MEM_STRIDE reg)
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
## t1 = 0x100000 + 0x20
add t1, t1, t0
## store 0x00040404 into mem[0x100020]
li t2, 0x00040404
sw t2, 0(t1)

## 5. Set ZERO_PSUM reg
## t1 -> 0x24 (Base address of ZERO_PSUM reg)
la t6, ACCEL_OFFSET_ZERO_PSUM
lw t1, 0(t6)
## t1 = 0x100000 + 0x24
add t1, t1, t0
## store 0x00000001 into mem[0x100024]
li t2, 0x00000001
sw t2, 0(t1)

## 6. Enable accelerator
## t1 -> 0x00 (Base address of ENABLE reg)
la t6, ACCEL_OFFSET_ENABLE
lw t1, 0(t6)
## t1 = 0x100000 + 0x00
add t1, t1, t0
## store 0x00000001 into mem[0x100000]
li t2, 0x00000001
sw t2, 0(t1)

######################
##                  ##
##      Step 3      ##
##                  ##
######################
## ... executing matmul ...
## wait accelerator to finish computation
wait_sa:
## t1 -> 0x04 (offset of STATUS reg)
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
## t1 = 0x100000 + 0x04
add t1, t1, t0
## load value of mem[0x100004]
lw t2, 0(t1)
beq t2, x0, wait_sa

######################
##                  ##
##      Step 4      ##
##                  ##
######################
## reset STATUS reg in ACCEL
sw x0, 0(t1)
hcf