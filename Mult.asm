// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


@R0
D=M //Initializing Data register with R0 register value
@R15
M=D	//Initializing Counter(R15) to R0 value

@R2
M=0	//Initializing R2 register to zero

D=0 //Initializing Data register to zero


@15
M;JEQ //if counter equals to zero goto instruction 15

@R1
D=D+M //Adding R1 value to Data Register

@R15
M=M-1 //Decreasing counter by 1

@7
0;JMP //Goto instruction 7

@R2
M=D	 //Setting the result Register(R2) to the value of Data Register
@15
0;JMP //Goto instruction 15




