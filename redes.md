
# 6.0 Redes
## 6.0.1 Introducción
### 6.0.1.1 Introducción

Redes
Introducción
En este capítulo, se brinda una descripción general de los principios, estándares y propósitos de las redes.

Se analizan los distintos tipos de topologías, protocolos y modelos lógicos de red, y el hardware necesario para crear una red. Además, en este capítulo se abarcan las actualizaciones de componentes de red, las instalaciones y la configuración de servidores de correo electrónico, la resolución de problemas y el mantenimiento preventivo. También ofrece conocimientos sobre software de red, métodos de comunicación y relaciones de hardware.

Para cumplir con las expectativas y las necesidades de los clientes y los usuarios de red, debe estar familiarizado con las tecnologías de networking. Este capítulo proporciona conocimientos básicos sobre diseño de red y sobre la manera en que algunos componentes afectan el flujo de datos en una red. Estos conocimientos lo ayudarán a resolver problemas de red correctamente.

# 6.1 Principios de networking
## 6.1.1 Redes de computadoras
### 6.1.1.1 Definición de redes de computadoras

Principios de networking
Redes de computadoras
Las redes son sistemas formados por enlaces. Por ejemplo, las calles que conectan grupos de personas crean una red física. Las conexiones con amigos crean una red personal. Los sitios Web que permiten a las personas enlazarse con las páginas de otras personas se denominan “sitios de networking social”.

Las personas utilizan las siguientes redes todos los días:

- Sistema de envío de correo
- Sistema telefónico
- Sistema de transporte público
- Red de computadoras corporativa
- Internet

Las redes comparten información y utilizan diversos métodos para dirigir la forma en que se transmite la información. La información se mueve de un lugar a otro en la red, en ocasiones, por distintos caminos, para llegar al destino correcto. Por ejemplo, el sistema de transporte público es una red similar a una red de computadoras. Los automóviles, los camiones y los demás vehículos son como los mensajes que transitan por la red. Cada conductor define un punto de inicio (PC de origen) y un punto de finalización (PC de destino). Dentro de este sistema, existen reglas, como las señales de parada y los semáforos, que controlan el flujo desde el origen hasta el destino. Las redes de computadoras también utilizan reglas para controlar el flujo de datos entre hosts en una red.

Un host es un dispositivo que envía y recibe información en la red. Algunos dispositivos pueden funcionar como hosts o como dispositivos periféricos. Por ejemplo, una impresora conectada a una computadora portátil que se encuentra en una red actúa como dispositivo periférico. Si la impresora se conecta directamente a la red, actúa como host.

Existen diversos tipos de dispositivos que pueden conectarse a una red:

- Computadoras de escritorio
- Computadoras portátiles
- Tablet PC
- Smartphones
- Impresoras
- Servidores de archivos y de impresión
- Consolas de juegos
- Dispositivos domésticos
  
Las redes de computadoras se utilizan en empresas, hogares, escuelas y agencias gubernamentales de todo el mundo. Muchas de las redes están conectadas entre sí a través de Internet. Una red puede compartir distintos tipos de recursos y datos:

- Servicios, como imprimir y escanear
- Espacio de almacenamiento en dispositivos extraíbles, como discos duros y unidades ópticas
- Aplicaciones, como bases de datos
- Información almacenada en otras PC
- Documentos
- Calendarios, sincronización entre una PC y un smartphone

Los dispositivos de red se enlazan entre sí mediante distintas conexiones:

- Cableado de cobre: utiliza señales eléctricas para transmitir datos entre dispositivos.
- Cableado de fibra óptica: utiliza fibra de vidrio o de plástico para transportar información en forma de pulsos de luz.
- Conexión inalámbrica: utiliza señales de radio, tecnología infrarroja o transmisiones satelitales.


### 6.1.1.2 Características y beneficios

Principios de networking
Redes de computadoras
Los beneficios de conectar PC y otros dispositivos a una red incluyen la reducción de costos y el aumento de la productividad. En una red, se pueden compartir los recursos para reducir la posibilidad de que se dupliquen y se dañen los datos.

**Necesidad de menos dispositivos periféricos**

En la ilustración, se muestra que pueden conectarse muchos dispositivos en una red. No es necesario que cada PC de la red tenga su propia impresora o su propio dispositivo de respaldo. Pueden configurarse varias impresoras en una ubicación central para compartirlas entre los usuarios de la red. Todos los usuarios de la red envían trabajos de impresión a un servidor de impresión central que administra las solicitudes de impresión. El servidor de impresión puede distribuir trabajos de impresión en varias impresoras o poner en cola los trabajos que requieren una impresora específica.

**Aumento de las capacidades de comunicación**

