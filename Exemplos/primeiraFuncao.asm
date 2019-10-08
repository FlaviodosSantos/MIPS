.data
	mensagem: .asciiz "Ola mundo, Assembly \nOlá MIPS!"
.text
	main: #função principal
		jal printMensagem # chamou a função
		
		#pra encerrar o programa
		li $v0, 10 #cogdigo 10 pra encerrar o programa
		syscall #chamada pro sistema
	
	printMensagem: #função
		li $v0, 4 #codigo 4 para printar string
		la $a0, mensagem #carrega o texto
		syscall #chamada pro sistema
		
		jr $ra #retorna pra quem chamou a função
