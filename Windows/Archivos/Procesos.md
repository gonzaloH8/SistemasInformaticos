# ENLACES
- [SYSINTERNALS](https://learn.microsoft.com/es-es/sysinternals/)
- [EXPLORADOR-DE-PROCESOS](https://learn.microsoft.com/es-es/sysinternals/downloads/process-explorer)
- [PROCESS-MONITOR](https://learn.microsoft.com/es-es/sysinternals/downloads/procmon)
- [PROCESS_LEARN](https://learn.microsoft.com/en-us/windows/win32/procthread/scheduling-priorities)
  
# PROCESOS
El modulo encargado de la gestion de procesos en windows: PROCESS MANAGER(esta en comunicacion con el OBJECT MANAGER, para crear los objetos que necesita)
El PROCESS MANEGER lo forman:
- DISPATCHER(lanzador de procesos). Se encarga de recoger los hilos o threads de los procesos en estado READY que el SCHEDULER, deja disponibles y los pasa a la CPU
- SCHEDULER(planificador de procesos). Para conseguir la idea de multitarea o multiprocesamiento(ejecutar varias cosas a la vez, aunque solo exista una CPU). Organiza la ejecucion de procesos segun el algoritmo ROUND-ROBIN basado en prioridades
Cuando el usuario/kernel quiere ejecutar una aplicacion, el process manager le dice al object-manager que genere una estructura de datos(objeto) llamada
- EPROCESS(Executive Process) guarda info como: PID (num.id.process), ruta ejecutable variables entorno, working-sets(zonas de memoria RAM del proceso), prioridad, variables de entorno, token de acceso puntero a LISTA DE THREADS (al menos se crea uno por defecto, objeto ETHREAD)
EJEMPLO: quiero ejecutar el notepad.exe
- Process-manager lo hace usando dll's (Kernel.dll, kernelos.dll, user32.dll) crea object-manager
- Object-manager genera estructura de datos EPROCESS + ETHREAD: se genera un proceso asociado al notepad.exe, con un PID, con una prioridad standard, con token de acceso del usuario q ha ejecutado el notepad.exe en el THREAD se cargan las instrucciones a ejecutar del notepad(main)
- Una vez creado esta estructura, el SCHEDULER la recoge y la mete en el algoritmo de planificacion ROUND-ROBIN 
- DISPATCHER: recoge eprocess listo para ejecutarse y lo mete en la CPU
- CPU: se mantiene el t.eje si no acabase al salir, el SCHEDULER lo pone al final de la cola ROUND-ROBIN
Para ver la lista de procesos en windows: Adiministrador de Tareas (Control+shift+Esc). Se reemplaza por la herramienta de SysInternals: Process-Monitor

# PRIORODADES EN PROCESOS E HILOS
OJO!!! en windows la prioridad NO ES ESTATICA!!!  es dinamica, cambia en funcion de acciones del usuario, carga del sistema, etc... todos los procesos e hilos nacen con una prioridad base
En windows la prioridad base se forma a partir de dos valores:
- PRIORIDAD BASE
  - Prority-class del proceso (clase de prioridad del proceso) NORMAL_PRIORITY_CLASS(8)
  - Priority-level del thread(clase de prioridad del hilo)THREAD_PRIORITY_NORMAL(8)
  - La prioridad base asignada por defecto a un proceso y sus hilos es de 8(normal)
El rango de valores va de 0(Baja) a 31(Alta)
Los usuarios solo pueden asignar los valores del 0 al 15 de prioridad, 8 es el rango medio
Los valores del kernel es de 16 a 31, no accesibles para el usuario
Para cambiar la prioridad base (aumentarla o disminuirla), puedes o cambiar la prioridad del procesos o la de cada hilo.
Para que te aparezca la columna de prioridades: Click Derecho(columnas) + Select Columns + Process Perfornmace + Process TimeLine

# COMANDOS
 El IDE para programar en powesherll: Powershell_ise.exe --- ejecutar como administrador
 Ver --- Activar panel de Script -- Atajo Control + R


 # WINDOWS + R
     perfmon.msc -- monitoriza el rendimiento del sistema


# ESTADO DE LOS HILOS DE UN PROCESO
Un proceso cuando se crea al menos tiene un hilo(instrucciones q se van a ejecutar en la cpu) nada mas crearse el estado asignado es INIT (estado inicial)
Una vez creado el SCHEDULER lo mete en la cola ROUND-ROBIN y le asigna un tiempo de ejecucion para cuando entre a la cpu, pasa al estado DEFERED-READY. Justo antes de entrar a la cpu gracias al dispacher, pasa al estado READY, y cuando esta dentro de la CPU el estado es RUNNING
Cada estado se identifica con un numero
- INIT = 0
- DEFERED-READY = 7
- READY = 2
- FINISHED O TERMINATED = 4
- WAITING = 5 (segundo plano)
Cuando un hilo esta dentro de la CPU ejecutandose y necesita acceder a los recursos del sistema q conllevan tiempo, se le saca de forma momentanea hasta q se consiguen esos recursos, pasando el hilo a estado
STANDBY(3); cuando los tiene, el dispatcher lo duelve a meter en la CPU y pasa a estado RUNNING

# COMANDOS POWERSHELL gestion de procesos/hilos
    System.Diagnostics.Process -- Clase/Objeto de Procesos
    get-Process -- te devuelve la coleccion de objetos "proceso" q se estan ejecutando en el sistema. Cada objeto "proceso" pertenece a esta clase: System.Diagnostics.Process
    Get-Process -Name nombre_proceso -- nos da la informacion del proceso
    Get-Process -Name nombre_proceso | Get-Member -- Si quiero saber el tipo de objeto que me devuelve el comando
    Get-Process -Name nombre_proceso | Select-Object -Property * -- Para mostrar todas las propiedades del objeto
    Get-Process -Name nombre_proceso | Select-Object -Property Name, Id, BasePriority, PriorityClass -- seleccionamos las propiedades que queremos ver
    Stop-Process -- mata/para el proceso Sopt-Process/kill/spps
    Start-Process -FilePath nombre_ejecutable.exe -ArgumentList 'ruta absoluta del archivo o web' -- crear un proceso(arranca una aplicacion)
    
    System.Diagnostics.Process q se llama kill
    variable de clase del proceso[System.Diagnostics.Process]

# CAMBIAR PRIORIDAD PROCESOS/HILOS
La prioridad en procesos/hilos es una propiedad de clase en procesos:
  [System.Diagnostics.Process] ----> propiedad.PriorityClass
    Ej:
      (get-process -name powershell_ise).PriorityClass -- permite ver la prioridad del proceso
      (get-process -name powersehll_ise) | get-member -- obtienes
      System.Diagnostics.ProcessPriorityClass: -- cambio de prioridad objeto de lectura y escritura
      (Get-Process -name powershell_ise).PriorityClass = [System.Diagnostics.ProcessPriorityClass]::High -- cambio de prioridad. :: indica que estamos tratando con un array enumerado con variables const
      


# PRACTICA 
Pedir por teclado el nombre de un proceso y mostrar del mismo esta informacion:
Nombres del proceso, id, prioridad, fecha de inicio o creacion del proceso, numero de threads
¿Que tipo de dato se almacena en cada propiedad: string, float, numberm decimal? acudimos al comando get-member

clear-host
[string]$proceso = read-host -Prompt "Dime el nombre del proceso a ejecutar "
Get-Process -Name $proceso | Select-Object -Property Name, Id, BasePriority, StartTime, Threads | spps
[System.Diagnostics.Process]$nombre=Get-Process -Name $proceso
$nombre.kill()
