# See LICENSE for license details.

#*****************************************************************************
# mergesort.S
#-----------------------------------------------------------------------------
#
# Test mergesort.
#


.data

test1: 
.word 412
.word -474
.word 443
.word 171
.word -23
.word 247
.word 221
.word 7
.word 40
.word 221
.word -90
.word 61
.word -9
.word 49
.word -80
.word -80
.word 221
.word -379
.word -161
.word -397
.word -173
.word 276
.word -197
.word 221
.word -12
.word -145
.word 10

TEST1_SIZE: 
.word 27

.text
main:

    # Collee save
    addi  sp, sp, -8
    # @s0 -> MEM[@sp-4]
    sw    s0, 4(sp)   
    # @s1 -> MEM[@sp-8]
    sw    s1, 0(sp)   

    # Load data
    la    s0, test1
    la    s1, TEST1_SIZE
    
    # set parameters
    mv    a0, s0
    li    a1, 0
    lw    a2, 0(s1)
    addi  a2, a2, -1
    
    # Caller save
    addi  sp, sp, -4
    # ra -> MEM[@sp-4]
    sw    ra, 0(sp)   
    
    # Call function
    jal   ra, mergesort
    
    # Caller save pop
    # MEM[@sp-4] -> ra
    lw    ra, 0(sp)   
    addi  sp, sp, 4
    
    # Collee save pop
    # @s0 -> MEM[@sp-4]
    lw    s0, 4(sp)   
    # @s1 -> MEM[@sp-8]
    lw    s1, 0(sp)   
    addi  sp, sp, 8

    li a7, 93
    li a0, 0
    j end

    
#------------------------#
#   Function mergesort   #
#------------------------#

mergesort:
    ####
    # a0: array address
    # a1: start offset
    # a2: end offset
    ####
    ## if start >= end, sort finished
    bge a1, a2, mergesort_ret    
    
    ### if(start < end)
    
    # Collee save
    addi  sp, sp, -12
    # @s0 -> MEM[@sp-4]
    sw    s0, 8(sp)  
    # @s1 -> MEM[@sp-8]
    sw    s1, 4(sp)    
    # @s2 -> MEM[@sp-12]
    sw    s2, 0(sp)    

    # set data
    mv    s1, a1
    mv    s2, a2
    # s0: mid = (end + start)/2
    add   s0, a1, a2
    srai  s0, s0, 1    
    
    # Caller save
    addi  sp, sp, -4
    # @ra -> MEM[@sp-4]
    sw    ra, 0(sp)   
    
    ### code: mergesort(arr, start, mid)
    # set parameters
    # a0: address (fixed)
    # a1: start
    mv    a1, s1        
    # a2: mid
    mv    a2, s0        
    # Call mergesort
    jal   ra, mergesort
    
    ### code: mergesort(arr, mid+1, end)
    # set parameters
    # a0: address (fixed)
    # a1: mid+1
    addi  a1, s0, 1      
    # a2: end
    mv    a2, s2         
    # Call mergesort
    jal   ra, mergesort
    
    ### code: merge(arr, start, mid, end)
    # set parameters
    # a0: address (fixed)
    # a1: start
    mv    a1, s1        
    # a2: mid
    mv    a2, s0        
    # a2: end
    mv    a3, s2        
    # Call merge
    jal   ra, merge
    
    # Caller save pop
     # @ra -> MEM[@sp-4]
    lw    ra, 0(sp)  
    addi  sp, sp, 4
    
    # Collee save pop
    # @s0 -> MEM[@sp-4]
    lw    s0, 8(sp)   
    # @s1 -> MEM[@sp-8]
    lw    s1, 4(sp)    
    # @s2 -> MEM[@sp-12]
    lw    s2, 0(sp)    
    addi  sp, sp, 12
    
mergesort_ret:
    ret

#--------------------#
#   Function merge   #
#--------------------#
merge:
    ####
    # a0: array address
    # a1: start offset
    # a2: mid offset
    # a3: end offset
    ####
    
    # t0: temp_size = end - start + 1
    sub   t0, a3, a1
    addi  t0, t0, 1
    
    # t1: temp[temp_size] address in stack (@temp[])
    slli  t1, t0, 2
    # @sp = @sp - temp_size*4(byte)
    sub   sp, sp, t1    
    mv    t1, sp
    
    ### for(int i = 0; i< temp_size;i++)
     # t2: int i
    li    t2, 0   
    bge   t2, t0, for_loop_1_end
for_loop_1:
    # t3 = i + start
    add   t3, t2, a1    
    slli  t3, t3, 2
    # t3 = @arr[i + start]
    add   t3, t3, a0    
    # arr[i + start] -> t4
    lw    t4, 0(t3)     
    slli  t3, t2, 2
    # t3 = @temp[i]
    add   t3, t3, t1   
    # t4 -> temp[i]
    sw    t4, 0(t3)     
    
    # i++
    addi  t2, t2, 1     
    blt   t2, t0, for_loop_1
