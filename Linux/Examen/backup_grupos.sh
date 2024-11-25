#!/bin/bash
# Ejercicio 3 Gonzalo San Andres Anton 1º DAW
clear

while read linea
do
    uid=$(echo "$linea" | cut -f 4)
    grupo=$(echo "$linea" | cut -f 2)
    if [ $uid -gt 7000 && $uid -lt 7999 && $grupo -eq "profesores"]
    then
        tar -cvzf /home/Documentos    
    fi


done < 