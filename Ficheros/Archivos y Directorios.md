# ENLACES
<ul>
    <li><a href="https://computernewage.com/2015/06/27/conoce-la-estructura-de-permisos-de-linux-al-detalle/">USUARIOS</a> 
    PERMISOS</li>
    <li><a href="https://victorhckinthefreeworld.com/2017/07/06/comando-cp-de-linux-un-par-de-trucos-utiles/">CP</a> informacion extra</li>
</ul>

# MANEJAR ARCHIVOS Y CARPETAS
    pwd -- indica la ruta completa del directorio de trabajo en el que estas
    cd /ruta de directorio -- permite cambiar de directorio de trabajo. Si ejecutas cd vuelves al direcotio raiz
    cd .. -- va uno hacia atras en la ruta
    cd ../.. -- va dos hacia atras en la ruta
    
    ls -- lista los archivos y directorios de la carpeta de trabajo en la que te encuentres
    ls -a  -- lista todos los archivos visibles y ocultos
    ls -l -- lista los archivos y te muestra informacion de ellos
    ls -i -- muestra los inodos de cada archivo y directorio
    
    find ./Documentos -- permite buscar archivos y te muestra el contenido de estos
    find ./Documentos -name archivo.txt
    find ./Documentos -name *.pdf -- busca todos los archivos con este nombre(extension)
    locate archivo.txt -- permite localizar archivos. Algo parecido a find
    
    mkdir /ruta/nombreDirectorio -- permite crear directorios
    rmdir /ruta/directorio -- permite eliminar el directorio especificado
    rm /ruta/archivo permite eliminar archivos sueltos y directorios que no se encuentren vacios
    rm -d Directorio -- permite borrar directorio
    rm -r /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(necesita confirmacion)
    rm -rf /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(sin confirmacion)
    cp archivo1.txt archivo2.txt-- copia conteido del primer archivo al segundo.
    mv /ruta /ruta-- permite mover archivos desde la consola y cambiar el nombre en la ubicacion de destino

# ESCANEAR EL CONTENIDO DE UN ARCHIVO DE TEXTO
        touch nombreArchivo -- permite crear uno o varios archivos vacios en formato txt
        > fichero1.txt > fichero2.txt -- permite crear fichero vacios
        
        echo -e 'contenido' >> fichero.txt -- permite agregar un texto y crear el fichero que lo contenga al mismo tiempo
        echo 'contenido' > fichero.txt .. sobreescribe el contenido del fichero
        
        cat >> nombreArchivo contenido -- crea un archivo con el conteido inidcado. CTRL + D finaliza
        cat > Archivo.txt contenido -- sobreescribe el contenido
        cat nombreArchvio -- imprimira en la terminal el contenido del archivo
        cat -n nombreArchivo -- imprime el contenido y hace un conteo de lineas
        cat -b -- imprime el contenido y numero solo aquellas que contengan texto, descarta las lineas en blanco

        more -- imprime el contenido paginado. Adecuado para archivos largos

        less -- muestra el contenido en modo editor de texto
        g + Enter -- avanza por defecto una linea adelante
        :1 -- marcas la g e introduces el numero deseado avanzamdo esa contidad de lineas
        q -- permite salir del editor de texto

        VIM -- editor de texto mas complejo
        sudo apt intall vim -- instalacion de vim
        vim -- abre el editor de texto
        :help -- archivo de ayuda sobre los comandos de vim

        ejecucion=$(ls) -- guardar comandos en variables

# COMPARACION DE ARCHIVOS DE TEXTO
    diff parametros archivo1 archivo2 -- compara dos archivos linea por linea. Muestra las diferencias 1ºArchivo < 2ºArchivo >
    diff -b .. hacemos la comparacion sin tener en cuenta los espacios en blanco

    cmp archivo1 archivo2 -- compara dos archivos byte a byte
    cmp -b archivo1 archivo2 -- nos muestra los byte diferentes, numero de linea y contenido que varia

# NANO
    NANO -- abres el editor de texto
        CTRL + R -- permite abrir un archivo de texto y mostrar su contenido
        CTRL + V -- permite avanzar a la pagina siguiente
        CTRL + Y -- permite retrocer a la pagina anterior
        CTRL + W -- abre un buscador de palabras dentro del texto
        CTRL + X -- permite salir del editor de texto
