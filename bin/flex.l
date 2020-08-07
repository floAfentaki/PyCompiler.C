%option noyywrap

%{
#include "y.tab.h"
void yyerror(char *s);
int yyelex();
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define YY_DECL int yylex()
int control=0;
%}

%option noyywrap

digit   [0-9]
num	{digit}+
real	{num}\.{num}

%%

{num}	{ yylval.ival = atoi(yytext); return INT; }
{real}	{yylval.fval = atof(yytext); return FLOAT;}
"+"	{ return '+'; }
"*"	{ return '*'; }
"-"	{ return '-'; }
"/"	{ return '/'; }
"\n"	{ return '\n'; }
.      	;

%%
