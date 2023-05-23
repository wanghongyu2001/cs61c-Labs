.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
#
# If the length of the vector is less than 1, 
# this function exits with error code 5.
# If the stride of either vector is less than 1,
# this function exits with error code 6.
# =======================================================
dot:
    li t0, 1
    blt a2, t0, exit2
    # Prologue
    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    mv s0, a0
    mv s1, a1
    mv s2, a2
    li a0, 0
    li a1, 0
    slli t3 a3, 2
    slli t4 a4, 2

loop_start:
    bge a1, a2, loop_end
    lw t0, 0(s0)
    lw t1, 0(s1)
    mul t2, t0, t1
    add a0, a0, t2
    add s0, s0, t3
    add s1, s1, t4
    addi a1, a1, 1
    j loop_start

loop_end:


    # Epilogue
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    addi sp, sp, 16
    
    ret

exit2:
    li a0 17
    li a1 6
    ecall
    ret
