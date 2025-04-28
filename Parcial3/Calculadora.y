%{
	#include<stdio.h>
	int yylex ();
	int yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
        return 0;
    }
%} 

%token NUM MAS EOL MENOS POR DIV ;
%start statements;

%%
statements : expression EOL { printf("= %d\n", $1);}

expression : NUM	{ $$ = $1; printf("numero: %d\n", $$);}
           | NUM MAS NUM { $$ = $1 + $3; printf("SUMA= %d\n", $$);}
	   | NUM MENOS NUM { $$ = $1 - $3; printf("RESTA= %d\n", $$);}
	   | NUM POR NUM { $$ = $1 * $3; printf("MULTIPLICACION= %d\n", $$);}
	   | NUM DIV NUM { $$ = $1 / $3; printf("SUMA= %d\n", $$);}
;
%%

int main () {
yyparse();
return 0;
}