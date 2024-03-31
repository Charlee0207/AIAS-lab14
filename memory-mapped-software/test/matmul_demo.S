## Lab 14-2-3 Assembly code for verifying 
## cpu, bus, dma, accelerator work properly.

## exexcution flow :
## (1) CPU program DMA to move data from shared data memory to the local memory of accelerator.
## (2) After DMA completing the movement, CPU program accelerator to start computing.
## (3) Accelerator start to compute matrixA(4x4) * matrixB(4x4).
## (4) Once CPU observe the done bit in Status reg of accelerator is high, halt the itself.

.data
## allocate memory space for Martix A, B, C data in shared data memory. (start from 0x8000)
mat_A:
.byte 1 4 5 3
.byte 1 4 2 2
.byte 5 5 3 3
.byte 4 3 1 5
mat_B:
.byte 1 4 3 4
.byte 5 5 5 2
.byte 4 4 5 4
.byte 3 4 3 5
mat_C:
.byte 0 0 0 0
.byte 0 0 0 0
.byte 0 0 0 0
.byte 0 0 0 0

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

ACCEL_OFFSET_MATA_MEM_ADDR:
.word 0x14

ACCEL_OFFSET_MATB_MEM_ADDR:
.word 0x18

ACCEL_OFFSET_MATC_MEM_ADDR:
.word 0x1c

ACCEL_OFFSET_MAT_MEM_STRIDE:
.word 0x20

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
## SOURCE_INFO = 0x8000 + 0x0
## DEST_INFO = 0x200000 + 0x0
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

## reset DONE reg in DMA
sw x0, 0(t1)

## --------------------------------------------------------------+
## copy mat_B from shared data memory to local mem of accelerator|
## --------------------------------------------------------------+
## SOURCE_INFO = 0x8000 + 0x4
## DEST_INFO = 0x200000 + 0x4
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
## not sure assembler support li with over 12 bits immediate value
## can be broken down into lui t2, 0x04040 and addi t2, t2, 0x404
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


## 5. Enable accelerator
## t1 -> 0x00 (Base address of MAT_MEM_STRIDE reg)
la t6, DMA_OFFSET_ENABLE
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
## load value of mem[0x300004]
lw t2, 0(t1)
beq t2, x0, wait_sa

######################
##                  ##
##      Step 4      ##
##                  ##
######################
## reset DONE reg in DMA
sw x0, 0(t1)
hcf