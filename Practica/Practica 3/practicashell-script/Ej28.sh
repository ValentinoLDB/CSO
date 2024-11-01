#!/bin/bash

#Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
#el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
#directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
#para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
#dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
#tampoco deberán ser tenidos en cuenta para la suma a informar.

# Verifica si se ha pasado un parámetro
if [ $# -ne 1 ]; then
    echo "Error: Debe ingresar el nombre de un directorio como parámetro"
    exit 1
fi

# Verifica si el directorio existe
if [ ! -d "$1" ]; then
    echo "Error: El directorio no existe"
    exit 4
fi

# Inicializa los contadores
cont=0

# Itera sobre los archivos en el directorio
for file in "$1"/*; do
    # Verifica si es un archivo regular
    if [ -f "$file" ]; then
        # Verifica si el archivo tiene permisos de lectura y escritura
        if [ -r "$file" ] && [ -w "$file" ]; then
            cont=$((cont + 1))
        fi
    fi
done

# Imprime los resultados
echo "Cantidad de archivos con permisos de lectura y escritura: $cont"

