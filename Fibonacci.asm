.data
n: .word 3
.text
   lw $a0, n
   jal fibonacci
   j exit


fibonacci:
    addi $sp, $sp, -12
    sw $a0, 0($sp)
    sw $v0, 4($sp)
    sw $ra, 8($sp)    
    slti $t0, $a0, 2
    bne $t0, 1, general
    jal base
    beq $a0, 0, exitFibonacci
    
general:
    addi $a0, $a0, -1
    jal fibonacci
    add $t1, $v0, $zero
    addi $a0, $a0, -1
    jal fibonacci
    add $v0, $v0, $t1

exitFibonacci:
   
    lw $a0, 0($sp)
    lw $v0, 4($sp)  
    lw $ra, 8($sp)
    addi $sp, $sp, 12 
    jr $ra      
     
    

base:
    add $v0, $zero, $a0
    jr $ra
	

exit: