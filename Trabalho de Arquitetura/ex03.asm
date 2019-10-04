.data
	base: .asciiz "Digite a base: "
	expoente: .asciiz "\nDigite o expoente: "
	resultado: .asciiz "\nO resultado é : "
.text
	MAIN:
		li $v0, 4 # codigo 4 para exibir mensagem
		la $a0, base # carrega a mensagem 
		syscall
		li $v0, 5 # codigo 5 para ler inteiro
		syscall
		move $s0, $v0 #salva o inteiro digitado 
		
		li $v0, 4
		la $a0, expoente
		syscall
		li $v0, 5
		syscall
		move $s1, $v0
		
		add $t1, $s0, 0 # resultado = zero
		sub $t2, $s1, 1 # varialvel axiliar com o valor do expoente
		
		jal POWER # chama a função
		
		li $v0, 4
		la $a0, resultado
		syscall
		li $v0, 1 # codigo 1 para exibir inteiro
		la $a0,($t1) #carrega o inteiro do registrador s3 a ser exibido
		syscall	
		
		j EXIT
		
	POWER:
		bne $s1, $zero, ELSE #se o expoente for diferente de 1 vá para ESLE
		li $t1,1 # se o expoente for zero o resultado é 1
		jr $ra #volta pro MAIN
		
		ELSE:
			sub $t2, $t2, 1 # varialvel t2 pra contar a repetição					
			mul $t1, $t1, $s0 # resultado = resultado * base 			
			
			bne $t2, $zero, POWER #se t2 for diferente de zero vá para POWER
			jr $ra #se t2 for igual a zero volte para MAIN
	
	
	EXIT:
		li  $v0, 10 # encerra o programa
		syscall