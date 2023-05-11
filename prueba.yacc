%{
#include <stdio.h>

extern int yylex();
extern int yylineno;
void yyerror(char *s);

int contador = 1;
%}

%token NUMERO

%%

expr : term
     | expr '+' term
     | expr '-' term
     ;

term : factor
     | term '*' factor
     | term '/' factor
     ;

factor : NUMERO
       | '(' expr ')'
       ;

%%

void yyerror(char *s) {
    printf("Error sintáctico en la línea %d: %s\n", yylineno, s);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s archivo_de_entrada\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        printf("No se pudo abrir el archivo %s\n", argv[1]);
        return 1;
    }

    yyin = f;
    yyparse();

    fclose(f);
    printf("El archivo no tiene errores sintácticos.\n");
    return 0;
}
