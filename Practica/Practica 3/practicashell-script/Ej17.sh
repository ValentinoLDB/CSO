#!/bin/bash
#Escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se
#encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de
#eliminar la letra a (mayúscula o minúscula). Ejemplo, directorio actual:
#IsO
#pepE
#Maria
#Si ejecuto: ./ejercicio17
#Obtendré como resultado:
#iSo
#PEPe
#mRI
#Ayuda: Investigar el comando tr

for file in *; do
    if [[ -f "$file" ]]; then
    echo "$file" | tr 'a-zA-Z' 'A-Za-z' | tr -d 'aA'
    fi
done


