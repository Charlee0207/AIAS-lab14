lui x08, 0x00000008
addi x08, x08, 0x00000000
lui x09, 0x00000008
addi x09, x09, 0x00000010
lui x18, 0x00000008
addi x18, x18, 0x00000020
lui x19, 0x00000000
addi x19, x19, 0x00000004
lui x20, 0x00000000
addi x20, x20, 0x00000004
lui x21, 0x00000000
addi x21, x21, 0x00000004
lui x31, 0x00000008
addi x31, x31, 0x00000034
lw t0, 0(t6)
mul t3, s3, s4
add t1, t0, t3
mul t3, s4, s5
add t2, t1, t3
mul t3, s3, s4
lui x29, 0x00000000
addi x29, x29, 0x00000000
add t5, s0, t4
vle8_v v1, 0(t5)
add t5, t0, t4
vse8_v v1, 0(t5)
addi t4, t4, 8
blt t4, t3, loop_a
mul t3, s4, s5
lui x29, 0x00000000
addi x29, x29, 0x00000000
add t5, s1, t4
vle8_v v1, 0(t5)
add t5, t1, t4
vse8_v v1, 0(t5)
addi t4, t4, 8
blt t4, t3, loop_b
lui x31, 0x00000008
addi x31, x31, 0x00000030
lw t3, 0(t6)
lui x31, 0x00000008
addi x31, x31, 0x00000040
lw t4, 0(t6)
add t4, t3, t4
sw t0, 0(t4)
lui x31, 0x00000008
addi x31, x31, 0x00000044
lw t4, 0(t6)
add t4, t3, t4
sw t1, 0(t4)
lui x31, 0x00000008
addi x31, x31, 0x00000048
lw t4, 0(t6)
add t4, t3, t4
sw t2, 0(t4)
lui x31, 0x00000008
addi x31, x31, 0x00000038
lw t4, 0(t6)
add t4, t3, t4
lui x30, 0x00000000
addi x30, x30, 0x00000001
sw t5, 0(t4)
lui x31, 0x00000008
addi x31, x31, 0x0000003c
lw t4, 0(t6)
add t4, t3, t4
lw t5, 0(t4)
lui x31, 0x00000000
addi x31, x31, 0x00000001
beq t5, t6, finish
j x0, hang
sw zero, 0(t4)
vle8_v v1, 0(t2)
addi t2, t2, 8
vle8_v v2, 0(t2)
hcf