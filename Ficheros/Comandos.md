<h1>SHORTS COMANDOS</h1>
<p>

    CTRL + MAYUS + T -- abre una nueva terminal
    CTRL + MAYUS + C -- copia el contenido seleccionado
    CTRL + MAYUS + V -- pega el contenido seleccionado
</p>

<h1>INFORMACION ADICCIONAL</h1>
<p>

    ruta abosoluta: aplicas la ruta en orden /home/usuario/descargas/archivo1.txt /home/usuario/Documentos/archivo1.txt
    ruta relativa: aplica la ruta corta si estan al mismo nivel. Descargas/archivo1.txt Documentos/archivo1.txt
    En linux no contiene extensiones, son todo nombres. El sistema de archivos es mediante inodos
    gonzalo@computer:~$ -- seras un usuario estandar
    root@computer:/home/gonzalo# -- indicador root de que estas como administrador
    Terminales TTY mediante las combinaciones de teclado 'CTRL+ALT+F1' hasta 'CTRL+ALT+F7'
    EMULADORES PTS: GNOME Terminal, Konsole, Xterm, Yakuake, Guake, etc.
</p>

<h1>COMANDOS GENERICOS</h1>
<ul>
  <li><a href="http://wttr.in/:help.">CURL WTTR.IN</a> mas informacion</li>
  <li><a href="https://computernewage.com/2014/12/25/como-personalizar-el-aspecto-del-prompt-de-la-terminal-de-linux/">Personalizacion del Terminal</a></li>
</ul>
<p>

    sudo + comando. -- permite ejecutar un comando con permisos de administrador de manera puntual
    sudo su o bash -- permite hacer un cambio de sesion de usuario, sin la necesidad de cerrar la sesion del usuario actual
    man + comando -- guia completa del comando
    uname -- informacion del SO usado
    who -- muestra los usuarios logeados en el sistema
    history -- imprime por pantalla un listado de los ultimos comandos usados
    clear -- limpia la pantalla sin borrar el contenido, hace scroll hacia abajo
    ping -- permite saber si un cliente o servidor esta operativo mediante la direccion IP o url
    date -- informa sobre la fecha y hora del sistema
    curl wttr.in/paris -- te permite saber la prevision meteorologica.(ciudad, codigo areopuerto o nombre dominio)
    exit -- cierra sesion de terminal actual del usuario logueado en ella. Tambien para pasar de root a usuario
    
</p>

<h1>MANEJAR ARCHIVOS Y CARPETAS</h1>
<ul>
    <li><a href="https://computernewage.com/2015/06/27/conoce-la-estructura-de-permisos-de-linux-al-detalle/">USUARIOS</a> 
    PERMISOS</li>
    <li><a href="https://victorhckinthefreeworld.com/2017/07/06/comando-cp-de-linux-un-par-de-trucos-utiles/">CP</a> informacion extra</li>
</ul>
<p>

    pwd -- indica la ruta completa del directorio de trabajo en el que estas
    cd /ruta de directorio -- permite cambiar de directorio de trabajo. Si ejecutas cd vuelves al direcotio raiz
    cd .. -- va uno hacia atras en la ruta
    cd ../.. -- va dos hacia atras en la ruta
    ls -- lista los archivos y directorios de la carpeta de trabajo en la que te encuentres
    ls -a  -- lista todos los archivos visibles y ocultos
    ls -l -- lista los archivos y te muestra informacion de ellos
    ls -i -- muestra los inodos de cada archivo y directorio
    find ./Documentos -- permite buscar archivos y te muestra el contenido de estos
    find ./Documentos -name archivo.txt
    find ./Documentos -name *.pdf -- busca todos los archivos con este nombre(extension)
    locate archivo.txt -- permite localizar archivos. Algo parecido a find
    mkdir /ruta/nombreDirectorio -- permite crear directorios
    rmdir /ruta/directorio -- permite eliminar el directorio especificado
    rm /ruta/archivo permite eliminar archivos sueltos y directorios que no se encuentren vacios
    rm -r /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(necesita confirmacion)
    rm -rf /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(sin confirmacion)
    cp archivo1.txt archivo2.txt-- copia conteido del primer archivo al segundo.
    mv /ruta /ruta-- permite mover archivos desde la consola y cambiar el nombre en la ubicacion de destino
</p>

<h1>INFORMACION DEL SISTEMA</h1>
<ul>
    <li><a href="https://wttr.in/:help">Documentacion Ampliado</a>  Meteorologia</li>
</ul>
<p>

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

    cat /proc/version -- informacion detallada de la version de Kernel utilizada, compilador GCC, nombre de quien compilo         el Kernel y fecha de compilacion
    cat /proc/cpuinfo -- informacion detallada de la CPU

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
    
</p>

<h1>ESCANEAR EL CONTENIDO DE UN ARCHIVO DE TEXTO</h1>
<p>

    
</p>
<h1>FICHERO 1</h1>
<p>

    SE NECESITAN PERMISOS DE ADMINISTRADOR
    sudo -l -- cambia de $ a #
    fdisk -l -- permite ver las particiones
    dumpe2fs /dev/particion -- ves la informacion de la particion
    dunpe2fs -h /dev/sad2 -- lees la informacion de la particion maestra o principal 0
    dumpe2fs -h /dev/sad2
    dumpe2fs -o superblock=inodo
    sudo bas -- cambiamos de usuario a administrador
    ls- i ves el inodo del fichero
    debugfs -- contenido de inodo. tiene sus propios comandos
    open /dev/sda2
    cat <inodo>
</p>
