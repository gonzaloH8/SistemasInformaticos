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

# COMANDOS
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

# PRACTICA
    PRÁCTICA:
	1- Crearnos en un dispositivo virtual un mini-disco duro, creando un fichero y asociándolo a /dev/loop0
	2- Lo intentamos particionar con: fdisk, parted, ...
	3- En una partición sobre el disp.virtual vamos a formatear una partición con ext4: mke2fs
	4- Una vez formateado lo montamos para ver el contenido: mount

# SOLUCION
    1er paso:
		Nos creamos fichero que va a funcionar como mini-disco con el comando dd
													(400 MB)
			dd if=/dev/zero of=/tmp/minidisco bs=4096 count=100000
				-----------	 -----------------	 ------  -----------
					|				|				  |		\---> num.bloques if->of
		if=input-file				of=output-file	  bs=blocksize
		disp.entrada de datos		disp.salida			bloques de bytes desde if->of
		/dev/zero---> 000000...	fichero /tmp --> minidisco

		Para comprobar que se ha creado el fichero: ls -l /tmp/mindisco
		Nos creamos el dispositvo "virtual" con este fichero (como si te crearas un miniusb de 400MB)

			losetup /dev/loop0 /tmp/minidisco
					---------  -------------
						|			\--> fichero que quieres meter dentro
			disp.virtual a usar	  
			si está ocupado y quieres
			saber cuál es el que está libre, usa losetup -f

		Vemos detalles del disco virtual con fdisk:
			
			fdisk -l /dev/loop0

    2º paso:
		Intentamos particionar el disco /dev/loop0 con fdisk (también puedes usar parted)
		Ejecutas fdisk /dev/loop0
					  ---> command: n (sirve para añadir una nueva partición)
						   command: p (sirve para añadir partición y seleccionar primaria)
								número partición: 1
								sector inicio (por defecto)
								sector fin (tamaño partición, por defecto te coge todo el tamaño del disco)
						   command: w (guardas cambios OJOOO!!!) si no quieres guardar nada:
								   q (sales de fdisk sin hacer nada)

		Ejecutas fdisk -l /dev/loop0
		para comprobar particiones

    3er paso:
		Formateas la partición recién creada (usando comando mke2fs)
	
			mke2fs -t ext4 /dev/loop0p1
			--------------
				|--> mke2fs.ext4

    4º paso:
		Para poder usarlo y guardar/leer información en él (crear ficheros, directorios,...)
		Hay que "montarlo"(anclarlo) dentro del sistema de ficheros existente en la máquina física:

		En Linux por defecto se usan los directorios: /mnt o /media

			mount -t ext4 /dev/loop0 /mnt/
				  ------- ---------- ----
					|			|	 \---> Lugar donde quieres montar el contenido o anclarlo
				tipo de sist		|
				de fich. con	   disp.a montar
				el que está
				formateada

		Si no da mensaje de error es que está listo.
		Para empezar a usarlo:
			
		(change directory)
			cd /mnt <------ Nos cambiamos al directorio donde está montado el disp.virtual y ya puedes hacer lo que quieras.

							Nos creamos un directorio:
								
								(make directory)
									mkdir ./mis_apuntes
								
							Nos creamos un fichero:
									echo "hola mundo..." > ./LEEME.txt

							Vemos si lo ha creado: ls -l