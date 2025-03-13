%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-z]{2}[0-9]{6}@uaeh\.edu\.mx { printf("Su correo fue aceptado: %s", yytext); }
%%

int main()
{
	printf("Ingrese el correo institucional de la UAEH:");
	yylex();
	return 0;
}