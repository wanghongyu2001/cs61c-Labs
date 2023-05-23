.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
#
# If the length of the vector is less than 1, 
# this function exits with error code 7.
# =================================================================
argmax:
    li t0, 1
    blt a1, t0, exit2 
    # Prologue
    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    mv s0, a0
    mv s1, a1
    lw t0, 0(s0)
    addi s0, s0, 4
    li a0, 0
    li a1, 1

loop_start:
    bge a1, s1, loop_end
    lw t1, 0(s0)
    bge t0, t1, loop_continue
    mv t0, t1
    mv a0, a1

loop_continue:
    addi s0, s0, 4
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
    li a1 7
    ecall
    ret

