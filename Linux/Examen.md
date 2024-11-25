duración: 2h 30min
| |   | | '_ \| | | \ \/ /  / _` |/ _` | '_ ` _ \| | '_ \  !! No se corrige ningún ejercicio con fallos de sintaxis, sin que se ejecute !!
| |___| | | | | |_| |>  <  | (_| | (_| | | | | | | | | | | == copy/paste de código de ia o de otro compañero, puede suponer q te pregunte por el mismo para q me lo expliques bien ==
|_____|_|_| |_|\__,_/_/\_\  \__,_|\__,_|_| |_| |_|_|_| |_|

=================================================================================================
===> OJO!!! HAY QUE INSTALAR mysql asi como root:   apt install -y mysql-server mysql-client 
=================================================================================================

Nos pasan una base de datos llamada DATOSEX dentro de un fichero "datosex.sql" creada con MYSQL con dos tablas, una llamada "usuarios" y otra llamada "grupos". 
Para restaurar la BD desde el fichero y acceder a los datos, ejecutar estos comandos por orden:

			sudo mysql -uroot -e 'create database datosex;'
			sudo mysql -uroot  datosex < datosex.sql

Hay q hacer un script que leyendo el contenido de ambas tablas genere las cuentas de usuario y de grupo en el sistema:

  1º ejercicio: 3 puntos
  ----------------------
	- tabla usuarios, para ver contenido:
 
		sudo mysql -uroot  datosex -e 'select * from usuarios;' <---------- este comando te da por pantalla las filas con info de usuarios a dar de alta en el sistema
										hay q ir leyendo fila por fila la salida del comando como si fuera un fichero, creando las cuentas de
										 usuario con las características que te dicen de uid, login,...

										

  2º ejercicio: 3 puntos
  ----------------------
	- tabla grupos, para ver contenido:

		sudo mysql -uroot  datosex -e 'select * from grupos;' <------------ este comando te da por pantalla las filas con la info de grupos a dar de alta en el sistema
										hay q ir leyendo fila por fila la salida del comando como si fuera un fichero, creando las cuentas de 
										grupo con las características que te dicen de gid, grupo,...

  3º ejercicio: 3 puntos
  ----------------------
  hacer un script para que haga un BACKUP TOTAL de los usuarios que pertenecen al grupo "profesores" (debes comprobar que su uid es mayor de 7000 y menor de 7999) de su directorio Documentos
  de todos los ficheros y directorios, EXCEPTO los directorios donde tienen maquinas virtuales, llamados "Virtual Machines" dentro de Documentos y SOLO FICHEROS en formato: .pdf, .txt, .word, .wordx, .odt, .ppt, .pptx
  
  el backup hay q hacerlo con TAR y se almacenara en el directorio /tmp/backups_PROFESORES/<nombre_usuario>  con nombre: backup_Documents_<nombre_usuario>_<fecha>



  4º ejercicio: 1 punto
  ---------------------
  programar una tarea para que ejecute el script de backups del ejercico 3 para que se ejecute todos los viernes 1,15 y 30 de mes, a las 15:00 y a las 22:00
  cuando  se ejecute la tarea, se debe mandar  un mensaje al LOG para que lo intercepte Rsyslog con el siguiente mensaje:

	' ------------ script backups de usuarios grupo "profesores" ejecutado a las ..... mira directorio de backups /tmp/backups_PROFESORES -------'
