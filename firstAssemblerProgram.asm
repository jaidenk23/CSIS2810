# Jaiden Kazemini
# CSIS2810, First Assembler Program Assignment 3A

.data
prompt1: .asciiz "Please enter the first number: "
prompt2: .asciiz "Please enter the second number: "
prompt3: .asciiz "Please enter the third number: "	
sum:  .asciiz "The sum is: "
smallest: .asciiz "\nThe smallest number is: "
largest: .asciiz "\nThe largest number is: "
exitProgram: .asciiz "\nEnter 0 to exit or enter another number to continue: "
	

.text
 main: 
   
loop:
    # Read first number
    la $a0, prompt1
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    
    # Read second number
    la $a0, prompt2
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
    
    # Read third number
    la $a0, prompt3
    li $v0, 4
    syscall
    li $v0, 5
    syscall 
    move $t2, $v0
    
add: # Adding the 3 numbers
    add $t4, $t0, $t1
    add $t4, $t4, $t2
    
    # Print the sum
    la $a0, sum
    li $v0, 4
    syscall
    move $a0, $t4
    li $v0, 1
    syscall
    
max: # Calculates the max of the 3 numbers
    sub $t3, $t0, $t1
    bltz $t3, secondMax
    sub $t3, $t0, $t2
    bltz $t3, thirdMax
    move $t3, $t0
    j printMax
    
    secondMax:
    	sub $t3, $t1, $t2
    	bltz $t3, thirdMax
    	move $t3, $t1
    	j printMax
    	
    thirdMax:
    	move $t3, $t2
    
    printMax:
    	la $a0, largest
    	li $v0, 4
    	syscall
    	move $a0, $t3
    	li $v0, 1
    	syscall
    	
min: # Calculates the min of the 3 numbers
    sub $t3, $t1, $t0
    bltz $t3, secondMin
    sub $t3, $t2, $t0
    bltz $t3, thirdMin
    move $t3, $t0
    j printMin
    
    secondMin:
    	sub $t3, $t2, $t1
    	bltz $t3, thirdMin
    	move $t3, $t1
    	j printMin
    	
    thirdMin:
    	move $t3, $t2
    	
    printMin:
    	la $a0, smallest
    	li $v0, 4
    	syscall
    	move $a0, $t3
    	li $v0, 1
    	syscall
    	
# Reads number user types whether they want to exit or continue
    la $a0, exitProgram
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    bnez $v0, loop
    
exit: # Exit program
    li $v0, 10
    syscall
    
    
    
