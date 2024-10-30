#!/bin/bash
#16.	Realizar un script que reciba como parámetro una extensión y haga un reporte con 2 columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se debe guardar el resultado en un archivo llamado reporte.txt.

if [ $# -ne 1 ]; then
    echo "Error: se requiere exactamente 1 parámetro"
    exit 1
fi

extension=$1
reporte="reporte.txt"

> "$reporte"  # Crear o vaciar el archivo de reporte

usuario=$(whoami)  # Obtener el nombre de usuario actual

# Contar archivos con la extensión dada en el directorio personal
cantidad=$(find /home/$usuario -name "*.$extension" | wc -l)

# Escribir el resultado en el archivo de reporte
echo "$usuario $cantidad" >> "$reporte"

# Informar al usuario
echo "Reporte generado en $reporte"

