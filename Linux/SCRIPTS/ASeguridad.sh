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


MI PRACTICA
#!/bin/bash
clear
echo "BACKUP TOTAL"
echo "1) Crea una carpeta y ficheros en Documents"
echo "2) Empaqueta el contenido creado en el punto 1"
echo "3) Mira el contenido"
echo "4) Restaura el contenido"
echo "BACKUP INCREMENTAL"
echo "5) Crea un fichero para el backup Incremental"
echo "6) Copia el contenido si ha sido modificado"
echo "CPIO"
echo "7) Haz un backup con CPIO"
echo "*) SALIMOS DEL SCRIPT"

read -p "Dime opcion: " opcion

case $opcion in
1)
    mkdir /home/gonzalo/Documentos/Empaquetador
    cd /home/gonzalo/Documentos/Empaquetador
    touch fich{1..4}.txt
    touch leeme.txt
;;

2)
    tar -cvzf /tmp/backup_empaque.tar.gz /home/gonzalo/Documentos/Empaquetador
;;

3)
    tar -tvzf /tmp/backup_empaque.tar.gz
;;

4)
    mkdir /home/gonzalo/Escritorio/Extraccion
    cd /home/gonzalo/Escritorio/Extraccion
    tar -xvzf /tmp/backup_empaque.tar.gz 
;;

5)
    tar -cvzf /tmp/backup_total.tar.gz -g /tmp/fichero_snap /Documentos/Empaquetador
;;

6)
    tar -cvzf /tmp/backup_incremental.tar.gz -g /tmp/fichero_snap /home/gonzalo/Documentos/Empaquetador
;;

7)

;;

*)
    echo "Salimos del Script"
    exit 0
;;
esac


PRACTICA SERVER
config serv
Hay que tener instalado el paquete: openssh-server
                                    sudo apt install openssh-server
                                    sudo systemctl enable ssh.service
                                    sudo systemctl daemon-reload
                                    sudo systemctl status ssh.service ===> debe estar arrancado
2º paso)
    Nos creamos directorio de destino de backups:
        mkdir /tmp/backups_cliente

config cliente
1º paso: generamos claves publica y privada para cifrar trafico
    ssh-keygen -f /home/gonzalo/.ssh/id_rsa -- guardas las claves. Genera un fichero con claves publicas y un fichero con claves privadas
    Enter password-key: ""
    Re-Enter password-key: ""

Vemos si las ha generado: ls -l /home/gonzalo/.ssh ===> crea dos ficheros: id_rsa(clave privada)
                                                                           id_rsa.pub(clave publica)

2º paso necesitamos subir (copiar) la clave publica al servidor para que pueda descifrar el trafico generado con la clave privada del cliente en la conexion ssh con rsync. 
    En el servidor el cliente tiene una cuenta llamada: gonza
    (necesito saber la ip del servidor) ejecutar comando: ipconfig o bien: ip address show
        scp /home/user/.ssh/id_rsa.pub user_server@ip_server:/home/user/.ssh/authorized_keys    -- permite copiar ficheros desde una maquina local a una del servidor
            --------------------------         ----------------------------
            origen local cliente            destino remoto servidor: gondaw@10.0.2.15:/directorio_destino/nombre_fich/

3º paso) ejecutamos backup
    rsync -a -v -z -e 'ssh -i /home/gonzalo/.ssh/id_rsa' /home/gonzalo/Documents gondaw@10.0.2.15:/tmp/backups_cliente
                        cifrar trafico con clave privada        origen-backups        destino en server de ficheros
    para comprobar si ha sido ok, ir al server y ver el contenido del directorio: /tmp/backups:cliente
