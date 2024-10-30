#!/bin/bash
#(c)	Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*,%. Esta calculadora debe funcionar recibiendo la operación y los números como parámetros

if [ $# -ne 3 ]; then
	echo "Error: se requieren 3 parametros"
	exit 1
fi

#Leer los parametros
op=$2 #operador
A=$1 #operando A
B=$3 #operando B

case $op in
+)
	C=$(expr $A + $B)
	echo "$C"
	;;
-)
	C=$(expr $A - $B)
	echo "$C"
	;;
*)
	C=$(expr $A \* $B)
	echo "$C"
	;;
%)
	C=$(expr $A % $B)
	echo "$C"
	;;
*)
	echo "operador invalido, pone + - * % flaquito no es tan dificil"
	exit 1
	;;
esac

