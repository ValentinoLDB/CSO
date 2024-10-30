#!/bin/bash
#(b)	Modificar el script creado en el inciso anterior para que los números sean recibidos como parámetros. El script debe controlar que los dos parámetros sean enviados

if [ $# -ne 2 ]; then
	echo "Error: se requieren exactamente 2 numeros como parametros"
	exit 1 #Salir del script con un codigo de error
fi

A=$1;B=$2 #Leo parametros

C=$(expr $A + $B)
echo "$A + $B = $C"
C=$(expr $A - $B)
echo "$A - $B = $C"
C=$(expr $A \* $B)
echo "$A * $B = $C"

if [ $A -gt $B ]; then
	echo "$A > $B"
elif [ $A -lt $B ]; then
	echo "$A < $B"
else 	echo "$A = $B"
fi