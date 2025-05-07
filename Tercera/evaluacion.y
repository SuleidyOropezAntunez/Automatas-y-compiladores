%{
	#include<stdio.h>
	int yylex ();
	int yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
        return 0;
    }
%} 

%token NUM POR ;
%start statements;

%%
statements : expression EOL { printf("= %d\n", $1);}

expression : NUM	{ $$ = $1; printf("numero: %d\n", $$);}
	   | NUM POR NUM { $$ = $1 * $3; printf("MULTIPLICACION= %d\n", $$);}
	  
;
%%

int main () {
yyparse();
}
