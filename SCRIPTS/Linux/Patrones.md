#! /bin/bash

clear

fichero=/home/gonzalo/Escritorio/Scripts/Pruebas/DATOS_CLIENTES.txt

grep -e '^[0-9]{8}' $fichero
