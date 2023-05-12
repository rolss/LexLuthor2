%{
#include <stdio.h>

extern FILE *yyin;
extern int yylex();
extern int yylineno;
void yyerror(char *s);
void yyrestart(FILE *);

%}

%token NUM AND OR XOR NOT
%token MAS MENOS POR DIV PAR_IZQ PAR_DER

%left MAS MENOS
%left POR DIV
%left AND OR XOR
%right NOT

%%

expresion: operando
         | expresion MAS expresion
         | expresion MENOS expresion
         | expresion POR expresion
         | expresion DIV expresion
         | expresion AND expresion
         | expresion OR expresion
         | expresion XOR expresion
         | NOT expresion
         | PAR_IZQ expresion PAR_DER
         |
         ;

operando: NUM;

%%

void yyerror(char *s) {
    printf("Error sintáctico en la línea %d: %s\n", yylineno, s);
    yyrestart(yyin);
}
