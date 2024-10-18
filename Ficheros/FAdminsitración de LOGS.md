# ADMINISTRACION LOGS SISTEMA: rsyslog
    un LOG es un fichero(por defecto, no tiene por que, pueden almacenarse en una BD) donde el sistema operativo
    va a ir registrando aspectos de su funcionamiento en tiempo real; se registran acciones como:
- inicio sesion de usuarios, cierre sesion, intento de conexion, cambio de contraseña,....
- aspectos del funcionamiento de servicios (si se modifica un servicio, si se para, si se deshabilita, si el servicio al funcionar quiere registrar su accion...)   
- aspectos del hardware (drivers dispositivos q no funcionan, deteccion de dispositivos montados,...)
    ...    
los logs en linux se gestionan mediante un servicio:   rsyslog.service 
                             (remote system logger daemon)                                                  
para ver el estado servicio:
            systemctl status rsyslog.service 
                                
# COMO FUNCIONA EL SERVICIO
    input-modules                                output-modules
    (modulos de entrada                             (modulos de registro de 
    de registros)          --------------> rsyslog.service -------------> mensajes) ficheros LOG, BD-mysql,
                       fichero de configuracion            servidor externo, ...
                       de reglas de registro:
                       
                           /etc/rsyslog.conf <==fichero conf.global
                                       lee reglas del
                                       directorio
                                       /etc/rsyslog.d/<--- nºnº nombre_fich.conf
                                                   nºnº nombre_fich.conf
                                                   ....

# ARCHIVO EN CUARENTENA
    a) como input-modules siempre por defecto van a ser otros servicios los q mandan mensajes a rsyslog para q
    los registre en los LOG; rsyslog a estos servicios los clasifica por grupos:

    - servicios globales:            grupo daemon
    - servicios de autentifcacion:   grupo auth
    - servicios de prog.tareas:     grupo cron
    - servicios de impresion:     grupo lpt
    ....
    los mensajes originados por estos grupos se almacenan en un OUTPUT-MODULE determinado en funcion del fichero
    de configuracion de reglas de rsyslog:  /etc/rsyslog.conf

    b) como output-modules son el destino donde rsyslog va a almacenar los mensajes q mandan estos servicios, por
    defecto siempre en ficheros LOG (se suelen almacenar en /var/log/
    
    rsyslog almacena los mensajes en los output-modules en funcion de TEMPLATES (plantillas); por defecto tiene 
    definida una plantilla general, pero puedes personalizarlas y usarlas
        
    como output-modules puedo usar aparte de ficheros LOG lo siguiente: (man rsyslog.conf)

            @x.y.z.w[;nombre_plantilla_personalizada] <--- mandas los mensajes al servidor con ip: x.y.w.z
                                    por TCP
            @@x.y.z.w[;nombre_plantilla_personalizada] <---mandas los mensajes al servidor con ip: x.y.w.z
                                    por UDP (mas rapida q tcp, pero menos segura)

            ^/ruta/nombre_script <------- mandas los mensajes a ese script para q los procese...
                            (los recibe como parametros)
                            
            | /ruta/comando ... <------- mandas los mensajes mediante esa tuberia a ese comando...
                    
            stop <--------------------- no se registran en ningun lado, se descartan

            :om-nombre_modulo, parametros_config_modulo <---- manda mensajes a ese modulo con esos parámetros

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
Importancia del mensaje de - a +
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
    rsyslog.service -- encargado de de la gestion de los LOGS
    /etc/rsyslog.conf -- mirar contenido
    /etc/rsyslog.conf -- fichero de configuracion de los LOGS
    /etc/rsyslog.d/ -- directorio donde se importan las reglas
        20-ufw.conf (reglas de registro para servicio firewall)
        50-default.conf (reglas resto de servicios)
    cron.service=>rsyslog.service=>/var/log/cron --

(ping 8.8.8.8 google)

