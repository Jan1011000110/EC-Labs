	.data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra


moda:
# ESCRIU AQUI EL TEU CODI
	addiu $sp, $sp, -60
	sw $s0, 40($sp)
	sw $s1, 44($sp)
	sw $s2, 48($sp)
	sw $s3, 52($sp)
	sw $ra, 56($sp)
	
	move $s0, $a0  # vec
	move $s1, $a1  # num
	
	addiu $s2, $sp, 0  # k
	addiu $t0, $sp, 40
for0:
	sw $zero, 0($s2)
	addiu $s2, $s2, 4
	blt $s2, $t0, for0
	
	li $s3, '0' # max
	
	addiu $s2, $s0, 0  # k = &vec[0]
	addu $s1, $s1, $s0
	
	bge $s2, $s1, fi_moda
for1:
	move $a0, $sp
	lb $a1, 0($s2)
	addiu $a1, $a1, -48
	move $a2, $s3
	addiu $a2, $a2, -48
	jal update
	addiu $s3, $v0, '0'
	addiu $s2, $s2, 1 
	blt $s2, $s1, for1

fi_moda:
	move $v0, $s3
	lw $s0, 40($sp)
	lw $s1, 44($sp)
	lw $s2, 48($sp)
	lw $s3, 52($sp)
	lw $ra, 56($sp)
	addiu $sp, $sp, 60
	jr $ra
	

update:
# ESCRIU AQUI EL TEU CODI
	addiu $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	
	jal nofares
	
	sll $t0, $s1, 2
	addu $t0, $t0, $s0
	lw $t1, 0($t0)
	addiu $t1, $t1, 1
	sw $t1, 0($t0)
	sll $t0, $s2, 2
	addu $t0, $t0, $s0
	lw $t2, 0($t0)	
	ble $t1, $t2, else0
if0:
	move $v0, $s1
	b fi_if0
else0:
	move $v0, $s2
fi_if0:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addiu $sp, $sp, 16
	jr $ra
