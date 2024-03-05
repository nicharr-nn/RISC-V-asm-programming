.data
a: .word 1, 2, 3, 4, 5 # int a[5] = {1, 2, 3, 4, 5};
b: .word 6, 7, 8, 9, 10 # int b[5] = {6, 7, 8, 9, 10};
print_line: .string "The dot product is: "
newline: .string "\n"

.text
main:
    la a0, a                     # Loading address, a[] to x8
    la a1, b                     # Loading address, b[] to x9
    
    addi a2, x0, 5               # size = 5 
    addi x5, x0, 1               # x5 = 1
    
    jal dot_product              # jump to dot_product 
    
exit:
    mv t3, a0
    
    li a0, 4                    # print text (print_line)
    la a1, print_line
    ecall
    
    li a0, 1                    # print result
    mv a1, t3
    ecall
    
    li a0, 4                    # print newline
    la a1, newline
    ecall

    li a0, 10                   # exit program
    ecall
    
# Base case for recursive
dot_product_base_case:
    bne a2, x5, dot_product         # if size != exit, do dot_product
    lw t1, 0(a0)                    # load a[0]
    lw t2, 0(a1)                    # load b[0]
    mul a0, t1, t2                  # a[0]*b[0]
    jr ra                           # return
    
# Recursive function for dot product calculation
dot_product:
    # save register on to the stack
    addi sp, sp, -12
    sw a0, 8(sp)
    sw a1, 4(sp)
    sw ra, 0(sp)
    
    addi a0, a0, 4                  # a += 1
    addi a1, a1, 4                  # b += 1
    addi a2, a2, -1                 # size -= 1
    
    jal dot_product_base_case       # jump to dot_product_base_case

load:
    # Load registers from the stack
    lw t1, 8(sp)
    lw t2, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 12

    lw t1, 0(t1)
    lw t2, 0(t2)
    
    mul t1, t1, t2
    add a0, a0, t1
   
    jr ra               # return