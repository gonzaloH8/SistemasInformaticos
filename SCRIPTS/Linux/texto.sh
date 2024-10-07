# SCRIPT DE TEXTO

    #! /bin/bash -- nos permite escribir por terminal y que se imprima en el fichero de texto, sobrescribiendolo
    cat > hola.txt 

    #! /bin/bash -- nos permite escribir por terminal y que se añada a lo ya existente en el archivo de texto
    cat >> hola.txt 

    #! /bin/bash -- nos permite leer en terminal un texto escrito en el ejecutable
    cat << myText
    esto es un texto que se mostrara por la terminal
    myText

    #! /bin/bash
    echo "Introduce tu edad: "
    read  age -- creamos una variable que obtendra como valor aquello que escriba el usuario por terminal
    echo "Esta es tu edad: $age años" -- 
