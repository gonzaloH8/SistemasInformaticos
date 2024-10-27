# ERRORES 400-500
[Errores](https://vicentferrer.com/errores-en-http/)
- 400(Bad Request): en la peticion, el servidor no puede procesar la solicitud.
  - caracteres incorrectors en la URL
  - Cookies con errores(borralas)
  - DNS antiguos
  - Archivos demasiado grandes
- 401(Unauthorized): nos informa de que la peticion http no ha sido ejecutada porque debemos iniciar una sesion
  - 401.1: error de inicio de sesion
  - 401.2: por error de configuracion del servidor
  - 401.3: fallo por ACL
  - 401.4: Auth Filtro
  - 401.5: Auth APP ISAPI CGI
- 403 Forbidden: la autentificacion no es posible, no tenemos permisos y esta prohibido acceder al recurso solicitado.
- 404 Not Found: el servidor no ha podido encontrar la pagina solicitada(contenido borrado, enlace incorrecto o defectuoso). Search Console
- 500 Internal Server Error: por fallo en la programacion o aplicacion web.
  - Otros nombre: 500 Internal Server Error
  - HTTP 500 -Internal Server Error
  - Temporary Error(500)
  - HTTP 500 Internal Error
  - 500 Error
  - HTTP Error 500
  - 500. That's an error
Para saber mas revisar el log de errores de Apache, /error_log.
Si nuestro hosting utiliza Cpanel, tiene una seccion para los errores
    - Error de Permisos: error 500
    - Demasido tiempo de Espera: en caso de que el script de php dependa de recursos y el tiempo de ejecucion lo limite.
    - Fallo en el .htaccess: en este archivo, puede haberse tocado algo
    - Fallo por limite de memoria: el archivo php.ini o wp-config(wordpress) estan limitados de memoria, habra que aumentarla.
- 502 Bad Gateway: error en la comunicacion del servidor web y algunos servidores que actuan por proxy
  - Firewall bloqueando la solicitud: o se ha activado alguna regla por error
  - Fallo en el servidor Proxy: como no puede conectarse al servidor web, nos devuelve un error
  - Fallo en un cluster, o CDN(sobrecarga)
  - Estamos recibiendo un DDOS
