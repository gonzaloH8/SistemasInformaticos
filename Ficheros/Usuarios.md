#CREACION DE USUARIOS Y GRUPOS

    adduser + nombreUsuario -- Añadir usuarios
    sudo addgroup + nombreGrupo -- Crear un grupo
    sudo adduser + nombreUsuario + nombreGrupo -- Añadir un usuario al grupo
    groups + nombreUsuario -- Comprobacion de en que grupos esta el usuario
    su + nombreUsuario -- Cambiar de usuario
    
    sudo usermod -G grupo1,grupo2 usuario  -- Establecer grupos secundarios
    sudo usermod -a -G sinsinf usuario --  Añadiendo al grupo sisinf, sin borrar los anteriores
    sudo usermod g nuevogrupo -G anteriorgrupo usuario -- Cambio de grupo principal de un usuario, manteniendo el anterior como secundario
    sudo usermod -d /home/nuevousuario -- Cambio de directorio personal
    -m --  Copia del contenido del antiguo directorio personal se añade
    
    sudo chown nuevopropietario fichero_o_directorio -- Cambio de propietario
    sudo chown nuevopropietario: nuevogrupo fichero_o_directorio -- Cambio de propietario y grupo
    sudo chown: nuevogrupo fichero_o_directorio -- Cambio de grupo
    
    sudo deluser usuario --  Para borrar un usuario
    sudo deluser usuario --remove-home -- Para borrar un usuario y su carpeta personal
    sudo deluser usuario grupo --  Para borrar un usuario del grupo
    sudo delgroup grupo -- Para borrar un grupo
    sudo deluser usuario --group grupo  -- Para borrar un grupo y su carpeta personal
