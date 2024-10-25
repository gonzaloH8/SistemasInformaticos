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
