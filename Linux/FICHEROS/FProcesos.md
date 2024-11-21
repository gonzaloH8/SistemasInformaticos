# ENLACES

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
 hilos -- ({hilo}), 2* ([hilo repetido])
 
# COMANDOS PARA VER O LISTAR LOS PROCESOS ACTIVOS
    CTRL + Z permite pausar 
    nombre_aplicacion -- ejecuta la aplicacion, pero se cierra al quitar la terminal
    nombre_aplicacion & -- ejecuta la aplicacion en segundo plano
    nohup nombre_aplicacion & -- version mas corta
    bg %numero_id_comando_background -- permite ejecutar la aplicacion en 2º plano
    jobs -- permite ver las aplicaciones en 2º plano
    fg %1 -- vuelve la aplicacion al 1º plano
    top -- permite ver los procesos en tiempo real
    trap comando_ejecutar nombre_señal -----> permite ejecutar un comando/s cuando se produce una determinada señal
  
    app firefox: /usr/bin ---> firefox 7.7KB --> BCP-firefox
  
    pidof nombre_app -- te muestra los PID de los threads del BCP de esa aplicacion
    sudo pidof nombreDelProceso -- permite conocer el PID del proceso indicado 
    sudo pstree -- ves toda la informacion de los procesos y subprocesos en forma de arbol

    Opciones de selecion de procesos:
    ps --help all | less -- te muestra toda la ayuda de procesos
    ps -p pid -- informacion del proceso con ese pid
    ps -C app -- informacion del proceso con ese nombre
    ps -u Usuario -- informacion de TODOS LOS PROCESOS que ha lanzado ese usuario
    ps -g grupo -- informacion de TODOS LOS PROCESOS que ha lanzado ese grupo
    ps -e -- te muestra procesos y subprocesos
    
    Opciones formato de informacion de salida del proceso:
    sudo ps -- te muestra una foto con todos lo procesos ejecutandose en tu sistema e informacion sobre ellos
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

     %C     pcpu     %CPU -- hilos que esta usando el proceso en la cpu
     %G     group    GROUP -- grupo al que pertenece el usuario
     %P     ppid     PPID -- 
     %U     user     USER -- usuario
     %a     args     COMMAND
     %c     comm     COMMAND
     %g     rgroup   RGROUP
     %n     nice     NI -- bondad del proceso
     %p     pid      PID -- numero del proceso
     %r     pgid     PGID
     %t     etime    ELAPSED
     %u     ruser    RUSER
     %x     time     TIME
     %y     tty      TTY
     %z     vsz      VSZ

    nice -n + 1 firefox -- lanza la aplicacion con la prioridad que tu indiques en primer plano
    renice -n valor_bondad -p pid_proceso <--- cambias el valor de la prioridad (alterando su bondad) en PROCESOS EN EJECUCION
      
    sudo top -- muestra en tiempo real los procesos en ejecucion
    sudo apt install htop -- version mejorada de top
    q - permite salir del listado de procesos 
   
    sudo kill PID-delproceso o kill -9 PID-delproceso -- permite matar le proceso indicado
    sudo killall nombreDelProceso -- puedes matar el proceso conociendo el nombre
    kill -l -- ves todos las señales de kill
    sudo kill -9 -p `pidof firefox`-- cierra la aplicacion
    sudo kill -9 -p 1 -- borra el proceso principal preguntando
    kill -s SIGTERM `pidof firefox`
    init 0 -- borra el proceso principal sin preguntar(no hacer nunca)
    
    chrt -- permite ver caracteristicas de los algoritmos de planificacion del scheduler; tambien permite cambiar procesos de un algoritmo a otro
    chrt -p num_prioridad -- muestra la prioridad de la aplicacion
    chrt -m -- ver algoritmos y sus prioridades
    chrt -f --pid 10 75 -- cambiar un proceso a SCHED_FIFO y que tenga prioridad 10, para BCP con pid del proceso 175
