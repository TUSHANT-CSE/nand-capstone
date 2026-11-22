// Box.asm  - Capstone Part C
// Student: Ayush | Roll 2501730195 | K = 95
// Box: starts at row 95, 20 rows tall, 16*((95 mod 4)+1) = 64 pixels wide (4 words)
// Start address = SCREEN + 32*95 = 16384 + 3040 = 19424
// While any key is pressed the box is black; when released it is white.

(LOOP)
    @1
    D=A
    @PRESSED
    D;JNE           // key pressed -> black
    @color
    M=0             // no key -> white
    @DRAW
    0;JMP
(PRESSED)
    @color
    M=-1            // all 16 bits set = black

(DRAW)
    @19424          // SCREEN + 32*95
    D=A
    @addr
    M=D
    @20             // 20 rows
    D=A
    @rows
    M=D

(ROW)
    @4              // 4 words = 64 pixels per row
    D=A
    @cols
    M=D

(COL)
    @color
    D=M
    @addr
    A=M
    M=D             // write one word
    @addr
    M=M+1
    @cols
    M=M-1
    D=M
    @COL
    D;JGT

    @28             // move to next row: 32 - 4
    D=A
    @addr
    M=D+M
    @rows
    M=M-1
    D=M
    @ROW
    D;JGT

    @LOOP
    0;JMP
