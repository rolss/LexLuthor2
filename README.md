# LLexLuthor2

En scripts.txt encuentran los comandos para correr todo esto. 

En entrada.txt, la entrada demo, la pueden cambiar a su gusto. Está un poco harsh y orientada a errores léxicos más que sintacticos. 

## Que funciona
La detección de errores léxicos y sintácticos funciona, en teoría. Es decir, detecta cuando hay un error léxico y cuando hay un error sintáctico

## Que no funciona
Los errores son los siguientes:
1. El análisis sintáctico se realiza aun si se detectaron errores léxicos en la linea
2. Al detectar un error sintáctico, no continúa analizando esa línea por más errores sintácticos
3. No se ha establecido un contador ni nada por el estilo, para contar los errores sintácticos. Simplemente arroja error sintáctico cuando encuentra uno, y pasa a la siguiente línea
