.data
n: .word 6
.text
   lw $a0, n

fibonacci:
    slti $t0, $a0,2
    beq $t0, 1, base

general:
    addi $a0, $a0, -1
    jal fibonacci
    add $v1, $v1, $v0
    addi $a0, $a0, -1
    jal fibonacci
    add $v1, $v1, $v0
    
    
base:
    add $v0, $zero, $a0

exit: