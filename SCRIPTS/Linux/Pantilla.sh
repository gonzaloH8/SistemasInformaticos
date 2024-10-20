#!/bin/bash
# rsyslog templates -- plantillas visitar la pagina
# crear plantillas rsyslog almacene el mensaje que manda el script 
# y añada la direccion IP donde se manda el mensaje y el nombre del equipo
# Buscar rsyslog templates

# COPIAR EN EL FICHERO RSYSLOG ETC/RSYSLOG.D/50-DEFAULT.CONF
# template(name="customFormat" type="string" string="%TIMESTAMP% %hostname%: %msg%\n")

clear

    while true
    do
        IP_LOCAL=$(hostname -I | awk '{print $1}') # GENERAR LA IP
        logger -t miscript.sh "IP: $IP_LOCAL - Este es un mensaje desde el script"
        sleep 1m
    done
