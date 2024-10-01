# SHORTS COMANDOS
    CTRL + MAYUS + T -- abre una nueva terminal
    CTRL + MAYUS + C -- copia el contenido seleccionado
    CTRL + MAYUS + V -- pega el contenido seleccionado
    CTRL + ALT + F1 -- permite acceder a la terminal
    CTRL + K CTRL + C -- comenta lo seleccionado
    CTRL + K CTRL + U -- descomenta lo seleccionado
    CTRL + D -- nos permite salirnos de un punto vacio
    CTRL + C -- cancela la ejecucion de un comando
    

# INFORMACION ADICCIONAL
    Ruta Abosoluta: aplicas la ruta en orden /home/usuario/descargas/archivo1.txt /home/usuario/Documentos/archivo1.txt
    Ruta Relativa: aplica la ruta corta si estan al mismo nivel. Descargas/archivo1.txt Documentos/archivo1.txt
    En linux no contiene extensiones, son todo nombres. El sistema de archivos es mediante inodos
    gonzalo@computer:~$ -- seras un usuario estandar
    root@computer:/home/gonzalo# -- indicador root de que estas como administrador
    Terminales TTY mediante las combinaciones de teclado 'CTRL+ALT+F1' hasta 'CTRL+ALT+F7'
    EMULADORES PTS: GNOME Terminal, Konsole, Xterm, Yakuake, Guake, etc.
    chmod +x archivo.sh -- nos permite ejecutar el archivo en terminal y ver el resultado

# COMANDOS GENERICOS
<ul>
  <li><a href="http://wttr.in/:help.">CURL WTTR.IN</a> mas informacion</li>
  <li><a href="https://computernewage.com/2014/12/25/como-personalizar-el-aspecto-del-prompt-de-la-terminal-de-linux/">Personalizacion del Terminal</a></li>
</ul>

    sudo -l -- cambia de $ a #
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

# MANEJAR ARCHIVOS Y CARPETAS
<ul>
    <li><a href="https://computernewage.com/2015/06/27/conoce-la-estructura-de-permisos-de-linux-al-detalle/">USUARIOS</a> 
    PERMISOS</li>
    <li><a href="https://victorhckinthefreeworld.com/2017/07/06/comando-cp-de-linux-un-par-de-trucos-utiles/">CP</a> informacion extra</li>
</ul>

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

# INFORMACION DEL SISTEMA
<ul>
    <li><a href="https://wttr.in/:help">Documentacion Ampliado</a>  Meteorologia</li>
</ul>

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

# ESCANEAR EL CONTENIDO DE UN ARCHIVO DE TEXTO
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

# COMANDOS PARA VER O LISTAR LOS PROCESOS ACTIVOS
<h2>LISTADO</h2>
<ul>
    <li>PID(identificador)</li>
    <li>Usuario Propietario</li>
    <li>Nombre</li>
</ul>

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

# COMPARACION DE ARCHIVOS DE TEXTO
    diff parametros archivo1 archivo2 -- compara dos archivos linea por linea. Muestra las diferencias 1ºArchivo < 2ºArchivo >
    diff -b .. hacemos la comparacion sin tener en cuenta los espacios en blanco

    cmp archivo1 archivo2 -- compara dos archivos byte a byte
    cmp -b archivo1 archivo2 -- nos muestra los byte diferentes, numero de linea y contenido que varia

# COMPRIMIR Y DESCOMPRIMIR ARCHIVOS
<ul>
    <li><a href="https://computernewage.com/2023/04/15/gnu-linux-formatos-compresion-archivos/">FORMATOS DE COMPRESION</a></li>
</ul>

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

# SERVICIOS
<ul>
    <li><a href="https://computernewage.com/2014/08/10/como-configurar-el-firewall-ufw-en-ubuntu/">UFW</a> ampliado</li>
</ul>

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

# FICHERO 1
<ul>
    <li><a href="https://keepcoding.io/blog/que-es-y-como-usar-el-comando-dd-en-linux/">DD</a> mas informacion</li>
