$$Steps to create myParser.exe (compiler)
- Compile bison file => creates y.tab.c and y.tab.h 
	bison -y -d bison.y     
- Compile flex file => creates lex.yy.c
	flex flex.l
- Compile both lex.yy.c, y.tab.c  => creates y.tab.o , lex.yy.o 
	gcc -c y.tab.c lex.yy.c
- Compbine y.tab.o , lex.yy.o   => creates myParser.exe
	gcc y.tab.o lex.yy.o -o myParser.exe
- Finally run your compiller:
	Execution **with** *input* file :
  	  	- ./myParser.exe input
    
	Execution **without** *input* file :
    	- ./myParser.exe 
    
    
