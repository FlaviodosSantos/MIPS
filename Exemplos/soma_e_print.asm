.text
li $s2, 12		#carrega o valor IMEDIATO 12 no registrador s2(li = load immediate)
li $s3, 16		#carrega o valor IMEDIATO 16 no registrador s3
add $s1, $s2, $s3	#carrega a soma de s2 com s3 e armazena em s1

li $v0, 1	# 1 = serviço para imprimir um inteiro
la $a0, ($s1) 	# carrega o inteiro no registro de argumento a0
syscall		# chamada para serviço do sistema para imprimir
