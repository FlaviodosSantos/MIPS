.data
	vetor: 	.word 0,0,0,0,0,0,0,0 	#definindo o vetor
	msg1:	.asciiz "\nEntre com A["
	msg2:	.asciiz	"]:"
	msg3:	.asciiz	"\nA["
	msg4:	.asciiz "\nA reprsentação do vetor lido\n\n"

.text
	MAIN:
		addi $s1, $zero, 8	# inicializa s1 em 8
		la 	 $s2, vetor		# inicializa o vetor
		addi $s4, $zero, 1	# inicializa j = 1
	
	LOOP:
		############# IMPRIME AS MENSAGENS #############
		addi $v0, $zero, 4	# codigo 4 para imprimir texto
		la   $a0, msg1
		syscall
		
		li   $v0, 1			# codigo 1 para imprimir inteiro
		add  $a0, $t0, $s0	# prepara t0 para imprimir
		syscall
		
		addi $v0, $zero, 4	# codigo 4 para imprimir texto
		la   $a0, msg2
		syscall
		######## PERCORRE O VETOR E PREPARA PARA RECEBER VALOR #############
		add  $t1, $t0, $t0	# t1 = 2 * i
		add  $t1, $t1, $t1	# t1 = 4 * i
		add  $t1, $t1, $s2 	# t1 = end.Base + 4*i(delocamneto)= end. de save[i]
		lw   $t2, 0($t1)	# t0 = save[i]
		li   $v0, 5			# condigo 5 para leitura de inteiro
		syscall
		############# GRAVA VALOR NA POSIÇÃO DO VETOR #############
		add  $t2, $v0, $0	# salva v0 em t0
		sw   $t2, 0($t1)	# t0 = save[i]
		addi $t0, $t0, 1 	# incrementa t0
		############# VERIFICAÇÃO DO LOOP #########################
		bne  $t0, $s1, LOOP	# enquanto t0 for diferente de s1 vai pro LOOP
		
		la   $s2, vetor		# inicializa o vetor
		addi $t0, $zero, 0	# inicializa t0 em zero , i = 0 
		
		addi $v0, $zero, 4  # cod 4 para imprimir texto
		la   $a0, msg4
		syscall
		
	LOOP2:
		addi $v0, $zero, 4  # cod 4 para imprimir texto
		la   $a0, msg3
		syscall 	
		############# EXIBIR i do vetor[i] ####################
		li   $v0, 1			# codigo 4 para imprimir inteiro
		add  $a0, $t0, $s0	# prepara t0 para imprimir
		syscall
		
		addi $v0, $zero, 4	# codigo 4 para imprimir texto
		la   $a0, msg2
		syscall
		###### PERCORRE O VETOR E PREPARA PARA EXIBIR VALOR ############
		add  $t1, $t0, $t0	# t1 = 2 * i
		add  $t1, $t1, $t1	# t1 = 4 * i
		add  $t1, $t1, $s2 	# t1 = end.Base + 4*i(delocamneto)= end. de save[i]
		lw   $t2, 0($t1)	# t0 = save[i]
		li   $v0, 1			# condigo 1 para imprimir inteiro
		add  $a0, $t2, $s0	# prepara t0 para imprimir
		syscall
		
		addi $t0, $t0, 1 	# incrementa t0
		
		############# VERIFICAÇÃO DO LOOP #########################
		bne  $t0, $s1, LOOP2	# enquanto t0 for diferente de s1 vai pro LOOP
		
		nop
		
		
		
		
		
		