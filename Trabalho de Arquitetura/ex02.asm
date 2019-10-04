.data
	dividendo: .asciiz "Digite o dividendo: "
	par: .asciiz "\nEste numero é par ! "
	impar: .asciiz "\nEste numero é impar ! "	
.text   
	j MAIN
	
		
	RESTO_DIVISAO:
	    LOOP: 	
		slt $t0, $s2, $s1 #se o resto for menor que o divisor, t0 = 1
		bne $t0, $zero, EXIT_LOOP #se t0 for diferente de ZERO, vá pra EXIT
		sub $s2, $s2, $s1 # RESTO = RESTO - DIVISOR
		addi $s3, $s3,1 # Quociente = quociente + 1
		j LOOP
	
	    EXIT_LOOP:
		jr $ra
		
	

	MAIN:
		li  $v0, 4 # exibir a mensagem
		la  $a0, dividendo # carrega a mansagem no registrador
		syscall	
		li  $v0, 5 # ler o inteiro digitado
		syscall	
		move $s0, $v0 #move o que está no v0 pro t0	
	
		li  $s1, 2   # divisor vai ser 2	
		add $s2, $s0, $zero # resto = s2 = dividendo
		li  $s3, 0   # quociente = s3 = 0
	
		jal RESTO_DIVISAO 
	
		bne $s2,$zero, ELSE # se s2 diferente de ZERO vá pra ELSE	
		li  $v0, 4 # exibir a mensagem
		la  $a0, par # carrega a mansagem no registrador
		syscall	
		j EXIT
		
		ELSE:
			li  $v0, 4 # exibir a mensagem
			la  $a0, impar # carrega a mansagem no registrador
			syscall
			j EXIT
	
	EXIT:
		li  $v0, 10 # encerra o programa
		syscall
	
	
