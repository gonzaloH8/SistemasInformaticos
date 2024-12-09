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
- []()

