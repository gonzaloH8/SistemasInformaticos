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
    nombresArrays = (( "Jone", "Mark", "Irina", "Jone", "Hulk", "Aroa" )) -- sintaxis para definir un array
    echo "Los nombres son: ${nombresArrays[*]}"
    echo "Los nombres son: ${nombresArrays[@]}"
    echo "Item 0: ${nombresArrays[0]}"
    echo "Los indices: ${!nombresArrays[@]}"
    echo "el total de items: ${#nombresArrays[@]}"
    echo "el total de items: ${#nombresArrays[*]}"
    echo "el ultimo elemento es: ${nombresArrays[${nombresArrays[@]}-1]}"
    for nombresArray in ${nombresArrays[@]}
        do
            echo "My name is: $nombresArray" -- muestra todos los nombres
        done
    unset names[1] -- elimina el elemento de la posicion 1
    echo "Los nombres son: ${nombresArrays[*]}" 
    nombresArrays[7]="boob" -- añade un elemento nuevo al array
    nombresArrays[${nombresArrays[@]}]="bob" -- interpreta la longitud maxima del array y añade un nuevo elemento
    echo "items: ${nombresArrays[*]}"
    nombresArrays+=("Bob") -- forma simple de añadir elementos
    nombresArrays[2]="Ari" -- actualiza los valores en funcion de la posicion

# FUNCIONES
    function hola(){
        local message="Hola" -- me permite hacer que el valor de esta variable solo existe dentro de la funcion
        echo "Hola yo soy $1, tengo $2 años"
    }
    hola "Gonza" 50
    
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

     test
         ! -f el fichero no existe
         -z 

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

# DIRECTORIES AND FILES
    echo "Ingresa el nombre de tu carpeta"
    read carpeta
   
    if [ -d $carpeta ] -- comprueba la existencia de un directorio
    then
        echo "el directoio $carpeta existe"
    else
        echo "el directorio no existe"
    fi
        
    echo "Ingresa el nombre de tu archivo"
    read archivo
    if [ -f $archvivo] -- comprueba la existencia de un archivo
    then
        echo "el fichero $archivo existe"
        read contenido
        echo $contenido >> $ $archivo -- permite ingresar contenido nuevo al archivo
    else
        echo "El fichero no existe"
    fi

    echo "Ingresa el nombre de tu archivo"
    read archivo
    if [ -f $archvivo] -- comprueba la existencia de un archivo
    then
        while IFS= read -r line
        do
            echo $line
        done < $archivo
    else
        echo "El fichero no existe"
    fi
    
ctrl + c cancela la ejecucion de un comando

# CURL
    permite descargar contenido a partir de un URL
    echo "Ingresa tu url"
    read url
    curl -T $url permite ver informacion del elemento a descargar

# DEBUGGING
    bash -x nombreScript.sh -- permite recorrer el archivo paso a paso
    set -x -- permite aplicar donde queremos que empiece a debuggear y donde queremos terminar lo escribimos otra vez
