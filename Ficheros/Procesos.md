# TEORIA 03-10-2024
Un proceso es una estructura de datos que el modulo de gestion de procesos del kernel (SCHEDULER o planificador) crea para cualquier aplicacion que se quiere ejecutar en ese instante
y se llama BCP (bloque control proceso). Aqui se almacena valores necesarios para la ejecucion de esa aplicacion
  - Identificativo del proceso(PID)
  - Identificativo del padre proceso(PPID)
  - La ruta al ejecutable
  - Permisos, credenciales de acceso a recursos (usuario y grupo de acceso)
  - Zonas de memoria RAM que necesita (stact, heap)
  - Prioridad del proceso
  - Lista de THREADS(conjunto de instrucciones del ejecutable del proceso que en ese momento estan en la CPU)
  - Estado del proceso (thread en ejecucion)
  - ...
El kernel siempre genera multiprocesamiento, es decir, que el usuario/sistema puedan ejecutar varias aplicaciones a la vez,
coexistiendo todas, esto lo hace con los algoritmos de planificacion de acceso a la CPU por parte de los procesos
Algoritmos para procesos tiempo real <----- procesos de apliaciones a acabar en tiempo delimitado super urgentes: se clasifican por prioridad 1-99(max)
SCHED_FIFO(firstin-firstout)
SCHED_RR(a procesos urgentes de la misma prioridad, les asigna tiempo limitado de acceso a la cpu y lo va repartiendo)
BCP-bootchat--->BCP-controltask---->BCP-adminREMOTO

Algoritmos para procesos tiempo compartido <---- procesos "normales" sin alta prioridad, da igual cuando acaban: SHED_OTHER, SCHED_BATCH, SCHED_IDLE,
El SCHED_OTHER: es un RR para apliciones de usuario
Los procesos marginales, no requieren urgencia en ejecutarse:
  SCHED_BATCH: procesos que necesitan operaciones Input/Output(lectura/escritura dispositivas)
  SCHED_IDLE: procesos que solo acceden a cpu cuando el kernel tiene menos carga de trabajo, esta practicamente parado, sin hacer nada.

# COMANDOS PARA VER O LISTAR LOS PROCESOS ACTIVOS
    CTRL + Z permite pausar 
    nombre_aplicacion -- ejecuta la aplicacion, pero se cierra al quitar la terminal
    nombre_aplicacion & -- ejecuta la aplicacion en segundo plano
    nohup nombre_aplicacion & -- version mas corta
    bg %1 -- permite ejecutar la apliacion en 2º plano
    jobs -- permite ver las apliaciones en 2º plano
    fg %1 -- vuelve la apliacion a 1º plano
  
    app firefox: /usr/bin ---> firefox 7.7KB --> BCP-firefox
    init 0 -- borra el proceso principal sin preguntar
    sudo kill -9 -p 1 -- borra el proceso principal preguntando
    pstree -- muestra en una lista los procesos
  
    sudo kill -l -- para ver el conjuto de señales que puede mandar
    sudo kill -9 -p `pidof firefox`-- cierra la aplicacion

    pidof nombre_app -- te muestra los PID de los threads del BCP de esa aplicacion

    Opciones de selecion de procesos:
    ps --help all | less -- te muestra toda la ayuda de procesos
    ps -p pid -- informacion del proceso con ese pid
    ps -C app -- informacion del proceso con ese nombre
    ps -u Usuario -- informacion de TODOS LOS PROCESOS que ha lanzado ese usuario
    ps -g grupo -- informacion de TODOS LOS PROCESOS que ha lanzado ese grupo
    ps -e -- te muestra procesos y subprocesos
    
    Opciones formato de informacion de salida del proceso:
    ps -f -- full-format, te da esta info: PID, PPID, usuario, grupo, %cpu, tiempo de ejecucion, estado, ejecutable
    ps -ef te muestra procesos y subprocesos con mayor informacion
    ps -o opcion1,opcion2,opcion3,... -- sirve para personalizar la informacion del BCP a mostrar de cada proceso(man ps)
    ps -u profesor -o pid,ppid,%cpu,%mem,status,pri,nice,cmd -- mostraria procesos del usuario PROFESOR, y de cada proceso muestro esta info
      pid
      ppid
      %(cpu qy esta usando cada hilo)
      % RAM que esta usando
      estado del proceso
      prioridad
      bondad
      ejecutable

    nice -n + 1 firefox -- lanza la aplicacion con la prioridad que tu indiques en primer plano
    renice -n valor_bondad -p pid_proceso <--- cambias el valor de la prioridad (alterando su bondad) en PROCESOS EN EJECUCION
      
    sudo top -- muestra en tiempo real los procesos en ejecucion
    q - permite salir del listado de procesos
    sudo ps -- te muestra una foto con todos lo procesos ejecutandose en tu sistema e informacion sobre ellos
    
    sudo pstree -- ves toda la informacion de los procesos y subprocesos en forma de arbol
    hilos -- ({hilo}), 2* ([hilo repetido])
    sudo pidof nombreDelProceso -- permite conocer el PID del proceso indicado 
    
    sudo kill PID-delproceso  o kill -9 PID-delproceso -- permite matar le proceso indicado
    sudo killall nombreDelProceso -- puedes matar el proceso conociendo el nombre
    kill -l -- ves todos las señales de kill
    chrt -- permite ver caracteristicas de los algoritmos de planificacion del scheduler; tambien permite cambiar procesos de un algoritmo a otro
    chrt -p num_prioridad -- muestra la prioridad de la aplicacion

    top
    sudo apt install htop -- version mejorada de top

   
    sudp apt install tmux --consola enriquecida
    CTRL B "
    CTRL 