for_loop_1_end:    
    
    ### set index
    # Collee save
    addi  sp, sp, -20
    sw    s0, 0(sp)
    sw    s1, 4(sp)
    sw    s2, 8(sp)
    sw    s3, 12(sp)
    sw    s4, 16(sp)
    
    # inde initial
    # s0: left_index  = 0
    # s1: left_max    = mid-start
    # s2: right_index = mid-start+1
    # s1: right_max   = end-start
    # s4: arr_index   = start   
    li    s0, 0         
    sub   s1, a2, a1    
    addi  s2, s1, 1     
    sub   s3, a3, a1    
    mv    s4, a1        
    
    ### while(left_index <= left_max && right_index <= right_max)
while_loop_1:

    # (left_index <= left_max) = false
    blt   s1, s0, while_loop_1_end    
    # (right_index <= right_max) = false
    blt   s3, s2, while_loop_1_end   
    
    ### if(temp[left_index] <= temp[right_index])
    # temp[left_index] -> t3
    slli  t2, s0, 2         
    # word
    add   t2, t2, t1        
    lw    t3, 0(t2)
    # temp[right_index] -> t4
    slli  t2, s2, 2         
    # word
    add   t2, t2, t1        
    lw    t4, 0(t2)
    # @arr[arr_index] -> t2
    slli  t2, s4, 2         
    # word
    add   t2, t2, a0        
    blt   t4, t3, else_1
if_1:      
    # arr[arr_index] = temp[left_index]
    sw    t3, 0(t2)        
    # arr_index++
    addi  s4, s4, 1        
    # left_index++
    addi  s0, s0, 1        
    j     if_1_end    
else_1:      
    # arr[arr_index] = temp[right_index]
    sw    t4, 0(t2)        
    # arr_index++
    addi  s4, s4, 1        
    # right_index++
    addi  s2, s2, 1        
if_1_end:    
    j    while_loop_1
while_loop_1_end:

### while(left_index <= left_max)
    # (left_index <= left_max) = false
    blt   s1, s0, while_loop_2_end    
while_loop_2:
    # word
    slli  t2, s0, 2         
    # temp[left_index] -> t3
    add   t2, t2, t1        
    lw    t3, 0(t2)
    # word
    slli  t2, s4, 2         
    # @arr[arr_index] -> t2
    add   t2, t2, a0        
    # arr[arr_index] = temp[left_index]
    sw    t3, 0(t2)         
     # arr_index++
    addi  s4, s4, 1        
    # left_index++
    addi  s0, s0, 1         
    # (left_index <= left_max) = true
    bge   s1, s0, while_loop_2    
while_loop_2_end:
    # (right_index <= right_max) = false
    blt   s3, s2, while_loop_3_end    
while_loop_3:
    # word
    slli  t2, s2, 2         
    # temp[right_index] -> t3
    add   t2, t2, t1        
    lw    t3, 0(t2)
    # word
    slli  t2, s4, 2         
    # @arr[arr_index] -> t2
    add   t2, t2, a0        
    # arr[arr_index] = temp[right_index]
    sw    t3, 0(t2)         
    # arr_index++
    addi  s4, s4, 1         
    # right_index++
    addi  s2, s2, 1         
    # (right_index <= right_max) = true
    bge   s3, s2, while_loop_3    
while_loop_3_end:
    
    # Collee save pop
    lw    s0, 0(sp)
    lw    s1, 4(sp)
    lw    s2, 8(sp)
    lw    s3, 12(sp)
    lw    s4, 16(sp)
    addi  sp, sp, 20
    
    # release temp array in stack
    slli  t1, t0, 2
    # @sp = @sp + temp_size
    add   sp ,sp, t1    
    
    ret

end:
    nop
    nop
    nop
    nop
    nop
    # Load data into reg x5 ~ x31
    la x3, test1
    lw x5, 0(x3)
    lw x6, 4(x3)
    lw x7, 8(x3)
    lw x8, 12(x3)
    lw x9, 16(x3)
    lw x10, 20(x3)
    lw x11, 24(x3)
    lw x12, 28(x3)
    lw x13, 32(x3)
    lw x14, 36(x3)
    lw x15, 40(x3)
    lw x16, 44(x3)
    lw x17, 48(x3)
    lw x18, 52(x3)
    lw x19, 56(x3)
    lw x20, 60(x3)
    lw x21, 64(x3)
    lw x22, 68(x3)
    lw x23, 72(x3)
    lw x24, 76(x3)
    lw x25, 80(x3)
    lw x26, 84(x3)
    lw x27, 88(x3)
    lw x28, 92(x3)
    lw x29, 96(x3)
    lw x30, 100(x3)
    lw x31, 104(x3)
    hcf




