%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z]{4}[0-9]{6}[A-Z0-9]{3}[A-Z0-9]? { printf("RFC ACEPTADO: %s", yytext); }
%%

int main(){
	printf("Ingrese RFC: \n");
	yylex();
	return 0;
}
