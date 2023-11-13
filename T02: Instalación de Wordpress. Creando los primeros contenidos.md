T02: Instalación de Wordpress. Creando los primeros contenidos.

En esta práctica instalarás Wordpress en la MV con Ubuntu Server y empezarás a crear tus primeros contenidos.

Recuerda que el contenido que publiques estará visible en Internet, así que sé cuidadoso/a con el lenguaje e imágenes utilizados

    1. Realiza la instalación de Wordpress. Sigue para ello el enlace siguiente (disponible también en la zona de recursos):
       
       https://comoinstalar.me/como-instalar-wordpress-en-ubuntu-22-04-lts/
      
IMPORTANTE!

    • La instalación inicial la tienes que realizar conectado por ssh a tu MV en Azure
    • Deberás deshabilitar el sitio web creado con Dokuwiki de la practica anterior:
      sudo a2dissite dokuwiki.conf
    • Para entrar a la base de datos, utiliza el comando sudo mariadb (en lugar de mysql -u root -p) Al crear el usuario de la base de datos, hay que poner una contraseña fácil de recordar en lugar de ‘XXXXXXXX’;
    • En la parte de PHP, instala la versión de las librerías del respositorio por defecto de Ubuntu (primera opción, la que no especifica el número de versión de php)
    • En la parte de Servicio web, realizar la configuración para Apache, no para Nginx.
    • Una vez instalado los componentes de wordpress, hay que realizar la configuración inicial, abriendo para ello en un navegador la URL: http://smrserverxxx.westeurope.cloudapp.azure.com/wordpress (siendo smrserverxxx el nombre de tu MV en Azure). Escribe los datos del usuario de la BD (usuario de base de datos ‘wordpress’ y la contraseña que has puesto). El resto de campos los puedes dejar por defecto en la primera pantalla.
    • Como título del sitio, debe aparecer: Sitio Web de Nombre, Apellidos (poniendo ahí tu nombre). Crea un usuario y no olvides la contraseña, lo utilizarás para administrar tu Wordpress.



    2. Entra a tu sitio web de Wordpress con el usuario creado y comprueba en Inicio→Actualizaciones que tienes la última versión estable de wordpress con todos los componentes actualizados (wordpress, plugins, temas, ...). Actualízalos si  no es así. Borra la entrada y la página de ejemplo.

    3. En la biblioteca de medios, añade imágenes de algunos personajes de la serie Juego de Tronos.
          
    4. Crea una categoría Casas, y por lo menos cuatro subcategorías de dicha categoría con nombres de las casas de Juego de Tronos.

    5. Crear al menos tres entradas relacionadas con tres personajes de Juego de Tronos:
        ◦ Cada entrada debe tener un título, una fotografía del personaje (que previamente habrás subido a la biblioteca de medios) y una descripción.
        ◦ Debes asociar una categoría a la entrada en  función de a qué casa pertenezca el personaje.
        ◦ Asocia etiquetas a la entrada según rasgos del personaje (por ejemplo: soldado, rey, intrépido, ambicioso…).
        ◦ Visualiza tu sitio web (pinchando en el icono de la casa situado arriba a la izquierda del entorno de Wordpress), y comprueba que aparecen las entradas publicadas.
        ◦ Prueba a comentar una entrada en tu sitio web y alguna del sitio de compañero, y revisa después que aparece en la sección de comentarios
       
    6. Crea otra entrada más:
        ◦ La temática debe estar relacionada con  Juego de Tronos. Asígnale etiquetas.
        ◦ Debe contener un enlace a un vídeo.
        ◦ Esa entrada no debe permitir comentarios.
        ◦ Programa la fecha de publicación para que se publique automáticamente al cabo de diez minutos.

Entrega

    • URL de tu sitio web
    • Adjunta en este propio documento varias capturas del proceso de instalación, contenido creado (medios, categorías, entradas) y su visualización en tu sitio web.
      
