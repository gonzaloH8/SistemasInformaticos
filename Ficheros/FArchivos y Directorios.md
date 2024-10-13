#  SISTEMA FICHEROS DE LINUX(EXT4) 16-09-2024
  El sistema de ficheros de Linux(la forma en que tiene Linux de almacenar la informatica) se llama extN(N es la version del sistema de ficheros, actualmente es la 4; ext4) esta formada por estas estructuras: (cuando das "formato" o formateas una unidad, creas un sistema de ficheros en esa unidad, en el caso de Linux creas ext4,  se crean estas estructuras):

  Unidad de almacenamiento
  <------------unidad basica: bloque o cluster 4096bytes o 4k...
  |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  <---32768------> <----32768-----><-----32728----->
  -----------------------------------------------------------------------
  MBR|PBS|GRUPO-BLOQUE-0|GRUPO-BLOQUE-1|GRUPO-BLOQUE-2|---
  -----------------------------------------------------------------------
  |  \-> partition boot sector
  gestor kernel, initrd, parte
  arranque del grub                                 dentro de cada bloque:
                                            --------------------------------------------------------------
                                            super bloque|GDT|mapa bits| mapa bits|tabla|bloque de DATOS
                                                                    bloques      inodos    inodos
                                            --------------------------------------------------------------
    (partes dentro de cada grupo bloque del sistema de ficheros ext)
    Super bloque: es una estructura fundamental del sistema de ficheros porque almacena toda la informacion basica sobre el mismo (tipo de sistema fich, numero de grupos-bloque que hay en todo dispositivo, el tamaño que tiene cada grupo-bloque,....)
    SI SE DAÑA,, el sistema de ficheros esta corrompido y el kernel(no pude acceder al mismo)
    (NO SE PUEDE ACCEDER A LA INFORMACION) por eso esta replicado(hay una copia en todos los grupos-bloques)
