%option noyywrap
%option yylineno
%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<fcntl.h>
	#include<unistd.h>
	#include<string.h>
	FILE *yyin;
	int lugares=0;
	int personajes=0;
	int casas=0;
	int Westeros=0;
	int Invernalia=0;
	int DesembarcodelRey=0;
	int NidodeAguilas=0;
	int Altojardin=0;
	int Aguasdulces=0;
	int Rocadragon=0;
	int RocaCasterly=0;
	int BastiondeTormentas=0;
	int Dorne=0;
%}

%%

Westeros {Westeros++;}
Invernalia {Invernalia++;}
Desempbarco del Rey {DesembarcodelRey++;}
Nido de Águilas| Nido de Aguilas {NidodeAguilas++;}
Altojardín {Altojardin++;}
Aguasdulces {Aguasdulces++;}
Roca dragón {Rocadragon++;}
Roca Casterly {RocaCasterly++;}
Bastión de Tormentas {BastiondeTormentas++;}
Dorne {Dorne++;}

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