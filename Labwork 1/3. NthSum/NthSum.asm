##### NTH SUM #####
# Sum the numbers 1+2+3+4...+N, where the user inputs N, and print the result

# Output:
# Enter a positive number: 5
# The summation of 5 is 15
# -- program is finished running (dropped off bottom) --

# Enter a positive number: -1
# Enter a positive number: -2
# Enter a positive number: -3
# Enter a positive number: 0
# Enter a positive number: 1
# The summation of 1 is 1
# -- program is finished running (dropped off bottom) --


##### PROGRAM START #####

            .data
sum:        .word 0
prompt:     .asciiz "Enter a positive number: "
userInput:  .space 20   # Allow 20 + 1 characters of input

.text
# Registers we can use:
# $t0 - $t9 Temporary storage
# $s0 - $s7 Saved values
# $a0 - $a3 Passing arguments
# $v0 - $v1 Return values to caller function

# $t0 --> user input
# $t1 --> sum
# $t9 --> loop counter
lw  $t1, sum

# Keep getting user input if value is <= 0
do:     li   $v0, 4          # Specify Print String service
        la   $a0, prompt     # Load address of prompt string for syscall
        syscall
        li   $v0, 5          # Specify Read Integer service
        syscall
while:  bgt  $v0, 0, exit    # Keep iterating if input <= 0
        j    do              # Jump back to do

# Copy inputted value to $t0
exit:   la   $t0, ($v0)

# Summation loop
        li   $t9, 1          # Loop starts from 1
loop:   bgt  $t9, $t0, print # Keep iterating if $t9 <= input
        add  $t1, $t1, $t9   # Increment sum by loop counter
        addi $t9, $t9, 1     # Increment loop counter by 1
        j    loop            # Jump back to beginning of loop

##### Routine to print out the result #####

            .data
toPrint1:   .asciiz "The summation of "
toPrint2:   .asciiz " is "

            .text
# Print Integer service is 1
# Print String service is 4
# $a0 --> printing
print:      li      $v0, 4          # Specify Print String service
            la      $a0, toPrint1   # Load address of toPrint1 string for syscall
            syscall
            li      $v0, 1          # Specify Print Integer service
            la		$a0, ($t0)		# Load user inputted number for syscall
            syscall
            li      $v0, 4          # Specify Print String service
            la      $a0, toPrint2   # Load address of toPrint2 string for syscall
            syscall
            li      $v0, 1          # Specify Print Integer service
            la		$a0, ($t1)		# Load sum number for syscall
            syscall
