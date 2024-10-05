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
    nombre_aplicacion -- ejecuta la aplicacion, pero se cierra al quitar la terminal
    nombre_aplicacion & -- ejecuta la aplicacion en segundo plano
    nohup nombre_aplicacion & -- version mas corta
  
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
      
    sudo top -- muestra en tiempo real los procesos en ejecucion
    q - permite salir del listado de procesos
    sudo ps -- te muestra una foto con todos lo procesos ejecutandose en tu sistema e informacion sobre ellos
    
    sudo pstree -- ves toda la informacion de los procesos y subprocesos en forma de arbol
    hilos -- ({hilo}), 2* ([hilo repetido])
    sudo pidof nombreDelProceso -- permite conocer el PID del proceso indicado 
    
    sudo kill PID-delproceso  o kill -9 PID-delproceso -- permite matar le proceso indicado
    sudo killall nombreDelProceso -- puedes matar el proceso conociendo el nombre
    chrt -- permite ver caracteristicas de los algoritmos de planificacion del scheduler; tambien permite cambiar procesos de un algoritmo a otro

# PRACTICAS
ver algoritmos y sus prioridades: chrt -m
cambiar un proceso a SCHED_FIFO y que tenga prioridad 10, para BCP con pid del proceso 175: chrt -f --pid 10 75
