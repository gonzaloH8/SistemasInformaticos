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

===========================================
#!/bin/bash
clear

#variables para definir colores en script
COLOR_BACKROJO_LETAMARILLO='\e[1;33;31m'
COLOR_ROJO='\e[31m'
COLOR_VERDE='\e[32m'
COLOR_AMARILLO='\e[33m'
COLOR_AZUL='\e[34m'
COLOR_MORADO='\e[35m'
COLOR_CYAN='\e[36m'

COLOR_RESET='\e[0m'

echo -e "\t\t\t $COLOR_BACKROJO_LETAMARILLO ############################## $COLOR_RESET"
echo -e "\t\t\t $COLOR_BACKROJO_LETAMARILLO ##     ALTA DE USUARIOS    ### $COLOR_RESET"
echo -e "\t\t\t $COLOR_BACKROJO_LETAMARILLO ############################## $COLOR_RESET"

echo -n -e "\t\tIntroduce el $COLOR_CYAN NOMBRE $COLOR_RESET del nuevo usuario..."; read nombre
if [ -z "$nombre" ]
then
    echo -e "\t\t\t...$COLOR_ROJO el nombre de la cuenta no puede estar vacio $COLOR_RESET ..."
    exit 0
fi

echo -n -e "\t\tIntroduce la $COLOR_CYAN PASSWORD $COLOR_RESET del nuevo usuario..."; read password
if [ -z "$password" ]
then
    echo -e "\t\t\t...$COLOR_ROJO la password de la cuenta no puede estar vacio $COLOR_RESET ..."
    exit 0
fi


echo -n -e "\t\tIntroduce de nuevo la $COLOR_AMARILLO PASSWORD $COLOR_RESET ..."; read repassword
if [ -z "$repassword" ]
then
    echo -e "\t\t\t...$COLOR_ROJO la password de la cuenta no puede estar vacio $COLOR_RESET ..."
    exit 0
elif [ "$password" != "$repassword" ]
then
    echo -e "\t\t\t...$COLOR_ROJO las passwords no coinciden $COLOR_RESET ..."
    exit 0

fi



echo -n -e "\t\tIntroduce los $COLOR_CYAN COMENTARIOS $COLOR_RESET del nuevo usuario..."; read comments
echo -n -e "\t\tIntroduce la $COLOR_CYAN SHELL $COLOR_RESET del nuevo usuario..."; read shell
[ -z "$shell" ] && shell=/bin/bash

useradd -c "$comments" -s "$shell" $nombre && echo -e "\n\n\t\t $COLOR_VERDE CUENTA CREADA CORRECTAMENTE... $COLOR_RESET"
echo "$nombre:$password" | chpasswd

#.....mostramos linea en fihcero /etc/passwd....
echo -e "\n\t\t linea en fichero $COLOR_AMARILLO /etc/passwd $COLOR_RESET"
grep -e "^$nombre:x:" /etc/passwd


#!/bin/bash
read -p "Introduzca el nombre del usuario (login) " usuario
existe=0
for aux in `cat /etc/passwd | cut .f1 -d":"`
do
  if [ "aux" == "$usuario" ]
  then
      existe=1
  fi
done

if [ $existe -eq 1 ]
then
    echo "El usuario existe en el sistema"
else
  echo "El usuario no existe"
fi


