#!/bin/bash

# Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación (debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta
# de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros recibidos, y solo para aquellos parámetros que se encuentren en posiciones impares (el primero, el tercero, el qverificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo
# de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o
# directorios inexistentes en el sistema.

# Verifica si no se ha pasado ningún parámetro al script
if [ $# -eq 0 ]; then
    echo "Error: Debe ingresar al menos un parámetro"
    exit 1
fi

# Inicializa la variable que contará los archivos o directorios inexistentes
inexistentes=0

# Itera sobre todos los parámetros recibidos
for ((i=0; i<$#; i++)); do
    # Verifica si el índice es impar
    if [ $((i % 2)) -ne 0 ]; then
        # Verifica si el parámetro existe
        if [ -e $1 ]; then
            # Verifica si es un archivo
            if [ -f $1 ]; then
                echo "$1 es un archivo"
            else
                echo "$1 es un directorio"
            fi
        else
            # Incrementa el contador de inexistentes si el parámetro no existe
            inexistentes=$((inexistentes + 1))
        fi
    fi
    # Desplaza los parámetros a la izquierda
    shift
done

# Imprime la cantidad de archivos o directorios inexistentes
echo "La cantidad de archivos o directorios inexistentes es: $inexistentes"