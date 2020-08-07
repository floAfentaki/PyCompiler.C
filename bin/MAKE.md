## Steps to create myParser.exe (compiler)
1. Compile bison file => creates y.tab.c and y.tab.h 

	`bison -y -d bison.y`
	
1. Compile flex file => creates lex.yy.c

	`flex flex.l`
	
2. Compile both lex.yy.c, y.tab.c  => creates y.tab.o , lex.yy.o :

	`gcc -c y.tab.c lex.yy.c`
	
1. Compbine y.tab.o , lex.yy.o   => creates myParser.exe

	`gcc y.tab.o lex.yy.o -o myParser.exe`
	
1. Finally run your compiller:

	- Execution **with** *input* file :
	
  	  	`./myParser.exe input`
    
	- Execution **without** *input* file :
		
		`./myParser.exe`
    
    
