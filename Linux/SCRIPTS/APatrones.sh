# PRACTICAS
# -patron definido asi: ^[0-9]{8}-[a-zA-Z]$ --- que empieze por un numero de 8 numeros con un guion y con una letra
# ¿Cumplen estos campos el patron?
# aAfasdf12323 NO --- empieza por letra
# 12345435645654Z NO --- contiene mas numeros de los permitidos
# 000-ADFc NO --- no llega a la cantidad de numeros exigido
# 08982312-T SI ----- cumple con la cantidad de numeros exigida, guion y letra unica exigida

# - define un patron para validar numeros de telefono movil (ej: +34 688 88 11 22, el +34 es opcional)
# ^(\+[0-9]{2})?[0-9]{9}$

# - define un patron para validar emails: gmail, msn, hotmail, yahoo. gonzasaa8@gmail.com
# ^.+@(gmail|hotmail|msn|hotmail|yahoo)\.[a-z]{2,3}

# PRACTICA CON GREP Y EXPRESIONES REGULARES
# - crear en tus Documentos un fichero texto llamado DATOS_CLIENTES.txt con este formato:
#    nombre_cliente : apellidos_cliente : NIF : tel movil : email
#    (meter varias lineas,ej):
#    Gema : Gonzalez Prieto : 08981122-A : +34 677 11 22 33 : gema.gonzalez@educa.madrid.org
#    Ferando : Martin Perez : 111aad2 : 677112233 : fermartin@gmail.com
#    Alicia : Gonzalez Jimeno : 08782233Q : 66112233 : @
#    : : 01234567-Q : +34 666 66 66 66 : devil@gmail.com

# con el comando GREP y con la opcion -e donde pones el patron o expresion regular hay que hacer
#    - mostrar las lines que tienen todos los campos ok
#    - mostrar las lineas con campo NIF incorrecto
#    - mostrar las luineas con campo TEL incorrecto
#    - mostrar las lineas con campo EMAIL incorrecto
#          ej: grep -e "^.*$" /home/profesor/Documentos/DATOS_CLIENTES.txt

ARCHIVO leeme.txt
PATRONES CORRECTOS
Gema:Gonzalez Prieto:08981122-A:+34 677 11 22 33:gema.gonzalez@educa.madrid.org
Cristina:Peralez Caste:13579012-S:+34 857 05 26 43:Cristina.Peralez@educa.madrid.hotmail
Fernando:Santome Pier:91756201-Z:+34 905 84 00 95:Fernando.Santome@educa.madrid.msn
Alberto:San Andres Anton:98129410-L:+34 859 83 96 33:Alberto.SanAndresAnton@educa.madrid.es
Ana:Caste Miralez:65812059-F:+34 129 85 28 41:Ana.Caste@educa.madrid.com

PATRONES INCORRECTOS
irina:wallace azul:842350183+F:+56 129 53 94 82: 9IrinaWallace@mita.mexico.est
5Irina:wAllace aZul:8423501834-F:+56345129710: _Irina-Wallace=queri.mexico.es
_Irina:wallace azul:842350183+F:+56 a14 65 12 83: #IrinaWallace;nica.brasil.com
-IrInA:wallace azul:842350183+F:+42 012 95 49 81: $IrinaWallace,kike.chile.ogi
Mati:wallace azul:842350183+F:+14 875 58 19 73: %IrinaWallace'loca.argen.est

#!/bin/bash
: <<'END_COMMENT'
    En el archivo leeme.txt busca mediante patrones las siguientes palabras
    Nombres
    Apellidos
    DNI
    Telefonos
    Email
    Linea Completa
END_COMMENT
clear

fichero=/home/gonzalo/Escritorio/Scripts/Practicas/leeme.txt

echo "MENU"
echo "1) Nombres"
echo "2) Apellidos"
echo "3) DNI"
echo "4) Telefonos"
echo "5) Email"
echo "6) Linea Completa"
echo "7) SALIR"

read -p "dime opcion: " opcion
cat $fichero

case $opcion in
1)
    echo "Nombre"
    grep --color -E '^[a-zA-Z]{4,8}' $fichero
;;
2)
    echo "Apellidos"
    grep --color -E '[a-zA-Z]{1,9}\s[a-zA-Z]{1,9}' $fichero
;;
3)
    echo "DNI"
    grep --color -E '[0-9]{8}-[A-Z]{1}' $fichero
;;

4)
    echo -e "\nTelefonos"
    grep --color -E '\+34\s[0-9]{3}(\s[0-9]{2}){,3}' $fichero
;;

5)
    echo "Email"
    grep --color -E '[a-zA-Z]*\.[a-zA-Z]*@[a-zA-Z]*\.(madrid)\.(org|es|com)' $fichero
;;

6)
    echo -e "\nCompleto"
    grep --color -E "^[a-zA-Z]{4}:[a-zA-Z]{1,}\s[a-zA-Z]{1,}:[0-9]{8}-[A-Z]{1}:\+34\s[0-9]{3}(\s[0-9]{2}){,3}:[a-zA-Z]+\.[a-zA-Z]+@[a-zA-Z]+\.(madrid)\.(org)" $fichero

;;
7)
    echo "Salimos del script Patrones"
    exit 0
;;
esac
        echo "Sales de Script"
        ;;
esac
