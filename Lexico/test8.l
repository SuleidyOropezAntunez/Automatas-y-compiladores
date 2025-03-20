%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%%
(ejecutar|implementar|resolver|utilizar|demostrar|calcular) { printf("Verbo de aplicacion: %s\n", yytext); }
. { }
%%
int main() {
    char filename[100];
    printf("Ingrese el nombre del archivo: ");
    scanf("%s", filename);
    yyin = fopen(filename, "r");
    if (!yyin) { perror("Error abriendo archivo"); return 1; }
    yylex();
    fclose(yyin);
    return 0;
}