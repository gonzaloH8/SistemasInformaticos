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
  man shadow

  brute force attack jhon the ripper -- forzado de hash
  echo "Hola1234" | sha512sum -- generador de hash 
  
  sed - e "s/textoO/textoM/g" fichero ---> es un editor de texto online
