# SERVICIOS
<ul>
    <li><a href="https://computernewage.com/2014/08/10/como-configurar-el-firewall-ufw-en-ubuntu/">UFW</a> ampliado</li>
</ul>

    UFW: servicio que se encarga de gestionar el cortafuegos del kernel en Ubuntu
    CRON: servicio de editor de texto
    ssh: servicio
    sudo systemctl status -- nos permite ver todos los servicios cargados en tu sistema
    sudo systemctl status nombre_servicio -- nos permite conocer el estado de ufw, si esta activo en memoria o no.
    sudo systemctl star nombre_servicio -- nos permite iniciar el servicio. Tiene que estar habilitado, si no no lo reconocera
    sudo systemctl stop nombre_servicio -- nos permite detener el servicio. Deshabilitas
    sudo systemctl restart nombre_servicio -- nos permite reiniciar el servicio
    sudo systemctl is-enabled nombre_servicio -- comprueba si el servicio esta configurado para iniciarse en cada arranque o no
    sudo systemctl enable nombre_servicio -- permite habilitar un servicio
    sudo systemctl disable nombre_servicio -- permite deshabilitar un servicio
    
    sudo service --status-all -- permite ver un listado plano de todos los servicios
    sudo service --status-all | grep + -- permite ver los servicios que esten iniciados
    sudo service ufw status -- nos permite ver el estado de un servicio en concreto
    sudo service ufw start -- permite iniciar el servicio
    sudo service ufw stop -- permite detener el servicio
    sudo service ufw restart -- permite reiniciar el servicio

    sudo /ent/init.d/ufw status -- fichero de configuracion dentro del directorio init.d. Comprueba el estado del servicio
    sudo /ent/init.d/ufw start -- inicia el servicio
    sudo /ent/init.d/ufw stop -- para el servicio
    sudo /ent/init.d/ufw restart -- reinicia el servicio

# TEORIA 08-10-2024
administracion servicios linux SYSTEMD
Un servicio es una aplicacion(ejecutable) que no tiene interaccion con el usuario, suele lanzar o en el arranque del sistema o antes eventos o señales; el encargado de la gestion de los servicios es SYSTEMD
(proceso inicial del arranque)

systemd ejecuta los servicios a lanzar en paralelo(todos a la vez) en funcion de TARGETS(sonlas formas en las que el usuario quiere ejecutar el sistema operativo:
    - ejecutarlo en modo recuperacion de errores: sin entorno grafico, sin red, monousuario root
    - ejecutarlo sin entorno grafico pero multiusuario
    - ejecutarlo con entorno grafico, multiusuario y con red
    - apager el sistema: systemd va finalizando los servicios levantados de forma ordenada
    ...
)

Para ver los targets:
    systemctl list-units --type=target

En cada target tienes(ficheros de unidad):
    - servicios
    - sockets o conexiones a establecer para comunicar procesos entre si
    - paths o señales para detectar cambios en el sistema de ficheros
    ...

Para ver los fich. de unidad de un determinado tipo, p.e listar todos los servicios cargados(disponibles) en el TARGET actual(multi-user.target)
    systemctl list-units --type=service

MOSTRAR DETALLES FICH.UNIDAD DE UN SERVICIO
para ver como esta configurado un servicio
    systemctl cat nombre_servicio.service
ej: el servicio de LOGS del sistema, se llama ryslog.service
    systemctl cat rsyslog.service
estructura de fich.unidad de un servicio: esta formado por secciones [nombre_seccion]
===================================================================== y dentro de cada seccion: variable=valor
en un servicio ES OBLIGATORIO que tengan las secciones: 
    - [Unit] establece una descripcion, docmentacion, usuario que lo creo,... el servicio
    - [Service] especificas el tipo de servicio(ejecutable,variables de entorno,como reiniciar de nuevo el servicio,permisos,...)
    - [Install] se especifica las dependencias que necesita el servicio para iniciarse(p.e si necesita de otros servicios, de algun target, timers, sockets)

practica:
    mirar el contenido del fichero de unidad del servicio: cron.service
    intentar descifrar cada una de las variables que hay en cada seccion (man systemd.service)

# /lib/systemd/system/cron.service
[Unit]
Description=Regular background program processing daemon -----> muestra la descripcion breve de lo que hace el servicio
Documentation=man:cron(8) -------> donde consultar como funciona el servicio
After=remote-fs.target nss-user-lookup.target -------> unidades que tienen que estar levantados antes de ejecutar el servicio

[Service]
EnvironmentFile=-/etc/default/cron -------> fichero para poner variables de conf. de entorno del servicio
ExecStart=/usr/sbin/cron -f -P $EXTRA_OPTS -----> es el ejecutable de la apliacion. (se ejecutamos la variable, inicia la aplicacion)
# ExecReload=/bin/kill -HUP $MAINPID -- en caso de fallo no-critico del servicio, se ejecuta mandar señal SIGHUP(despertar de nuevo)
IgnoreSIGPIPE=false -----> ignora cualquier señal
KillMode=process ----> especifica que el servicio puede ser susceptible de recibir señales como un proceso
Restart=on-failure ----> en caso de que el equipo se caiga, reinicia el servicio ante fallos
RestartSec=30s ----> tiempo entre servicios
SysLogFacility=cron------> como se mandan mensajes al LOG del servicio

[Install]
WantedBy=multi-user.target -----> indica que unidades necesitan estar cargadas para el servicio

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
