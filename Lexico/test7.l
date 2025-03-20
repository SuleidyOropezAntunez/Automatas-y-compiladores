%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
extern FILE *yyin;
%}
%%
[A-Z]    { printf("%c", yytext[0] + 'a' - 'A'); }
.        { printf("%s", yytext); }
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