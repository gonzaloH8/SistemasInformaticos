<h1>SHORTS COMANDOS</h1>
<p>

    CTRL + MAYUS + T -- abre una nueva terminal
    CTRL + MAYUS + C -- copia el contenido seleccionado
    CTRL + MAYUS + V -- pega el contenido seleccionado
    CTRL + ALT + F1 -- permite acceder a la terminal
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

        touch nombreArchivo -- permite crear uno o varios archivos vacios en formato txt
        cat > nombreArchivo contenido -- crea un archivo con el conteido inidcado. CTRL + D finaliza
        cat nombreArchvio -- imprimira en la terminal el contenido del archivo
        cat -n nombreArchivo -- imprime el contenido y hace un conteo de lineas
        cat -b -- imprime el contenido y numero solo aquellas que contengan texto, descarta las lineas en blanco

        more -- imprime el contenido paginado. Adecuado para archivos largos

        less -- muestra el contenido en modo editor de texto
        g + Enter -- avanza por defecto una linea adelante
        :1 -- marcas la g e introduces el numero deseado avanzamdo esa contidad de lineas
        q -- permite salir del editor de texto

        NANO -- abres el editor de texto
        CTRL + R -- permite abrir un archivo de texto y mostrar su contenido
        CTRL + V -- permite avanzar a la pagina siguiente
        CTRL + Y -- permite retrocer a la pagina anterior
        CTRL + W -- abre un buscador de palabras dentro del texto
        CTRL + X -- permite salir del editor de texto

        VIM -- editor de texto mas complejo
        sudo apt intall vim -- instalacion de vim
        vim -- abre el editor de texto
        :help -- archivo de ayuda sobre los comandos de vim
</p>

<h1>COMANDOS PARA VER O LISTAR LOS PROCESOS ACTIVOS</h1>
<h2>LISTADO</h2>
<ul>
    <li>PID(identificador)</li>
    <li>Usuario Propietario</li>
    <li>Nombre</li>
</ul>
    
<p>

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
</p>

<h1>COMPARACION DE ARCHIVOS DE TEXTO</h1>
<p>

    diff parametros archivo1 archivo2 -- compara dos archivos linea por linea. Muestra las diferencias 1ºArchivo < 2ºArchivo >
    diff -b .. hacemos la comparacion sin tener en cuenta los espacios en blanco

    cmp archivo1 archivo2 -- compara dos archivos byte a byte
    cmp -b archivo1 archivo2 -- nos muestra los byte diferentes, numero de linea y contenido que varia
</p>

<h1>COMPRIMIR Y DESCOMPRIMIR ARCHIVOS</h1>
<ul>
    <li><a href="https://computernewage.com/2023/04/15/gnu-linux-formatos-compresion-archivos/">FORMATOS DE COMPRESION</a></li>
</ul>
<p>

    gzip -- comprimira en formato gz(LINUX)
    gzip -9 archivo -- comprime el archivo
    gzip -1 archivo.gz -- permite saber los parametros del archivo(compresion o el nombre del archivo una vez descomprimido)
    gxip -d archivo.gz -- permite descomprimir un Gzip

    bzip2 -- comprimira en formato bz2(LINUX)
    bzip2 -z archivo -- comprimira el archivo
    bzip2 -t archivo-bz2 -- hace un test de integridad
    bzip2 -d archivo-bz2 -- descomprime el archivo

    tar -- permite el empaquetado y desempaquetado
    tar -cvf paquete.tar archivo1 archivo2 -- empaquetas los archivos(no recomendada)
    tar -cvf paqueter.tar directorio -- empquetas todo de una
    tar -tvf paquete-tar -- te lista todo lo que contiene de forma recursiva
    tar -xvf paquete.tar -- desempaqueta
    tar -czvf paquete.tar.gz archivo1 archivo2 -- comprime los archivo en formato gz
    tar -czvf paquete.tar.gz directorio -- comprime un directorio
    tar -xzvf paquete.tar.gz -- descomprime el archivo
    tar -cjvf paquete.tar.bz2 archivo1 archivo2 --comprime los archivos en formato bz2
    tar -xjvf paquete.tar.bz2 -- descomprime el paquete

    zip -- formato zip
    zip archivador.zip archivo1 archivo2 -- comprime y empaquete los archivos
    unzip -1 archivador.zip -- previsualiza la lista de todos los archivos o directorios del paquete archivador.zip 
    unzip archivador.xip -- descomprime el paquete
    unzip archivador.zip archivo1 -- permite descomprimir un archivo en concreto
</p>

<h1>SERVICIOS</h1>
<ul>
    <li><a href="https://computernewage.com/2014/08/10/como-configurar-el-firewall-ufw-en-ubuntu/">UFW</a> ampliado</li>
</ul>
<p>

    UFW: servicio que se encarga de gestionar el cortafuegos del kernel en Ubuntu
    sudo systemctl status -- nos permite ver todos los servicios cargados en tu sistema
    sudo systemctl status ufw -- nos permite conocer el estado de ufw, si esta activo en memoria o no.
    sudo systemctl star ssh -- nos permite iniciar el servicio
    sudo systemctl stop ufw -- nos permite detener el servicio
    sudo systemctl restart ufw -- nos permite reiniciar el servicio
    sudo systemctl is-enabled ufw -- comprueba si el servicio esta configurado para iniciarse en cada arranque o no
    sudo systemctl enable ufw -- permite habilitar un servicio
    sudo systemctl disable ufw -- permite deshabilitar un servicio
    
    sudo service --status-all -- permite ver un listado plano de todos los servicios
    sudo service --status-all | grep + -- permite ver los servicios que esten iniciados
    sudo service ufw status -- nos permite ver el estado de un servicio en concreto
    sudo service ufw start -- permite iniciar el servicio
    sudo service ufw stop -- permite detener el servicio
    sudo service ufw restart -- permite reiniciar el servicio

    sudo /ent/init.d/ufw status -- fichero de configuracion dentro del directorio init.d. Comprueba el estado del servicio
    sudo /ent/init.d/ufw start -- inicia el servicio
    sudo /ent/init.d/ufw stop -- para el servicio
    sudo /ent/init.d/ufw restart -- reinicia el servicio
    
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
