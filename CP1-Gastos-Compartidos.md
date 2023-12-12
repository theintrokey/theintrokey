CASO PRÁCTICO 1

Gastos compartidos

1. Enunciado del problema

Un grupo de amigos quieren repartir equitativamente los gastos ocasionados por los distintos eventos que realizan a lo largo del tiempo, y para ello desean crear una base de datos que gestione todos los gastos realizados por el grupo. La información a extraer para la base de datos se obtiene de los siguientes supuestos:

S1.- Cada vez que se planifique una actividad grupal se creará un evento, el cual tendrá un código (único), nombre, detalle, un enlace web (para poder visualizar online todos los gastos ocasionados por el grupo y que no podrá repetirse entre distintos eventos), fecha de comienzo y personas (miembros) participantes.

S2.- Un evento es organizado por un miembro registrado en el sistema. No ha- brá límites en cuanto al número de eventos que pueda organizar un participante, ni en cuanto al número de eventos en los que puede participar cualquier miem- bro. De cada miembro queremos registrar un identificador (único), un nombre, un email y un password. Dos miembros del sistema no pueden tener el mismo email aunque pueden coincidir en el password.

S3.- En un evento se llevan a cabo varios servicios y cada uno de estos consta de un identificador único (número de factura), una descripción (alojamiento, desplazamiento en coche, entradas de concierto, etc.), la fecha y hora en la que se produjo, la cuantía facturada, así como el evento en el que tuvo lugar.

S4.- Cada servicio puede recibir aportes económicos de varios miembros del grupo. Una persona solo puede realizar un aporte económico en un servicio realizado, aunque puede contribuir económicamente en los distintos servicios consumados. En todo momento se querrá saber si todos los aportes económicos de los participantes en un servicio son suficientes para pagar la cuantia facturada en dicho servicio.

$5.- Es frecuente que un evento ocasione devoluciones entre sus participan tes. Un participante puede actuar como deudor en ciertas devoluciones y como acreedor en otras, sin embargo, en una devolución el deudor y el acreedor no .

puede ser el mismo participante S6.- Cada devolución tiene asociado un código distinto, se realizará en una fecha y una hora concreta y estará compuesta por el participante deudor, el partici pante acreedor, la cantidad transferida y el evento afectado en dicha devolución.

Consideraciones sobre los supuestos semánticos

El Diagrama Entidad Relación (DER) no puede recoger el supuesto S4:

"En todo momento se querrá saber si todos los aportes económicos de los participantes en un servicio son suficientes para pagar la cuantía facturada en dicho servicio". Para realizar esta comprobación se ha creado la función ChkGastos Evento en el apartado implementación en PostgreSQL.

2. Diseño conceptual: Esquema E/R
2.1. Análisis de los tipos de entidades
2.2. Análisis de los tipos de interrelaciones

3. Diseño lógico. Transformación al esquema relacional.
3.1 Análisis de las relaciones resultantes.

4. Implementación
4.1 Creación de la base de datos
