# SHELL(bash)
    cat /etc/shells -- nos permite ver los shells a instalar
    cat /etc/bahts -- en caso de que no tengamos ninguno instalado
    echo $SHELL -- permite ver el que tenemos instalado
    
# SHORT COMANDOS
    CTRL + D -- nos permite salirnos de un punto vacio
    chmod +x archivo.sh -- nos permite ejecutar el archivo en terminal y ver el resultado

# COMENTARIOS
    # este es un comentario de una linea
    : 'este es un comentario de dos o mas lineas'

# OPERADORES DE TEXTO
    >
    >>
    <<
    
# OPERADORES DE COMPARACION
    -eq -- igualdad ==
    -ge -- mayor o igual >=
    -le -- menor o igual <=
    -g -- mayor que >
    -l -- menor que <

# OPERADORES LOGICOS


# CONDICIONALES
     age=10 -- variable
     if [ age -eq 18 ]
     then
     echo "eres un adulto"
     elif [ $age >= 17]
     echo "eres casi un adulto"
     else
     echo "eres un niño"
     fi
