#!/bin/bash
#script que sume las posiciones de dos vectores de igual tamaño

vector1=(10 3 5 7 9 3 5 4)
vector2=(1 2 3 4 5 6 7 8)

size=${#vector1[@]}

for ((i=0;i<size;i++)) do
    echo "La suma de los elementos de la posicion $i de los vectores es $((${vector1[$i]} + ${vector2[$i]}))"
done