.text
    li $a0, 5
    li $a1, 3
    mult $a0, $a1
    mfhi $a2 # 32 most significant bits of multiplication to $a2
    mflo $v0 # 32 least significant bits of multiplication to $v0

