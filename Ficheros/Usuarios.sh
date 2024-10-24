#!/bin/bash
# PRACTICA
# ALTA USUARIOS
# pedir por teclado el nombre del usuario a crear: ====> comprobar q no esta vacia, si esta vacio mostrar mensaje de error y salir
# pedir la nueva contaseña del usuario ===> no puede estar en blanco
# Repetir la nueva contraseña del usuario ====> no puede estar en blanco y debe coincidir con valor de arriba
# SI COINCIDEN poner esta contraseña a la cuenta ===> usando el comando chpasswd
# Pedir los comentarios a poner a la cuenta
# pedir la shell ===> si esta vacio, se pone por defecto /bin/bash
# con esos datos, crear la cuenta comprobarlo en el fichero /etc/passwd (buscando la linea con grep)
clear

read -p "Dime el nombre de usuario a crear: " usuario
if [ -z $usuario ]
then
    echo "no has escrito el nombre de usuario"
    sudo userdel $usuario
    sleep 1s   
    exit 0
else 
    sudo useradd $usuario
fi

read -p "Dime el password de usuario a crear: " pass
if [ -z $pass ]
then
    echo -n -e "\t\t\t No puede estar vacio"
    sudo userdel $usuario
    sleep 1s
    exit 0
fi

read -p "Repite la password: " passs
if [ -z $passs ]
then
    echo "No puede estar vacio"
    sudo userdel $usuario
    sleep 1s
    exit 0
elif [ $pass -eq $passs ]
then
    echo "La password $pass coincide"
    sudo chpasswd $pass
    sleep 1s
    exit 0
fi

[ -z "$shell" ] && shell=/bin/bash
