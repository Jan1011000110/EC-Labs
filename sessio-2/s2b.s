	.data
result: .word 0
num:	.byte ';'

	.text
	.globl main
main:

# COPIA EL TEU CODI AQUI
	la $t0, num
	lb $t0, 0($t0)
	la $t1, result

cond0:
	li $t2, 'a'
	blt $t0, $t2, cond1
	li $t2, 'z'
	ble $t0, $t2, if0
cond1:
	li $t2, 'A'
	blt $t0, $t2, else0
	li $t2, 'Z'
	bgt $t0, $t2, else0
if0:
	sw $t0, 0($t1)
	b fi
else0:
	li $t2, '0'
	blt $t0, $t2, else1
	li $t2, '9'
	bgt $t0, $t2, else1
if1:
	li $t2, '0'
	subu $t0, $t0, $t2
	sw $t0, 0($t1)
	b fi
else1:
	li $t2, -1
	sw $t2, 0($t1)
fi:
	
	jr $ra

