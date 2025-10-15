## HW 14-3-2 Assembly code for verifying 
## cpu, bus, dma, accelerator work properly.

## exexcution flow :
## (1) CPU program dma to move data from shared data memory to the local memory of accelerator.
## (2) After accelerator completing the movement, CPU program accelerator to start computing.
## (3) Accelerator start to compute matrixA(4x4) * matrixB(4x4).
## (4) Once CPU observe the done bit in Status reg of accelerator is high, halt the itself.

.data
## allocate memory space for Martix A, B, C data in shared data memory. (start from 0x8000)
mat_A:
.word 0x04020304 0x03020401 0x03020101 0x04010303
.word 0x04020103 0x04040302 0x04040202 0x01030401
.word 0x03030104 0x04020104 0x03040302 0x02030101
.word 0x03010203 0x04040203 0x01010401 0x04020302
.word 0x02010103 0x01020404 0x02010204 0x01010301
.word 0x04010404 0x03030304 0x01010404 0x01030302
.word 0x02010103 0x03010102 0x03020301 0x03030401
.word 0x04030402 0x02010303 0x03010104 0x04030104
.word 0x03010202 0x04010404 0x02030301 0x02010302
.word 0x02030303 0x04030402 0x02020204 0x04030103
.word 0x04040102 0x03040101 0x01010403 0x01010301
.word 0x04040304 0x04010204 0x02030402 0x02010102
.word 0x03030403 0x01020303 0x04040301 0x03020103
.word 0x01040104 0x01010103 0x04030404 0x02040401
.word 0x01010201 0x02040102 0x04010404 0x02040402
.word 0x02030101 0x02040302 0x03030401 0x03010304
mat_B:
.word 0x03030302 0x03020101 0x01020102 0x04040204
.word 0x02010401 0x04030404 0x04040101 0x01020101
.word 0x04010103 0x02010201 0x03040104 0x03020403
.word 0x03030204 0x03010302 0x03030404 0x01010304
.word 0x02030203 0x01020303 0x01010401 0x02030104
.word 0x03020202 0x02040402 0x03020103 0x04030202
.word 0x02020401 0x01030103 0x01040201 0x04030102
.word 0x02040203 0x02030103 0x02020401 0x02020302
.word 0x04010103 0x03040101 0x03020301 0x02030403
.word 0x01040302 0x04030203 0x01010101 0x01010404
.word 0x03020203 0x03040403 0x01020403 0x03030204
.word 0x01040204 0x04010404 0x04030304 0x01010404
.word 0x02020304 0x03040402 0x04030302 0x03040303
.word 0x04020104 0x02020304 0x04010204 0x03040101
.word 0x01030301 0x01040204 0x03010104 0x02030202
.word 0x04040401 0x02020401 0x01040401 0x04030104
mat_C:
.word 0x6b666a65 0x626d685e 0x606a625b 0x6c70607d
.word 0x6d72696d 0x6b7b6d73 0x665d6464 0x6c756781
.word 0x676d5f71 0x6d6d6c6c 0x615a6b59 0x5c67647c
.word 0x6767606a 0x5c717064 0x5d5c6860 0x6c715978
.word 0x4d5b5155 0x5058515a 0x50525550 0x50515260
.word 0x75786779 0x6b6f7674 0x6a6d7276 0x74746b88
.word 0x56574e5d 0x5261595a 0x54475853 0x515e5165
.word 0x746d6a72 0x6e6a7267 0x6e756b61 0x7074687f
.word 0x5c67605d 0x57695a61 0x4d58624e 0x61655874
.word 0x73726f78 0x70738074 0x71757267 0x72766885
.word 0x55585855 0x5b61675f 0x55525056 0x575d4c68
.word 0x6d706a70 0x716e716c 0x606b705c 0x656b6786
.word 0x7569696d 0x71756d64 0x656f675c 0x6d6f6d80
.word 0x676b6173 0x73747479 0x73606a6a 0x58676a77
.word 0x6761546a 0x5f706f69 0x68566167 0x636b5f6f
.word 0x66656a5b 0x637a7064 0x5a626152 0x6b6e5975

## allocate memory space for constant value in shared data memory for computation.
ACCEL_REG_BASE_ADDR:
.word 0x100000

ACCEL_MEM_BASE_ADDR:
.word 0x200000

DMA_REG_BASE_ADDR:
.word 0x300000

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

DMA_OFFSET_ENABLE:
.word 0x0

DMA_OFFSET_SOURCE_INFO:
.word 0x4

DMA_OFFSET_DEST_INFO:
.word 0x8

