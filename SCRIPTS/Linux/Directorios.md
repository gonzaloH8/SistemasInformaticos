#! /bin/bash
# - 1 situaros en directorio "Musica" del perfil de tu usuario y ver contenido
# - 2 Crearos dentro del mismo estos directorios
#    heavy/instrumental,hardcore/trash-metal,death-metal), dance, pop, trap, regatton
# - 3 ver con tree si todo esta creado ok
# - 4 borrar directorios trap y regatton
# - 5 renombrar directorio pop a Happy-pop 
# - 6 meter algun fichero en directorio Happy-Pop y copiar su contenido en /tmp/Happy-Pop
clear

echo "Dime una opcion a ejecutar"
read opcion

case $opcion in
    1)
        mkdir -p Heavy/Instrumental | mkdir -p Heavy/Hardcore/trash-metal | mkdir -p Heavy/Hardcore/death-metal | mkdir Dance | mkdir Pop |
        mkdir Trap | mkdir Regatton
        ;;
    2)
        rm -d Trap | rm -d Regatton
        ;;
    3)
        mv Pop Happy-pop
        ;;
    4)
        rm -r Generos
        ;;
    *)
        echo "No has creado ningun directorio"
        ;;
esac
