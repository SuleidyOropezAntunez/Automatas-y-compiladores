%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9_]* { printf("Variable ACEPTADA: %s\n", yytext); }
%%

int main()
{
	printf("Ingrese nombre de variable:\n");
	yylex();
	return 0;
}