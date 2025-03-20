%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%%
(diferenciar|organizar|comparar|examinar) { printf("Verbo de analizar: %s\n", yytext); }
(bello|grande|excelente|maravilloso) { printf("Adjetivo positivo: %s\n", yytext); }
(y|o|pero|aunque) { printf("Conjuncion: %s\n", yytext); }
(en|con|sin|para) { printf("Preposicion: %s\n", yytext); }
(yo|Yo|tu|Tu|el|El|nosotros|Nosotros) { printf("Pronombre: %s\n", yytext); }
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