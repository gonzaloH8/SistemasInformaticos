# PRACTICA
# creamos script para hacer backup total de directorio Documents de todos los usuarios q no sean del sistema; vamos a programarlo para que se ejecute cada 2 min como tarea cron
#!/bin/bash
clear
#sin usar patrones, tenemos q leer linea a linea el fichero /etc/passwd y partir cada linea por el separador ":" 
#coger la posicion o campo 3 donde esta el UID y preguntar si es mayor o igual de 1000, si es asi hacer backup con tar

       while read linea # almacena cada linea en la variable y la imprime
        do
            idUser=$(echo $linea | cut -d ":" -f 3)
            nombreUser=$(echo $linea | cut -d ":" -f 1)
            if [ $idUser -ge 1000 ]
            then
                tar -c -v -z -f /tmp/backup_${nombreUser}_$(date '+%Y-%m-%d-%H:%M').tar.gz /home/$nombreUser/Documentos
            fi
        done < /etc/passwd 

# MI PRACTICA
#!/bin/bash
clear
echo " BACKUP TOTAL "
echo "1) Crea una carpeta y ficheros en Documents"
echo "2) Empaqueta el contenido creado en el punto 1"
echo "3) Mira el contenido"
echo "4) Restaura el contenido"
echo "BACKUP INCREMENTAL"
echo "5) Crea un fichero para el backup Incremental"
echo "6) Copia el contenido si ha sido modificado, Borra un archivo y comprueba que se ha actualizado"
echo " CPIO "
echo "7) Haz un backup con CPIO"
echo "8) Extramenos el contenido del backup CPIO"
echo " RSYNC "
echo "9) Creamos una copia"
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
    echo -e "COMPRIMIMOS EL CONTENIDO EN EL DIRECTORIO Empaquetador"
    tar -cvzf /tmp/backup_total.tar.gz /home/gonzalo/Documentos/Empaquetador
;;

3)
    echo -e "VEMOS EL CONTENIDO"
    tar -tvzf /tmp/backup_total.tar.gz
;;

4)
    mkdir /home/gonzalo/Escritorio/Extraccion
    cd /home/gonzalo/Escritorio/Extraccion
    tar -xvzf /tmp/backup_total.tar.gz 
;;

5)
    tar -cvzf /tmp/backup_total.tar.gz -g /tmp/fichero_snap /Documentos/Empaquetador
;;

6)
    tar -cvzf /tmp/backup_incremental.tar.gz -g /tmp/fichero_snap /home/gonzalo/Documentos/Empaquetador
;;

7)
    cd /home/gonzalo/Documentos/Empaquetador
    cpio -o > /tmp/backup_doc_office.cpio
;;

8)
    mkdir /tmp/extraer_apuntes_sistemas
    cd /tmp/extraer_apuntes_sistemas
    cpio -i -v -d --no-absolute-filenames < /tmp/backup_doc_office.cpio
    ls -l
;;

9)
    mkdir /tmp/backup_rsync
    rsync -a -v --no-whole-file /home/gonzalo/Documentos/Empaquetador /tmp/backup_rsync
    ls -l /tmp/backup_rsync
;;

10)
    mkdir /home/gonzalo/Documentos/Pruebas
    cd /home/gonzalo/Documentos/Pruebas
    touch fich{1..4}.txt
    cd /home/gonzalo/Documentos
    touch leeme.txt
    rsync -a -v --no-whole-file /home/gonzalo/Documentos/Pruebas /tmp/backup_rsync
    ls -l /tmp/backup_rsync
    cd /home/gonzalo/Documentos/Pruebas
    rm fich1.txt fich2.txt
    rsync -a -v --no-whole-file /home/gonzalo/Documentos/Pruebas /tmp/backup_rsync
    rsync -a -v --no-whole-file --delete --backup --backup-dir=/tmp/ficheros_borrados /home/gonzalo/Documentos/Pruebas /tmp/backup_rsync
;;

*)
    echo "Salimos del Script"
    exit 0
;;
esac

# PRACTICA SERVER
CONFIG SERV
1º) Hay que tener instalado el paquete: openssh-server
        sudo apt install openssh-server
        sudo systemctl enable ssh.service
        sudo systemctl daemon-reload
        sudo systemctl status ssh.service ===> debe estar arrancado
2º paso)
    Nos creamos directorio de destino de backups:
        mkdir /tmp/backups_cliente

CONFIG CLIENTE
1º paso) generamos claves publica y privada para cifrar trafico
    ssh-keygen -f /home/gonzalo/.ssh/id_rsa -- guardas las claves. Genera un fichero con claves publicas y un fichero con claves privadas
    Enter password-key: ""
    Re-Enter password-key: ""

Vemos si las ha generado: ls -l /home/gonzalo/.ssh ===> crea dos ficheros: id_rsa(clave privada)
                                                                           id_rsa.pub(clave publica)

2º paso) necesitamos subir (copiar) la clave publica al servidor para que pueda descifrar el trafico generado con la clave privada del cliente en la conexion ssh con rsync. 
    En el servidor el cliente tiene una cuenta llamada: gonza
    (necesito saber la ip del servidor) ejecutar comando: ipconfig o bien: ip address show
        scp /home/user/.ssh/id_rsa.pub user_server@ip_server:/home/user/.ssh/authorized_keys    -- permite copiar ficheros desde una maquina local a una del servidor
            --------------------------         ----------------------------
            origen local cliente            destino remoto servidor: gondaw@10.0.2.15:/directorio_destino/nombre_fich/

3º paso) ejecutamos backup
    rsync -a -v -z -e 'ssh -i /home/gonzalo/.ssh/id_rsa' /home/gonzalo/Documents gondaw@10.0.2.15:/tmp/backups_cliente
                        cifrar trafico con clave privada        origen-backups        destino en server de ficheros
    para comprobar si ha sido ok, ir al server y ver el contenido del directorio: /tmp/backups:cliente
