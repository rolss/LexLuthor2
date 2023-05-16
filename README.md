# LexLuthor2

En scripts.txt encuentran los comandos para correr todo esto. 

En entrada.txt, la entrada demo, la pueden cambiar a su gusto. Está un poco harsh y orientada a errores léxicos más que sintacticos. 

## Que funciona
La detección de errores léxicos y sintácticos funciona. Es decir, detecta cuando hay un error léxico y cuando hay un error sintáctico
Si se detecta un error lexico, no se realizará el analisis sintactico en el resto de la linea. Sin embargo, como estan en paralelo, es posible que realice el análisis sintactico, encuentre un error sintactico, y luego uno lexico.

## Que no funciona
Los errores son los siguientes:
1. El analisis sintactico y lexico se realizan aparentemente en paralelo, y no uno tras otro por cada linea
2. Hay un error extraño donde imprime que hay un error sintactico la principio de cada linea, sin importar si hay, no hay o esta vacía.
3. El contador cuenta los errores sintacticos totales, no por linea

Otros:
1. Cuando hay un error lexico, no se está pasando como token, por lo que el analizador sintactico lo omite, lo que puede causar errores. Sin embargo, esto no es relevante puesto que el analizador sintactico nisiquiera se debe correr en presencia de un error lexico.
