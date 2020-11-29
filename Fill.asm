// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(BEGIN)
	//Setting Counter value to 8192
	@24575
		D=A		//Setting D to 24575
	@16384
	//Evaluating the population of the screen memory map
		D=D-A	
		D=D+1	
	@counter
		M=D
	
	//Setting currentScreenRegister to Screen Register Address
	//currentScreenRegister will consequently be the Pointer to Screen Register Map
	@SCREEN
		D=A					
	@currentScreenRegister
		M=D
	
	//Setting Data Register to Keyboard Register Value
	@KBD
		D=M
	
	@WHITEN SCREEN
		D;JEQ			//if (keyboard is not pressed) goto whitening the screen
		
	
	//EXECUTION COMMANNDS TO BLACKEN THE SCREEN
	(BLACKEN SCREEN)
		
		//Setting Address Register to Screen Register
		@currentScreenRegister	
			A=M						//Setting Address Register to First Screen Register (R16384)
			M=-1					//Setting Current Screen Register to zero(-1)
			
		@counter
			M=M-1				//Reducing Counter by 1
			D=M					//Setting Data Register to Counter Value
		
		@BEGIN
			D;JEQ				//if(counter equals 0) start program afresh
		
		@KBD
			D=M					//Setting Data Register to Keyboard Register Value
		
		@currentScreenRegister
			M=M+1					//Selecting the next Register in Screen Register Map		
		
		@BEGIN			
			D;JEQ				//if(Keyboard is not pressed) goto Begining of Program Execution
		
		@BLACKEN SCREEN
			0;JMP				//else Continue Blackening the Screen
		
		
	//EXECUTION COMMANNDS TO WHITEN THE SCREEN
	(WHITEN SCREEN)	
		
		//Setting Address Register to Screen Register
		@currentScreenRegister
			A=M						//Setting Address Register to First Screen Register (R16384)
			M=0						//Setting Screen Register to zero(0)
			
		@counter
			M=M-1				//Reducing Counter by 1
			D=M					//Setting Data Register to Counter Value
		
		@BEGIN
			D;JEQ				//if(counter equals 0) start program afresh
		@KBD
			D=M					//Setting Data Register to Keyboard Register Value
		
		@currentScreenRegister
			M=M+1					//Selecting the next Register in Screen Register Map
		
		@WHITEN SCREEN
			D;JEQ				//if(Keyboard is not pressed) continue Whitening the Screen
		
		@BEGIN
			0;JMP				//else goto Begining of Program Execution
		
	
