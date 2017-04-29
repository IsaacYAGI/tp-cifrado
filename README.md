# TP Cifrado I.U.T. FRP - 2010

## Clone

```
git clone https://github.com/IsaacYAGI/tp-cifrado.git
cd tp-cifrado
```
## Compilación

Se puede hacer uso de **Bloodsheed Dev-Pascal v1.9.2** para compilarlo. Abrir el archivo \*.pas con el IDE y compilar el ejecutable presionando el botón **Compile Project**.

## Descripción del problema

##### Descifrar mensajes 
Actualmente el Instituto Universitario de Tecnología Dr. Federico Rivero Palacio necesita enviar mensajes en un archivo de texto de un departamento a otro, pero de una forma cifrada, ya que algunas personas han logrado conseguir estos archivos, pero sin cifrar, y por lo tanto se han llevado información confidencial. 

El Instituto ya definió las reglas de cifrado y mandó a hacer con una compañia este programa, sin embargo no se completó. Sólo llegaron a implementar la parte de cifrar un texto.

Ahora, el IUT para completar este sistema ha solicitado al Departamento de Informática que lo continúe, por lo tanto usted debe hacer un programa que permita descifrar el o los mensajes contenidos en un archivo de texto y mostrarlos por pantalla según las reglas de cifrado que se explican a continuación: 

— Toda parte cifrada comienza con un asterisco (\*) y luego viene el comando a ejecutar (que consta de una letra) y por último un número de un dígito. 

— Los comandos que encontrará en el archivo son los siguientes: 

- \*m\#: debe convertir a mayúsculas las próximas \# letras 
- \*e\#: debe eliminar de la cadena las próximas \# letras 
- \*s\#: debe sumarle uno al código ASCII de las próximas \# letras 
- \*r\#: debe restarle dos al código ASCII de las próximas \# letras 
- \*i\#: debe insertar en esa posición \# caracteres en blanco 
- \*ft debe mover al final de la cadena las próximas \# letras 


##### Ejemplo: 

Archivo de entrada: 

```
*mlínstituto*i1*mluniver*e5federsitario de *mitecnologia Doctor F*s7dcdqhbn Riv*f9al*r3rekoero P
```
Salida por pantalla: 
```
Instituto Universitario de Tecnologia Doctor Federico Rivero Palacio 
```


Debe tener en cuenta lo siguiente: 

- Todo lo debe trabajar en la misma cadena 
- Debe elaborar el programa con procedimientos y funciones 
- \# siempre será una cantidad de una sola cifra 
- Cada línea del archivo es independiente de las otras 


Elaborado por Johan Alarno. Mayo de 2.010 
