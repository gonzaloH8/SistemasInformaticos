<h1>ENLACES INFORMATIVOS</h1>
<ul>
  <li><a href="https://computernewage.com/2015/06/14/el-arbol-de-directorios-de-linux-al-detalle-que-contiene-cada-carpeta/#estructura-directorios">DOCUMENTACION</a></li>
  <li><a href="https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/index.html">DOCUMENTACION INGLES EXTENDIDA</a></li>
  <li><a href="https://computernewage.com/2013/04/10/como-manejar-archivos-y-carpetas-desde-la-terminal-de-linux/">COMANDOS</a></li>
</ul>

<h1>INSTALACION</h1>

<ul>
  <li><a href="https://www.oracle.com/es/virtualization/virtualbox/"> Virtual Box</a>DESCARGAR MAQUINA VIRTUAL(VIRTUALBOX)</li>
  <li><a href="https://ubuntu.com/download/desktop"> DESCARGA DE UBUNTU</a>Descargar de la pagina el SO de Ubuntu</li>
  <li>Hacer una nueva maquina</li>
  <li>Nombre: Ubuntu y su version</li>
  <li>Aplicar SO adecuado</li>
  <li>Aumentar la RAM,ROM,Procesadores,Memoria de Video, Carpetas Compartidas,</li>
  <li>Iniciar la instalacion y seleccionar try and install Ubuntu</li>
  <li>--------------------------------------------------------------------------</li>
  <li>Instalacion de las Guest Adicctions</li>
  <li>Insetamos las guesst adicctions(si hay problemas haremos lo siguiente)</li>
  <li>lsb_release -a: vemos que esta instalado la versión de Linux</li>
  <li>sudo apt Update -y: nor permite actualizar</li>
  <li>sudo apt install bzip2: instalación necesaria para las guesst adiction</li>
  <li>Hacemos una isntantanea de la maquina recién instalada por si ocurre algo, seleccionamos la instantánea y damos a restaurar</li>
</ul>

<h1>ESTANDAR DE JERARQUIA DE DIRECTORIOS O FHS</h1>

Filesystem Hierarchy Standard(FHS): es la jerarquia para los sistemas de archivos en sistemas Linux y otros derivados de UNIX
Esta siendo mantenida por la Linux Foundation. Hay distribuciones GNU/Linux que apuestan por(Gobo Linux). Todo el arbol parte de una raiz comun denominada root y que simboliza por una barra inclinada. Es usual hacer particiones donde guarden ciertos directorios como /home

<ul>
  <li><strong>BIN</strong>(Binarios de Usuario)</li>
  <li>boot(Ejecutables y archivos requeridos para el arranque)</li>
  <li>dev(Archivos de informacion de todos los volumenes)</li>
  <li>etc(Archivos de configuracion del sistema y de apliaciones)</li>
  <li>home(directorio personar de las carpetas de usuario)</li>
  <li>lib(Bibliotecas necesarias para la ejecucion de binarios)</li>
  <li>media(Directorio de montaje de volumenes extraibles)</li>
  <li>opt(Ficheros de apliaciones externas que no se integran en /usr)</li>
  <li>proc(Ficheros de informacion de procesos)</li>
  <li>root(Directorio personal de superusuario)</li>
  <li>sbin(Binarios de sistema)</li>
  <li>srv(Archivos relativos a servidores web, FTP, etc)</li>
  <li>sys(Archicos virtuales con informacion de eventos del sistema)</li>
  <li>tmp(Directorio de ficheros temporales)</li>
  <li>usr(Archivos de programas y apliaciones instaladas)</li>
  <li>var(Archivos de variables, logs, emails de los usuarios del sistema, etc)</li>
</ul>

<h1>DIRECTORIO RAIZ O ROOT</h1>
Se inicia con una /, con la que accederas a todos los directorios del sistema, particiones, etc

<h2>BIN SBIN</h2>
/bin: directorio estatico, donde se almacenan todos lo binarios necesarios para garantizar las funciones basicas a nivel de usuario. Solo almacenan los ejecutables de ususario.
/sbin: Los binarios necesarios para tareas administraticas gestionadas por el usuario root o superusuario del sistema.
Tambien incluye los binarios que permiten la ejecucicion de utilidades estandar de la terminal de Linux: cat, cd, cp, echo, grep, gzip, kill, ls, mv, rm, ping, su, ps, tar y vi.

