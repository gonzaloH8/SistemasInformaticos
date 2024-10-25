# PRACTICA
# Nos creamos este script en /tmp <---- infinito.sh(añdir permisos de ejecucion y lanzarlo)
# Consultar en otra consola el valor de su bondad, prioridad y estado (opciones de ps: nice,pri,stat)
# Mandar señal con kill de tipo SIGUSR1 al pid del script ¿que hace el script?
# Suspender el script con CTRL + Z y mandarlo a segundo plano para que continue su ejecucion (comprobarlo con jobs)
# Aumentar su prioridad en 2 puntos con renice, volverlo a comprobar con comando ps
# Matar el script

#!/bin/bash
clear
cont=0
while true
do
trap 'echo "...señal recibida"' SIGUSR1

if [ $cont -le 10 ]
then
  echo -n "."
else
  clear
  cont=0
fi
cont=`expr $cont + 1`
sleep 1s
done

#! /bin/bash
    clear
    
    app="infinito.sh"
    echo "MENU"
    echo "1) consultar en otra consola el valor de su bondad, prioridad y estado (opciones de ps: nice,pri,stat)"
    echo "2) mandar señal con kill de tipo SIGUSR1 al pid del script ¿que hace el script? "
    echo "3) suspender el script con CTRL + Z y mandarlo a segundo plano para que continue su ejecucion (comprobarlo con jobs)"
    echo "4) aumentar su prioridad en 2 puntos con renice, volverlo a comprobar con comando ps "
    echo "5) matar el script "
    read opcion
    case $opcion in
        1)
           ps -C $app -o nice,pri,stat
        ;;

    2) 
        ps -C $app -o pid,cmd
        read -p "escribe el pid: " pid
        kill -s SIGUSR1 $pid
    ;;

    3)

    ;;

    4)
        renice -n +2 $app
        ps -C $app -o pid,pri,cmd,stat
    ;;

    5)
        ps -C $app -o pid,cmd
        read -p "Excribe la pid: " pid
        kill -s SIGTERM $pid
    ;;

    *)
        echo "Salimos del Script"
    ;;
    esac
