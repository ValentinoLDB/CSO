#!/bin/bash
#Renombrando Archivos: haga un script que renombre solo archivos de un directorio pasado
#como parametro agregandole una CADENA, contemplando las opciones:
#“-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del
#archivo
#“-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre
#del archivo
#Ejemplo:
#Si tengo los siguientes archivos: /tmp/a /tmp/b
#Al ejecutar: ./renombra /tmp/ -a EJ
#Obtendré como resultado: /tmp/aEJ /tmp/bEJ
#Y si ejecuto: ./renombra /tmp/ -b EJ
#El resultado será: /tmp/EJa /tmp/EJb

if [ $# -ne 3 ]; then
    echo "Error: se requieren exactamente 3 parametros"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Error: $1 no es un directorio"
    exit 1
fi

cd "$1"  # Cambia al directorio especificado

for file in *; do  # Itera sobre todos los archivos en el directorio
    if [ -f "$file" ]; then  # Verifica si es un archivo regular
        case "$2" in
            "-a")  # Opción para agregar al final
                mv "$file" "$file$3"  # Renombra concatenando CADENA al final
                ;;
            "-b")  # Opción para agregar al principio
                mv "$file" "$3$file"  # Renombra concatenando CADENA al principio
                ;;
            *)     # Opción inválida
                echo "Error: opcion invalida"
                exit 1
                ;;
        esac
    fi
done

exit 0



