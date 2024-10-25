# ENLACES
<ul>
    <li><a href="https://computernewage.com/2023/04/15/gnu-linux-formatos-compresion-archivos/">FORMATOS DE COMPRESION</a></li>
</ul>

# COMPRIMIR Y DESCOMPRIMIR ARCHIVOS
    gzip -- comprimira en formato gz(LINUX)
    gzip -9 archivo -- comprime el archivo
    gzip -1 archivo.gz -- permite saber los parametros del archivo(compresion o el nombre del archivo una vez descomprimido)
    gxip -d archivo.gz -- permite descomprimir un Gzip

    bzip2 -- comprimira en formato bz2(LINUX)
    bzip2 -z archivo -- comprimira el archivo
    bzip2 -t archivo-bz2 -- hace un test de integridad
    bzip2 -d archivo-bz2 -- descomprime el archivo

    tar -- permite el empaquetado y desempaquetado
    tar -cvf paquete.tar archivo1 archivo2 -- empaquetas los archivos(no recomendada)
    tar -cvf paqueter.tar directorio -- empquetas todo de una
    tar -tvf paquete-tar -- te lista todo lo que contiene de forma recursiva
    tar -xvf paquete.tar -- desempaqueta
    tar -czvf paquete.tar.gz archivo1 archivo2 -- comprime los archivo en formato gz
    tar -czvf paquete.tar.gz directorio -- comprime un directorio
    tar -xzvf paquete.tar.gz -- descomprime el archivo
    tar -cjvf paquete.tar.bz2 archivo1 archivo2 --comprime los archivos en formato bz2
    tar -xjvf paquete.tar.bz2 -- descomprime el paquete

    zip -- formato zip
    zip archivador.zip archivo1 archivo2 -- comprime y empaquete los archivos
    unzip -1 archivador.zip -- previsualiza la lista de todos los archivos o directorios del paquete archivador.zip 
    unzip archivador.xip -- descomprime el paquete
    unzip archivador.zip archivo1 -- permite descomprimir un archivo en concreto
