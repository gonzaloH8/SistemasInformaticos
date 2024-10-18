# ADMINISTRACION LOGS SISTEMA: rsyslog(remote system logger daemon)
Un LOG es un fichero(por defecto, no tiene por que, pueden almacenarse en una BD) donde el sistema operativo, va a ir registrando aspectos de su funcionamiento en tiempo real; se registran acciones como: 
    - inicio sesion de usuarios, cierre sesion, intento de conexion, cambio de contraseña,....
    - aspectos del funcionamiento de servicios (si se modifica un servicio, si se para, si se deshabilita, si el servicio al funcionar quiere registrar su accion...)   
    - aspectos del hardware (drivers dispositivos q no funcionan, deteccion de dispositivos montados,...)
        ...    
Los logs en linux se gestionan mediante un servicio:   rsyslog.service                                                                             
Para ver el estado servicio: systemctl status rsyslog.service      
                                
# COMO FUNCIONA EL SERVICIO
    input-modules                                    output-modules
    (modulos de entrada de registros) --------------> rsyslog.service   ------------->    (modulos de registro de mensajes) ficheros LOG, BD-mysql,            
                                     fichero de configuracion          servidor externo, ...
                                       de reglas de registro:
                       
    /etc/rsyslog.conf <== fichero conf.global
    Lee reglas del directorio /etc/rsyslog.d/<--- nºnº nombre_fich.conf nºnº nombre_fich.conf ....                                                                            

# ARCHIVO EN CUARENTENA
- Como input-modules siempre por defecto van a ser otros servicios los q mandan mensajes a rsyslog para q los registre en los LOG; rsyslog a estos servicios los clasifica por grupos:
    - servicios globales:            grupo daemon
    - servicios de autentifcacion:   grupo auth
    - servicios de prog.tareas:     grupo cron
    - servicios de impresion:     grupo lpt
    ....
