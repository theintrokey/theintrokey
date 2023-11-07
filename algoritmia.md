# Algoritmia

https://mermaid.js.org/syntax/flowchart.html

ALGORITMIA
ORGANIGRAMAS CONDICIONALES Y BUCLES

Los organigramas o diagramas de flujo son dibujos que ayudan al
programador a representar de forma gráfica un algoritmo. Las tareas se representan
como rectángulos, rombos y romboides y mediante flechas se muestra el flujo de
tareas.
A continuación se muestran los organigramas de condicionales y bucles, no
se han introducido en los libros por falta de espacio. Es recomendable que el opositor
introduzca los distintos organigramas en los temas de algoritmia donde corresponda.

## Condición Simple con sentencia afirmativa

``` 
si (condición){
sentencias
}
```

```mermaid
flowchart TD
    A[Inicio] --> B{Es?}
    B -->|Sí| C[OK]
    C --> D[Repensar]
    D --> B
    B ---->|No| E[Fin]
 ```

![img](https://github.com/theintrokey/diagramas-de-flujo/dia_01.png)


En este organigrama se muestra un condicional simple, si se cumple la
condición, se ejecutan las sentencias. Si no se cumple, no ocurre nada. El programa
finaliza.


## Condición con sentencias afirmativa y negativa

```
si (condición){
sentencias 1
sino
sentencias 2
}
fin si
```
![img](https://github.com/theintrokey/)


En este organigrama se muestra un condicional donde, si se cumple la
condición, se ejecutan las sentencias 1. Si la condición no se cumple, se ejecutan las
sentencias 2. El programa finaliza.


### Condición múltiple anidada con sentencias afirmativas y negativas

```
si (condición){
sentencias 1
sino
si (condición)
sentencias 2
else
sentencias 3
}
fin si
```

![img](https://github.com/theintrokey/)

En este organigrama se muestra un condicional donde, si se cumple la
condición, se ejecutan las sentencias 1. Si la condición no se cumple, se comprueba
otra condición, si esta se cumple, se ejecutan las sentencias 2, y sino las sentencias
3. Entonces el programa finaliza


### Ejemplo número mayor entre tres dados
A continuación se muestra el ejemplo de un programa que comprueba cuál
es el mayor de tres números introducidos por el usuario.

```
inicio
escribir “introduce el valor de a y b y c”
leer a y b y c
si (a > b)
si (a > c)
escribir “el número mayor es a”
fin si
sino
si (b > c)
escribir “el número mayor es b”
sino
escribir “el número mayor es c”
fin si
fin si
fin programa
```

![img](https://github.com/theintrokey/)


Este organigrama muestra un programa para encontrar el mayor de tres
números dados. Lo primero es pedir al usuario los tres valores de a, b y c. Si se
cumple que a es mayor que b, entonces si a es mayor que c, ya se ha averiguado que
el mayor es a, y el programa acaba. Si no se cumple que a es mayor que b, hay que
comprobar si b es mayor a c, si se cumple la condición entonces el mayor de los tres
números es b y sino es c. Acaba el programa.


### Bucle while
while es una estructura de control que permite repetir una tarea un número
determinado de veces.

```
while (condición) {
sentencias
}
```

![img](https://github.com/theintrokey/)

### Bucle do while
Do while es una estructura de control parecida al while pero que permite
ejecutar al menos una vez las sentencias antes de que se evalúe la condición.

```
do{
sentencias
} while (condición);
```

![img](https://github.com/theintrokey/)


### Bucle for
for es una estructura que se repite las veces que indique el contador.

```
for (valor; condición; paso)
{
sentencias
}
```

![img](https://github.com/theintrokey/)