DMA_OFFSET_SIZE_CFG:
.word 0xc

DMA_OFFSET_DONE:
.word 0x14


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
## Program DMA to move data from shared data memory to local mem of accelerator.

## --------------------------------------------------------------
## copy mat_A from shared data memory to local mem of accelerator.
## --------------------------------------------------------------
## SRC_INFO = 0x8000 + 0x0
## DST_INFO = 0x200000 + 0x0
## SIZE_CFG = (0x4 << 24) + (0x4 << 16) + (0x4 << 8) + 0x4

## t0 -> 0x300000 (Base address of DMA registers)
la t6, DMA_REG_BASE_ADDR
lw t0, 0(t6)


## 1. Program SOURCE_INFO reg
## t1 -> 0x04 (offset of SOURCE_INFO reg)
la t6, DMA_OFFSET_SOURCE_INFO
lw t1, 0(t6)
## t1 = 0x300000 + 0x04
add t1, t1, t0
## store 0x8000 into mem[0x300004]
sw s0, 0(t1)

## 2. Program DEST_INFO reg
## t1 -> 0x08 (offset of DEST_INFO reg)
la t6, DMA_OFFSET_DEST_INFO
lw t1, 0(t6)
## t1 = 0x300000 + 0x08
add t1, t1, t0
## store 0x200000 into mem[0x300008]
sw s3, 0(t1)

## 3. Program SIZE_CFG reg
## t1 -> 0x0c (offset of SIZE_CFG reg)
la t6, DMA_OFFSET_SIZE_CFG
lw t1, 0(t6)
## t1 = 0x300000 + 0x0c
add t1, t1, t0
## store 0x04040404 into mem[0x30000c]
li t2, 0x04040404
sw t2, 0(t1)

## 4. Enable DMA
li t1, 0
## t1 = 0x300000 + 0x00
add t1, t1, t0
## store 0x01 into mem[0x300000]
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
## wait DMA finish data movement
wait_dma1:
## t1 -> 0x14 (offset of DONE reg)
la t6, DMA_OFFSET_DONE
lw t1, 0(t6)
## t1 = 0x300000 + 0x14
add t1, t1, t0
## load value of mem[0x300014]
lw t2, 0(t1)
beq t2, x0, wait_dma1

## reset LOAD_DONE reg in ACCEL
sw x0, 0(t1)

## --------------------------------------------------------------+
## copy mat_B from shared data memory to local mem of accelerator|
## --------------------------------------------------------------+
## SRC_INFO = 0x8000 + 0x4
## DST_INFO = 0x200000 + 0x4
## SIZE_CFG = (0x4 << 24) + (0x4 << 16) + (0x4 << 8) + 0x4

## t0 -> 0x300000 (Base address of DMA registers)
la t6, DMA_REG_BASE_ADDR
lw t0, 0(t6)

## 1. Program SOURCE_INFO reg
## t1 -> 0x04 (offset of SOURCE_INFO reg)
la t6, DMA_OFFSET_SOURCE_INFO
lw t1, 0(t6)
## t1 = 0x300000 + 0x04
add t1, t1, t0
## store 0x8010 into mem[0x300004]
sw s1, 0(t1)

## 2. Program DEST_INFO reg
## t1 -> 0x08 (offset of DEST_INFO reg)
la t6, DMA_OFFSET_DEST_INFO
lw t1, 0(t6)
## t1 = 0x300000 + 0x08
add t1, t1, t0
## store 0x200010 into mem[0x300008]
addi t2, s3, 0x10
sw t2, 0(t1)

## 3. Program SIZE_CFG reg
## t1 -> 0x0c (offset of SIZE_CFG reg)
la t6, DMA_OFFSET_SIZE_CFG
lw t1, 0(t6)
## t1 = 0x300000 + 0x0c
add t1, t1, t0
## store 0x04040404 into mem[0x30000c]
li t2, 0x04040404
sw t2, 0(t1)

## 4. Enable DMA
li t1, 0
## t1 = 0x300000 + 0x00
add t1, t1, t0
## store 0x01 into mem[0x300000]
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
## wait DMA finish data movement
wait_dma2:
## t1 -> 0x14 (offset of DONE reg)
la t6, DMA_OFFSET_DONE
lw t1, 0(t6)
## t1 = 0x300000 + 0x14
add t1, t1, t0
## load value of mem[0x300014]
lw t2, 0(t1)
beq t2, x0, wait_dma2

## reset DONE reg in DMA
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
## t1 -> 0x24 (Base address of MAT_MEM_STRIDE reg)
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