.text
main:
    addi a0, x0, 110 #(a)
    addi a1, x0, 50 #(b)
    jal mult

    mv a1, a0
    addi a0, x0, 1
    ecall

    addi a0, x0, 10
    ecall

mult:
    addi t0, x0, 1
    beq a1,t0, exit_base_case

    addi sp, sp, -4
    sw ra, 0(sp)
    
    addi sp, sp, -4
    sw a0, 0(sp)
    addi a1, a1, -1
    jal mult

    mv t1, a0
    
    lw a0, 0(sp)
    addi sp, sp, 4
    add a0, a0, t1

    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra

    add a0, a0, t0

exit_base_case:
    jr ra