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

# HERRAMIENTAS PARA CRON
  - Crontab Guru: editor rapido y sencillo. Facilita alertas en tiempo real acerca de errores o incovenientes. Ofrece consejos y trucos para dudas.
  - Cron Job Generator: podemos crear y programar comandos para que se ejecuten a una hora determinada.
  - EasyCron: nos permite programar tareas para llamar a URL especificas en diferentes intervalos de tiempo y momentos concretos. Nos facilita un panel de usuario y programar labores de acuerdo a fecha y hora.
  - Cron Maker: aplicacion completa
  - Logs en Cron: nos da la posibilidad de almacenar en un archivo. /vat/log/syslog
