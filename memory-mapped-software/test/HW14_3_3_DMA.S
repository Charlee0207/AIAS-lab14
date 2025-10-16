.data
mat_A:
.byte 1 4 1 3 1 2 4 2 4 2 3 2 1 1 4 4
.byte 3 3 1 1 3 2 2 4 1 1 4 1 1 4 3 2
.byte 2 3 3 2 1 2 4 2 2 3 4 3 3 1 4 2
.byte 1 1 3 4 1 2 1 2 4 2 1 3 3 3 2 1
.byte 4 3 4 2 2 4 4 1 1 3 3 3 2 1 3 2
.byte 2 3 2 2 4 3 1 1 2 4 1 4 1 4 2 4
.byte 2 3 2 2 4 3 3 3 2 4 1 3 2 2 3 3
.byte 1 4 2 4 3 3 1 3 2 3 1 1 3 2 1 2
.byte 1 1 2 2 2 2 3 4 3 4 2 2 3 2 1 2
.byte 2 3 4 4 4 4 3 3 2 4 4 1 2 2 2 3
.byte 3 1 4 3 3 1 4 1 1 1 2 2 1 3 2 4
.byte 4 1 2 3 3 4 1 4 3 4 2 3 3 3 1 3
.byte 3 4 4 2 2 2 1 1 1 3 1 1 1 1 2 3
.byte 4 1 4 1 2 3 4 4 1 2 2 2 4 1 4 4
.byte 3 1 3 2 4 4 3 4 2 2 2 2 3 3 4 1
.byte 3 4 1 2 3 2 2 1 4 3 4 4 1 2 4 3
mat_B:
.byte 3 4 1 3 3 4 1 1 3 2 3 3 3 3 4 1
.byte 4 4 4 3 2 1 2 4 4 2 2 2 4 4 1 1
.byte 4 2 2 1 4 1 1 3 3 3 2 4 4 4 4 3
.byte 2 2 3 2 3 4 3 4 4 1 3 1 3 3 1 1
.byte 3 2 4 1 4 2 2 2 1 2 1 2 4 4 3 4
.byte 3 4 1 4 3 3 2 1 4 2 4 4 2 2 2 2
.byte 2 4 2 1 3 2 2 4 2 2 2 4 2 3 4 3
.byte 4 2 3 4 1 2 4 1 4 1 2 3 1 4 2 1
.byte 4 4 4 1 1 1 3 1 1 1 3 1 4 1 4 4
.byte 4 3 3 3 1 4 3 3 1 3 1 2 3 2 1 4
.byte 3 1 4 4 2 1 4 3 3 2 4 1 3 4 4 2
.byte 3 3 1 3 1 3 2 3 1 1 2 3 3 2 3 3
.byte 1 3 3 2 2 4 1 3 3 4 3 1 4 1 4 4
.byte 2 1 3 3 1 3 3 1 4 1 4 3 3 3 2 4
.byte 2 2 1 2 1 1 2 4 4 4 4 4 2 2 3 4
.byte 2 3 4 1 3 2 1 1 1 3 2 1 4 1 1 3
mat_C:
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


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
la t6, DMA_REG_BASE_ADDR
lw t0, 0(t6)

## 1. Program SOURCE_INFO reg
la t6, DMA_OFFSET_SOURCE_INFO
lw t1, 0(t6)
add t1, t1, t0
sw s0, 0(t1)

## 2. Program DEST_INFO reg
la t6, DMA_OFFSET_DEST_INFO
lw t1, 0(t6)
add t1, t1, t0
sw s3, 0(t1)

## 3. Program SIZE_CFG reg
la t6, DMA_OFFSET_SIZE_CFG
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10101010
sw t2, 0(t1)

## 4. Enable DMA
li t1, 0
add t1, t1, t0
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
wait_dma_transfer_a:
la t6, DMA_OFFSET_DONE
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_dma_transfer_a

## reset DONE reg in DMA
sw x0, 0(t1)

## --------------------------------------------------------------+
## copy mat_B from shared data memory to local mem of accelerator|
## --------------------------------------------------------------+
la t6, DMA_REG_BASE_ADDR
lw t0, 0(t6)

## 1. Program SOURCE_INFO reg
la t6, DMA_OFFSET_SOURCE_INFO
lw t1, 0(t6)
add t1, t1, t0
sw s1, 0(t1)

## 2. Program DEST_INFO reg
la t6, DMA_OFFSET_DEST_INFO
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x100
sw t2, 0(t1)

## 3. Program SIZE_CFG reg
la t6, DMA_OFFSET_SIZE_CFG
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10101010
sw t2, 0(t1)

## 4. Enable DMA
li t1, 0
add t1, t1, t0
li t2, 0x01
sw t2, 0(t1)

## ... moving data ...
wait_dma_transfer_b:
la t6, DMA_OFFSET_DONE
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_dma_transfer_b

## reset DONE reg in DMA
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
