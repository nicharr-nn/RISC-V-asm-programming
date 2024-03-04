.data
# int a[5] = {1, 2, 3, 4, 5};
# int b[5] = {6, 7, 8, 9, 10};
arr1: .word 1, 2, 3, 4, 5
arr2: .word 6, 7, 8, 9, 10
print_line: .string "The dot product is: "
newline: .string "\n"

.text
main:
    # int main() {
    # int i, sop = 0;
    addi x6, x0, 0 # let x6 be 0 (i)
    addi x7, x0, 0 # let x7 be 0 (sop)
    addi x5, x0, 5
    la x8, arr1
    la x9, arr2

loop:
    bge x6, x5, break
    slli x18, x6, 2
    add x19, x18, x8
    lw x20, 0(x19)

    add x22, x18, x9
    lw x23, 0(x22)

    mul x24, x20, x23
    add x7, x7, x24
    addi x6, x6, 1
    j loop
    
break:
    # printf("The dot product is: %d\n", sop);
    addi a0, x0, 4
    la a1, print_line
    ecall
    
    li a0, 1
    mv a1, x7
    ecall
    
    addi a0, x0, 4
    la a1, newline
    ecall
    
    li a0, 10
    ecall
    