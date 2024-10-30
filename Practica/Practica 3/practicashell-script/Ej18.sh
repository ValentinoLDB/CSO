#!/bin/bash
#Crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema
#(el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
#el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

if [ $# -ne 1 ]; then
    echo "Error: se requiere exactamente 1 parametro"
    exit 1
fi

usuario=$1

while true; do
    if who | grep -w -q "$usuario"; then
        echo "Usuario $usuario logueado en el sistema"
        exit 0
    fi
    sleep 10
done