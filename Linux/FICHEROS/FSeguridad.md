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

# COMANDOS
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
        
============================================================
backup INCREMENTAL
con TAR para poder hacer backups incrementales, exige tener referencia un fichero de "snapshot" 
(instantanea de ficheros/directorios copiados) para crear este fichero debes usar opcion -g /ruta/fichero_snap
    1º) cuando haces un backup total, te creas el fichero snapshot asi
        tar -c -v -z -f /ruta/fich_backup_total.tar.gz -g /ruta/fichero_snap /ruta_a_hacer_backup
    2º) haces un backup del mismo directorio a copiar usando ese fichero snap creado en el backup total del paso anterior. 
        De tal forma que antes de copiar un fichero o directorio consulta el fichero snap y mira a ver si lo tiene q copiar o no
        tar -c -v -z -f /ruta/fich_backup_incremental_num.tar.gz -g /ruta/fichero_snap /ruta_a_hacer_backup
