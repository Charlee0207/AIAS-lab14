.data
mat_A:
.byte 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
mat_B:
.byte 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5
.byte 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
.byte 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7
.byte 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5
.byte 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
.byte 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7
.byte 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5
.byte 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
.byte 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7
.byte 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5
.byte 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
.byte 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7
.byte 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5
.byte 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
.byte 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7
.byte 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5
.byte 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
.byte 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7 2 3 4 5 6 7
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
mat_C:
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.byte 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

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
li t2, 0x14141404
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
addi t2, s3, 0x50
sw t2, 0(t1)

## 3. Program SIZE_CFG reg
la t6, ACCEL_OFFSET_SIZE_CFG
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x24242414
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
## Compute (j=0, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x50
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x320
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_0_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=0, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xe0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x320
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_0_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=0, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x170
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x320
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_0_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=0, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x200
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x320
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_0_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=0, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x290
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x320
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_0_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=1, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x54
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x324
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_1_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=1, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xe4
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x324
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_1_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=1, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x174
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x324
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_1_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=1, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x204
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x324
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_1_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=1, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x294
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x324
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_1_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=2, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x58
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x328
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_2_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=2, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xe8
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x328
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_2_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=2, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x178
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x328
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_2_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=2, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x208
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x328
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_2_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=2, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x298
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x328
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_2_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=3, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x5c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x32c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_3_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=3, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xec
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x32c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_3_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=3, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x17c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x32c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_3_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=3, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x20c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x32c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_3_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=3, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x29c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x32c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_3_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=4, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x60
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x330
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_4_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=4, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xf0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x330
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_4_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=4, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x330
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_4_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=4, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x210
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x330
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_4_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=4, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2a0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x330
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_4_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=5, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x64
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x334
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_5_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=5, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xf4
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x334
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_5_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=5, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x334
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_5_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=5, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x214
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x334
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_5_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=5, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2a4
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x334
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_5_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=6, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x68
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x338
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_6_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=6, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xf8
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x338
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_6_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=6, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x338
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_6_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=6, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x218
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x338
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_6_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=6, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2a8
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x338
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_6_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=7, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x6c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x33c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_7_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=7, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0xfc
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x33c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_7_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=7, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x33c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_7_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=7, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x21c
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x33c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_7_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=7, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2ac
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x33c
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_7_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=8, k=0) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x70
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x340
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_8_0:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_0

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=8, k=1) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x100
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x340
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_8_1:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_1

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=8, k=2) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x190
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x340
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_8_2:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_2

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=8, k=3) tile of 4x4 matrix multiplication in accelerator.|
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
li t2, 0x220
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x340
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_8_3:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_3

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)


## -------------------------------------------------------------------------+
## Compute (j=8, k=4) tile of 4x4 matrix multiplication in accelerator.|
## -------------------------------------------------------------------------+

## 1. Program MATA_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATA_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x10
sw t2, 0(t1)

## 2. Program MATB_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATB_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x2b0
sw t2, 0(t1)

## 3. Program MATC_MEM_ADDR reg
la t6, ACCEL_OFFSET_MATC_MEM_ADDR
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x340
sw t2, 0(t1)

## 4. Program MAT_MEM_STRIDE reg
la t6, ACCEL_OFFSET_MAT_MEM_STRIDE
lw t1, 0(t6)
add t1, t1, t0
li t2, 0x242414
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
wait_sa_8_4:
la t6, ACCEL_OFFSET_STATUS
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_4

## 7. Reset STATUS reg in ACCEL
sw x0, 0(t1)

hcf