# PRACTICAS
ver algoritmos y sus prioridades: chrt -m
cambiar un proceso a SCHED_FIFO y que tenga prioridad 10, para BCP con pid del proceso 175: chrt -f --pid 10 75

07/10/2024
ej lanzar el navegador (p.e firefox)
abres consola, consultamos el proceso creado para firefox con el valor de su prioridad y bondad
ps -C firefox -o pid,nice,pri,cmd ---> 1992 o 19 firefox
matamos proceso:
kill -s SIGTERM `pidof firefox`
lanzamos el navegador, desde consola con otra bondad-prioridad
nice -n +1 firefox <=== para bondodes negativas exige permisos de root(via sudo)
volvemos a consultar el proceso nuevo de firefox
ps -C firefox -o pid,nice,pri,cmd ----> 2019

PARA MANDAR COMANDOS A SEGUNDO PLANO
  - pulsar 1º: CTRL + Z -----> asi pausamos el comando
  - ejecutar: bg %numero_id_comando_background
  - para listar todos los comandos en background jobs
  - para pasar a primer plano un comando fg %numero_id_comando_background

ej:
    - Lanzo navegador desde consola -----> bloqueara la consola desde donde lo lanzas
    - para poder usar la consola, mandamos a background el proceso del navegador: CTRL + z
        [2] detenido   firefox ..... <--- navegador esta congelado, pausado
    - mandamos a background el proceso que esta pausado  bg %2 <---- navegador operativo ya
    - comprobamos: jobs
    - mandamos a primer plano otra vez el anvegador: fg %2 <----- consola esta otra vez bloqueada
    - finalizamos navegador con CTRL + Z

trap comando_ejecutar nombre_señal -----> permite ejecutar un comando/s cuando se produce una determinada señal

PRACTICA
ej: nos creamos este script en /tmp <---- infinito.sh(añdir permisos de ejecucion y lanzarlo)
#!/bin/bash
clear
cont=0
while true
do
trap 'echo "...señal recibida"' SIGUSR1

if [ $cont -le 10 ]
then
  echo -n "."
else
  clear
  cont=0
fi
cont=`expr $cont + 1`
sleep 1s
done

-- consultar en otra consola el valor de su bondad, prioridad y estado (opciones de ps: nice,pri,stat)
-- mandar señal con kill de tipo SIGUSR1 al pid del script ¿que hace el script?
-- suspender el script con CTRL + Z y mandarlo a segundo plano para que continue su ejecucion (comprobarlo con jobs)
-- aumentar su prioridad en 2 puntos con renice, volverlo a comprobar con comando ps
-- matar el script


#! /bin/bash
clear

app="infinito.sh"
echo "MENU"
echo "1) consultar en otra consola el valor de su bondad, prioridad y estado (opciones de ps: nice,pri,stat)"
echo "2) mandar señal con kill de tipo SIGUSR1 al pid del script ¿que hace el script? "
echo "3) suspender el script con CTRL + Z y mandarlo a segundo plano para que continue su ejecucion (comprobarlo con jobs)"
echo "4) aumentar su prioridad en 2 puntos con renice, volverlo a comprobar con comando ps "
echo "5) matar el script "
read opcion
case $opcion in
    1)
       ps -C $app -o nice,pri,stat
    ;;

    2) 
        ps -C $app -o pid,cmd
        read -p "escribe el pid: " pid
        kill -s SIGUSR1 $pid
    ;;

    3)

    ;;

    4)
        renice -n +2 $app
        ps -C $app -o pid,pri,cmd,stat
    ;;

    5)
        ps -C $app -o pid,cmd
        read -p "Excribe la pid: " pid
        kill -s SIGTERM $pid
    ;;

    *)
        echo "Salimos del Script"
    ;;
    esac
