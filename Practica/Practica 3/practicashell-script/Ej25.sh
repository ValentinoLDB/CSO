#!/bin/bash

#Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema
#pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
#“-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso
#contrario, un mensaje de error.
#“-l”: Devuelve la longitud del arreglo
#“-i”: Imprime todos los elementos del arreglo en pantalla

usuarios=$(cat /etc/group | grep -w "users" | cut -d: -f4)
array=($(echo $usuarios | tr "," " "))

case $1 in
    -b)
        if [ -z $2 ]; then
            echo "Error: Debe ingresar una posición"
            exit 1
        fi
        if [ $2 -ge ${#array[@]} ]; then
            echo "Error: La posición ingresada no existe"
            exit 1
        fi
        echo ${array[$2]}
        ;;
    -l)
        echo "La longitud del arreglo es: ${#array[@]}"
        ;;
    -i)
        for i in ${array[@]}; do
            echo $i
        done
        ;;
    *)
        echo "Error: Opción no válida"
        exit 1
        ;;
esac

