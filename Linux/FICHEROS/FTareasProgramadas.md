# ENLACES
  - [GENERADOR DE TIEMPO ](https://crontab-generator.org/)
  - [GENERADOR DE TIEMPO ](https://crontab.guru/)
  - [GENERADOR DE TIEMPO ](https://www.freeformatter.com/cron-expression-generator-quartz.html)
  - [DOCUMENTACION](https://geekland.eu/planificar-tareas-con-cron-y-anacron-en-linux/)
# TAREAS PROGRAMADAS AUTOMATICAS
(Programacion de tareas)
el servicio encargado de programacion de tareas CICLICAS (tareas que se repiten a lo largo del tiempo) se llama
  cron.service <---- servcio principal
Hay otro servicio secundario que apoya a cron.service, en el caso de que cron.service no haya ejecutado alguna tarea:
  anacron.service <----- servicio secundario
para tareas que se EJECUTAN UNA UNICA VEZ a futuro, se usa el servicio: atd.servicie
(antes venia instalado, actualmente ya no, si intentas ver el estado del servicio comprobaras que no existe, hay que instalarlo)
comprobar si estan los servicios corriendo:
  systemctl status cron.service
  systemctl status ancron.service
====> Si estos servicios estuvieran parados no podriamos programar tareas <======
Funcionamiento del servicio CRON (var/spool/crontab directorio donde se almacena todos las tareas programadas)
  cron.service ===>
    timer(temporizador): cada minuto despierta al servicio CRON para que chequee
  
  Formato ficheros de tareas programadas(crontabs)
  Son ficheros de texto plano, las lineas que comienzan con # son comentarios
  pueden tener definidas VARIABLES antes de las tareas(por si estas tareas las usan)
  cada linea del fichero despues de la def. de las variables representan una tarea, y deben de tener este formato:(!!OJO si no el servicio NO LAS EHJECUTA)[]-->opcional
  minutos: valor 0-59 representa el minuto en el cual quieres que se ejecute la tarea
  horas: valor 0-23, representa la hora en el cual quieres que se ejecute la tarea
  dia_mes: valor 1-31, representa los dias del mes en el cual que se ejecute la tarea
  mes: valor 1-12, representa el mes en el cual quieres que se ejecute la tarea
  dia_semana: 0(Domingo)-6, representa el dia_semana en el cual quieres que se ejecute la tarea
  [usuario_ejecuta_tarea]
  comando(s)_a_ejecutar
ejemplo:
25 8,15,23 1-31/3 1,6,7 * comando a ejecutar

Practicas
Programar tarea para que se ejecute a las 23:00, cada 15 dias siempre y cuando sea viernes, cada dos meses
Minutos/00, Horas/23, Dia_Mes/1-31/15, Mes-1-12/2, Dia_Semana 5
Programar tarea para que se ejecute cada dos horas, todos los dias, todos lo meses, solo LUNES Y VIERNES
  *-*/2-*-*-1,5
Programar tarea para que se ejecute cada 15 minutos, cada hora, todas los meses, solo de LUNES A VIERNES
*/15-*-*,*,1-5

Como usuario normal, como creo TAREAS PROGRAMADAS (ficheros crontab usuarios):
las tareas del sistema /etc/crontab, solo puede modificar /añadir/quitar tareas el roat (ver permisos)

17 *	* * *	root    cd / && run-parts --report /etc/cron.hourly -- si cd / && acaba bien ejecuta el siguiente comando
25 6	* * *	root	test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6	* * 7	root	test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6	1 * *	root	test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )

# COMANDOS
    Formarto: MINUTOS  -  HORAS  -  DIA_MES  -  MES  -  DIA_SEMANA
    * : Este valor representa todos los valores para ese campo(se ejecutara de forma aleatoria entre los valores de ese campo)
    , : Este valor indica que los representados son incluidos. 1,5
    - : Este valor indica que los reprentados son rangos: 1-5
    / : Rangos de incremento: valorIncial/Incremento 1/5
    run-parts -- Aplica al directorio /etc/cron.hourly la funcionalidad de ejecutar todo aquel archivo ejecutable que se encuentre en su interior
    test -x ruta(pregunta si existe el fichero que le sigue y este tiene permisos de ejecucion, si es true se ejecuta)
    El contenido del fichero de tareas programadas /etc/crontab
    crontab -e          -- Ejecuta nano donde podras hacer las tareas programadas
    crontab -l          -- Te muestra el contenido del fichero de programacion de tareas
    crontab -ir         -- Pregunta antes de borrar, si no existe -i la borra si preguntar
    crontab -r          -- Borra el fichero de programacion de tareas  
    crontab -t          -- Permite ver los errores(debug)
    crontab -u usuario  -- permite manejar los crontrab de otros usuarios
    crontab -h          -- permite generar una serie de cadenas de teto ya configuradas

# VARIABLES RESERVADAS
    @reboot: ejecuta una vez y nada mas iniciarse el equipo
    @yearly -- ejecuta una sola vez al año: 0 0 1 1 *
    @monthly -- ejecuta una vez al mes y el primer dia 0 0 1 * *
    @weekly -- todas las semanas, el primer minutos de la primera hora de la semana 0 0 * * 0
    @daily -- todos los dias a la 12 de la noche 0 0 * * *
    @midnigth -- tiene el mismo efecto que el anterior
    @hourly -- todas las horas durante su primer minuto 0 * * * *

# DENEGACION DE PERMISOS SOBRE LAS TAREAS PROGRAMADAS
    sudo nano /etc/cron.deny
    nombre_usuario -- le deniega permisos sobre cron
    all -- deniega permisos a todos los usuarios que no sean administradores
    sudo service cron restart -- reiniciamos cron para confirmar que se guardaron los cambios

# PERMISOS SOBRE LAS TAREAS PROGRAMADAS
    sudo nano /etc/cron.allow
    nombre_usuario -- le deniega permisos sobre cron
    all -- deniega permisos a todos los usuarios que no sean administradores
    sudo service cron restart -- reiniciamos cron para confirmar que se guardaron los cambios

SI UN USUARIO no aparece en ninguno de los ficheros, depende de la distrubucion linux(en ubuntu, por defecto ES PERMISIVA y si le deja programar tareas) SI UN USUARIO APARECE EN ABMOS, por politica de cron.allow directmente se le permite

# HERRAMIENTAS PARA CRON
  - Crontab Guru: editor rapido y sencillo. Facilita alertas en tiempo real acerca de errores o incovenientes. Ofrece consejos y trucos para dudas.
  - Cron Job Generator: podemos crear y programar comandos para que se ejecuten a una hora determinada.
  - EasyCron: nos permite programar tareas para llamar a URL especificas en diferentes intervalos de tiempo y momentos concretos. Nos facilita un panel de usuario y programar labores de acuerdo a fecha y hora.
  - Cron Maker: aplicacion completa
  - Logs en Cron: nos da la posibilidad de almacenar en un archivo. /vat/log/syslog

# HERRAMIENTAS PARA ANACRON
Es un servicio que surgio como respaldo del servicio CRON, se penso para ejecutar las tareas que el servicio CRON no ha podido lanzar(por caidas del sistema, fallos en el servicio CRON.SERVICE,...)
el servicio anacron: anacron.service
para ver el estado systemctl status anacron.service
anacron.service <=== se activa cada hora, el resto del tiempo esta desactivado. Solo existe un fichero, usable para todos los usuarios /etc/anacrontab
/var/spool/anacron/identificador <=== aparecera la fecha de ejecucion por ultima vez la tarea: YYYYMMDD
Para saber si toca ejecutar, consulta fichero: /var/spool/anacron/ <----cron.daily contiene la fecha actual hace la diferencia dentre fechaActual-fechaContenida = 0

    sudo nano /etc/anacrontab
    diaria: 1 o @daily
    semanal: 7 o @weekly
    mensual: 30 o @monthly
    periodica: 2

    retardo_ejecucion: numero entero = minutos
    identificador: nombre_cualquiera(identificable en los logs)
    comando: tarea a ejecutar
    
     Ejemplo: 7 10 backup.weekly /bin/bash /home/joan/scripts/backup.sh

PRACTICA
Introduce el nombre de tu usuario en el fichero /etc/cron.deny
    sudo /etc/cron.deny <== en una linea metes el nombre de tu usuario
Comprueba el contenido del fichero: cat /etc/cron.deny
Intenta programar una tarea cron con ese usuario:
  cron -e <== te abrira el editor. intenta meter una tarea, cuando la intentas almacenar no te permitira GUARDAR LOS CAMBIOS
  */2 * * * * touch /tmp/prueba_TAREA_CRON_ `date +\%Y'-'\%m'-'\%d__\%H':'\%H'`
Introduce ahora el nombre de tu usuario en fichero /etc/cron.allow
  sudo /etc/cron.allow <= en una linea metes nombre de tu usuario
Comprueba el contenido del fichero: cat /etc/cron.deny
                                    cat /etc/cron.allow
Intenta programar la tarea cron con ese usuario¿deja?
si te deja en el directorio /tmp va a crear cada 2 minutos una serie de ficheros llamados:
    prueba_TAREA_CRON

PRACTICA
#!/bin/bash
clear
# tengo que programar asi el script en crontab -e: 
# */5 15-17 * * 1,2,4 /home/gonzalo/Escritorio/Practicas/cron_tarea.sh
# se ejecuta cada 5min, de 15 a 17h los LUNES,MARTES,JUEVES(cualquier mes y todos los dias del mes, del 1 al 31)
# lo que hace es copiar el directorio "Documentos" del usuario gonzalo en /tmp
*/5 15-17 * * 1,2,4 cp -r /home/profesor/Documentos/* /tmp



