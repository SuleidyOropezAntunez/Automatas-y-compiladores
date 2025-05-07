%{
	#include<stdio.h>
	int yylex ();
	int yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
        return 0;
    }
%} 

%token NUMERO MULT ;
%start statements;

%%
statements : expression EOL { printf("= %d\n", $1);}

expression : NUMERO	{ $$ = $1; printf("numero: %d\n", $$);}
	   | NUMERO MULT NUMERO { $$ = $1 * $3; printf("MULTIPLICACION= %d\n", $$);}
	  
;
%%

int main () {
yyparse();
return 0;
}