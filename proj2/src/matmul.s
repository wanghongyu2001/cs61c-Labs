.globl matmul

.text
# =======================================================
# FUNCTION: Matrix Multiplication of 2 integer matrices
# 	d = matmul(m0, m1)
#   The order of error codes (checked from top to bottom):
#   If the dimensions of m0 do not make sense, 
#   this function exits with exit code 2.
#   If the dimensions of m1 do not make sense, 
#   this function exits with exit code 3.
#   If the dimensions don't match, 
#   this function exits with exit code 4.
# Arguments:
# 	a0 (int*)  is the pointer to the start of m0 
#	a1 (int)   is the # of rows (height) of m0
#	a2 (int)   is the # of columns (width) of m0
#	a3 (int*)  is the pointer to the start of m1
# 	a4 (int)   is the # of rows (height) of m1
#	a5 (int)   is the # of columns (width) of m1
#	a6 (int*)  is the pointer to the the start of d
# Returns:
#	None (void), sets d = matmul(m0, m1)
# =======================================================
matmul:

    # Error checks
    li t0, 1
    blt a1, t0, exit2
    blt a2, t0, exit2
    blt a4, t0, exit3
    blt a5, t0, exit3
    bne a2, a4, exit4

    # Prologue
    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    li t0, 0
    mv t2, a3
outer_loop_start:
    bge t0, a1, outer_loop_end
    mv a3, t2
    li t1, 0

inner_loop_start:
    bge t1, a5, inner_loop_end
    addi sp, sp, -40
    sw t0, 0(sp)
    sw t1, 4(sp)
    sw ra, 8(sp)
    sw a0, 12(sp)
    sw a1, 16(sp)
    sw a2, 20(sp)
    sw a3, 24(sp)
    sw a4, 28(sp)
    sw a5, 32(sp)
    sw t2, 36(sp)
    mv a1, a3
    li a3, 1
    mv a4, a5
    call dot
    sw a0, 0(a6)
    addi a6, a6, 4
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw ra, 8(sp)
    lw a0, 12(sp)
    lw a1, 16(sp)
    lw a2, 20(sp)
    lw a3, 24(sp)
    lw a4, 28(sp)
    lw a5, 32(sp)
    lw t2, 36(sp)
    addi sp, sp, 40
    addi t1, t1, 1
    addi a3, a3, 4
    slli t3, a2, 2
    j inner_loop_start

inner_loop_end:
    addi t0, t0, 1
    add a0, a0, t3
    j outer_loop_start


outer_loop_end:


    # Epilogue
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    addi sp, sp, 20

    ret

exit2:
    li a0 17
    li a1 2
    ecall
    ret

exit3:
    li a0 17
    li a1 3
    ecall
    ret
    
exit4:
    li a0 17
    li a1 4
    ecall
    ret
