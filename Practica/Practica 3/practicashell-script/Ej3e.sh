#!/bin/bash
# Este script solicita al usuario su nombre y apellido, muestra la fecha y hora actual,
# su nombre completo y usuario, y proporciona información sobre su entorno.

# Solicita el nombre y apellido del usuario
echo "Introduzca su nombre y apellido:"
read nombre apellido

# Muestra la fecha y hora actual
echo "Fecha y hora actual:"
date

# Muestra el apellido y nombre
echo "Su apellido y nombre es: $apellido $nombre"

# Muestra el usuario actual
echo "Su usuario es: $(whoami)"

# Muestra el directorio actual
echo "Su directorio actual es: $(pwd)"

# Solicita el nombre de un directorio para mostrar su contenido
echo "Introduzca el nombre de un directorio para mostrar su contenido:"
read directorio
if [ -d "$directorio" ]; then
    echo "Contenido del directorio $directorio:"
    ls "$directorio"
else
    echo "El directorio $directorio no existe."
fi

# Muestra el espacio libre en disco
echo "Espacio libre en disco:"
df -h
