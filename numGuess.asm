# Assignment 4 - Number to Guess
# Jaiden Kazemini
# CSIS2810

.data
numToGuess: .word 12 # Number hard coded, change in code to reflect in program
lowGuess: .asciiz "too low"
highGuess: .asciiz "too high"
goodGuess: .asciiz "good guess"
winMsg: .asciiz "\nCongratulations! You guessed correctly within 5 guesses."
loseMsg: .asciiz "\nyou had your five guesses"
prompt: .asciiz "\nenter a number: "

.text
li $s0, 1

main:
bgt $s0, 5, lose

li $v0, 4
la $a0, prompt
syscall

# Read number
li $v0, 5
syscall
move $t1, $v0

# Setup parameter and call procedure
move $a0, $t1
jal checkGuess

beq $v0, 1, win # Checks return value, if 1, then guess is correct
add $s0, $s0, 1 # Increment counter
j main

win:
li $v0, 4
la $a0, winMsg
syscall
b exit

lose:
li $v0, 4
la $a0, loseMsg
syscall

 
exit: # Exit program
li $v0, 10
syscall


# Procedure to check the users guess and print message. 
# Return 1 if good guess and 0 for too high/too low guess

checkGuess:
lw $t0, numToGuess
beq $t0, $a0, equal
bgt $a0, $t0, higher

li $v0, 4
la $a0, lowGuess
syscall
li $v0, 0
jr $ra

higher:
li $v0, 4
la $a0, highGuess
syscall
li $v0, 0
jr $ra

equal:
li $v0, 4
la $a0, goodGuess
syscall
li $v0, 1
jr $ra
