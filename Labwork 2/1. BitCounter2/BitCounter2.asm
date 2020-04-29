##### BIT COUNTER #####
# Count how many bits are zero in a 32-bit word.
# Suppose the word is stored in register $t0.

# Output:
# There are 24 bits that are zero in the word 3310
# -- program is finished running (dropped off bottom) --


##### PROGRAM START #####

.data
# A 32-bit word is an INTEGER that consist of 4 bytes
# 3310 in binary is 00000000 00000000 00001100 11101110
# There are 24 bits that are zero in the word '3310'
given_word: .word 3310

.text
# Registers we can use:
# $t0 - $t9 Temporary storage
# $s0 - $s7 Saved values
# $a0 - $a3 Passing arguments
# $v0 - $v1 Return values to caller function

# $a0 --> given_word (argument 1)
# $a1 --> bit_finder (argument 2)
# $t0 --> counter
# $t1 --> bit
# $t9 --> loop counter
lw      $a0, given_word     # Load word value from given_word into $a0
li      $a1, 1              # bit_finder starts from position 1

# count_bits(int input, int position) function
count_bits: j       loop        # Jump to loop

# Loop through each bit of the given word and determine which ones are zero
# Our loop starts from 0
loop:       bgt  $t9, 31, print	# Keep iterating if $t9 < 32 or $t9 <= 31
            and  $t1, $a0, $a1  # bit = given_word & bit_finder
            jal  check_bit      # Jump and link to check_bit
            sll  $a1, $a1, 1    # Shift left bit_finder 1 time
            addi $t9, $t9, 1	# Increment loop counter by 1
	  		j    loop			# Jump back to beginning of loop

# Check if bit == 0
check_bit:  bnez $t1, return    # If bit != 0, return
            addi $t0, $t0, 1    # Otherwise increment counter by 1

# Return back to original calling function
return:     jr   $ra

##### Routine to print out the result #####

	        .data
toPrint1:   .asciiz "There are "
toPrint2:	.asciiz " bits that are zero in the word "

            .text
# Print Integer service is 1
# Print String service is 4
# $a0 --> printing
print:		la      $s0, ($a0)      # Save given_word before it gets overridden 
            li		$v0, 4			# Specify Print String service
			la		$a0, toPrint1	# Load address of toPrint1 string for syscall
			syscall
			li		$v0, 1			# Specify Print Integer service
			la		$a0, ($t0)		# Load counter number for syscall
			syscall
			li		$v0, 4			# Specify Print String service
			la		$a0, toPrint2	# Load address of toPrint2 string for syscall
			syscall
			li		$v0, 1			# Specify Print Integer service
			la 		$a0, ($s0)		# Load given_word number for syscall
			syscall