lui x08, 0x00000008
addi x08, x08, 0x00000000
lui x09, 0x00000008
addi x09, x09, 0x00000050
lui x18, 0x00000008
addi x18, x18, 0x00000320
lui x19, 0x00000008
addi x19, x19, 0x000003b4
lw s3, 0(s3)
lui x31, 0x00000008
addi x31, x31, 0x000003b0
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x000003dc
lw t1, 0(t6)
add t1, t1, t0
sw s0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003e0
lw t1, 0(t6)
add t1, t1, t0
sw s3, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003e4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00014141
addi x07, x07, 0x00000404
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d8
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_a
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b0
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x000003dc
lw t1, 0(t6)
add t1, t1, t0
sw s1, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003e0
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x50
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003e4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00024242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d8
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_b
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b0
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000050
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000320
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000e0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000320
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000170
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000320
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000200
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000320
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000290
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000320
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_0_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000054
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000324
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000e4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000324
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000174
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000324
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000204
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000324
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000294
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000324
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_1_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000058
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000328
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000e8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000328
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000178
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000328
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000208
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000328
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000298
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000328
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_2_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000005c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000032c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000ec
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000032c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000017c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000032c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000020c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000032c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000029c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000032c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_3_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000060
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000330
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000f0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000330
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000180
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000330
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000210
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000330
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002a0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000330
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_4_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000064
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000334
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000f4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000334
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000184
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000334
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000214
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000334
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002a4
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000334
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_5_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000068
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000338
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000f8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000338
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000188
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000338
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000218
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000338
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002a8
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000338
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_6_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000006c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000033c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000000fc
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000033c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000018c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000033c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000021c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000033c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002ac
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000033c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_7_4
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000070
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000340
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000004
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000100
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000340
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000008
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000190
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000340
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x0000000c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000220
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000340
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c4
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x000002b0
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003c8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000340
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003cc
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000242
addi x07, x07, 0x00000414
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003d0
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000000
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003b8
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x000003bc
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa_8_4
sw x0, 0(t1)
hcf
nop
nop
nop
nop
nop