Para ver la informacion: dumpe2fs /dev/nombre-del-disco-almacenamiento
Ej:(opcion - h lees info del superbloque principal o maestros, el 0)
    dumpe2fs -h /dev/sad1
    (para ver discos y particiones sobre los mismos, si las tiene: fdisk -l)
    (para cambiar de $ a # hay que poner sudo -l)
    Ej: si leo la info de la copia del superbloque en el grupo bloque 2 debe salir la misma info:
      dumpe2fs -o superblock=32768 - o blocksize=4096 /dev/sda1
      con lo de arriba: nos estamos saltando los bloques anteriores
      block per group: 32728
      GDT(Group Description Table): es una TABLA donde cada registro informa del estado de cada GRUPO-BLOQUE del sistema de ficheros; cada registro ocupa 32 bytes en ext2/3 y 64 bytes en ext4
      GDT
      ---------------------------------------
      resgistro-0(grupo-bloque0)-> infor del grupo-bloque-0(32 o 64 bytes)
      registro-1(grupo-bloque1) 
      registro-2(grupo-bloque2)
      se guarda la informacion como:
        -donde comienza el mapa de bits bloques
        -donde comienza el mapa de bits de inodos
        -Donde comienza la tabla de inodos
        -Cuantos bloques o clusters de datos para grabar info hay libres
      Mapa de bits bloques:
      Mapa de bits inodos:
      Tabla de inodos:
      Bloques de datos:
      
# MI TEORIA
  - **Sistema de ficheros de Linux:** ext3/ext4
  - **SUPERBLOQUE:** es un bloque que contiene la informacion mas relavante y describe al sistema de ficheros. Se encarga de recibir el estado de los sistemas de ficheros, tamaño de los sitemas de archivos, lista de bloques libres, tamaño, total y lista de inodos, numero de bloques del bitmap, tamaño maximo de un archivo, version del sistema de ficheros, etc
  - **BITMAP:** mapa de bits, representacion binaria que representa al objeto. Se utiliza para indicar el estado de los Inodos y los bloques para ver si estan disponibles o no.
  - **I-Nodo/nodoIndice:** estructura de datos de 128 bytes propia de SO UNIX. Alamacena los metadatos de un fichero, tiene informacion acerca del nombre del archivo, su tamaño, fecha de modificacion, propietarios, permisos, etc 
  - **Bloques/Cluster:** es la unidad minima de almacenamiento a nivel logico. Su numero es determinada al momento de la creacion del sistema de archivos y el tipo de sistema. Un blque solo puede contener un archivo, o parte de uno. Su tamaño es de 4096 bytes
  - **Apuntadores Directos:** son los que apuntan a un bloque de carpetas o bloque de archivos
  - **Apuntadores indirectos:** son aquellos que apuntan o referencian a un bloque de apuntadores, y estos a su vez son lo que hacen referencia a los bloques de carpetas y archivos.
  - **GDT(Group Description Table):** es una TABLA donde cada registro informa del estado de cada GRUPO-BLOQUE del sistema de ficheros; cada registro ocupa 32 bytes en ext2/3 y 64 bytes en ext4

----------------------------------------------------------------------------------
   # ESTRUCTURA LOGICA DEL SISTEMAS DE FICHEROS 26-09-2024
-----------------------------------------------------------------------------------

Si el usuario tuviera que manejar directamente el sistema de ficheros usando inodos, reservando esapcio en la tabla de inodos, buscando y reservando los bloques o clusters necesarios para almacenar la informacion de un fichero o directorio, seguramente nadie lo usuaria. 
Todos los sitemas operativos crean una capa intermedia entre el sistema fisico real de ficheros y el usuario, que se llama la estructura logica del sistema de ficheros. 
Son simplemente objetos, organizados de en una estructura jerarquica en forma de arbol (cada nodo del arbol se mapea con un inodo real del sistema de ficheros fisico real)
El objeto raiz del arbol en linux es el directorio raiz o "/" y del mismo ya cuelgan el resto; hay mas de un tipo de objeto, pero los principales:

  - Un directorio es un objeto destinado a contener otros objetos
  - Un archivo es un objeto a contener informacion
  - Un enlace o LINK es un puntero a un archivo o directorio
  - Un socket es un "buffer" para almacenar informacion a mandar/recibir atraves de la red
  - Una pipe es un tipo especial de fichero o archivo

El kernel monta una capa intermedia entre el sistema de ficheros real de ficheros(inodos...) y el usuario, llamada sistema logico del sistema de ficheros, 
que consiste en una serie de objetos organizados de forma jerarquica en arbol 
nodo raiz <=== directorio raiz /
nodo-hijo   nodo-hijo     nodo-hijo
                            |
                        ------------------
                        |    |    |     |
                        nodo
                        hijo

# ENLACES
<ul>
    <li><a href="https://computernewage.com/2015/06/27/conoce-la-estructura-de-permisos-de-linux-al-detalle/">USUARIOS</a> 
    PERMISOS</li>
    <li><a href="https://victorhckinthefreeworld.com/2017/07/06/comando-cp-de-linux-un-par-de-trucos-utiles/">CP</a> informacion extra</li>
</ul>

# MANEJAR ARCHIVOS Y CARPETAS
    pwd -- indica la ruta completa del directorio de trabajo en el que estas
    cd /ruta de directorio -- permite cambiar de directorio de trabajo. Si ejecutas cd vuelves al direcotio raiz
    cd .. -- va uno hacia atras en la ruta
    cd ../.. -- va dos hacia atras en la ruta

# VER CONTENIDO DE UN DIRECTORIO
    ls -- lista los archivos y directorios de la carpeta de trabajo en la que te encuentres
    ls -a  -- lista todos los archivos visibles y ocultos
    ls -l -- lista los archivos y te muestra informacion de ellos
    ls -i -- muestra los inodos de cada archivo y directorio
    tree -opciones ruta ---> imprime por pantalla la ruta en forma de arbol
    sudo apt install -y tree -- instalacion del paquete tree

# BUSCA DIRECTORIOS
    find ./Documentos -- permite buscar archivos y te muestra el contenido de estos
    find ./Documentos -name archivo.txt
    find ./Documentos -name *.pdf -- busca todos los archivos con este nombre(extension)
    locate archivo.txt -- permite localizar archivos. Algo parecido a find

# CREA, MODIFICA Y ELMINA DIRECTORIOS/FICHEROS
    mkdir /ruta/nombreDirectorio -- permite crear directorios
    rmdir /ruta/directorio -- permite eliminar el directorio especificado
    rm /ruta/archivo permite eliminar archivos sueltos y directorios que no se encuentren vacios
    rm -d Directorio -- permite borrar directorio
    rm -r /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(necesita confirmacion)
    rm -rf /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(sin confirmacion)
    mv /ruta /ruta-- permite mover archivos desde la consola y cambiar el nombre en la ubicacion de destino
    cp archivo1.txt archivo2.txt-- copia conteido del primer archivo al segundo.

# ESCANEAR EL CONTENIDO DE UN ARCHIVO DE TEXTO
    touch nombreArchivo -- permite crear uno o varios archivos vacios en formato txt
    > fichero1.txt > fichero2.txt -- permite crear fichero vacios
    
    echo -e 'contenido' >> fichero.txt -- permite agregar un texto y crear el fichero que lo contenga al mismo tiempo
    echo 'contenido' > fichero.txt .. sobreescribe el contenido del fichero
    
    cat >> nombreArchivo contenido -- crea un archivo con el conteido inidcado. CTRL + D finaliza
    cat > Archivo.txt contenido -- sobreescribe el contenido
    cat nombreArchvio -- imprimira en la terminal el contenido del archivo
    cat -n nombreArchivo -- imprime el contenido y hace un conteo de lineas
    cat -b -- imprime el contenido y numero solo aquellas que contengan texto, descarta las lineas en blanco

    more -- imprime el contenido paginado. Adecuado para archivos largos

    less -- muestra el contenido en modo editor de texto
    g + Enter -- avanza por defecto una linea adelante
    :1 -- marcas la g e introduces el numero deseado avanzamdo esa contidad de lineas
    q -- permite salir del editor de texto

    VIM -- editor de texto mas complejo
    sudo apt intall vim -- instalacion de vim
    vim -- abre el editor de texto
    :help -- archivo de ayuda sobre los comandos de vim

    ejecucion=$(ls) -- guardar comandos en variables

# COMPARACION DE ARCHIVOS DE TEXTO
    diff parametros archivo1 archivo2 -- compara dos archivos linea por linea. Muestra las diferencias 1ºArchivo < 2ºArchivo >
    diff -b .. hacemos la comparacion sin tener en cuenta los espacios en blanco
  
    cmp archivo1 archivo2 -- compara dos archivos byte a byte
    cmp -b archivo1 archivo2 -- nos muestra los byte diferentes, numero de linea y contenido que varia

# NANO
    NANO -- abres el editor de texto
        CTRL + R -- permite abrir un archivo de texto y mostrar su contenido
        CTRL + V -- permite avanzar a la pagina siguiente
        CTRL + Y -- permite retrocer a la pagina anterior
        CTRL + W -- abre un buscador de palabras dentro del texto
        CTRL + X -- permite salir del editor de texto
