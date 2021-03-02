# C to MIPS conversion
# CSIS2810
# Jaiden Kazemini


.data



.text

main:	# int leaf_example
	add $s0, $s1, $s2 # $s0 = g + h
	add $s1, $s3, $s4 # $s1 = i + j
	sub $s0, $s0, $s1 # f = (g + h) - (i + j)
	
	j $ra # return address register returning to the point of origin(f? I'm not 100% sure how this register works)
Exit:	