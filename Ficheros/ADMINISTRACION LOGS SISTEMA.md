=======================================
# Administracion de LOGS en Linux: RSYLOG
=======================================
Son imprescindibles para la admin en el funcionamiento del s.op porque vas reflejando el funcionamiento de los servicios, kernel, etc
El servicio encargado de la gestion de los LOGS:
rsyslog.service <==== para ver el estado del servicio
el servicio tiene un fichero de configuracion: /etc/rsyslog.configuracion
fichero de texto plano:
    $directiva valor
    $directiva valor
    ...

Funcionamiento del servicio rsyslog:
el fichero REGLAS de registro es muy importante en el servicio RSYSLOG porque define como se van a registrar o guardar los mensajes producidos por
servicios del sistema, kernel, usuarios,....
Las lineas del fichero de reglas se incluyen dentro del fichero de configuracion del servicio: /etc/rsyslog.conf
input-modules(origenes de eventos o mensajes) ===> rsyslog.service======> output-modules(destino de almacenamiento de mensajes)
                                                          |                              este destino (NO TIENE QUE SER SIEMPRE UN FICHERO)
                                                    fichero de reglas
Ej: cron.service(input-module)===> rsyslog.service(escuchando) =====> los manda ak fichero /var/log/cron
genera mensajes cada vez                        fichero de reglas cron.* -/var/cron
que se ejecutan tareas programadas 
o los usuarios crean sus tareas,etc  

En ubuntu las reglas se importan desde: /etc/rsyslog.d/ <===== ficheros *.conf con reglas
ficheros con reglas: ls -l /etc/rsyslog.d/ <==== 20-ufw.conf (reglas de registro para servicio firewall)
                                                 50-default.conf (reglas resto de servicios)
formato de las reglas
filtro(puede ser:)                      <=== accion(destino mensajes, puede ser)
origen_mensajes.grado_importancia_mensaje           /ruta/fichero(:nombre_plantilla)
condicion                                           @servidor_externo(:nombre_plantilla)<=opcional
                                                    @servidor_externo(:nombre_plantilla)<=opcional
                                                    nombre_usuario(:nombre_plantilla)
                                                    ^ /ruta/script
                                                    | /ruta/tuberia:ram

Ej: mirar contenido fichero /etc/rsyslog.d/50-default.conf

filtro(origen)               acciones(destinos)
kern.*				        -/var/log/kern.log <=== NO LA CUMPLE(filtra mensajes originados por kernel)
mail.*			        	-/var/log/mail.log<==== NO LA CUMPLE(filtra mensajes originados por serv.mail)
mail.err        			/var/log/mail.err
*.*;auth,authpriv.none		-/var/log/syslog<==== SI LA CUMPLE(filtra mensajes originados por cualquier servicio)
                                                                todos los mensajes originados por el servicio cron.service 
                                                                se ALMACENAN en fichero /var/log/syslog
cron.*                      /var/log/cron   <====== SI LA CUMPLE(filtra mensajes originados por cron.service)
                                                                todos los mensajes originados por cron.service 
                                                                se ALMACENAN en fichero /var/log/cron                                 
auth,authpriv.*			    /var/log/auth.log<==== no la cumple(filtro de mensajes originados serv.autentificacion)
*.emerg				        :omusrmsg:*(usuario)   <===== SOLO SE CUMPLE (si el mensaje producido por el servicio tiene la importancia de "emerg" 
                                                    y lo registra en el modulo de salida "outmsg", manda mensaje al terminal)
Importancia del mensaje
debug,
info,
notice,
warning, warn(same as warning),
err, error(same as err),
crit,
alert,
panic                                                    

