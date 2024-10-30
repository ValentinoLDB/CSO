#!/bin/bash
#Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado menu, el
#cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados
#en esta práctica. Las instrucciones de como proceder deben mostrarse junto con el menú.
#El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir. Por ejemplo:
#MENU DE COMANDOS
#03. Ejercicio 3
#12. Evaluar Expresiones
#13. Probar estructuras de control
#...
#Ingrese la opción a ejecutar: 03


# Función para mostrar el menú
mostrar_menu() {
    clear
    echo "MENU DE COMANDOS"
    echo "-----------------"
    echo "03. Ejercicio 3"
    echo "12. Evaluar Expresiones"
    echo "13. Probar estructuras de control"
    echo "16. Reporte de archivos por extensión"
    echo "17. Eliminar Aa, cambiar mayúsculas por minúsculas y viceversa"
    echo "00. Salir"
    echo ""
}

# Bucle principal del menú
while true; do
    mostrar_menu
    echo "Ingrese la opción a ejecutar: "; read opcion

    case $opcion in
        03)
            echo "Ejecutando Ejercicio 3..."
            # Llama al script del ejercicio 3
            ./ejercicio3e.sh
            ;;
        12)
            echo "Ingrese la operacion a evaluar: "; read A op B
            # Llama al script de Evaluar Expresiones
            ./ejercicio12c.sh $A $op $B 
            ;;
        13)
            echo "Ingrese el nombre de un archivo: "; read arch
            # Llama al script de Probar estructuras de control
            ./ejercicio13c.sh $arch
            ;;
        16)
            echo "Ingrese la extensión de los archivos a buscar: "; read ext
            # Llama al script de Reporte de archivos por extensión
            ./ejercicio16.sh $ext
            ;;
        17)
            # Llama al script de Eliminar Aa, cambiar mayúsculas por minúsculas y viceversa
            ./ejercicio17.sh
            ;;
        00)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida, por favor intente de nuevo."
            ;;
    esac

    echo "Presione Enter para continuar..."
    read
done
