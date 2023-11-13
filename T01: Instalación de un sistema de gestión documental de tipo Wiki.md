https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax


T01: Instalación de un sistema de gestión documental de tipo Wiki

DokuWiki es un sistema de Wiki de uso sencillo, orientado a crear documentación de
cualquier tipo dentro de grupos de desarrollo, grupos de trabajo y pequeñas empresas. Su
sintaxis es simple y potente, facilita la creación de textos estructurados, y permite que los
archivos generados sean legibles incluso fuera del Wiki. Todos los datos se guardan en
archivos de texto plano, de tal forma que no necesita una base de datos.

Parte 1: Instalación de Dokuwiki en tu MV Ubuntu Server de Azure

1. Instala las librerías necesarias de php:
```
sudo apt install php-gd php-xml php-json
```

2. Descarga e instala dokuwiki:
```
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
sudo mkdir /var/www/html/dokuwiki
sudo tar xzf dokuwiki-stable.tgz -C /var/www/html/dokuwiki/ --strip-components=1
```

Comprueba que está todo en su sitio: 
```
ls -l /var/www/html/dokuwiki
```


3. Crea un host virtual en Apache:
```
sudo nano /etc/apache2/sites-available/dokuwiki.conf
```

Copia en el fichero el siguiente contenido:
```
<VirtualHost *:80>
 ServerName smrserverjcm
 DocumentRoot /var/www/html/dokuwiki
 <Directory ~ "/var/www/html/dokuwiki/(bin/|conf/|data/|inc/)">
  <IfModule mod_authz_core.c>
   AllowOverride All
   Require all denied
  </IfModule>
  <IfModule !mod_authz_core.c>
   Order allow,deny
   Deny from all
  </IfModule>
 </Directory>
 ErrorLog /var/log/apache2/dokuwiki_error.log
 CustomLog /var/log/apache2/dokuwiki_access.log combined
</VirtualHost>
```

En ServerName debes poner el nombre de tu servidor (el que devuelve el comando hostname).Guarda el fichero y sal del editor nano.

Renombra los ficheros .htaccess de la web de dokuwiki:
```
sudo cp /var/www/html/dokuwiki/.htaccess{.dist,}
```

Cambia los permisos del sitio web de dokuwiki:
```
sudo chown -R www-data: /var/www/html/dokuwiki
```
Comprueba que la nueva configuración de Apache es correcta:
```
apache2ctl -t
```
Si la salida del comando es Syntax OK, está correcto.

Desahabilita el sitio web por defecto de Apache:
```
sudo a2dissite 000-default.conf
```

Habilita el sitio web de Dokuwiki:
```
sudo a2ensite dokuwiki.conf
```

Reinicia el servicio de Apache:
```
sudo systemctl reload apache2
```

Comprueba el estado del servicio de Apache:
```
sudo systemctl status apache2
```

4. Completa la instalación de DokuWiki mediante su interfaz web:

Conéctate desde un navegador a la dirección de tu máquina de Azure:
```
http://tuservidor.westeurope.cloudapp.azure.com/install.php
```

Siendo tuservidor el nombre de dominio de tu máquina de Azure.

Realiza la configuración inicial:
◦ Nombre del Wiki: “Wiki de Nombre, Apellidos” (pon ahí tu nombre).
◦ Crear un superusuario y dale una contraseña segura (¡y recuérdala!)
◦ Puedes inventarte el email si no quieres poner uno real (de todas maneras es tu máquina virtual personal)
◦ Selecciona un tipo de wiki en el cual los usuarios públicos puedan leer pero sólo los usuarios registrados puedan escribir.
◦ No permitas que los usuarios se autoregistren.
◦ El tipo de licencia puedes dejarlo tal cual.

Una vez realizada la configuración inicial, haz login en dokuwiki con el usuario creado, y entrando en la opción de administración arriba a la derecha de la página (Admin Configuration Settings), puedes cambiar el idioma de la interfaz al que prefieras

Parte 2: Generación de contenido y administración del sitio web

1. El contenido versará sobre la serie ‘Stranger Things’. La estructura del wiki debe ser la siguiente:

◦ La <ins>página de comienzo</ins> debe tener como título: “Stranger Things”, y debajo una descripción con el argumento de la serie
◦ A continuación debe aparecer un título “Personajes principales”, y debajo una lista de tipo viñeta con los <u>principales personajes de Stranger Things</u> (no es necesario que pongas todos los personajes, sólo los que te parezcan más importantes o te
gusten más) . Cada elemento de la lista será un enlace a una nueva página de la wiki a la descripción de cada personaje.
◦ En las páginas de los personajes, debe aparecer como título el nombre del personaje, una foto, y una breve descripción del mismo. Al final de la página debe haber un enlace para volver a la página principal.
◦ Añade una barra lateral (sidebar) para poder navegar por los distintos personajes.

3. Instala una nueva plantilla. Una vez creado el contenido, desde el Administrador de
Extensiones busca e instala una plantilla que soporte barra lateral (sidebar). Para
aplicar la nueva plantilla, tendrás que indicarlo en los parámetros de configuración.
4. Crear un usuario que pertenezca al grupo admin. Facilítale a un compañero dirección
de tu máquina ubuntu, el nombre de usuario creado y la contraseña, y pídele que se
conecte a tu wiki y añada una nueva página de un personaje que no tengas. Haz tú lo
mismo con su wiki.
5. Instala un plugin de CAPTCHA. Configúralo para que cuando un usuario se conecte a
la wiki con usuario y contraseña, le pida además que resuelva una sencilla operación
matemática.

Entrega
• Parte 1: Adjunta varias capturas del proceso de instalación.
• Parte 2:
◦ URL de tu página
◦ Capturas del contenido del wiki (página principal y algún personaje, plantilla
utilizada en Parámetros de Configuración, usuario creado y configuración del
plugin.

![image](https://github.com/theintrokey/theintrokey/assets/15022199/98bafdbb-7d12-445d-a5be-5559bc8cdc4a)
![image](https://github.com/theintrokey/theintrokey/assets/15022199/15005043-dac5-416e-9846-b5ad5ba6ee2a)

