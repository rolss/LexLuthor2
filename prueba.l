%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "y.tab.h"

int contador = 1;
int cont_linea = 2;
int cont_lex = 0;
int new_line = 0;
%}

%%

[01]+ {
    printf("num%d = %s\n", contador, yytext);
    contador++;
    return NUM;
}

[+] {
    printf("op-sum = %s\n", yytext);
    return MAS;
}

[*] {
    printf("op-mul = %s\n", yytext);
    return POR;
}

[-] {
    printf("op-men = %s\n", yytext);
    return MENOS;
}

[/] {
    printf("op-div = %s\n", yytext);
    return DIV;
}

[(] {
    printf("par-a = %s\n", yytext);
    return PAR_IZQ;
}

[)] {
    printf("par-c = %s\n", yytext);
    return PAR_DER;
}

not {
    printf("op-%s = %s\n", yytext, yytext);
    return NOT;
}

and {
    printf("op-%s = %s\n", yytext, yytext);
    return AND;
}

or {
    printf("op-%s = %s\n", yytext, yytext);
    return OR;
}

xor {
    printf("op-%s = %s\n", yytext, yytext);
    return XOR;
}

[01]+[\+\-\*\/]+[2-9]+ {
    printf("Error Léxico: %s\n", yytext);
}

[2-9]+[\+\-\*\/]+[01]+ {
    printf("Error Léxico: %s\n", yytext);
}

[2-9]+[01]+[2-9]+ {
    printf("Error Léxico: %s\n", yytext);
}

[2-9]*[\+\-\*\/]+[2-9]* {
    printf("Error Léxico: %s\n", yytext);
}

[01]*[^(01)+\+\-\*\(\)\/ \n\t]+[01]* {
    printf("Error Léxico: %s\n", yytext);
}

. {

}

[\n] {
    printf("\n Linea %d\n", cont_linea);
    cont_linea++;
    new_line = 1;
}

%%

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
    printf("\n Linea 1\n");
    FILE *f = fopen(entradas[1], "r");
    if (!f) {
        printf("El siguiente archivo no se pudo abrir: %s \n", entradas[1]);
        return 1;
    }

    // Iniciar analisis con el archivo como entrada
    //yyin = f;
    
    char input_line[1024];
    int line_number = 1;

    while (fgets(input_line, sizeof(input_line), f)) {
        printf("\n Linea %d\n", line_number);

        // Realizar análisis léxico
        yy_scan_string(input_line);
        

        // Realizar análisis sintáctico
        if (yyparse()) {
            printf("Error sintactico detectado en la linea %d.\n", line_number);
        }

        line_number++;
    }
        //yylex();
        //yyparse();


    // Terminar ejecucion
    fclose(f);
    return 0;
}

int yywrap() {
    return 1;
}