Las redes proporcionan diversas herramientas de colaboración que pueden utilizarse para la comunicación entre los usuarios de una red. Las herramientas de colaboración en línea incluyen el correo electrónico, los foros y chats, la transmisión de voz y video, y la mensajería instantánea. Con estas herramientas, los usuarios pueden comunicarse con amigos, familiares y colegas.

**Prevención de duplicación y daño de archivos**

Los servidores administran los recursos de red. Los servidores almacenan datos y los comparten con los usuarios en una red. Los datos confidenciales pueden protegerse y compartirse con los usuarios que tienen permiso para acceder a esos datos. Se puede utilizar software de rastreo de documentos para evitar que los usuarios sobrescriban o modifiquen archivos a los que otros usuarios acceden de forma simultánea.

**Menor costo de licencias**

Las licencias de las aplicaciones pueden ser costosas para las PC individuales. Muchos proveedores de software ofrecen licencias de sitio para redes, lo que puede reducir notablemente el costo del software. La licencia de sitio permite que un grupo de personas o una organización entera utilicen la aplicación por una única tarifa.

**Administración centralizada**

La administración centralizada reduce la cantidad de personas que se necesitan para administrar los dispositivos y los datos de la red, lo que reduce los tiempos y los costos para la compañía. Los usuarios individuales de la red no necesitan administrar sus propios datos y dispositivos. Un administrador puede controlar los datos, los dispositivos y los permisos de los usuarios de la red. Realizar copias de seguridad de los datos resulta más sencillo, debido a que los datos se almacenan en una ubicación central.

**Conservación de recursos**

El procesamiento de datos se puede distribuir en muchas PC para evitar que una PC se sobrecargue con tareas de procesamiento.


