# exemplo de divisão
.data
	mensagem: .asciiz "\nO resultado da divisão é : "

.text 
	li $s2, 10		# guarda o vr 10 em s2
	li $s3, 2		# guarda o vr 2 em s3
	div $s1, $s2, $s3	# divide s2 por s3 e guarda em s1

	li $v0, 4		# 4 é o comando para imprimir texto
	la $a0, mensagem 	# guarda a mensagem em a0
	syscall 		# chamada do sistema e executa o print

 	li $v0, 1		# 1 é o comando para imprimir inteiro
 	la $a0, ($s1)		# guarda o inteiro em a0
 	syscall			# chamada do sistema e executa o print
