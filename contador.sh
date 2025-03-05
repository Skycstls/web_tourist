#!/bin/bash

archivo="contador.txt"

# Si el archivo no existe, lo crea e inicia en 0
if [ ! -f "$archivo" ]; then
    echo 0 > "$archivo"
fi

while true; do
    # Leer el último número del archivo
    numero=$(tail -n 1 "$archivo")
    # Incrementar el número
    ((numero++))
    # Escribir el número en el archivo
    echo "$numero" >> "$archivo"
    # Esperar 1 segundo
    sleep 1
done