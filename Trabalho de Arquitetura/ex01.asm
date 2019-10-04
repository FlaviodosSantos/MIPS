.data
	dividendo: .asciiz "Digite o dividendo: "
	divisor: .asciiz "\nDigite o divisor: "
	quociente: .asciiz "\nO quociente é: "
	resto: .asciiz "\nO resto é : "
.text
	li $v0, 4 # exibir a mensagem
	la $a0, dividendo # carrega a mansagem no registrador
	syscall	
	li $v0, 5 # ler o inteiro digitado
	syscall	
	move $s0, $v0 #move o que está no v0 pro t0
	
	li $v0, 4
	la $a0, divisor
	syscall	
	li $v0, 5
	syscall
	move $s1, $v0 #move o que está no v0 pro t1
	
	add $s2, $s0, $zero # resto = s2 = dividendo
	li $s3, 0   # quociente = s3 = 0
	
	LOOP: 
	# while(resto < divisor){
	#    	resto = resto - divisor;
	#	quociente++;
	# }
	slt $t0, $s2, $s1 #se o resto for menor que o divisor, t0 = 1
	bne $t0, $zero, EXIT #se t0 for diferente de ZERO, vá pra EXIT
	sub $s2, $s2, $s1 # RESTO = RESTO - DIVISOR
	addi $s3, $s3,1 # Quociente = quociente + 1
	j LOOP
	
	EXIT:
	
	li $v0, 4 # exibir a mensagem
	la $a0, quociente # carrega a mansagem no registrador
	syscall	
	li $v0, 1 # codigo 1 para exibir inteiro
	la $a0,($s3) #carrega o inteiro do registrador s3 a ser exibido
	syscall	
		
	li $v0, 4 # exibir a mensagem
	la $a0, resto # carrega a mansagem no registrador
	syscall
	li $v0, 1 # codigo 1 para exibir inteiro
	la $a0, ($s2) #carrega o inteiro do registrador s3 a ser exibido	
	syscall
	
	