6.1.1.3 Actividad: Ventajas y desventajas de networking
6.2 Identificación de redes
6.2.1 Tipos de redes
6.2.1.1 Redes LAN
6.2.1.2 Redes WLAN
6.2.1.3 Redes PAN
6.2.1.4 Redes MAN
6.2.1.5 Redes WAN
6.2.1.6 Redes punto a punto
6.2.1.7 Redes cliente/servidor
6.2.1.8 Actividad: Correspondencia de los tipos de red
6.3 Tecnologías y conceptos básicos de networking
6.3.1 Flujo de datos
6.3.1.1 Ancho de banda
6.3.1.2 Transmisión de datos
6.3.2 Direccionamiento de equipos en red
6.3.2.1 Direccionamiento IP
6.3.2.2 IPv4
6.3.2.3 IPv6
6.3.2.4 Direccionamiento estático
6.3.2.5 Direccionamiento DHCP
6.3.2.6 ICMP
6.3.2.7 Práctica de laboratorio: Configuración de una NIC para utilizar DHCP en Windows 7
6.3.2.8 Práctica de laboratorio: Configuración de una NIC para utilizar DHCP en Windows Vista
6.3.2.9 Práctica de laboratorio: Configuración de una NIC para utilizar DHCP en Windows XP
6.3.2.10 PT: Adición de PC a una red existente
6.3.3 Protocolos y puertos comunes
6.3.3.1 Protocolos TCP y UDP
6.3.3.2 Actividad: Comparación de los protocolos TCP y UDP
6.3.3.3 Puertos y protocolos TCP y UDP
6.3.3.4 Planilla de trabajo: Definiciones de protocolo y puertos predeterminados
6.4 Componentes físicos de una red
6.4.1 Dispositivos de red
6.4.1.1 Módems
6.4.1.2 Hubs, puentes y switches
6.4.1.3 Routers y puntos de acceso inalámbrico
6.4.1.4 NAS
6.4.1.5 Teléfonos VoIP
6.4.1.6 Firewalls de hardware
6.4.1.7 Appliances de Internet
6.4.1.8 Adquisición de dispositivos de networking originales
6.4.2 Cables y conectores
6.4.2.1 Consideraciones para el cableado de una red
6.4.2.2 Cables coaxiales
6.4.2.3 Cables de par trenzado
6.4.2.4 Práctica de laboratorio: Armado de cables UTP directos y cruzados
6.4.2.5 PT: Cableado de una red simple
6.4.2.6 Cables de fibra óptica
6.5 Topologías de red
6.5.1 Topologías
6.5.1.1 Topologías lógicas y físicas
6.5.1.2 PT: Topologías físicas
6.5.1.3 Determinación de la topología de la red
6.6 Estándares Ethernet
6.6.1 Conexiones por cable e inalámbricas
6.6.1.1 Organismos de estandarización
6.6.1.2 IEEE 802.3
6.6.1.3 Tecnologías Ethernet
6.6.1.4 IEEE 802.11
6.7 Modelos de datos OSI y TCP/IP
6.7.1 Modelos de referencia
6.7.1.1 TCP/IP
6.7.1.2 OSI
6.7.1.3 Comparación entre los modelos OSI y TCP/IP
6.7.1.4 Actividad: Unir el modelo OSI con el modelo TCP/IP
6.8 Conexión de PC a una red
6.8.1 Pasos para la instalación de una red
6.8.1.1 Lista de finalización de instalación de una red
6.8.2 Tarjetas de red
6.8.2.1 Elección de una NIC
6.8.2.2 Planilla de trabajo: Búsqueda de controladores de NIC en Internet
6.8.2.3 Instalación y actualización de una NIC
6.8.2.4 Práctica de laboratorio: Instalación de una NIC inalámbrica en Windows 7
6.8.2.5 Práctica de laboratorio: Instalación de una NIC inalámbrica en Windows Vista
6.8.2.6 Práctica de laboratorio: Instalación de una NIC inalámbrica en Windows XP
6.8.2.7 Configuración de una NIC
6.8.2.8 Configuración avanzada de la NIC
6.8.2.9 PT: Instalación de una NIC inalámbrica
6.8.3 Configuración de routers inalámbricos y conectados por cable
6.8.3.1 Conexión a un router
6.8.3.2 Configuración de la ubicación de la red
6.8.3.3 Conexión al router
6.8.3.4 Configuración básica de red
6.8.3.5 Práctica de laboratorio: Conexión a un router por primera vez
6.8.3.6 PT: Conexión a un router inalámbrico y configuración de parámetros básicos
6.8.3.7 Configuración inalámbrica básica
6.8.3.8 Práctica de laboratorio: Configuración de un router inalámbrico en Windows 7
6.8.3.9 Práctica de laboratorio: Configuración de un router inalámbrico en Windows Vista
6.8.3.10 Práctica de laboratorio: Configuración de un router inalámbrico en Windows XP
6.8.3.11 PT: Conexión de PC inalámbricas a Linksys WRT300N
6.8.3.12 Prueba de conectividad con la GUI de Windows
6.8.3.13 Prueba de conectividad con la CLI de Windows
6.8.3.14 Práctica de laboratorio: Prueba de la NIC inalámbrica en Windows 7
6.8.3.15 Práctica de laboratorio: Prueba de la NIC inalámbrica en Windows Vista
6.8.3.16 Práctica de laboratorio: Prueba de la NIC inalámbrica en Windows XP
6.8.3.17 PT: Prueba de una conexión inalámbrica
6.8.4 Configuraciones de OS
6.8.4.1 Dominio y grupo de trabajo
6.8.4.2 Conexión a un grupo de trabajo o dominio
6.8.4.3 Grupo Hogar en Windows 7
6.8.4.4 Uso compartido de recursos en Windows Vista
6.8.4.5 Uso compartido de recursos en Windows XP
6.8.4.6 Recursos compartidos de red y asignación de unidades
6.8.4.7 Práctica de laboratorio: Compartir una carpeta, crear un grupo en el hogar y asignar una unidad de red en Windows 7
6.8.4.8 Práctica de laboratorio: Compartir una carpeta y asignar una unidad de red en Windows Vista
6.8.4.9 Práctica de laboratorio: Compartir una carpeta y asignar una unidad de red en Windows XP
6.8.4.10 VPN
6.9 Elección de un tipo de conexión ISP
6.9.1 Tecnologías de conexión
6.9.1.1 Breve historia de las tecnologías de conexión
6.9.1.2 DSL y ADSL
6.9.1.3 Servicio de Internet inalámbrica con línea de vista
6.9.1.4 WiMAX
6.9.1.5 Otras tecnologías de banda ancha
6.9.1.6 Planilla de trabajo: Preguntas sobre banda ancha
6.9.1.7 Elección de un ISP para un cliente
6.9.1.8 Planilla de trabajo: Tipos de conexiones ISP
6.10 Técnicas de mantenimiento preventivo comunes utilizadas para redes
6.10.1 Mantenimiento de redes
6.10.1.1 Procedimientos de mantenimiento preventivo
6.11 Proceso básico de resolución de problemas para redes
6.11.1 Aplicación del proceso de resolución de problemas a las redes
6.11.1.1 Identificación del problema
6.11.1.2 Establecimiento de una teoría de causas probables
6.11.1.3 Puesta a prueba de la teoría para determinar la causa
6.11.1.4 Establecimiento de un plan de acción para resolver el problema e implementar la solución
6.11.1.5 Verificación de la funcionalidad total del sistema e implementación de medidas preventivas
6.11.1.6 Registro de hallazgos, acciones y resultados
6.11.2 Problemas y soluciones comunes de las redes
6.11.2.1 Identificación de problemas y soluciones comunes

