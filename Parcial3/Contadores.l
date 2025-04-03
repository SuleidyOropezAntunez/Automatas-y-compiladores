%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>

	int total_lineas = 0;
	int total_palabras = 0;
	int total_caracteres = 0;
	int total_palabras_n = 0;
	int total_ni=0;
	int total_num=0;
	int total Bjo=0;

%}

%%
/n { total_lineas++; }
[ \t\r]+ { total_caracteres += yyleng; }
[a-zA-Z]+ { total_palabras++; total_caracteres += yyleng; }
[0-9]+ { total_palabras++; total_caracteres += yyleng; }
ni[a-z A-Z] {total_ni++; total_caracteres += yyleng; }
num[a-z A-Z] {total_nu++, total_palabras++
{ total_palabras_n++; total_caracteres += yyleng; }
.{ total_caracteres++; }
%%
int main(int argc, char **argv)
{
	if (argc > 1){
		FILE *archivo = fopen(argv[1], "r");
		if (!archivo) {
			perror("Error al abrir el archivo");
			return 1;
		}
		yylin = archivo;
	}

	yylex();
	fclose(yyin);

	printf("Total de lineas: %d\n", total_lineas);
	printf("Total de palabras: %d\n", total_palabras);
	printf("Total de caracteres (incluye espacios): %d\n", total_caracteres);
	printf("Total de palabras que inician con ni: %d\n", total_ni);

	return 0;
}