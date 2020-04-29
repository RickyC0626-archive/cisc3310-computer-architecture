##### BIT COUNTER #####
# Count how many bits are zero in a 32-bit word.
# Suppose the word is stored in register $t0.

# Output:
# There are 24 bits that are zero in the word 3310
# -- program is finished running (dropped off bottom) --


##### PROGRAM START #####

# Variable declarations succeed .data
.data
# A 32-bit word is an INTEGER that consist of 4 bytes
# 3310 in binary is 00000000 00000000 00001100 11101110
# There are 24 bits that are zero in the word '3310'
given_word: .word 3310
# Counter for number of bits that are zero
# The counter will increment by 1 every time the loop
# finds a zero in the given word
counter: .word 0
# Contains the values that occur both in the given word AND the bit finder
# If bit == 0, then counter will increment 1 because a 0 has been found
# Otherwise, the counter will not increment since a 1 has been found
bit: .word 0
# The bit finder starts at 2^0, and shifts left by 1 every iteration of the loop
# It will be used to compare each bit in the given word to determine if a 0 or 1
# has been found
bit_finder: .word 1

# Instructions succeed .text
.text
# Registers we can use:
# $t0 - $t9 Temporary storage
# $s0 - $s7 Saved values
# $a0 - $a3 Passing arguments
# $v0 - $v1 Return values to caller function

# $t0 --> given_word
# $t1 --> counter
# $t2 --> bit
# $t3 --> bit_finder
# $t9 --> loop counter
lw      $t0, given_word     # Load word value from given_word into $t0
lw		$t1, counter		# Load word value from counter into $t1
lw		$t2, bit			# Load word value from bit into $t2
lw		$t3, bit_finder		# Load word value from bit_finder into $t3
			
# Loop through each bit of the given word and determine which ones are zero
			li	 $t9, 0 		# Our loop starts from 0
loop: 		bgt  $t9, 31, print	# Keep iterating if $t9 < 32 or $t9 <= 31
	  		and  $t2, $t0, $t3	# bit = given_word & bit_finder
	  		jal  check_bit		# Jump and link to check_bit
	  		sll  $t3, $t3, 1	# Shift left bit_finder 1 time
	  		addi $t9, $t9, 1	# Increment loop counter by 1
	  		j    loop			# Jump back to beginning of loop
# Check if bit == 0
check_bit:	bnez	$t2, return			# If bit != 0, return
			addi	$t1, $t1, 1			# Otherwise increment counter by 1
			jr		$ra
	return: jr		$ra					# Return to the loop

##### Routine to print out the result #####

	        .data
toPrint1:   .asciiz "There are "
toPrint2:	.asciiz " bits that are zero in the word "

            .text
# Print Integer service is 1
# Print String service is 4
# $a0 --> printing
print:		li		$v0, 4			# Specify Print String service
			la		$a0, toPrint1	# Load address of toPrint1 string for syscall
			syscall
			li		$v0, 1			# Specify Print Integer service
			la		$a0, ($t1)		# Load counter number for syscall
			syscall
			li		$v0, 4			# Specify Print String service
			la		$a0, toPrint2	# Load address of toPrint2 string for syscall
			syscall
			li		$v0, 1			# Specify Print Integer service
			la 		$a0, ($t0)		# Load given_word number for syscall
			syscall