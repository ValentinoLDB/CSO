#!/bin/bash

# Directorio de destino
dest_dir="$HOME/bin"

# Verifica si el directorio "bin" existe, si no, lo crea
if [ ! -d "$dest_dir" ]; then
    mkdir "$dest_dir"
    echo "Directorio $dest_dir creado."
fi

# Inicializa el contador de archivos movidos
moved_count=0

# Itera sobre los archivos en el directorio actual
for file in *; do
    # Verifica si el archivo es ejecutable
    if [ -f "$file" ] && [ -x "$file" ]; then
        mv "$file" "$dest_dir"
        echo "Movido: $file"
        moved_count=$((moved_count + 1))
    fi
done

# Imprime el resultado
if [ $moved_count -eq 0 ]; then
    echo "No se ha movido ningún archivo."
else
    echo "Se han movido $moved_count archivos."
fi

