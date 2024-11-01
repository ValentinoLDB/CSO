#!/bin/bash

#Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya
#terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
#acceder a la estructura creada:

#verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se
#encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 5

#cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc

#borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archivo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el
#usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe
#validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 10

# Inicializa el arreglo
archivos_doc=()

# Agrega todos los archivos .doc del directorio /home al arreglo
for file in /home/*.doc; do
    if [ -f "$file" ]; then
        archivos_doc+=("$file")
    fi
done

# Función para ver un archivo
verArchivo() {
    local archivo=$1
    for file in "${archivos_doc[@]}"; do
        if [ "$file" == "$archivo" ]; then
            cat "$file"
            return 0
        fi
    done
    echo "Archivo no encontrado"
    return 5
}

# Función para contar la cantidad de archivos .doc
cantidadArchivos() {
    echo "Cantidad de archivos .doc: ${#archivos_doc[@]}"
}

# Función para borrar un archivo
borrarArchivo() {
    local archivo=$1
    for i in "${!archivos_doc[@]}"; do
        if [ "${archivos_doc[$i]}" == "$archivo" ]; then
            echo "¿Desea eliminar el archivo lógicamente? (Si/No)"
            read respuesta
            if [ "$respuesta" == "Si" ]; then
                unset 'archivos_doc[i]'
                echo "Archivo eliminado del arreglo"
            elif [ "$respuesta" == "No" ]; then
                rm "$archivo"
                unset 'archivos_doc[i]'
                echo "Archivo eliminado del arreglo y del sistema de archivos"
            else
                echo "Respuesta no válida"
            fi
            return 0
        fi
    done
    echo "Archivo no encontrado"
    return 10
}

# Menú interactivo
while true; do
    echo "Seleccione una opción:"
    echo "1. Ver archivo"
    echo "2. Contar archivos .doc"
    echo "3. Borrar archivo"
    echo "4. Salir"
    read -p "Opción: " opcion

    case $opcion in
        1)
            read -p "Ingrese el nombre del archivo a ver: " archivo
            verArchivo "$archivo"
            ;;
        2)
            cantidadArchivos
            ;;
        3)
            read -p "Ingrese el nombre del archivo a borrar: " archivo
            borrarArchivo "$archivo"
            ;;
        4)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida"
            ;;
    esac
done

