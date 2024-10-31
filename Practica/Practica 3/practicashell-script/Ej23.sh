#!/bin/bash
#Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla
#sólo los números pares y que cuente sólo los números impares y los informe en pantalla al
#finalizar el recorrido

array=(1 2 3 4 5 6 7 8 9 10)

size=${#array[@]}
impares=0

for ((i=0;i<size;i++)) do
    if [ $((array[$i] % 2)) -ne 0]; then
        impares=$((impares + 1))
    else 
        echo ${array[$i]}
    fi
done

echo "La cantidad de números impares es: $impares"