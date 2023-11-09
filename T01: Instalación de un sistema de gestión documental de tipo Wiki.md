T01: Instalación de un sistema de gestión documental de tipo Wiki

DokuWiki es un sistema de Wiki de uso sencillo, orientado a crear documentación de
cualquier tipo dentro de grupos de desarrollo, grupos de trabajo y pequeñas empresas. Su
sintaxis es simple y potente, facilita la creación de textos estructurados, y permite que los
archivos generados sean legibles incluso fuera del Wiki. Todos los datos se guardan en
archivos de texto plano, de tal forma que no necesita una base de datos.

Parte 1: Instalación de Dokuwiki en tu MV Ubuntu Server de Azure

1. Instala las librerías necesarias de php:

'''
sudo apt install php-gd php-xml php-json
...

3. Descarga e instala dokuwiki:

...
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
sudo mkdir /var/www/html/dokuwiki
sudo tar xzf dokuwiki-stable.tgz -C /var/www/html/dokuwiki/ --strip-components=1
...

Comprueba que está todo en su sitio: ls -l /var/www/html/dokuwiki
4. Crea un host virtual en Apache:
sudo nano /etc/apache2/sites-available/dokuwiki.conf
Copia en el fichero el siguiente contenido:
