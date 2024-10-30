#!/bin/bash
#(a)	Realizar un script que le solicite al usuario 2 números, los lea de la entrada Standard e imprima la multiplicación, suma, resta y cuál es el mayor de los números leídos.

echo "Ingrese numero A"; read A
echo "Ingrese numero B"; read B

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
