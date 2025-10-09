lui x06, 0x00000008
addi x06, x06, 0x00000024
lw t0, 0(t1)
lui x10, 0x00080000
addi x10, x10, 0x00000000
lui x11, 0x00000000
addi x11, x11, 0x00000000
lui x07, 0x00000000
addi x07, x07, 0x00000000
bge t2, t0, end_loop
lui x28, 0x00000008
addi x28, x28, 0x00000000
slli t4, t2, 2
add t3, t3, t4
lw t5, 0(t3)
add a1, a1, t5
blt a1, zero, reset_max_ending_here
blt a0, a1, update_so_far
j x0, next_element
lui x11, 0x00000000
addi x11, x11, 0x00000000
j x0, update_max
addi a0, a1
addi t2, t2, 1
j x0, loop
nop
nop
nop
nop
nop
hcf
