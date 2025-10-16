lui x08, 0x00000008
addi x08, x08, 0x00000000
lui x09, 0x00000008
addi x09, x09, 0x00000100
lui x18, 0x00000008
addi x18, x18, 0x00000200
lui x19, 0x00000008
addi x19, x19, 0x00000304
lw s3, 0(s3)
lui x31, 0x00000008
addi x31, x31, 0x00000308
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
sw s0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
sw s3, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x06, 0x00000000
addi x06, x06, 0x00000000
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000338
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_dma_transfer_a
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000308
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
sw s1, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x100
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x06, 0x00000000
addi x06, x06, 0x00000000
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000338
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_dma_transfer_b
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000100
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000200
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000140
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000200
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000180
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000200
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000200
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000104
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000204
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000144
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000204
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000184
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000204
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000204
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000108
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000208
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000148
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000208
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000188
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000208
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000208
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000010c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000020c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000014c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000020c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000018c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000020c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000020c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000040
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000100
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000240
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000044
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000140
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000240
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000048
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000180
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000240
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000004c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000240
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000040
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000104
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000244
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000044
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000144
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000244
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000048
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000184
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000244
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000004c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000244
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000040
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000108
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000248
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000044
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000148
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000248
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000048
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000188
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000248
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000004c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000248
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000040
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000010c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000024c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000044
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000014c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000024c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000048
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000018c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000024c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000004c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000024c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000080
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000100
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000280
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000084
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000140
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000280
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000088
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000180
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000280
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000008c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000280
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000080
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000104
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000284
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000084
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000144
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000284
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000088
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000184
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000284
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000008c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000284
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000080
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000108
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000288
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000084
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000148
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000288
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000088
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000188
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000288
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000008c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000288
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000080
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000010c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000028c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000084
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000014c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000028c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000088
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000018c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000028c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000008c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000028c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000100
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000140
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000180
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000104
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000144
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000184
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000108
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000148
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000188
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000010c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000014c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000c8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000018c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000001cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002cc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3_3
sw x0, 0(t1)
hcf
nop
nop
nop
nop
nop
