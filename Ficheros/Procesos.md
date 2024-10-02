# LISTADO
  - PID(identificador)
  - Usuario Propietario
  - Nombre

# COMANDOS PARA VER O LISTAR LOS PROCESOS ACTIVOS
    PID(es un identificador)
    sudo top -- muestra en tiempo real los procesos en ejecucion
    q - permite salir del listado de procesos
    sudo ps -- te muestra una foto con todos lo procesos ejecutandose en tu sistema e informacion sobre ellos
    sudo ps -e -- te muestra procesos y subprocesos
    sudo ps -ef te muestra procesos y subprocesos con mayor informacion
    sudo pstree -- ves toda la informacion de los procesos y subprocesos en forma de arbol
    hilos -- ({hilo}), 2* ([hilo repetido])
    sudo pidof nombreDelProceso -- permite conocer el PID del proceso indicado 
    sudo kill PID-delproceso  o kill -9 PID-delproceso -- pemrite matar le proceso indicado
    sudo killall nombreDelProceso -- puedes matar el proceso conociendo el nombre
