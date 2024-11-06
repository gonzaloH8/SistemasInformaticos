# PRACTICA
backup del directorio documentos /home/gonzalo/Documents en fichero /tmp/backup_documentos.tat.gz
tar -c -v -z -f /tmp/fichero_tar_backup.tar.gz /home/gonzalo/Escritorio/

# PRACTICA
    mkdir /tmp/mibackup
    cd /tmp/mibackup
    tar -x -v -z -f /tmp/backup_documentos.tar.gz
    
# PRACTICA
# creamos script para hacer backup total de directorio Documents de todos los usuarios q no sean del sistema; vamos a programarlo para que se ejecute cada 2 min como tarea cron
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

# PRACTICA
#!/bin/bash
# crear en /tmp un directorio llamado pruebas: dentro de este directorio crear 4 ficheros de texto llamados  
# creamos backup total con fichero snapshot
# comprobar con ls q esta creado el fichero tar.gz y el fichero de snapshot
# mirar el contenido del fichero tar.gz comprobar que tiene los 4 ficheros de texto
# mirar el contenido del fichero snapshot
# en el directorio pruebas crear un nuevo fichero llamado LEEME.txt y subdirectorio llamando "otros" Dentro de "otros" meter un fichero lamado: fich_otros.txt
# creais backup incremental del directorio /tmp/pruebas
# comprobar con ls que esta creado ficher .tar.gz
# mirar su contenido !!! SOLO HA DEBIDO COPIAR el fichero: LEEME.txt y /tmp/pruebas/otros/fich_otros.txt
# restaurar contenido del backup total e icnremental en directorio /tmp/copia_pruebas
# crear directorio /tmp/copia_pruebas
# restauramos backup total
# comprobar con ls q se ha restaurado los ficheros:   fich1.txt fich2.txt fich3.txt fich4.txt
# restauramos backup incremental
clear

fich1.txt fich2.txt fich3.txt fich4.txt
tar -c -v -z -f /tmp/backup_total_pruebas.tar.gz -g /tmp/pruebas_snap /tmp/pruebas/
tar -c -v -z -f /tmp/backup_incremental_pruebas.tar.gz -g /tmp/pruebas_snap /tmp/pruebas/
cd /tmp/copia_pruebas
tar -x -v -z -f /tmp/backup_total_pruebas.tar.gz -g /dev/null
cd /tmp/copia_pruebas
tar -x -v -z -f /tmp/backup_incremental_pruebas.tar.gz -g /dev/null
comprobar con ls q se ha restaurado ya fichero LEEME.txt y directorio "otros" con fichero fich_otros.txt


# PRACTICA SCRIPT
#    CREACION BACKUP
# 1. crear backup total aislado ===> pedir el directorio a copiar(comprobar que existe, si no existe, error).
#                                   pedir el directorio destino del backup(comprobar q existe, si no existe, error)
#                                   hacer backup con TAR llamado: backup_TOTAL_nombre_directorio_fecha_hora.tar.gz
# 2. crear backup total+Incremental ====> pedir directorio a copiar(comprobar que existe, si no existe, error)
#                                         pedir el directorio destino de los backup totales e incrementales(comprobar q existe, si no existe, error)
#                                         hacer 1º backup total con tar llamado: backup_TOTAL_nombre_directorio_feche_hora.tat.gz
#                                           el dichero snap meterlo en directorio destino backups: nombre_directorio_snap
#                            el propio script debe ser capaz de programar una tarea para q se ejecute al dia siguiente y haga el backup incremental de ese directorio usando ese dichero snap
# 4. ===SALIR===
# 5. opcion_
