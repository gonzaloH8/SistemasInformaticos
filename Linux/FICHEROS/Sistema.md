# ENLACES
<ul>
    <li><a href="https://wttr.in/:help">Documentacion Ampliado</a>  Meteorologia</li>
</ul>

# INFORMACION DEL SISTEMA
    uname -- nuestra el nombre del Kernel
    uname -o .. muestra el nombre del SO
    uname -a -- nuestra el nombre del Kernel, SO, arquitectura del sistema, host, procesador
    uname -m -- sabras si la CPU tiene soporte para virtualizacion
    
    who -- lista los usuarios conectados en el sistema en tiempo real
    who -a -- informa de la fecha y hora del ultimo arranque del sistema por parte de algun usuario
    who -H -- lista de usuarios logeados, sesiones de terminal a las que estan conectados
    whoami -- muestra por pantalla el nombre del usuario que acaba de ejecutar el comando
    
    ifconfig -- muestra las interfaces activas
    ifconfig -a -- muestra las interfaces de red disponibles en tu sistema, esten en uso o no y sus paramentro basicos
    ifconfig eth0 -- permite acotar el resultado para mostrar la informacion de una interfaz determinada

    dmicode -s system-manufacturer -- puedes ver el fabricante del PC, ya sea Asus,HP,Dell,Lenovo,etc
    dmicode -s processor-manufacturer -- muestra el nombre del fabricante de la CPU, INTEL o AMD
    dmicode -s -- listado completo de todos los posibles inputs que puede introducir como opciones

    lshw -- lista de todos los componentes de hardware detectados, fabricante, version firmware,etc
    lshw -short -- arbol con todos los dispositivos detectados y su ruta de hardware
    lshw -c video -- componentes hardaware de clase video. tarjeta, tarjeta graficas detectadas, etc
    lshw -c network -- componentes de clase netwprk. tarjetas de red ethernet y adaptador wireless

    date -- fecha actual del SO, segun el estandar CEST
    date -u -- imprime la fecha actual segun el estandar UTC

    cal -- muestra el calendario de un mes o año especificados
    cal -y 2019 -- muestra el calendario del año especificado

    curl wttr.in -- consulta la prevision meteorologica de los proximos 3 dias
    curl wttr.in/paris -- consulta la prevision de una zona en concreto

# HASH
    sha512sum -- crea un hash de una longitud de 128 caracteres
    echo $RANDOM | sha512sum | head -c 8
