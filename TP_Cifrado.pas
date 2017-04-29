program TP2;

uses crt;
//-----------------------------CONSTANTES---------------------------------------
const
ejemplo='*m1instituto*i1*m1univer*e5federsitario de *m1tecnologia Doctor F*s7dcdqhbn Riv*f9al*r3cekoero P';
//-----------------------------VARIABLES----------------------------------------
var
texto:string;
respuesta:string[1]; //Para que sólo se pueda leer una letra
posicion,cod:integer;
dig:byte;
error:boolean;
//-----------------------------PROCESOS-----------------------------------------
//------------------------------------------------------------------------------
procedure color;
begin
     textbackground(blue); //Color de fondo
     textcolor(yellow); //Color de las letras
     clrscr; //Limpia la pantalla para que haga el coloreado a toda la pantalla
end;
//-----------------------------MÓDULO DE MAYÚSCULAS-----------------------------
procedure cmdmay(x:integer; y:byte);
var
j:byte;
begin
     for j:=x to y+x do texto[j+2]:=upcase(texto[j+2]); //Reemplaza el caracter en minúsculas por el caracter en mayúscula
     delete(texto,x,3); //Al terminar de convertir, borra "*m#" de la cadena
end;
//-----------------MÓDULO DE SUMAR O RESTA AL CÓDIGO ASCII----------------------
procedure cmdsumres(x:integer; y:byte);
var
j,cant:byte;
begin
     if (texto[x+1]='s') then cant:=1 else cant:=-2; //Si el comando es de suma, cant vale 1, sino (o sea, es de resta) cant vale -2
     for j:=x to y+x do texto[j+2]:=chr(ord(texto[j+2])+cant); //Va a reemplazar el caracter en esa posición por el del caracter convertido (se le sumará o restará dependiendo del comando)
     delete(texto,x,3); //Al terminar de convertir, borra "*s#" de la cadena
end;
//---------------MÓDULO DE INSERTAR ESPACIOS EN BLANCO--------------------------
procedure cmdesp(x:integer; y:byte);
var
j,i:byte;
begin 
     i:=0;
     j:=x+3;
     //for j:=x+1 to y+x do insert(' ',texto,j+2);
     while (i<>y) do
           begin
                i:=i+1; //Cantidad de veces que ha hecho el proceso
                insert(' ',texto,j); //Inserta una cantidad X de espacios en blanco despues de "*i#"
                j:=j+1; //Siguiente posición
           end;
     delete(texto,x,3); //Al terminar de convertir, borra "*i#" de la cadena
end;
//----------MÓDULO DE MOVER CARACTERES AL FINAL DE LA CADENA--------------------
procedure cmdmov(x:integer; y:byte);
var
aux:string;
begin
     aux:=copy(texto,x+3,y); //Guarda en aux los caracteres a copiar
     delete(texto,x,y+3); //Borra los caracteres copiados junto con "*f#"...
     insert(aux,texto,length(texto)+1); //... inserta al final de la cadena, los caracteres copiados.
end;
//-----------------------MÓDULO QUE CREA EL ARCHIVO-----------------------------
procedure arch(x:string);
var
archivo:text;
ruta,nombre:string;
begin
     write('Introduzca la ruta a guardar: ');
     readln(ruta);
     write('Introduzca el nombre del archivo con extension: ');
     readln(nombre);
     assign(archivo, ruta+nombre); //Lo guarda en la ruta especificada con el nombre especificado y la extensión seleccionada
     rewrite(archivo); //Crea el archivo en la ruta especificada antes y con el nombre y la extensión
     write(archivo, x); //Escribe en el archivo...
     close(archivo);  //... cierra el archivo.
end;
//------------------INICIO DEL PROGRAMA PRINCIPAL-------------------------------
BEGIN
     error:=false;
     color; //Llama al proceso que cambia el color de fondo y de las letras
     writeln('Introduzca el texto cifrado o ingrese 1 para usar el ejemplo: '); //El ejemplo es la constante
//Lee el texto cifrado----------------------------------------------------------
     readln(texto);
     clrscr;
     if texto='1' then texto:=ejemplo;
     writeln('Texto original: ');
     writeln;
     writeln(texto);
     writeln;
//REPETIR QUE BUSCA TODOS LOS * EN LA CADENA-----------------------------------
     repeat
           begin
                posicion:= pos('*',texto);
                if posicion<>0 then
                   begin
                        val(texto[posicion+2],dig,cod); //Cambia el número de cadena a entero y lo guarda en dig
                        if (texto[posicion+1]='f') then cmdmov(posicion,dig) //Llama al proceso de mover los caracteres al final de la cadena
                        else
                            if (texto[posicion+1]='m') then cmdmay(posicion,dig) //Llama al proceso de colocar caracteres en mayúsculas
                            else
                                if (texto[posicion+1]='e') then delete(texto,posicion,dig+3) //Llama al proceso de eliminar caracteres de la cadena
                                else
                                    if (texto[posicion+1]='s') or (texto[posicion+1]='r') then cmdsumres(posicion,dig) //Llama al proceso de sumarle o restarle al caracter de la cadena
                                    else
                                        if (texto[posicion+1]='i') then cmdesp(posicion,dig) //Llama al proceso de insertar espacios en blanco
                                        else
                                            begin
                                                 error:=true; //Si encuentra algo que no es válido, error será verdadero y parará el ciclo
                                                 writeln('Error, codigo no reconocido, operacion no exitosa.');
                                                 writeln;
                                            end;
                   end;
           end;
     until(posicion=0) or (error); //Hasta que no encuentre otro "*" o haya un error
     writeln('El texto cifrado es: ');
     writeln;
     writeln(texto);
     writeln;
     write('Desea guardar el texto en un archivo? (S/N): ');
     readln(respuesta);
     if (respuesta='S') or (respuesta='s') then arch(texto);
     readln;
END.
