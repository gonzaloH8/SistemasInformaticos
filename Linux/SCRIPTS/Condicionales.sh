  # CONDICIONALES
    #! /bin/bash
    
    echo "Dime tu edad"
    read age
    
    if (( $age > 18 ))
    then
        echo "Eres mayor de edad"
    elif (( $age >= 65 ))
    then
        echo "Eres jubilado"
    else
        echo "Eres menor de edad"
    fi
    exit
