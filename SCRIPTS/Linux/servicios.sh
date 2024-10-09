# PRACTICA
#!/bin/bash
clear
# 1º paso pedir por teclado el nombre de un servicio
# 2º mostrar este menu
    # 1º Mostrar fichero de configuracion del servicio
    # 2º Mostrar estado del servicio
    # 3º Parar servicio
    # 4º Arrancar servicio
    # 5º Deshabilitar servicio
    # 6º Habilitar servicio
    # 7º Salir del script 

read -p "Dime el nombre del servicio a trabajar: " serv
opcion=0
# while [ $opcion -ne 7 ]
# do
    echo "1º Mostrar fichero de configuracion del servicio"
    echo "2º Mostrar estado del servicio"
    echo "3º Parar servicio"
    echo "4º Arrancar servicio"
    echo "5º Deshabilitar servicio"
    echo "6º Habilitar servicio"
    echo "7º Salir del script"

read opcion
case $opcion in
    1)
        systemctl cat $serv.service
    ;;

    2)
        systemctl status $serv.service
    ;;

    3)
        systemctl stop $serv.service
    ;;

    4)
        systemctl start $serv.service
    ;;
    5)
        sudo systemctl disable $serv.service
    ;;

    6)
        sudo systemctl enable $serv.service
    ;;

    *)
        echo "Salimos del Script"
esac
