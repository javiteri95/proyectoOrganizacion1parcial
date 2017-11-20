.data
	titulo: .asciiz "****Bienvenido al programa hecho en mips para hacer persistencia aditiva.****\n\n"
	ingresoNumero: .asciiz "Ingrese el numero, por favor\n"
	mensajeNumeroPuesto: .asciiz "Su numero es el: "
	mensajeRetorno: .asciiz "la persistencia aditiva de su numero es: "
	saltoLinea: .asciiz "\n"

.text
.globl main
	main:
		#impresion titulo
		la $a0 , titulo
		li $v0 , 4
		syscall
		
		#impresion ingreso de numero
		la $a0 , ingresoNumero
		li $v0 , 4
		syscall
		
		#pedida por teclado
		li $v0, 5
		syscall
		
		move $a1, $v0
		
		#Inmpresion del mensaje de que ingrese el numero
		la $a0 , mensajeNumeroPuesto
		li $v0 , 4
		syscall
		
		#impresion del numero ingresado por teclado
		li $v0 , 1
		move $a0 , $a1
		syscall
		
		#Impresion del salto de linea
		la $a0 , saltoLinea
		li $v0 , 4
		syscall
		
		jal funcionPersistenciaAditiva
		
		#impresion del "valor de mi persistencia aditiva es":
		la $a0 , mensajeRetorno
		li $v0, 4
		syscall
		
		#impresion del valor numerico de la persistencia aditiva
		move $a0 , $t1 #muevo mi valor de persistencia a a0 para imprimirlo
		li $v0 , 1
		syscall
		
		#Impresion del salto de linea
		la $a0 , saltoLinea
		li $v0 , 4
		syscall
		
		
		
		#terminacion Programa
		li $v0, 10
		syscall
		
	funcionPersistenciaAditiva :
		# t1 : valor de retorno
		# t6 : valor contador
		# t7 : valor acumulador
		# a1 :valor del numero al que quiero calcular persistencia aditiva
		
		#en a1 esta mi numero
		#creo dos variables temporales, un acumulador y un contador
		addi $t6 , $t6 , 0 #contador
		addi $t7 , $t7 , 0 #acumulador
		loop1 : #loop de si el numero es mayor que 10 
			bgt $a1 , 10 , loop2
			move $t1 , $t6 #gurado el valor de return en t1 
			jr $ra
			
			
			
			loop2 : #descompone el numero
				bne $a1 , $zero , insideLoop2
				addi $t6 , $t6 , 1 #aumento el contador
				move $a1 , $t7 #reincio el numero a la nueva suma del acumulador
				move $t7 , $zero #reseteo el acumulador
				b loop1 #regreso al loop1
				
				insideLoop2: 
					li $t2 , 10
					div $a1 , $t2 
					mflo $t3 #este es mi cociente
					mfhi $t4 #este es mi residuo
					add $t7 , $t7 , $t4 #sumo al acumulador
					move $a1 , $t3 #seteo el nuevo numero
					b loop2
					
					
					
				
			
		
		
		
		
		