Imaginamos que cron.service genera mensaje ====> rsyslog.service, consulta fichero: /etc/rsyslog.conf
                                                                                    $includeConfig /etc/rsyslog.d/*.conf            
                                                                                    En ese directorio entan dicheros de reglas, lee 50-default.conf

# COMANDOS
    

PRACTICA
vamos a generar una accion para que el servicio corn.service origine un mensaje que recoje syslog
    1) comprobar que en un fichero /etc/rsyslog.d/50-default.conf existe esta regla
            cron.*          /var/log/cron <=== crear este fichero si no existe
        si se modifica el fichero de reglas, hay que reiniciar servicio <=== OJO!!!
        sudo systemctl restart rsyslog.service                
    2) vemos las ultimas lineas del fichero log donde rsyslog manda mensajes del servicio: en una consola
            sudo tail -f /var/log/cron
    3) con tu usuario, editas fichero de tareas automaticas:
        crontab -e <====== el servicio cron.service manda mensaje a rsyslog.service para que registre accion        
                            el mensaje tendria que aparecer en la otra consola donde estas viendo el log
        añadimos tarea:
            */2 * * * * touch /tmp/prueba_log_$(date '+%Y-%m-%d--%H:%M')<=== al grabar, el servicio genera mensaje y debe aparecer en consola donde esta viendo el LOGS
        Cuando sales del la edicion del fichero <==== mensaje tambien enviado a rsyslog
        Cuando se ejecuta la tarea<====== mensaje tambien enviado a rsyslog
Como mandar mensajes personalizados a rsyslog: (muy util en scripts)
logger -p origen.importancia_mensaje -t tag_mensaje "TEXTO MENSAJE"
           |<--- origen tiene que venir de.en fichero de reglas cron, auth, authpriv, kern, null...daemon
ej
logger -p cron.info .t "[MI MENSAJE]" "... este es un mensaje propio creado con logger, deberia aparecer en log"

(ping 8.8.8.8 google)

PRACTICA --- 17-10-2024
    1º PASO) generar un script propio que mande mensaje(como si fuera un servicio) cada minuto para que rsyslog los intercepte(llamarlo miscript.sh):
        #!/bin/bash
        clear
        while true
        do
            fecha=$(date '+%Y-%m-%d__%H:%M') # poner la comilla invertida es mas eficaz que el $(.....)<=== subshell
            echo"..mandando mensaje al log a las $date..."
            logger -p daemon.info -t "[miscript.sh]" "mensaje mandado por script: miscript.sh a las $fecha..."
            sleep 1m
        done
    (cambiar permisos: chmod a+x miscript.sh)
    2º PASO) en el fichero de reglas de rsyslog: /etc/rsyslog.d/50-default.conf
                añadimos esta regla:
                    daemon.info     /tmp/miscript.log
            grabamos cambios y reiniciar el servicio¡¡¡¡:
                    sudo systemctl daemon-reload
                    sudo systemctl restart rsyslog.service
            comprobamos el estado: sudo systemctl status rsyslog.service 
    3º PASO) ejecutamos el script: ./miscript.sh
    4º PASO) comprobamos si rsyslog a recibido los mensajes del script y los ha almacenado en fichero /tmp/miscript.sh
            tail -f /tmp/miscript.log

miscript.sh ====> rsyslog.service recibe mensaje¿Donde lo almacena? ====> destino mensaje /tmp/milog
            cada        /etc/rsyslog.d/50-default.conf
            minuto          1º regla, la cumple ¿no?
            genera          2º regla, la cumple SI: daemon.info /var/log/milog
            mensaje      
        "[miscript.sh]" mensaje mandado por script: miscript.sh a las 2024-10-17__19:45  
    
Para filtrar y que solo aparezcan los mensajes de mi script en el fichero(no los mensajes de todos los servicios)
    :msg, contains, "micript.sh" /var/log/milog -- forma antigua para lo tecnicos
    if $msg contains "miscript.sh" then /var/log/milog -- forma nueva programadores

    rsyslog templates -- plantillas visitar la pagina
---------------- crear plantillas rsyslog almacene el mensaje que manda el script y añada la direccion IP donde se manda el mensaje y el nombre del equipo---
Buscar rsyslog templates
