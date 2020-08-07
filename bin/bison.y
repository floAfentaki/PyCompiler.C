%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(char *); 
int yyelex();
extern FILE *yyin;								
extern FILE *yyout;								
%}
	
	
%union {
	int ival;
	float fval;
}

%token<ival> INT
%token<fval> FLOAT	    
%left '+' '-'
%left '*' '/' 

%type<ival> expr_i
%type<fval> expr_f

%%

program: expr_i  			 { fprintf(yyout, "%i\n", $1); printf("%i\n",$1);}
	| expr_f			 { fprintf(yyout, "%f\n", $1); printf("%f\n",$1);}
	;

expr_f:  	FLOAT			{ $$ = $1; printf("%f \n",$1);}
	| expr_f '+' expr_f            { $$ = $1 + $3; printf("%f + %f\n",$1,$3); }
	| expr_f '*' expr_f            { $$ = $1 * $3; printf("%f * %f\n",$1,$3);}
	| expr_f '-' expr_f            { $$ = $1 - $3; printf("%f - %f\n",$1,$3); }
	| expr_f '/' expr_f            { $$ = $1 / $3; printf("%f / %f\n",$1,$3);}
	
	| expr_f '+' expr_i            { $$ = $1 + $3; printf("%f + %i\n",$1,$3); }
	| expr_f '*' expr_i            { $$ = $1 * $3; printf("%f * %i\n",$1,$3);}
	| expr_f '-' expr_i            { $$ = $1 - $3; printf("%f - %i\n",$1,$3); }
	| expr_f '/' expr_i            { $$ = $1 / $3; printf("%f / %i\n",$1,$3);}
	| expr_f '*''*' expr_i         { 
					  float temp=1;
					  printf("%f ** %i\n",$1,$4) ;
					  while($4!=0){
						temp=temp*$1;
						$4--;}	
					  $$=temp;
					}
	
	| expr_i '+' expr_f            { $$ = $1 + $3; printf("%i + %f\n",$1,$3); }
	| expr_i '*' expr_f            { $$ = $1 * $3; printf("%i * %f\n",$1,$3);}
	| expr_i '-' expr_f            { $$ = $1 - $3; printf("%i - %f\n",$1,$3); }
	| expr_i '/' expr_f            { $$ = $1 / $3; printf("%i / %f\n",$1,$3);}
	;
					    
expr_i: INT		       	{ $$ = $1; printf("%i \n",$1);}
	| expr_i '+' expr_i		{ $$ = $1 + $3; printf("%i + %i\n",$1,$3); }
	| expr_i '*' expr_i        	{ $$ = $1 * $3; printf("%i * %i\n",$1,$3);}
	| expr_i '-' expr_i      	{ $$ = $1 - $3; printf("%i - %i\n",$1,$3); }
	| expr_i '/' expr_i         	{ $$ = $1 / $3; printf("%i / %i\n",$1,$3);}
	
	| expr_i '*''*' expr_i         { 
					  int temp=1;
					  printf("%i ** %i\n",$1,$4) ;
					  while($4!=0){
						temp=temp*$1;
						$4--;}	
					  $$=temp;
					}
	;
								    
%%								    
    

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    exit(1);
}									


int main ( int argc, char **argv  ) 
  {
  
  yyout = fopen ( "output", "w" );		
  
  ++argv; --argc;
  if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
  else
        yyin = stdin;
        
  	
  do {
	yyparse();
	} while(!feof(yyin));   
   
  fclose(yyout);
   
  exit(0);
  }   
										
