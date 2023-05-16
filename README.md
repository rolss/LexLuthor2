# LexLuthor2

En scripts.txt encuentran los comandos para correr todo esto. 

En entrada.txt, la entrada demo, la pueden cambiar a su gusto. Está un poco harsh y orientada a errores léxicos más que sintacticos. 

## Que funciona
La detección de errores léxicos y sintácticos funciona. Es decir, detecta cuando hay un error léxico y cuando hay un error sintáctico
Además, cuenta los errores sintácticos en el programa

## Que no funciona
Los errores son los siguientes:
1. El análisis léxico y sintáctico se realizan en paralelo, y no uno antes de otro (linea por linea). Se necesita que primero se corra el lexico y en caso de no haber errores, proceder con el sintáctico. Si encuentra errores lexicos, no debe correrse el sintactico PARA ESA LINEA.
2. Hay un error extraño donde imprime que hay un error sintactico la principio de cada linea, sin importar si hay, no hay o esta vacía.
3. El contador cuenta los errores sintacticos y solo imprime el total al final del programa, en lugar de imprimirlo por cada línea

Otros:
1. Cuando hay un error lexico, no se está pasando como token, por lo que el analizador sintactico lo omite, lo que puede causar errores. Sin embargo, esto no es relevante puesto que el analizador sintactico nisiquiera se debe correr en presencia de un error lexico.
