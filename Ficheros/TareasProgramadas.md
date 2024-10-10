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
  * si esta este valor representa todos los valores para ese campo(se ejecutara de forma aleatoria entre los valores de ese campo)
tambien para indicar dos valores o mas se separan por comas
tambien pueden aparecer rangos: valorInicial-valorFinal
Rangos de incremento: valorInicial/Incremento
ejemplo:
25 8,15,23 1-31/3 1,6,7 * comando a ejecutar
Practicas
Programar tarea para que se ejecute a las 23:00, cada 15 dias siempre y cuando sea viernes, cada dos meses
Minutos/00, Horas/23, Dia_Mes/1-31/15, Mes-1-12/2, Dia_Semana 5
Programar tarea para que se ejecute cada dos horas, todos los dias, todos lo meses, solo LUNES Y VIERNES
  *-*/2-*-*-1,5
Programar tarea para que se ejecute cada 15 minutos, cada hora, todas los meses, solo de LUNES A VIERNES
*/15-*-*,*,1-5

El contenido del fichero de tareas programadas /etc/crontab

run-parts -- aplica al directorio /etc/cron.hourly la funcionalidad de ejecutar todo aquel archivo ejecutable que se encuentre en su interior
test -x ruta(pregunta si existe el fichero que le sigue y este tiene permisos de ejecucion, si es true se ejecuta)

Como usuario normal, como creo TAREAS PROGRAMADAS (ficheros crontab usuarios):
las tareas del sistema /etc/crontab, solo puede modificar /añadir/quitar tareas el roat (ver permisos)

crontab -e ejecuta nano donde podras hacer las tareas programadas
Una vez que grabes las tareas y salgas del editor, puedes listar las tareas de tu fichero
crontab -l --  te muestra el contenido del fichero de programacion de tareas

Para borrar todo el fichero de tareas programadas
crontab -i -r es para preguntarte antes de borrar, si no la -i la borra si preguntar
crontab -t -- permite ver los errores(debug)


