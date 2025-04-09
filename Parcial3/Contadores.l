%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
extern FILE *yyin;

int total_lineas = 0;
int total_palabras = 0;
int total_caracteres = 0;
int total_palabras_especificas = 0;
int palabras_ni = 0;
int palabras_num = 0;
int palabras_b_to = 0;
int palabras_jo = 0;
int digitos = 0;
%}

%%

\n            { total_lineas++; total_caracteres++; }
[ \t]+       { total_caracteres += yyleng; }
[0-9]+       { digitos++; total_palabras++;total_palabras_especificas++; total_caracteres += yyleng; }
ni[a-zA-Z]*  { palabras_ni++; total_palabras++; total_palabras_especificas++; total_caracteres += yyleng; }
n[uú]m[a-zA-Z]* { palabras_num++; total_palabras++; total_palabras_especificas++; total_caracteres += yyleng; }
b[a-zA-Z]*to { palabras_b_to++; total_palabras++; total_palabras_especificas++; total_caracteres += yyleng; }
[a-zA-Z]*jo  { palabras_jo++; total_palabras++; total_palabras_especificas++; total_caracteres += yyleng; }
[a-zA-Z]+    { total_palabras++; total_caracteres += yyleng; }
.            { total_caracteres++; }

%%

int main() {
    char filename[100];
    printf("Ingrese el nombre del archivo: ");
    scanf("%s", filename);
    yyin = fopen(filename, "r");
    if (!yyin) { perror("Error abriendo archivo"); return 1; }
    yylex();
    fclose(yyin);
    
    printf("Total de lineas: %d\n", total_lineas);
    printf("Total de palabras: %d\n", total_palabras);
    printf("Total de caracteres (con espacios): %d\n", total_caracteres);
    printf("Total de palabras especificas: %d\n", total_palabras_especificas);
    printf("Palabras que empiezan con 'ni': %d\n", palabras_ni);
    printf("Palabras que empiezan con 'num': %d\n", palabras_num);
    printf("Palabras que empiezan con 'b' y terminan en 'to': %d\n", palabras_b_to);
    printf("Palabras que terminan en 'jo': %d\n", palabras_jo);
    printf("Total de digitos reconocidos: %d\n", digitos);
    
    return 0;
}
