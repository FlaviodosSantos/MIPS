.data
	Hello: .asciiz "Hello World Assembly !!! "
	
.text
	li $v0, 4	# 4 = servi�o para imprimir uma sitrng
	la $a0, Hello	# carrega a string no registro de argumento a0
	syscall		# chamada para servi�o do sistema