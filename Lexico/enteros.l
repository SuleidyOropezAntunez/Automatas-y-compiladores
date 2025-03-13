%option noyywrap
%{
	#include<stdio.h>
%}

%%
[0-9]+ { printf("Numero entero: %s\n", yytext); }
%%

int main()
{
	printf("Ingrese el numero:\n");
	yylex();
	return 0;
}