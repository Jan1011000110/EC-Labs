	.data
	.align 2
fib: 	.space 40

	.text
	.globl main
	
main:
	li $s0, 2
	la $t1, fib
	sw $zero, 0($t1)
	li $t2, 1
	sw $t2, 4($t1)
	
while:
	slti $t0, $s0, 10
	beq $t0, $zero, fi
	sll $t3, $s0, 2
	addu $t3, $t3, $t1
	lw $s1, -4($t3)
	lw $s2, -8($t3)
	addu $s3, $s1, $s2
	sw $s3, 0($t3)
	addiu $s0, $s0, 1
	b while

fi:
	jr $ra