6.12 Redes
6.12.1 Resumen
6.12.1.1 Resumen

Redes
Resumen
En este capítulo, se presentaron los principios básicos de networking, los beneficios de contar con una red, las formas de conectar PC a una red, y la planificación, la implementación y la actualización de redes y componentes de red. Se analizaron los distintos aspectos de la resolución de problemas de una red con ejemplos de cómo analizar e implementar soluciones simples. Es importante recordar los siguientes conceptos de este capítulo:

- Una red de computadoras consta de dos o más PC que comparten datos y recursos.
- Existen varios tipos distintos de red denominados LAN, WLAN, PAN, MAN y WAN.
- En una red punto a punto, los dispositivos se conectan directamente entre sí. Las redes punto a punto son fáciles de instalar, y no se necesitan equipos adicionales o un administrador dedicado. Los usuarios controlan sus propios recursos, y la red funciona mejor con pocas PC. Las redes cliente/servidor utilizan un sistema dedicado que funciona como el servidor. El servidor responde a las solicitudes que realizan los usuarios o los clientes conectados a la red.
- La topología de la red define la forma en que se conectan las PC, las impresoras y otros dispositivos. La topología física describe la disposición del cable y los dispositivos, así como las rutas utilizadas para la transmisión de datos.
- a topología lógica es la ruta que recorren las señales desde un punto hasta otro. Las topologías incluyen topología de bus, en estrella, en anillo, de malla e híbrida.
- Los dispositivos de networking se utilizan para conectar PC y dispositivos periféricos de modo que puedan comunicarse. Entre ellos se incluyen hubs, puentes, switches, routers y dispositivos multipropósito. El tipo de dispositivo implementado depende del tipo de red.
- Los medios de networking pueden definirse como el medio por el cual las señales o los datos se envían de una PC a otra. Las señales pueden transmitirse por cable o por medios inalámbricos. Los tipos de medios que se analizaron fueron el cableado coaxial, de par trenzado, de fibra óptica y las radiofrecuencias.
- Actualmente, la arquitectura de Ethernet es el tipo de arquitectura LAN más popular. La arquitectura se refiere a la estructura general de un sistema de computación o de comunicación. Determina las capacidades y limitaciones del sistema. La arquitectura de Ethernet se basa en el estándar IEEE 802.3. El estándar IEEE 802.3 especifica que una red debe implementar el método de control de acceso CSMA/CD.
- El modelo de referencia OSI es un marco estándar en la industria que divide las funciones de networking en siete capas distintas: aplicación, presentación, sesión, transporte, red, enlace de datos y física. Es importante comprender el propósito de cada capa.
- La suite de protocolos TCP/IP se convirtió en el estándar predominante para Internet. TCP/IP representa un conjunto de estándares públicos que especifican cómo se intercambian los paquetes de información entre las PC de una o más redes.
- Una NIC es un dispositivo que se conecta a una motherboard y proporciona puertos para las conexiones del cable de red. Constituye la interfaz de la PC con la LAN.
- Los recursos se comparten a través de la red cuando las PC pertenecen al mismo grupo de trabajo y al mismo grupo en el hogar.
- La conectividad de red se puede probar con herramientas CLI como ping, ipconfig, net, tracert y nslookup.
- Los tres métodos de transmisión para enviar señales a través de canales de datos son simplex, half-duplex y full-duplex. La tecnología de networking full-duplex mejora el rendimiento, debido a que los datos se pueden enviar y recibir al mismo tiempo. La tecnología DSL, de cable, y otras tecnologías de banda ancha, funcionan en modo full-duplex.
- Se deben realizar tareas de mantenimiento de los dispositivos y medios de red, como los componentes de PC. Es importante limpiar los equipos con regularidad y aplicar un enfoque proactivo para evitar problemas. Repare o reemplace los equipos rotos para evitar el tiempo de inactividad.
- Muchos riesgos de seguridad se asocian a los entornos, los dispositivos y los medios de red.
- Tome decisiones con respecto al diseño de red que satisfagan las necesidades de los clientes y que cumplan los objetivos de estos.
- Seleccione componentes de red que ofrezcan las capacidades y los servicios necesarios para implementar una red según las necesidades del cliente.
- Planifique las instalaciones de red según los equipos y los servicios necesarios.
- La actualización de una red puede implicar la necesidad de cableado o equipos adicionales.
- Evite problemas de red mediante el desarrollo y la implementación de una política integral de mantenimiento preventivo.
- Al realizar la resolución de problemas de red, escuche lo que le dicen los clientes de modo que pueda formular preguntas abiertas y cerradas que le ayuden a determinar por dónde abordar el problema. Verifique los problemas obvios y pruebe soluciones rápidas antes de elevar el proceso de resolución de problemas.
