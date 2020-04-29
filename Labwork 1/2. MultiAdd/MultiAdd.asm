##### MULTI ADD #####
# Using a loop, multiply two positive numbers by using repeated addition

# Output:
# 12 times 5 is: 60
# -- program is finished running (dropped off bottom) --


##### PROGRAM START #####

            .data
operand1:   .word 12
operand2:   .word 5
sum:        .word 0

.text
# Registers we can use:
# $t0 - $t9 Temporary storage
# $s0 - $s7 Saved values
# $a0 - $a3 Passing arguments
# $v0 - $v1 Return values to caller function

# $t0 --> operand1
# $t1 --> operand2
# $t2 --> sum
# $t9 --> loop counter
lw  $t0, operand1
lw  $t1, operand2
lw  $t2, sum

# Loop the number of times as operand2 and increment sum by operand1
        li   $t9, 1          # Loop starts from 1
loop:   bgt  $t9, $t1, print # Keep iterating if $t9 < operand2
        add  $t2, $t2, $t0   # Increment sum by operand1
        addi $t9, $t9, 1     # Increment loop counter by 1
        j    loop            # Jump back to beginning of loop

##### Routine to print out the result #####

            .data
toPrint1:   .asciiz " times "
toPrint2:   .asciiz " is: "

            .text
# Print Integer service is 1
# Print String service is 4
# $a0 --> printing
print:      li          $v0, 1          # Specify Print Integer service
            la	        $a0, ($t0)	# Load operand1 number for syscall
            syscall
            li          $v0, 4          # Specify Print String service
            la          $a0, toPrint1   # Load address of toPrint1 string for syscall
            syscall
            li          $v0, 1          # Specify Print Integer service
            la		$a0, ($t1)	# Load operand2 number for syscall
            syscall
            li          $v0, 4          # Specify Print String service
            la          $a0, toPrint2   # Load address of toPrint2 string for syscall
            syscall
            li          $v0, 1          # Specify Print Integer service
            la		$a0, ($t2)	# Load sum number for syscall
            syscall
