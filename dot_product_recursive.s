.data
# int a[5] = {1, 2, 3, 4, 5};
# int b[5] = {6, 7, 8, 9, 10};
arr1: .word 1, 2, 3, 4, 5
arr2: .word 6, 7, 8, 9, 10
print_line: .string "The dot product is: "
newline: .string "\n"

.text
main:
    addi x6, x0, 0 # let x6 be 0 (result)
    addi x5, x0, 5
    la x8, arr1
    la x9, arr2