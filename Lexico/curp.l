%option noyywrap
%{
	#include<stdio.h>
%}

%%
[A-Z]{4}[0-9]{6}[HM][A-Z]{5}[A-Z0-9]{2} { printf("CURP ACEPTADO: ", yytext); }

%%

int main()
{
	printf("Ingrese CURP:\n");
	yylex();
	return 0;
}