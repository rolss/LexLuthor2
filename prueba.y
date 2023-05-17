%{
#include <stdio.h>

extern FILE *yyin;
extern int yylex();
extern int yylineno;
void yyerror(char *s);
void yyrestart(FILE* archivo);
int errorcounter=0;
extern int errorlexico;

%}

%token NUM AND OR XOR NOT
%token MAS MENOS POR DIV PAR_IZQ PAR_DER

%left MAS MENOS
%left POR DIV
%left AND OR XOR
%right NOT

%%

expresion: expresion MAS expresion
         | expresion MENOS expresion
         | expresion POR expresion
         | expresion DIV expresion
         | expresion AND expresion
         | expresion OR expresion
         | expresion XOR expresion
         | NOT expresion
         | PAR_IZQ expresion PAR_DER
         | operando
         | error
         ;

operando: NUM;

%%

void yyerror(char *s) {
    printf("Error sintáctico!\n");
    errorcounter++;
}

int main(int cont_entradas, char *entradas[]) {
    freopen("salida.txt", "w", stdout);
    // Validacion de entradas 
    if (cont_entradas < 2) {
        printf("Invalido. Asegurese de proveer un archivo de entrada");
        return 1;
    } else if (cont_entradas > 2) {
        printf("Invalido. Recuerde que solo puede haber un archivo de entrada");
        return 1;
    }

    // Abrir el archivo y validarlo
    printf("Linea 1\n");
    FILE *f = fopen(entradas[1], "r");
    if (!f) {
        printf("El siguiente archivo no se pudo abrir: %s \n", entradas[1]);
        return 1;
    } 

    // Iniciar analisis con el archivo como entrada
    yyin = f;

    yylex();
    printf("Errores: %d\n", errorlexico);
    if (errorlexico > 0) {
        printf("Analisis sintactico no se correrá en presencia de errores lexicos");
    } else {
        yyparse();
        printf("Errores sintacticos: %d", errorcounter);
    }

    // Terminar ejecucion
    fclose(f);
    return 0;
}
