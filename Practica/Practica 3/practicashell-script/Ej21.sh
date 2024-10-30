#!/bin/bash
#Realice un script que simule el comportamiento de una estructura de PILA e implemente
#las siguientes funciones aplicables sobre una estructura global definida en el script:
#push: Recibe un parámetro y lo agrega en la pila 
#pop: Saca un elemento de la pila
#length: Devuelve la longitud de la pila 
#print: Imprime todos elementos de la pila

#!/bin/bash
# Simula el comportamiento de una estructura de PILA

# Definir la pila
pila=()

# Función push
push() {
    pila+=("$1")
}

# Función pop
pop() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "La pila está vacía"
    else
        unset pila[${#pila[@]}-1]
        echo "Elemento eliminado de la pila."
    fi
}

# Función length
length() {
    echo "La longitud de la pila es: ${#pila[@]}"
}   

# Función print  
print() {
    if [ ${#pila[@]} -eq 0 ]; then
        echo "La pila está vacía."
    else
        echo "Elementos de la pila:"
        for elemento in "${pila[@]}"; do
            echo "$elemento"
        done
    fi
}

#agregar 10 elementos a la pila
for ( i=1;i<=10;i++ ); do
    pila+=("$i")
done

#sacar 3 elementos de la pila
for ( i=1;i<=3;i++ ); do
    pop
done

#imprimir la longitud actual de la pila
length

#imprimir los elementos restantes de la pila
print

# Menú
while true; do
    clear
    echo "MENU DE OPERACIONES SOBRE LA PILA"
    echo "1. Push (Agregar elemento)"
    echo "2. Pop (Eliminar último elemento)"
    echo "3. Length (Mostrar longitud de la pila)"
    echo "4. Print (Imprimir todos los elementos de la pila)"
    echo "5. Salir"
    read -p "Ingrese una opción: " opcion
    case $opcion in
        1)
            read -p "Ingrese un elemento para agregar a la pila: " elemento
            push "$elemento"
            ;;
        2)
            pop
            ;;
        3)
            length
            ;;
        4)
            print
            ;;
        5)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción inválida"
            ;;
    esac
    echo "Presione Enter para continuar..."
    read
done