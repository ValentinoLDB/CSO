#!/bin/bash

#Realice un script que implemente a través de la utilización de funciones las operaciones
#básicas sobre arreglos:

#inicializar: Crea un arreglo llamado array vacío

function iniciar{
    arreglo=()
    echo "Arreglo iniciado"
}

#agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido

function agregar_elem{
    if [ $# -ne 1 ]; then
    echo "Ingrese un parametro"
    exit 1
    fi

    arreglo=(${arreglo[*] $1})
    echo "Elemento $1 agregado al arreglo"
}

#eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la
#posición recibida como parámetro. Debe validar que se reciba una posición válida

function eliminar_elem{
    if [ $# -ne 1 ]; then
    echo "Ingrese un parametro"
    exit 1
    fi

    if [$1 -ge ${#arreglo[*]} ]; then
        echo "Posicion invalida"
        exit 2
    fi

    unset arreglo[$1]
    arreglo= (${arreglo[*]})
    
    echo "Elemento $1 fue eliminado"

}

#longitud: Imprime la longitud del arreglo en pantalla

function longitud{
    echo ${#arreglo[*]}
}

#imprimir: Imprime todos los elementos del arreglo en pantalla

function imprimir{
    echo ${arreglo[*]}
}

#inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud
#<parametro1>y en todas las posiciones asigna el valor <parametro2>

function inicializar_Con_Valores{
    if [ $# -ne 2 ]; then
    echo "Ingrese dos parametros"
    exit 3
    fi

    iniciar
    for ((i=0;i<$1;i++)) do
        agregar_elem $2
    done

    echo "Arreglo inicializado con $1 veces el valor $2"
}

echo "Seleccione una opcion"

select action in iniciar agregar_elem eliminar_elem longitud imprimir inicializar_Con_Valores terminar do
case $action in
    "iniciar")
        iniciar
        ;;
    "agregar_elem")
        echo "Ingresar un elemento"
        read elemento
        agregar_elem $elemento
        ;;
    "eliminar_elem")
        echo "Indique posicion a eliminar"
        read posicion
        eliminar_elem $posicion
        ;;
    "longitud")
        echo "El arreglo tiene ${longitud} elementos"
        ;;
    "imprimir")
        echo "Arreglo: ${imprimir}"
        ;;
    "inicializar_Con_Valores")
        echo "Ingrese la cantidad"
        read cantidad
        echo "Ingrese valor"
        read valor
        inicializar_Con_Valores $cantidad $valor
        ;;
    "terminar")
        echo "Finalizando proceso"
        exit 0
        ;;
    *)
        echo "Opcion incorrecta"
        ;;
    esac
done