- Los mensajes originados por estos grupos se almacenan en un OUTPUT-MODULE determinado en funcion del fichero de configuracion de reglas de rsyslog:  /etc/rsyslog.conf
- Como output-modules son el destino donde rsyslog va a almacenar los mensajes q mandan estos servicios, por defecto siempre en ficheros LOG (se suelen almacenar en /var/log/  
- rsyslog almacena los mensajes en los output-modules en funcion de TEMPLATES (plantillas); por defecto tiene definida una plantilla general, pero puedes personalizarlas y usarlas
- Como output-modules puedo usar aparte de ficheros LOG lo siguiente: (man rsyslog.conf)
  - @x.y.z.w[;nombre_plantilla_personalizada] <--- mandas los mensajes al servidor con ip: x.y.w.z por TCP
  - @@x.y.z.w[;nombre_plantilla_personalizada] <---mandas los mensajes al servidor con ip: x.y.w.z  por UDP (mas rapida q tcp, pero menos segura)
  - ^/ruta/nombre_script <------- mandas los mensajes a ese script para q los procese... (los recibe como parametros)                      
  - | /ruta/comando ... <------- mandas los mensajes mediante esa tuberia a ese comando...              
  - stop <--------------------- no se registran en ningun lado, se descartan
  - :om-nombre_modulo, parametros_config_modulo <---- manda mensajes a ese modulo con esos parámetros                                  
            
# FICHERO CONFIGURACION RSYSLOG:  /etc/rsyslog.conf  (man rsyslog.conf)
Fichero de texto plano, se divide en 3 secciones:
- 1º Seccion se definen los im-modules y om-modules con los q va a trabajar el servicio rsyslog
- 2º Seccion (directivas globales) o parametros de funcionamiento del servicio:
    $instruccion  valor
    $instruccion  valor
    ....
- 3º Seccion reglas de registro de mensajes por parte del servicio o vienen definidas por la directiva:    
        $IncludeConfig  /ruta/directorio/ficheros.config
                        ----------------
                           |---> reglas de registro
Ejemplo:   
  $IncludeConfig /etc/rsyslog.d/*.conf
      |                | 
  directorio    ficheros donde estan reglas

# FORMATO DE LAS REGLAS DE REGISTRO
En cada linea del fichero supone una regla de registro, el servicio las procesa todas:
    
     filtro(selector)            destino om-module[;plantilla_mensaje]
     ------                        -----------------
      \---> el formato              \---> lugar donde se registran
           puede ser:                     los mensajes q cumplen el filtro con un determinado
                                          formato definido por "plantilla_mensaje"
    1º caso:
    --------  
     origen_im[, origen2_im,...].importancia_mensaje [;...] 

    REGLAS PREDETERMINADAS EN EL SISTEMA
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
    importancia_mensaje:  emerg > alert > crit > err > warn > notice > info > debug

    Ej: mirar contenido fichero /etc/rsyslog.d/50-default.conf
                                            
    Imaginamos que cron.service genera mensaje ====> rsyslog.service, consulta fichero: /etc/rsyslog.conf
                                                                                        $includeConfig /etc/rsyslog.d/*.conf            
                                                                                        En ese directorio entan dicheros de reglas, lee 50-default.conf       
    Ejemplo:
        *.* ;             auth,authpriv.none                        -/var/log/syslog
        -----            -------------------                        -----------------    
         |                       |                                se registran en este fichero LOG
         todos              salvo (.none)                         el [-] delante del fichero significa q los mensajes
         los                mensajes grupo servicios              no se registran de forma inmediata en el fichero sino
         servicios          de autentificacion                    q se almacenan temporalmente en buffer de memoria RAM
         q generan                                                y luego se volcaran mas adelante
         cualquier
         mensaje

    2º caso:
    :propiedad, [!]operador, valor
            -----------
                |
           contains = chequea si en la propiedad contiene el valor q pones
           isequal = chequea si la propiedad es exactamente igual al valor
           startswith = chequea si la propiedad comienza con el valor
           regex = chequea si la propiedad cumple con el patron indicado
    
     Ejemplo: 
      :msg, contains, "authentication failure"    /var/log/sesiones_fallidas.log
    ----------------------------------------    -------------------------------
        \--si el mensaje generado por             \--> se registra en este fichero
          algún servicio contiene
          "authentication failuer"

# DEFINICION DE PLANTILLAS DE FORMATO DE SALIDA DE MENSAJES
Para crear una plantilla, la forma mas rápida es definirla en el fichero de /etc/Rsyslog.conf y después ya usarla con el nombre que la identifica en el fichero de reglas. Para definirla, 2 formas:  
- 1º forma tradicional o LEGACY:
    $template TEMPLATE_NAME,"text %PROPERTY% more text" 
    donde:
        - $template es la directiva de plantilla que indica que el texto que la sigue define una plantilla.
        - TEMPLATE_NAME es el nombre de la plantilla. Utilice este nombre para hacer referencia a la plantilla.

Todo lo que se encuentre entre las dos comillas (“…”) es el texto de la plantilla real. Dentro de este texto, se pueden utilizar caracteres especiales, como \n para nueva línea o \r para retorno de carro. Otros caracteres, como % o ", deben ser escapados si desea utilizar esos caracteres de forma literal.
El texto especificado entre dos signos de porcentaje (%) especifica una propiedad que le permite acceder a contenidos específicos de un mensaje de syslog.(son variables predefinidas:
https://www.rsyslog.com/doc/configuration/properties.html#message-properties

Ejemplo:
Vamos a crearnos una plantilla personalizada para el registro de mensajes de demonios de autentificacion editamos el fichero /etc/rsyslog.conf:

    1º Forma
        $template miplantilla, "---mensaje demonio auth generado en: %TIMESTAMP%  desde %HOSTNAME% con contenido %msg% ---"
        usamos la plantilla en el fichero de reglas, editamos fichero:  /etc/rsyslog.d/50-default.conf
        auth,authpriv.*      /var/log/auth.log;miplantilla
    2º forma actual con objeto template():          
        template(name="__nombre_plantilla"
             type="string"
             string="....plantilla del mensaje..."
             )
                 
# COMANDOS
    rsyslog.service -- encargado de de la gestion de los LOGS
    /etc/rsyslog.conf -- mirar contenido
    /etc/rsyslog.conf -- fichero de configuracion de los LOGS
    /etc/rsyslog.d/ -- directorio donde se importan las reglas
        20-ufw.conf (reglas de registro para servicio firewall)
        50-default.conf (reglas resto de servicios)
    cron.service=>rsyslog.service=>/var/log/cron --
