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
- [SYSINTERNALS](https://learn.microsoft.com/es-es/sysinternals/)
- [EXPLORADOR-DE-PROCESOS](https://learn.microsoft.com/es-es/sysinternals/downloads/process-explorer)
- [PROCESS-MONITOR](https://learn.microsoft.com/es-es/sysinternals/downloads/procmon)

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
