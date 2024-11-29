#!/bin/bash
# Ejercicio 4 Gonzalo San Andres Anton 1º DAW
clear
(crontab -l 2>/dev/null ; echo '0 15,22 1,15,30 * 5 ./ejercicio3.sh') | crontab
* 15,22 1,15,30 * 5 Escritorio/Scripts/Examen/backup_grupos.sh
fecha=$(date '+%Y-%m-%d__%H:%M')
logger -p daemon.info -t "[backup_grupos.sh]" "mensaje mandado por script: backup_grupos.sh a las $fecha..."
