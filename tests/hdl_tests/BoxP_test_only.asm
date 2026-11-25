// Box.asm  - Capstone Part C
// Student: Tushant Yadav | Roll 2501730294 | K = 94
// Box: starts at row 94, 20 rows tall, 16*((94 mod 4)+1) = 48 pixels wide (3 words)
// Start address = SCREEN + 32*94 = 16384 + 3008 = 19392
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
    @19392          // SCREEN + 32*94
    D=A
    @addr
    M=D
    @20             // 20 rows
    D=A
    @rows
    M=D

(ROW)
    @3              // 3 words = 48 pixels per row
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

    @29             // move to next row: 32 - 3
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