<h2>BOOT</h2>
/boot: Directorio estatico e incluye todos los ejecutables y archivos que son necesarios en el proceso de arranque del sistema, y que se deben ser utilizados antes que el kernel empiece a dar las ordenes de ejecucion de los diferentes modulos del sistema. Es tambien donde se encuentra el gestor de arranque GRUB

<h2>DEV</h2>
/dev: incluye todos los dispositivos de almacenamiento, en forma de archivos, conectaddos al sistema(discos duros, USB, particion, CDROM) Contiene la informacion de cada uno de los volumenes.
/media: contiene los puntos de montaje, pero no la informacion real
  /media/User1
  /media/User2
Para ver esto aplicando esto en la terminal se puede ver: "sudo fdisk -l", veras la estructura de particiones de tu sistema.
Ejemplos de volumenes Predefinidos del sistema:
  /dev/sda1 - Particion principal
  /dev/sda2 - Particion extendida
  /dev/sda5 - Particion Swap

Ejemplos para dispositivos externos:
  /dev/sdb1
  /dev/sdb2
  /dev/sdb3

<h2>ETC</h2>
Es el encargado de almacenar archivos de configuracion tanto a nivel de componentes del sistemas operativo en si, como de los programas y apliaciones instaladas a posteriori.

<h2>HOME</h2>
Es el directorio de usuarios estandar, destinado a almacenar todos los archivos de usuario(/documentos, /Imagenes, /videos, /musica, /plantillas,etc). Es usual ubicar el /home en una particion separada del resto
Tambien incluye archivos temporales de apliaciones ejecutadas en modo usuario, que sirven para guardar las configuraciones de programas,etc situadas en carpetas ocultas(Acceso a ellas CTRL + F)
Estructura
  .NombreCarpeta(Carpetas Ocultas)
  /home/user1
  /home/user2

<h2>LIB</h2>
Incluye las bibliotecas esenciales que son necesarios para que se puedan ejecutar correctamente todos los binarios que se encuentran en los directorios /bin y /sbin, asi como los modulos del propio Kernel.
En los sistemas Operativos de 64bits, ademas de /lib existe el direcotio /lib64, referidas a las bibliotecas para aplicaciones de 64 bits

<h2>OPT</h2>
Van todos los archivos de solo lectira que son parte de programas autocontenidos. Seria algo parecido al directorio de "Archivos y Programs de Windows"

<h2>PROC</h2>
Contiene informacion de los procesos y apliaciones que se estan ejecutando en un momento determinado en el sistema, por lo que su contenido es nulo, ya que no guarda nada. Basicamente son listas de eventos del SO que se generan al momento de acceder a ellos.
<ul>
  <li><a href="https://www.linuxtotal.com.mx/index.php?cont=info_admon_016">Informacion Ampliada</a></li>
</ul>

<h2>ROOT</h2>
Vendria a ser como el directorio /home del usuario root o superusuario del sistema.
El usuario root esta en su propia carpeta colgando directamente del la raiz del sistema.

<h2>SRV</h2>
Sirve para almacenar archivos y directorios relativos a servidores que puedas tener instalados dentro de tu sistema, ya sea un servidor web www, un servidor FTP, CVS, etc.
En caso de tener alguno isntalado seria buena idea tenerlo publico dentro del /srv
  /srv/www

<h2>SYS</h2>
Contiene archivos virtuales que proveen informacion al kernel relativa a eventos del sistema operativo
Estos archivos se distribuyen de forma jerarquica a diferencia del /proc

<h2>TMP</h2>
Sirve para almacenar archivos temporales de todo tipo. Se vacia cada vez que reiniciamos el sistema
El subdirectorio /var/tmp almacena archivos temporales, pero su contenido no se borra tras el reinicio del sistema

<h2>USR</h2>
/usr viene de "User System Reources" y sirve para almacenar todos los archivos de solo lectura y relativos a las utilidades de usuario, incluyendo todo el software instalado a traves de los gestores de paquetes de cada distribucion
  /usr/bin
  /usr/include
  /usr/lib
  /usr/local
  /usr/sbin
  /usr/share
  /usr/src

<h2>VAR</h2>
Contiene varios archivos con informacion del sistema, como archivos de logs, emails de los usuarios del sistema, bases de datos, informacion almacenada en la cache, informacion relativa a los paquetes de apliaciones almacenados en /opt, etc
Actua a modo de registro de sistema
