# ADMINISTRACION DE USUARIOS Y GRUPOS
Por defecto en linux la info de los usuarios esta en un fichero: /etc/passwd
Cada linea del fichero es una cuenta de usuario: dos tipos de usuarios o cuentas:
- Usuarios de sistema: cuentas de usuario q no pueden usarse para iniciar sesion usadas por servicios
- Usuarios normales: cuentas de usuario con las que puedes iniciar sesion e intercambiar con el SO
Cada linea del fichero /etc/passwd o bien es una cuenta del sistema o bien es una cuenta de usuario normal
el formato de las lineas:
nombre_usuario : x : user_id : group_principal_id : comentarios : ruta/directorio : shell_interactiva
Ejemplo:
  Usuarios normales: en el campo shell_interactiva tienen una shell q pueden ejecutar para introducir comandos para manejar el SO
  root:x:0:0:root:/root:/bin/bash----> el usuario adm tiene como UID=0;
                                       el grupo administradores q en linux tambien se llama "root" tiene como GID=0,
                                       el directorio personal: /root
                                       la shell: /bin/bash
                                       comentarios de la cuenta: root
  gonzalo:x:1000:1000:Gonzalo,,,:/home/gonzalo:/bin/bash ----> el usuario gonzalo UID:1000
                                                                el grupo principal GID:1000
                                                                comentarios Gonzalo,,,
                                                                directorio personal: /home/pablo
                                                                shell: /bin/bash
  En usuario normales los UID > 1000 en cuentas del sistema UID <=1000
  Las contraseñas se almacenan en un fichero al q solo tiene acceso el root, q se llama /etc/shadow
  Los permisos son muy restrictivos ls -l /etc/shadow
  Cada linea representa la informacion de una contraseña de una cuenta de usuario(tienen q coincidir el nunmero de lineas con el de /etc/passwd), tiene estos campo
  nombre_usuario: has_passwd | ! | * : .... campos que indican la durabilidad de la contraseña, etc

# COMANDOS
    GLOBALES
   
    /etc/ssh/sshd_config (PasswordAuthentication yes) -- archivo de directivas varias
    sudo pam-auth-update
    
    USUARIOS
    id -- te indica el nombre de usuario con el que has iniciado session y estas trabajando
    w -- te da informacion de todos los usuarios q estan usando el sistema y lo que estan haciendo
    useradd + nombre_usuario -- añade usuario
      -c -- añade comentarios
      -s -- añade shell
    userdel + nombre_usuario -- elimina usuario
    sudo addgroup + nombreGrupo -- Crear un grupo
    sudo adduser + nombreUsuario + nombreGrupo -- Añadir un usuario al grupo
    groups + nombreUsuario -- Comprobacion de en que grupos esta el usuario
    su + nombreUsuario -- Cambiar de sesion de usuario. Para abandonar esta sesion y recuperar la anterior: exit
    sudo deluser usuario --remove-home -- Para borrar un usuario y su carpeta personal
    sudo deluser usuario grupo --  Para borrar un usuario del grupo
    sudo delgroup grupo -- Para borrar un grupo
    sudo deluser usuario --group grupo  -- Para borrar un grupo y su carpeta personal
    sudo passwd -u nombre_de_usuario -- permite desbloquear la cuenta
    sudo passwd -S nombre_de_usuario -- comprueba si la cuenta esta bloqueada

    GRUPOS
    sudo usermod + nombre_usuario -- modifica una cuenta de usuario existente
    sudo usermod -G grupo1,grupo2 usuario  -- Establecer grupos secundarios
    sudo usermod -a -G sinsinf usuario --  Añadiendo al grupo sisinf, sin borrar los anteriores
    sudo usermod g nuevogrupo -G anteriorgrupo usuario -- Cambio de grupo principal de un usuario, manteniendo el anterior como secundario
    sudo usermod -d /home/nuevousuario -- Cambio de directorio personal
    -m --  Copia del contenido del antiguo directorio personal se añade

    CAMBIO DE PERMISOS A USUARIOS
    sudo chown nuevopropietario fichero_o_directorio -- Cambio de propietario
    sudo chown nuevopropietario: nuevogrupo fichero_o_directorio -- Cambio de propietario y grupo
    sudo chown: nuevogrupo fichero_o_directorio -- Cambio de grupo   

    PASSWORD
    pam_passwdqc.so -- host de comprobacion de autentificacion de password predeterminada
    man shadow -- ves la documentacion de las password
    /etc/passwd -- archivo donde se enencuentran las passwd
    passwd usuario -- cambia de forma interactiva la password de un usuario
    echo "nombreUsuario:passwd" | chapsswd -- cambia la password de ese usuario sin preguntar ===> MUY UTIL PARA SCRIPTS

PRACTICA
ALTA USUARIOS
pedir por teclado el nombre del usuario a crear: ====> comprobar q no esta vacia, si esta vacio mostrar mensaje de error y salir
pedir la nueva contaseña del usuario ===> no puede estar en blanco
Repetir la nueva contraseña del usuario ====> no puede estar en blanco y debe coincidir con valor de arriba
SI COINCIDEN poner esta contraseña a la cuenta ===> usando el comando chpasswd
Pedir los comentarios a poner a la cuenta
pedir la shell ===> si esta vacio, se pone por defecto /bin/bash
con esos datos, crear la cuenta comprobarlo en el fichero /etc/passwd (buscando la linea con grep)

2º) Borrar usuario
pedir usuario a borrar===> comprobar qe no esta vacio y que el usuario existe
Pedir si realmente estas seguro de querer borrarlo: ....Si o NO
Si es afirmativo, borrar la cuenta

pam_chauthtok() failed, error: Error de manipulación del testigo de autenticación

    
