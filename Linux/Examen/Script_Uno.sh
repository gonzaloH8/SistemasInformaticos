#!/bin/bash
# Ejercicio 1 Gonzalo San Andres Anton 1º DAW
clear

while read linea
do
    
    shell=$(echo "$linea" | cut -f 1)
    comments=$(echo "$linea" | cut -f 2)
    grupo=$(echo "$linea" | cut -f 3)
    uid=$(echo "$linea" | cut -f 4)
    pass=$(echo "$linea" | cut -f 5)
    login=$(echo "$linea" | cut -f 6)

    [ -z "$shell" ] && shell=/bin/bash
    sudo useradd -c "$comments" -s "$shell" $login -u "$uid"
    echo "$login:$pass" | sudo chpasswd
    
done < Usuarios.txt 

# Ejercicio 2
while read linea
do
     gid=$(echo "$linea" | cut -f 1)
     grupo=$(echo "$linea" | cut -f 2)
     pass=$(echo "$linea" | cut -f 3)
     sudo groupadd $grupo -g $gid
     echo "$grupo:$pass" | sudo chgasswd
done < grupos.txt