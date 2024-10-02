# SERVICIOS
<ul>
    <li><a href="https://computernewage.com/2014/08/10/como-configurar-el-firewall-ufw-en-ubuntu/">UFW</a> ampliado</li>
</ul>

    UFW: servicio que se encarga de gestionar el cortafuegos del kernel en Ubuntu
    sudo systemctl status -- nos permite ver todos los servicios cargados en tu sistema
    sudo systemctl status ufw -- nos permite conocer el estado de ufw, si esta activo en memoria o no.
    sudo systemctl star ssh -- nos permite iniciar el servicio
    sudo systemctl stop ufw -- nos permite detener el servicio
    sudo systemctl restart ufw -- nos permite reiniciar el servicio
    sudo systemctl is-enabled ufw -- comprueba si el servicio esta configurado para iniciarse en cada arranque o no
    sudo systemctl enable ufw -- permite habilitar un servicio
    sudo systemctl disable ufw -- permite deshabilitar un servicio
    
    sudo service --status-all -- permite ver un listado plano de todos los servicios
    sudo service --status-all | grep + -- permite ver los servicios que esten iniciados
    sudo service ufw status -- nos permite ver el estado de un servicio en concreto
    sudo service ufw start -- permite iniciar el servicio
    sudo service ufw stop -- permite detener el servicio
    sudo service ufw restart -- permite reiniciar el servicio

    sudo /ent/init.d/ufw status -- fichero de configuracion dentro del directorio init.d. Comprueba el estado del servicio
    sudo /ent/init.d/ufw start -- inicia el servicio
    sudo /ent/init.d/ufw stop -- para el servicio
    sudo /ent/init.d/ufw restart -- reinicia el servicio
