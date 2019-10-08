
# include <stdio.h>
# include <stdlib.h>
# include <locale.h>

# int main(){
#    setlocale(LC_ALL,"Portuguese");
#    int c[15] = {3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0};
#    int a = 0, b = 30;
#    a = b + c[10];
#    printf("\n o valor de a é: %d \n", a);
#}

.data
	c: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0
.text
	li $s1, 30               # determinando o valor para $s1
	la $s2, c                # colocando o endereço do array em $s2
	li $t2, 10               # colocando o índice do array em $t2
	add $t2, $t2, $t2        # “2i”
	add $t2, $t2, $t2        # “4i”
	add $t1, $t2, $s2        # combinando os dois componentes do endereço
	lw $t0, 0 ( $t1 )        # obtendo o valor da célula do array
	add $s0, $s1, $t0        # executando a soma

	li $v0, 1	# 1 = serviço para imprimir um inteiro
	la $a0, ($s0) 	# carrega o inteiro no registro de argumento a0
	syscall		# chamada para serviço do sistema para imprimir