</ul>

    SE NECESITAN PERMISOS DE ADMINISTRADOR
    mkefs -- formatea todo
    fdisk -l -- permite ver las particiones
    
    dumpe2fs /dev/particion -- ves la informacion de la particion
    dunpe2fs -h /dev/sad2 -- lees la informacion de la particion maestra o principal 0
    dumpe2fs -h /dev/sad2
    dumpe2fs -o superblock=inodo
    dumpe2fs -o superblock=32768 -o blocksize=4096 /dev/sda1 | less -- sale reducido   
    
    ls- i nombreFichero ves el inodo del fichero especificado. Si no especificas sale el inodo los ficheros de la ruta
    
    debugfs -- contenido de inodo. tiene sus propios comandos
    open /dev/sda2 -- abre la particion y permite empezar a ejecutar los comandos de debugfs
    cat <inodo> -- permite visualizar el contenido
    imap <inodo> -- permite consultar la info del inodo
    if=/dev/sda1 bs=4096 skip=48089362 count=1 -- contenido de los clusters de datos del inodo ded forma directa(RAW)
            bs(blocksize): tamaño del bloque
            skip: tamaño del cluster
            count: numero de contenido a ver

    dd -- permite realizar copias de seguridad, clonar discos y particiones, tranferencia de datos
        info dd -- permite consultar toda la informacion del comando

    losetup -- 
    losetup -f -- para saber cual esta libre

    parted/fdisk /dev/loop0 -- accedemos al creador de particionamientos
    n -- añadimos una nueva particion
    p -- añadimos particion y la seleccionamos como primaria
    w -- guardamos los cambios
    q -- salimos del fdisk

    mke2fs -t ext4 /dev/loop0p1 -- permite formatear la particion recien creada

    Por defecto el lugar donde se montan es en los directorio /mnt o /media
    mount -- permite montarlo dentro del sistema de ficheros existente en la maquina fisica
    mount -t ext4 /dev/loop0 /mnt/
    cd /mnt -- vemos que se ha creado correctamente nuestro dispositivo virtual

# SHELL(bash)
    cat /etc/shells -- nos permite ver los shells a instalar
    cat /etc/bahts -- en caso de que no tengamos ninguno instalado
    echo $SHELL -- permite ver el que tenemos instalado
    
# COMENTARIOS
    # este es un comentario de una linea
    : 'este es un comentario de dos o mas lineas'

# OPERADORES DE TEXTO
    >
    >>
    <<
    \ permite escapar una interpretacion distinta a la que queremos
    
# OPERADORES DE COMPARACION
    -eq -- igualdad ==
    -ge -- mayor o igual >=
    -le -- menor o igual <=
    -gt -- mayor que >
    -lt -- menor que <

# OPERADORES LOGICOS
    && -- AND necesita que se cumplan ambas condiciones especificadas
    || -o -- OR necesita que se cumpla una de las condiciones especificadas
    | -- permite ejecutar varios comandos por separado al mismo tiempo

# VARIABLES
    declare -r variableConstante = 123 -- solo lectura
    variableModificable = 123
    vairbleString = "Hola"

# ARRAYS
    nombresArrays = (( "Jone", "Mark", "Irina", "Jone", "Hulk", "Aroa" )) -- sintaxis para definir un array
    echo "Los nombres son: ${nombresArrays[*]}"
    echo "Los nombres son: ${nombresArrays[@]}"
    echo "Item 0: ${nombresArrays[0]}"
    echo "Los indices: ${!nombresArrays[@]}"
    echo "el total de items: ${#nombresArrays[@]}"
    echo "el total de items: ${#nombresArrays[*]}"
    echo "el ultimo elemento es: ${nombresArrays[${nombresArrays[@]}-1]}"
    for nombresArray in ${nombresArrays[@]}
        do
            echo "My name is: $nombresArray" -- muestra todos los nombres
        done
    unset names[1] -- elimina el elemento de la posicion 1
    echo "Los nombres son: ${nombresArrays[*]}" 
    nombresArrays[7]="boob" -- añade un elemento nuevo al array
    nombresArrays[${nombresArrays[@]}]="bob" -- interpreta la longitud maxima del array y añade un nuevo elemento
    echo "items: ${nombresArrays[*]}"
    nombresArrays+=("Bob") -- forma simple de añadir elementos
    nombresArrays[2]="Ari" -- actualiza los valores en funcion de la posicion

# FUNCIONES
    function hola(){
        local message="Hola" -- me permite hacer que el valor de esta variable solo existe dentro de la funcion
        echo "Hola yo soy $1, tengo $2 años"
    }
    hola "Gonza" 50
    
# CONDICIONAL IF ELIF ELSE
     age=10 -- variable
     if [ age -eq 18 ]
     then
     echo "eres un adulto"
     elif [ $age >= 17]
     echo "eres casi un adulto"
     else
     echo "eres un niño"
     fi

     if [[ $age -gt 10 && $age -lt 30 ]]
     if [[ $age -gt 10 -o $age -lt 30 ]]

     test
         ! -f el fichero no existe
         -z 

