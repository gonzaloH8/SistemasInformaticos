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
    rm -r /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(necesita confirmacion)
    rm -rf /ruta/directorio -- borrara todos los archivos y directorios que se encuentren dentro de el(sin confirmacion)
    cp archivo1.txt archivo2.txt-- copia conteido del primer archivo al segundo.
    mv /ruta /ruta-- permite mover archivos desde la consola y cambiar el nombre en la ubicacion de destino
