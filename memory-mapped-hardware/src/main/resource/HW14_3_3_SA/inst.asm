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
addi x31, x31, 0x00000300
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
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_a_0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
addi t2, s0, 0x04
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x04
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
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
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_a_1
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
addi t2, s0, 0x08
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x08
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
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
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_a_2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
addi t2, s0, 0x0c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x0c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
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
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer_a_3
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
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
lui x31, 0x00000008
addi x31, x31, 0x00000324
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
addi t2, s1, 0x04
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x104
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
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
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
addi t2, s1, 0x08
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x108
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
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
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x0000032c
lw t1, 0(t6)
add t1, t1, t0
addi t2, s1, 0x0c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000330
lw t1, 0(t6)
add t1, t1, t0
addi t2, s3, 0x10c
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000334
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00010101
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
addi x31, x31, 0x00000328
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_accel_transfer2
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000300
lw t0, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x00000310
lw t1, 0(t6)
add t1, t1, t0
sw x0, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000314
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000100
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000318
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000200
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000031c
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000101
addi x07, x07, 0x00000010
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000320
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x00000308
lw t1, 0(t6)
add t1, t1, t0
lui x07, 0x00000000
addi x07, x07, 0x00000001
sw t2, 0(t1)
lui x31, 0x00000008
addi x31, x31, 0x0000030c
lw t1, 0(t6)
add t1, t1, t0
lw t2, 0(t1)
beq t2, x0, wait_sa
sw x0, 0(t1)
hcf
nop
nop
nop
nop
nop
