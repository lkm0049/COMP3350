# a sample file to print an integer array
.data
	A:      .word   21, 50, 63, 72, 0, 95, 11, 28, 4, 5, 16, 7  # Array A
	N: .word 12 # Array Length
    prompt1: .asciiz "print an array \n"
    prompt2: .asciiz "array length: "
    prompt3: .asciiz "array elements: "
	eol: .asciiz " \n"
     spacer: .asciiz ", "
.text
.globl main

main:
    # Initialize $s0 and $s1 for array address and length
    la   $s0, A           # $s0 contains the address of the array
    lw $s1, N #load array length N to register $s3

    # 1. show prompt information. 
    li        $v0, 4	# system call #4 - print string
    la        $a0, prompt1
    syscall
    li        $v0, 4	# system call #4 - print string
    la        $a0, prompt2
    syscall

    # print N. When we load 1 into register $v0 and invoke syscall, MARS will print the integer in $a0
    li        $v0, 1        # system call #1 - print int
    move      $a0, $s1        # $a0 = $t3
    syscall             
    
    li        $v0, 4	# system call #4 - print string
    la        $a0, eol
    syscall   
    
    li        $v0, 4	# system call #4 - print string
    la        $a0, prompt3
    syscall

    # 2. call printarray procedure
    move $t0, $s0
    move $t1, $s1
    printloop:
	lw $a0, 0($t0)	# Load value at address $t0	
	li $v0, 1
	syscall
    	li        $v0, 4	# system call #4 - print string
    	la        $a0, spacer
    	syscall
	
	addi $t0, $t0, 4	# Next element, i.e., increment offset by 4.
	addi $t1, $t1, -1	# decrement $t1
	bne $t1, $zero, printloop # check whether $t1 is equal to 0

    # 3. return 0 to end program
    li        $v0, 10        # $v0 = 10
    syscall
