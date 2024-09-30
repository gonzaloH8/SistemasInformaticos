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
    \ permite escapar una interpretacion distinta a la que queremos
    
# OPERADORES DE COMPARACION
    -eq -- igualdad ==
    -ge -- mayor o igual >=
    -le -- menor o igual <=
    -gt -- mayor que >
    -lt -- menor que <

# OPERADORES LOGICOS
    && -- AND necesita que se cumplan ambas condiciones especificadas
    || -o -- OR necesita que se cumpla una de las condiciones especificadas
    | -- permite ejecutar varios comandos por separado al mismo tiempo

# VARIABLES
    declare -r variableConstante = 123 -- solo lectura
    variableModificable = 123
    vairbleString = "Hola"

# ARRAYS
    nombresArrays = (( "Jone", "Mark", "Irina" )) -- sintaxis para definir un array
    echo "Los nombres son: ${nombresArrays[*]}"
    echo "Los nombres son: ${nombresArrays[@]}"
    echo "Item 0: ${nombresArrays[0]}"
    echo "Los indices: ${!nombresArrays[@]}"
    echo "el total de items: ${#nombresArrays[@]}"
    echo "el total de items: ${#nombresArrays[*]}"
    
    
# CONDICIONAL IF ELIF ELSE
     age=10 -- variable
     if [ age -eq 18 ]
     then
     echo "eres un adulto"
     elif [ $age >= 17]
     echo "eres casi un adulto"
     else
     echo "eres un niño"
     fi

     if [[ $age -gt 10 && $age -lt 30 ]]
     if [[ $age -gt 10 -o $age -lt 30 ]]

# CONDICIONAL CASE
    Se utiliza normalmente para textos
    echo "escoge entre el valor 1 o 2 "
    read valor
    case $valor in 
        1)
            echo "escogiste el 1"
        ;; -- misma funcionalidad que el break
        2) 
            echo "escogistes el 2"
        ;;
        *)
        echo "valor incorrecto"
        ;;
        esac

# BUCLES
    number =1
    while [ $number -lt 10 ] -- mientras sea cierto se ejecuta el do
    do
    echo $number
    number = $((number + 1))
    done

    until [ $number -ge 10 ] -- mientras no sea falso se ejecuta el do
    do
    echo $number
    number = $((number + 1))
    done

    for i in {0..100} -- bucle normal
    do
        echo $i
    done

    for i in {0..100..10} --bucle indicando el incremento deseado

    for (( i=0; i < 10; i++ ))
    do
    echo $i
    done

# BREAK Y CONTINUE
    for (( i=0; i < 10; i++ ))
    do
    if [ $1 -gt 6 ] -- nos pemite para el bucle en cuanto se cumple la condicion
        break
    fi
    echo $i
    done

    for (( i=0; i < 10; i++ ))
    do
    if [ $1 -gt 6 ] -- nos pemite saltarnos el 6 y continuar con el bucle
        continue
    fi
    echo $i
    done

# ARGUMENTOS
    ./arguments.sh 10 20 30 Argumento -- sintaxis de argumentos
    echo $1 $2 $3 $4 -- muestra los argumentos especificados
    echo $@ -- muestra todos los argumentos
    echo $# -- cuenta los argumentos
    args=("$@) -- guarda todos los argumentos en una variable, se convierte en una array
    echo "Result: ${args[0]} - $args{args[1]} , $args{args[2]}"

# INPUT
    while read line
    do     
        echo $line
    done "${1:-/dev/stdin}" -- permite leer lo que escribe el usuario por terminal al momento de escribirlo 

# STANDAR OUTPUT Y STANDAR ERROR
    output -- es aquello que nos muestra por terminal cuando el comando es correcto
    ls 1>file-txt -- permite guardar el resultado del comando en un fichero 1
    ls >file.txt -- permite guardar el resultado del comando en un fichero por defecto
    ls >& file.txt -- permite guardar el resultado del comando en un fichero

    error -- es aquello que nos muestra por terminal cuando el comando es incorrecto
    ls -123 2>file.txt -- permite guardar el resultado de error del terminal a un fichero
    ls 1>fichero.txt 2>&1 -- permite guardar el resultado de error del terminal mediante parametro al fichero
    ls -123 >& file.txt -- permite guardar el resultado de error del terminal a un fichero

# EXPORTAR VARIABLES
    firts.sh
    MESSAGE="hola mundo"
    export MESSAGE
    ./second.sh

    second.sh
    echo "Contenido del script 1: MESSAGE"

# COMPARACIONES CON STRINGS
    echo ${name,,} -- convierte el nombre en miniscula
    echo ${name^^} --convierte el nombre en mayuscula
    echo ${name,,[AEIOU]} -- convierte en minuscula las vocales
    echo ${name^^[aeiou]} -- convierte en mayuscula las vocales

# NUMBERS
    echo $(( 10 + 20 )) -- sintaxis para operar aritmetica
    echo $(( x - y )) --sintaxis para operar aritmetica con variables
    
