# FIREWALL
    sudo ufw status -- Comprobar estado
    sudo ufw enable -- Activar firewall
    sudo ufw disable -- Desactivar firewall

# COPIAS DE SEGURIDAD ====> programacion de tareas
Un backup es una copia de seguridad de ficheros de usuario(s)/sitema, de tal forma que si hay un determinado fallo puedes restaurar el sistema o bien los doc, del usuario(s) a como estaban en el momento de hacer el backup.
(Ataque de cifrado de contenido)

tipos de backup
A lo largo del mes se crea una planificacion de backups
    - backup totales: es una copia de todos los ficheros/directorios de usuario(s)/sistema como si no se hubiese realizado antes ninguna copia nada. 
        Al menos una vez a la semana hacer un backup total(generalmente a primera hora del lunes)
    - backup incrementales: copia de ficheros/directorios que han sido modificados desde el ultimo backup. Estos backup siempre se apoyan en un backup anterior, ya se total o incremental
Entre semana, realizar backup incremental.
Ejemplo: si se cae todo el viernes a ultima hora, para restaurar los datos hay que hacer. Se parte del ultimo backup total y a partir de ahi se recupera los backup incrementales
Almacenamientos de NAS profesionales/domesticos

COMANDOS
    empaquetador tar a los ficheros que crea como backup se les llamar tar-files
    backup total
    1) CREAR UN BACKUP TOTAL A UN FICHERO COMPRIMIDO
        tar -c -v -z -f /ruta/fichero_tar_backup.tar.gz  /ruta_copiar/ -- crear una copia comprimida de tipo tar
        tar -- indica como se ha creado este fichero
        gz -- indica que esta comprimido
            tar -z comprime
            tar -c obligatoria para crear un backup
            tar -v te muestra los procesos de copiado
            -f /ruta/fichero -- indica la ruta y el nombre del fichero de backup o tar-file
        2) VER EL CONTENIDO
            tar -t -v -z -f /tmp/backup_documentos.tat.gz -- muestra el contenido del fichero creado
                 tar -t list backup -- permite ver el contenido del backup
                tar -v modo detallado del contenido del fichero backup
                tar -f /ruta/fichero indicas el fichero tar que quieres ver
        3) RESTAURAR EL CONTENIDO el contenido de un BACKUP: 1º te debes situar en el directorio donde quieres extraer el backup      
            cd /ruta/_extraccion
            tar -x -v -z -f /ruta/fichero_backup.tar.gz /ruta/extraccion
            -x -- EXTRACT BACKUP
            -v -- modo detallado de la extraccion fichero por fichero
            -z -- si esta comprimido con gzip, lo descomprime
            -f /ruta/fichero -- fichero q quieres extraer

    cut -d ':' corta el string por el delimitador definido entre comillas
    cut -d ':' -f 1,3 -- indica la posicion del array creado que se quiere mostrar
    while IFS= read -r line. do. echo "$line" -- lectura de ficheros
    IFS(INPUT FIELD SEPARATOR) -- indica por defecto el salto de linea


        
PRACTICA
backup del directorio documentos /home/gonzalo/Documents en fichero /tmp/backup_documentos.tat.gz
tar -c -v -z -f /tmp/fichero_tar_backup.tar.gz /home/gonzalo/Escritorio/

PRACTICA
    mkdir /tmp/mibackup
    cd /tmp/mibackup
    tar -x -v -z -f /tmp/backup_documentos.tar.gz

PRACTICA
creamos script para hacer backup total de directorio Documents de todos los usuarios q no sean del sistema; vamos a programarlo para que se ejecute cada 2 min como tarea cron
#!/bin/bash
clear
#sin usar patrones, tenemos q leer linea a linea el fichero /etc/passwd y partir cada linea por el separador ":" 
#coger la posicion o campo 3 donde esta el UID y preguntar si es mayor o igual de 1000, si es asi hacer backup con tar

   while read linea # almacena cada linea en la variable y la imprime
    do
        idUser=$(echo $linea | cut -d ":" -f 3)
        nombreUser=$(echo $linea | cut -d ":" .f 1)
        if [ $idUser -ge 1000 ]
        then
            tar -c -v -z -f /tmp/backup_${nombreUser}_$(date '+%Y-%m-%d-%H:%M').tar.gz /home/$nombreUser/Documentos
        fi
    done < /etc/passwd 


