%option noyywrap
%option yylineno
%{
	#include<stdio.h>
	FILE *yyin
	int lugares=0;
	int personajes=0;
	int casas=0;
	int Westeros=0;
	int Invernalia=0;
	int Desempbarco del Rey=0;
	int Nido de Águilas=0;
	int Altojardín=0;
	int Aguasdulces=0;
	int Rocadragón=0;
	int Roca Casterly=0;
	int Bastión de Tormentas=0;
	int Dorne=0;
%}

%%

Westeros {Westeros++}
Invernalia {Invernalia++;}
Desempbarco del Rey {Desempbarco del Rey++;}
Nido de Águilas {Nido de Águilas++;}
Altojardín {Altojardín++;}
Aguasdulces {Aguasdulces++;}
Roca dragón {Rocadragón++;}
Roca Casterly {Roca Casterly++;}
Bastión de Tormentas {Bastión de Tormentas}
Dorne {Dorne++;}
StarkArryn|Tully|Greyjoy|Lannister|Tyrell|Martell|Baratheon|Targaryen {casas++}
Eddard|Catelyn|Arya|Robert|Joffrey|Stannis|Baratheon|Aegon|Daenerys|Aerys|Tywin|Jaime|Tyrion|Cersei {personajes++}

%%
int main()
{
FILE *archivo;
char nameFile[]="jtronos.txt";
archivo= fopen(nameFile, "r");

if(!archivo){
printf("ERROR AL ABRIR EL ARCHIVO");
return 1;
}
printf("Westeros %d\n", Westeros);

	return 0;
}