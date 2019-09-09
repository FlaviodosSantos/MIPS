# Exemplo de multiplica��o "sem overflow": 2 x 10 = 20
.data
Resultado: .asciiz "\n O resulado da multiplica��o sem overflow �: "

.text 

li $s2, 10	#carrega o vr imediato 10 no registrador s2(li = load immediate)
li $s3, 2	#carrega o vr imediato 2 no registrador s3
mul $s4, $s2, $s3	#executa a multiplica��o entre s2 e s3

li $v0, 4	# 4 = comando para imprimir string
la $a0, Resultado	#mensagem "Resultado"
syscall

li $v0, 1	# 1 = servi�o para imprimir um inteiro
la $a0, ($s4) 	# carrega o inteiro no registro de argumento a0
syscall		# chamada para servi�o do sistema para imprimir

