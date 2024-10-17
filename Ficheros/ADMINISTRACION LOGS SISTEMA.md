-- ------------------------------------------
--   ADMINISTRACION LOGS SISTEMA: rsyslog  --
-- ------------------------------------------
un LOG es un fichero(por defecto, no tiene por que, pueden almacenarse en una BD) donde el sistema operativo
va a ir registrando aspectos de su funcionamiento en tiempo real; se registran acciones como:

    - inicio sesion de usuarios, cierre sesion, intento de conexion, cambio de contraseña,....
    - aspectos del funcionamiento de servicios (si se modifica un servicio, si se para, si se deshabilita,
      si el servicio al funcionar quiere registrar su accion...)
    - aspectos del hardware (drivers dispositivos q no funcionan, deteccion de dispositivos montados,...)
    ...
    
los logs en linux se gestionan mediante un servicio:   rsyslog.service 
                             (remote system logger daemon)
                                                          
para ver el servicio:
            systemctl status rsyslog.service 
                                
COMO FUNCIONA EL SERVICIO
-------------------------

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

---------------------------------------------------------------------
fichero configuracion rsyslog:  /etc/rsyslog.conf  (man rsyslog.conf)
---------------------------------------------------------------------
fichero de texto plano, se divide en 3 secciones:

    -1º seccion se definen los im-modules y om-modules con los q va a 
     trabajar el servicio rsyslog

    -2º seccion (directivas globales) o parametros de funcionamiento
    del servicio:
            $instruccion  valor
            $instruccion  valor
            ....

    -3º seccion reglas de registro de mensajes por parte del servicio
      o vienen definidas por la directiva:

        $IncludeConfig  /ruta/directorio/ficheros.config
                        ----------------
                           |---> reglas de registro
    ej:
        
        $IncludeConfig /etc/rsyslog.d/*.conf
                   -------------- ------ 
                directorio    ficheros donde estan reglas


formato de las reglas de registro
---------------------------------
en cada linea del fichero supone una regla de registro, el servicio las procesa
todas:

 filtro(selector)            destino om-module[;plantilla_mensaje]
 ------                    -----------------
  \---> el formato              \---> lugar donde se registran
puede ser:                    los mensajes q cumplen el filtro con un determinado
                        formato definido por "plantilla_mensaje"
1º caso:
--------  
 origen_im[, origen2_im,...].importancia_mensaje [;...] 

origen_im: quien ha originado el mensaje, rsyslog las agrupa en
       aplicaciones o servicios de autentificacion: auth, authpriv
       aplicaciones de correo:  mail
       servicios kernel,procesos..:  kern
       tareas automaticas:         cron
       ...
importancia_mensaje: 
    emerg > alert > crit > err > warn > notice > info > debug


ej:
    *.* ; auth,authpriv.none        -/var/log/syslog
    ------------------------        -----------------    
     |           |                se registran en este fichero LOG
     todos           salvo (.none)            el [-] delante del fichero significa q los mensajes
     los            mensajes grupo servicios    no se registran de forma inmediata en el fichero sino
     servicios       de autentificacion        q se almacenan temporalmente en buffer de memoria RAM
     q generan                    y luego se volcaran mas adelante
     cualquier
     mensaje


2º caso:
--------
:propiedad, [!]operador, valor
        -----------
            |
       contains = chequea si en la propiedad contiene el valor q pones
       isequal = chequea si la propiedad es exactamente igual al valor
       startswith = chequea si la propiedad comienza con el valor
       regex = chequea si la propiedad cumple con el patron indicado


 ej: 
 
      :msg, contains, "authentication failure"    /var/log/sesiones_fallidas.log
    ----------------------------------------    -------------------------------
        \--si el mensaje generado por             \--> se registra en este fichero
          algún servicio contiene
          "authentication failuer"

definición de plantillas de formato de salida de mensajes
---------------------------------------------------------
Para crear una plantilla, la forma mas rápida es definirla en el fichero de /etc/Rsyslog.conf y después ya
usarla con el nombre que la identifica en el fichero de reglas. Para definirla, 2 formas:

1º forma tradicional o LEGACY:

    $template TEMPLATE_NAME,"text %PROPERTY% more text"
    
donde:

    - $template es la directiva de plantilla que indica que el texto que la sigue define una plantilla.
    - TEMPLATE_NAME es el nombre de la plantilla. Utilice este nombre para hacer referencia a la plantilla.

        Todo lo que se encuentre entre las dos comillas (“…”) es el texto de la plantilla real. Dentro de este texto,
     se pueden utilizar caracteres especiales, como \n para nueva línea o \r para retorno de carro. Otros caracteres, como 
    % o ", deben ser escapados si desea utilizar esos caracteres de forma literal.

    El texto especificado entre dos signos de porcentaje (%) especifica una propiedad que le permite acceder a contenidos 
    específicos de un mensaje de syslog.(son variables predefinidas: 
    https://www.rsyslog.com/doc/configuration/properties.html#message-properties

ej:
    vamos a crearnos una plantilla personalizada para el registro de mensajes de demonios de autentificacion
    editamos el fichero /etc/rsyslog.conf:
    
        $template miplantilla, "---mensaje demonio auth generado en: %TIMESTAMP%  desde %HOSTNAME% con contenido %msg% ---"

    usamos la plantilla en el fichero de reglas, editamos fichero:  /etc/rsyslog.d/50-default.conf
    
        auth,authpriv.*      /var/log/auth.log;miplantilla


2º forma actual con objeto template():          

        template(name="__nombre_plantilla"
             type="string"
             string="....plantilla del mensaje..."
             )
