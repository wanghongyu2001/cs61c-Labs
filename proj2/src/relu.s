.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
#
# If the length of the vector is less than 1, 
# this function exits with error code 8.
# ==============================================================================
relu:
    li t0, 1
    blt a1, t0, exit2
    # Prologue
    addi sp, sp, -8
    sw s0, 0(sp)
    sw s1, 4(sp)
    li t0, 1

loop_start:
    blt a1, t0, loop_end
    lw s1, 0(a0)
    bge s1, x0, loop_continue
    addi s1, x0, 0

loop_continue:
    sw s1, 0(a0)
    addi a0, a0, 4
    addi a1, a1, -1
    j loop_start

loop_end:

    # Epilogue
    lw s0, 0(sp)
    lw s1, 4(sp)
    addi sp, sp, 8
    
	ret

exit2:
    li a0 17
    li a1 8
    ecall
    ret
