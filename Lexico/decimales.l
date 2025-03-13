%option noyywrap
%{
	#include<stdio.h>
%}

%%
[0-9]+\.[0-9]+ { printf("Numero decimal ACEPTADO: %s\n", yytext); }
%%

int main()
{
	printf("Ingrese el numero:\n");
	yylex();
	return 0;
}