# CONDICIONAL CASE
    Se utiliza normalmente para textos
    echo "escoge entre el valor 1 o 2 "
    read valor
    case $valor in 
        1)
            echo "escogiste el 1"
        ;; -- misma funcionalidad que el break
        2) 
            echo "escogistes el 2"
        ;;
        *)
        echo "valor incorrecto"
        ;;
        esac

# BUCLES
    number =1
    while [ $number -lt 10 ] -- mientras sea cierto se ejecuta el do
    do
    echo $number
    number = $((number + 1))
    done

    until [ $number -ge 10 ] -- mientras no sea falso se ejecuta el do
    do
    echo $number
    number = $((number + 1))
    done

    for i in {0..100} -- bucle normal
    do
        echo $i
    done

    for i in {0..100..10} --bucle indicando el incremento deseado

    for (( i=0; i < 10; i++ ))
    do
    echo $i
    done

# BREAK Y CONTINUE
    for (( i=0; i < 10; i++ ))
    do
    if [ $1 -gt 6 ] -- nos pemite para el bucle en cuanto se cumple la condicion
        break
    fi
    echo $i
    done

    for (( i=0; i < 10; i++ ))
    do
    if [ $1 -gt 6 ] -- nos pemite saltarnos el 6 y continuar con el bucle
        continue
    fi
    echo $i
    done

# ARGUMENTOS
    ./arguments.sh 10 20 30 Argumento -- sintaxis de argumentos
    echo $1 $2 $3 $4 -- muestra los argumentos especificados
    echo $@ -- muestra todos los argumentos
    echo $# -- cuenta los argumentos
    args=("$@) -- guarda todos los argumentos en una variable, se convierte en una array
    echo "Result: ${args[0]} - $args{args[1]} , $args{args[2]}"

# INPUT
    while read line
    do     
        echo $line
    done "${1:-/dev/stdin}" -- permite leer lo que escribe el usuario por terminal al momento de escribirlo 

# STANDAR OUTPUT Y STANDAR ERROR
    output -- es aquello que nos muestra por terminal cuando el comando es correcto
    ls 1>file-txt -- permite guardar el resultado del comando en un fichero 1
    ls >file.txt -- permite guardar el resultado del comando en un fichero por defecto
    ls >& file.txt -- permite guardar el resultado del comando en un fichero

    error -- es aquello que nos muestra por terminal cuando el comando es incorrecto
    ls -123 2>file.txt -- permite guardar el resultado de error del terminal a un fichero
    ls 1>fichero.txt 2>&1 -- permite guardar el resultado de error del terminal mediante parametro al fichero
    ls -123 >& file.txt -- permite guardar el resultado de error del terminal a un fichero

# EXPORTAR VARIABLES
    firts.sh
    MESSAGE="hola mundo"
    export MESSAGE
    ./second.sh

    second.sh
    echo "Contenido del script 1: MESSAGE"

# COMPARACIONES CON STRINGS
    echo ${name,,} -- convierte el nombre en miniscula
    echo ${name^^} --convierte el nombre en mayuscula
    echo ${name,,[AEIOU]} -- convierte en minuscula las vocales
    echo ${name^^[aeiou]} -- convierte en mayuscula las vocales

# NUMBERS
    echo $(( 10 + 20 )) -- sintaxis para operar aritmetica
    echo $(( x - y )) --sintaxis para operar aritmetica con variables

# DIRECTORIES AND FILES
    echo "Ingresa el nombre de tu carpeta"
    read carpeta
   
    if [ -d $carpeta ] -- comprueba la existencia de un directorio
    then
        echo "el directoio $carpeta existe"
    else
        echo "el directorio no existe"
    fi
        
    echo "Ingresa el nombre de tu archivo"
    read archivo
    if [ -f $archvivo] -- comprueba la existencia de un archivo
    then
        echo "el fichero $archivo existe"
        read contenido
        echo $contenido >> $ $archivo -- permite ingresar contenido nuevo al archivo
    else
        echo "El fichero no existe"
    fi

    echo "Ingresa el nombre de tu archivo"
    read archivo
    if [ -f $archvivo] -- comprueba la existencia de un archivo
    then
        while IFS= read -r line
        do
            echo $line
        done < $archivo
    else
        echo "El fichero no existe"
    fi

# CURL
    permite descargar contenido a partir de un URL
    echo "Ingresa tu url"
    read url
    curl -T $url permite ver informacion del elemento a descargar

# DEBUGGING
    bash -x nombreScript.sh -- permite recorrer el archivo paso a paso
    set -x -- permite aplicar donde queremos que empiece a debuggear y donde queremos terminar lo escribimos otra vez
