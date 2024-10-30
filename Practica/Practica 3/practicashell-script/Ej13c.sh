#!/bin/bash
#Crear un script que reciba como parámetro el nombre de un archivo e informe si el
#mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En
#caso de que no exista el archivo/directorio cree un directorio con el nombre recibido
#como parámetro.

if [ $# -ne 1 ]; then
    echo "Error: se requiere exactamente 1 parametro"
    exit 1
fi

if [ -e $1 ]; then
    if [ -d $1 ]; then
        echo "$1 es un directorio"
    elif [ -f $1 ]; then
        echo "$1 es un archivo"
    else
        echo "$1 es un archivo especial"
    fi
else
    echo "$1 no existe, creando directorio..."
    mkdir $1
fi