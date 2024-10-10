# ENLACES INFORMATIVOS
- [DOCUMENTACION](https://computernewage.com/2015/06/14/el-arbol-de-directorios-de-linux-al-detalle-que-contiene-cada-carpeta/#estructura-directorios)
- [DOCUMENTACION INGLES EXTENDIDA](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/index.html)
- [COMANDOS](https://computernewage.com/2013/04/10/como-manejar-archivos-y-carpetas-desde-la-terminal-de-linux/)

# INSTALACION
- [Virtual Box( DESCARGAR MAQUINA VIRTUAL(VIRTUALBOX))](https://www.oracle.com/es/virtualization/virtualbox/)
- [DESCARGA DE UBUNTU(Descargar de la pagina el SO de Ubuntu)](https://ubuntu.com/download/desktop)
- Hacer una nueva maquina
- Nombre: Ubuntu y su version
- Aplicar SO adecuado
- Aumentar la RAM,ROM,Procesadores,Memoria de Video, Carpetas Compartidas
- Iniciar la instalacion y seleccionar try and install Ubuntu
- -------------------------------------------------------------------------
- Instalacion de las Guest Adicctions
- Insetamos las guesst adicctions(si hay problemas haremos lo siguiente)
- lsb_release -a: vemos que esta instalado la versión de Linux
- sudo apt Update -y: nor permite actualizar
- sudo apt install bzip2: instalación necesaria para las guesst adiction
- Volver a ejecutar la aplicacion de las Guest Adition
- Hacemos una isntantanea de la maquina recién instalada por si ocurre algo, seleccionamos la instantánea y damos a restaurar

# ESTANDAR DE JERARQUIA DE DIRECTORIOS O FHS
Filesystem Hierarchy Standard(FHS): es la jerarquia para los sistemas de archivos en sistemas Linux y otros derivados de UNIX
Esta siendo mantenida por la Linux Foundation. Hay distribuciones GNU/Linux que apuestan por(Gobo Linux). Todo el arbol parte de una raiz comun denominada root y que simboliza por una barra inclinada. Es usual hacer particiones donde guarden ciertos directorios como /home

## DIRECTORIO RAIZ O ROOT(Directorio personal de superusuario)
Se inicia con una /, con la que accederas a todos los directorios del sistema, particiones, etc

## BIN(Binarios de Usuario) SBIN(Binarios de sistema)
/bin: directorio estatico, donde se almacenan todos lo binarios necesarios para garantizar las funciones basicas a nivel de usuario. Solo almacenan los ejecutables de ususario.
/sbin: Los binarios necesarios para tareas administraticas gestionadas por el usuario root o superusuario del sistema.
Tambien incluye los binarios que permiten la ejecucicion de utilidades estandar de la terminal de Linux: cat, cd, cp, echo, grep, gzip, kill, ls, mv, rm, ping, su, ps, tar y vi.

## BOOT(Ejecutables y archivos requeridos para el arranque)
/boot: Directorio estatico e incluye todos los ejecutables y archivos que son necesarios en el proceso de arranque del sistema, y que se deben ser utilizados antes que el kernel empiece a dar las ordenes de ejecucion de los diferentes modulos del sistema. Es tambien donde se encuentra el gestor de arranque GRUB

## DEV(Archivos de informacion de todos los volumenes)
/dev: incluye todos los dispositivos de almacenamiento, en forma de archivos, conectaddos al sistema(discos duros, USB, particion, CDROM) Contiene la informacion de cada uno de los volumenes.

    /dev/sda1 - Particion principal
    /dev/sda2 - Particion extendida
    /dev/sda5 - Particion Swap
   
    /dev/sdb1 -- dispositivo externo
    /dev/sdb2 -- dispositivo externo
    /dev/sdb3 -- dispositivo externo
  
## MEDIA(Directorio de montaje de volumenes extraibles)
    /media: contiene los puntos de montaje, pero no la informacion real
    /media/User1
    /media/User2

  

## ETC(Archivos de configuracion del sistema y de apliaciones)
Es el encargado de almacenar archivos de configuracion tanto a nivel de componentes del sistemas operativo en si, como de los programas y apliaciones instaladas a posteriori.

## HOME(directorio personar de las carpetas de usuario)
Es el directorio de usuarios estandar, destinado a almacenar todos los archivos de usuario(/documentos, /Imagenes, /videos, /musica, /plantillas,etc). Es usual ubicar el /home en una particion separada del resto
Tambien incluye archivos temporales de apliaciones ejecutadas en modo usuario, que sirven para guardar las configuraciones de programas,etc situadas en carpetas ocultas(Acceso a ellas CTRL + F)
Estructura
  .NombreCarpeta(Carpetas Ocultas)
  /home/user1
  /home/user2

## LIB(Bibliotecas necesarias para la ejecucion de binarios)
Incluye las bibliotecas esenciales que son necesarios para que se puedan ejecutar correctamente todos los binarios que se encuentran en los directorios /bin y /sbin, asi como los modulos del propio Kernel.
En los sistemas Operativos de 64bits, ademas de /lib existe el direcotio /lib64, referidas a las bibliotecas para aplicaciones de 64 bits

## OPT(Ficheros de apliaciones externas que no se integran en /usr)
Van todos los archivos de solo lectira que son parte de programas autocontenidos. Seria algo parecido al directorio de "Archivos y Programs de Windows"

## PROC(Ficheros de informacion de procesos)
Contiene informacion de los procesos y apliaciones que se estan ejecutando en un momento determinado en el sistema, por lo que su contenido es nulo, ya que no guarda nada. Basicamente son listas de eventos del SO que se generan al momento de acceder a ellos.
- [Informacion Ampliada](https://www.linuxtotal.com.mx/index.php?cont=info_admon_016)
  
      proc/ -- el kernel cuando arranca, y los crea en memoria RAM (cuando se apaga el equipo, desaparecen)
      ls /proc -- muestra las carpetas que lo conforman y los numeros son procesos en ejecucion
      cat proc/meminfo -- info del equipo
      cat proc/cpuinfo -- muestra info del procesador de tu equipo

## ROOT
Vendria a ser como el directorio /home del usuario root o superusuario del sistema.
El usuario root esta en su propia carpeta colgando directamente del la raiz del sistema.

## SRV(Archivos relativos a servidores web, FTP, etc)
Sirve para almacenar archivos y directorios relativos a servidores que puedas tener instalados dentro de tu sistema, ya sea un servidor web www, un servidor FTP, CVS, etc.
En caso de tener alguno isntalado seria buena idea tenerlo publico dentro del /srv
  
    /srv/www

## SYS(Archicos virtuales con informacion de eventos del sistema)
Contiene archivos virtuales que proveen informacion al kernel relativa a eventos del sistema operativo
Estos archivos se distribuyen de forma jerarquica a diferencia del /proc

## TMP(Directorio de ficheros temporales)
Sirve para almacenar archivos temporales de todo tipo. Se vacia cada vez que reiniciamos el sistema
El subdirectorio /var/tmp almacena archivos temporales, pero su contenido no se borra tras el reinicio del sistema

## USR(Archivos de programas y apliaciones instaladas)
"User System Reources" y sirve para almacenar todos los archivos de solo lectura y relativos a las utilidades de usuario, incluyendo todo el software instalado a traves de los gestores de paquetes de cada distribucion

    /usr/bin
    /usr/include
    /usr/lib
    /usr/local
    /usr/sbin
    /usr/share
    /usr/src

# VAR(Archivos de variables, logs, emails de los usuarios del sistema, etc)
Contiene varios archivos con informacion del sistema, como archivos de logs, emails de los usuarios del sistema, bases de datos, informacion almacenada en la cache, informacion relativa a los paquetes de apliaciones almacenados en /opt, etc
Actua a modo de registro de sistema
