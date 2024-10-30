#!/bin/bash
#Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) (la cantidad
#de elementos del arreglo puede variar). Implemente la función productoria dentro de este
#script, cuya tarea sea multiplicar todos los números del arreglo

num=(10 3 5 7 9 3 5 4)

#obtener tamaño del arreglo
size=${#num[@]}

productoria() {
    local prod=1
    for ((i=0; i<size; i++)); do
        prod=$((prod * num[$i]))
    done
    echo "La productoria de los elementos del arreglo es: $prod"
}

productoria

exit 0