# BUSQUEDA DE CONTENIDO 30-09-2024
      grep [-opciones] /ruta/fichero
        -e -- patron o expresion-regular

# PATRONES
Patron lo conforman una serie de caracteres con un significado especial:  
<a href="https://emailregex.com/">Patron de Email</a>
<a href="https://10minutemail.com/">Email temporales</a>

    ^ -- principio de linea o cadena
    $ -- fin de linea o cadena
    . -- en esa posicion de la expresion puede aparecer cualquier caracter
    * -- cero o mas repeticiones de la anterior expresion a partir de esa posicion
    + -- una o mas repeticiones de la expresion anterior en esa posicion
    ? -- cero o una repeticion de la expresion anterior.Opcional
    {n,m} -- la expresion anterior se repite mas de n-veces pero menos de n-veces
    {n,} -- la expresion anterior se repite exactamente n-veces
    [^._-$#] -- en esa posicion NO PUEDE aparecer cualquier caracter enumerado en la lista
    (expresion1 | expresion2 | ...) -- en esa posicion puede darse cualquiera de esas expresiones, es un OR
    \caracter -- permite tomar de forma literal ese caracter, evita errores de ejecucion (ESCAPA EL CARACTER)
    \d -- en esa posicion aparece un digito, sinonimo de [0-9]
    \w -- en esa posicion aparece una palabra, sinonimo de [a-zA-Z]+
    /s -- en esa posicion aparece un espacio en blanco
    \t -- tabula un mensaje
    \n -- salto de linea

# PRACTICAS
        -patron definido asi: ^[0-9]{8}-[a-zA-Z]$ --- que empieze por un numero de 8 numeros con un guion y con una letra
        ¿Cumplen estos campos el patron?
            aAfasdf12323 NO --- empieza por letra
            12345435645654Z NO --- contiene mas numeros de los permitidos
            000-ADFc NO --- no llega a la cantidad de numeros exigido
            08982312-T SI ----- cumple con la cantidad de numeros exigida, guion y letra unica exigida

        - define un patron para validar numeros de telefono movil (ej: +34 688 88 11 22, el +34 es opcional)
              ^(\+[0-9]{2})?[0-9]{9}$

        - define un patron para validar emails: gmail, msn, hotmail, yahoo. gonzasaa8@gmail.com
              ^.+@(gmail|hotmail|msn|hotmail|yahoo)\.[a-z]{2,3}

# PRACTICA CON GREP Y EXPRESIONES REGULARES
        - crear en tus Documentos un fichero texto llamado DATOS_CLIENTES.txt con este formato:
            nombre_cliente : apellidos_cliente : NIF : tel movil : email
            (meter varias lineas,ej):
            Gema : Gonzalez Prieto : 08981122-A : +34 677 11 22 33 : gema.gonzalez@educa.madrid.org
            Ferando : Martin Perez : 111aad2 : 677112233 : fermartin@gmail.com
            Alicia : Gonzalez Jimeno : 08782233Q : 66112233 : @
            : : 01234567-Q : +34 666 66 66 66 : devil@gmail.com

      con el comando GREP y con la opcion -e donde pones el patron o expresion regular hay que hacer
            - mostrar las lines que tienen todos los campos ok
            - mostrar las lineas con campo NIF incorrecto
            - mostrar las luineas con campo TEL incorrecto
            - mostrar las lineas con campo EMAIL incorrecto
                  ej: grep -e "^.*$" /home/profesor/Documentos/DATOS_CLIENTES.txt
