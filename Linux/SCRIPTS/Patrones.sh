#! /bin/bash

clear

fichero=/home/gonzalo/Escritorio/Scripts/Pruebas/DATOS_CLIENTES.txt

echo "MENU"
echo "1) Patron Nombre"
echo "2) Patron Apellido"
echo "3) Patron DNI"
echo "4) Patron telefonico"
echo "5) Patron de EMAIL" 
echo "*) SALIDA DEL SCRIPT"

read -p "Dime opcion a buscar en '$fichero' "  opcion

case $opcion in
    1)
    grep --color -E '^[A-Z][a-z]{1,9}' $fichero
    ;;

    2)
    grep --color -E '[a-zA-Z]*\s[a-zA-Z]*' $fichero
    
    ;;

    3)
        grep --color -E '[0-9]{8}-[A-Z]' $fichero
    ;;

    4)
        grep --color -E '\+[0-9]{2}?\s[0-9]{3}\s[0-9]{2}\s[0-9]{2}\s[0-9]{2}' $fichero
    ;;

    5)
        
        grep --color -E '[a-zA-Z]*\.[a-zA-Z]*@[a-zA-Z]*\.[a-zA-Z]*.\org' $fichero
    ;;

    *)
        echo "Sales de Script"
        ;;
esac
