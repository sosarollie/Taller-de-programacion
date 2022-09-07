{
1.	Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. De cada socio se lee número de socio, nombre y edad. 
	La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente. 
}

Program ImperativoClase3;

type 

	 rangoEdad = 12..100;
     
     cadena15 = string [15];
     
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
				 end;
     
procedure GenerarArbol (var a: arbol);
{ Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. }

  Procedure LeerSocio (var s: socio);
  begin
    write ('Ingrese numero del socio: ');
    readln (s.numero);
    If (s.numero <> 0)
    then begin
           write ('Ingrese nombre del socio: ');
           readln (s.nombre);
           write ('Ingrese edad del socio: ');
           readln (s.edad);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

var unSocio: socio;  
Begin
 a:= nil;
 LeerSocio (unSocio);
 while (unSocio.numero <> 0)do
  begin
   InsertarElemento (a, unSocio);
   writeln;
   LeerSocio (unSocio);
  end;
end;

procedure InformarNumeroSocioMasGrande (a: arbol);
{Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor.}

  function NumeroMasGrande (a: arbol): integer;
  begin
    if (a = nil) then NumeroMasGrande:= -1
    else if (a^.HD = nil) then NumeroMasGrande:= a^.dato.numero
                          else NumeroMasGrande:= NumeroMasGrande (a^.HD);
  end;
   
var max: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Mas Grande ----->');
  writeln;
  max:= NumeroMasGrande (a);
  if (max = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio mas grande: ', max);
         writeln;
       end;
end;

procedure InformarDatosSocioNumeroMasChico (a: arbol);
{ Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. }
  
  function SocioMasChico (a: arbol): arbol;
  begin
    if ((a = nil) or (a^.HI = nil))
    then SocioMasChico:= a
    else SocioMasChico:= SocioMasChico (a^.HI);
  end;
   
var minSocio: arbol;
begin
  writeln;
  writeln ('----- Informar Datos Socio Numero Mas Chico ----->');
  writeln;
  minSocio:= SocioMasChico (a);
  if (minSocio = nil) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Socio con numero mas chico: ', minSocio^.dato.numero, ' Nombre: ', minSocio^.dato.nombre, ' Edad: ', minSocio^.dato.edad); 
         writeln;
       end;
end;

procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

  procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor > maxValor) then
	  begin
		  maxValor := nuevoValor;
		  maxElem := nuevoElem;
	  end;
	end;
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		   actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		   numeroMasEdad(a^.HI, maxEdad,maxNum);
		   numeroMasEdad(a^.HD, maxEdad,maxNum);
	   end; 
	end;
var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
end;

procedure AumentarEdad (a: arbol);
begin
 if (a <> nil)
 then begin
        a^.dato.edad:= a^.dato.edad + 1;
        AumentarEdad (a^.HI);
        AumentarEdad (a^.HD);
      end;
end;

procedure InformarExistenciaNumeroSocio (a: arbol);
{ Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso. }
       
  function Buscar (a: arbol; num: integer): boolean;
  begin
    if (a = nil) 
    then Buscar:= false
    else If (a^.dato.numero = num) 
         then Buscar:= true
         else if (num < a^.dato.numero)
              then Buscar:= Buscar (a^.HI, num)
              else Buscar:= Buscar (a^.HD, num)
  end;
  
var 
	numABuscar: integer;
begin
  writeln;
  writeln ('----- Informar Existencia Numero Socio ----->');
  writeln;
  write ('Ingrese numero de socio a buscar: ');
  Readln (numABuscar);
  writeln;
  if (Buscar (a, numABuscar)) 
  then writeln ('El numero ', numABuscar, ' existe')
  else writeln ('El numero ', numABuscar, ' no existe');
  writeln;
end;
  
procedure InformarExistenciaNombreSocio (a: arbol); 
{Lea un nombre e informe si existe o no existe un socio con ese nombre. 
* Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.}
 
function Buscar (a: arbol; nombre: cadena15): boolean;
  begin
    if (a = nil) then 
		Buscar:= false
    else if (a^.dato.nombre = nombre) then 
		Buscar:= true
    else if (nombre <> a^.dato.nombre)then begin
		Buscar:= Buscar (a^.HI, nombre);
		if (not Buscar) then
			Buscar:= Buscar (a^.HD, nombre)
	end; 
  end;
 
var 
	nombre: cadena15;

begin
  writeln;
  writeln ('----- Informar Existencia Nombre Socio ----->');
  writeln;
  write ('Ingrese nombre de socio a buscar: ');
  Readln (nombre);
  writeln;
  if (Buscar (a, nombre)) then 
	writeln ('El nombre ', nombre, ' existe')
  else 
	writeln ('El nombre ', nombre, ' no existe');
  writeln;
end;

procedure InformarCantidadSocios (a: arbol); 
{
Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
}

	procedure contar (a: arbol; var cant: integer); 
		begin 
		if (a <> nil) then begin 
			contar(a^.HI, cant);
			cant:= cant + 1;  
			contar(a^.HD, cant); 
		end;
	end; 

var
	cant: integer; 
		
begin 
	cant:= 0; 
	contar(a, cant);
	writeln('La cantidad de socios del club es: ', cant); 
end;

procedure InformarPromedioDeEdad (a: arbol); 
{
Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo 
recursivo que retorne la suma de las edades de los socios.
}


{
procedure contar (a: arbol; var cant, total: integer); 
	begin 
		if (a <> nil) then begin 
			contar(a^.HI, cant, total);
			cant:= cant + 1;  
			total:= total + a^.dato.edad;
			contar(a^.HD, cant, total); 
		end;
	end; 
}


	procedure contar (a: arbol; var cant: integer); 
	begin 
		if (a <> nil) then begin 
			contar(a^.HI, cant);
			cant:= cant + 1;  
			contar(a^.HD, cant); 
		end;
	end; 
	
	procedure sumar (a: arbol; var total: integer); 
	begin 
		if (a <> nil) then begin 
			sumar(a^.HI, total); 
			total:= total + a^.dato.edad;
			sumar(a^.HD, total); 
		end;
	end;
	
var 
	total, cant: integer;
	prom: real;
begin
	cant:= 0; total:=0;
	sumar(a, total);
	contar(a, cant); 
	prom:= total / cant; 
	writeln ('El promedio de edad del club es: ', prom:2:2); 
end;

procedure InformarCantidadSociosEnRango (a: arbol); 
{
Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. 
* Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
}
	procedure contar (a: arbol; var cant: integer; n1,n2: integer); 
	begin 
		if (a <> nil) then begin 
			contar(a^.HI, cant, n1, n2);
			if (a^.dato.numero > n1) and (a^.dato.numero < n2) then 
				cant:= cant + 1;  
			contar(a^.HD, cant, n1, n2); 
		end;
	end; 

var 
	cant, n1, n2: integer; 

begin 
	cant:=0; 
writeln;
  writeln ('----- Informar Cantidad De Socios Cuyo Numero Se Encuentra En El Siguiente Rango ----->');
  writeln;
  write ('Ingrese primer numero del rango: ');
  Readln (n1);
  write ('Ingrese segundo numero del rango: ');
  Readln (n2);
  writeln;
  contar(a, cant, n1, n2);
  writeln ('La cantidad de socios cuyo numero corresponde al rango es de: ', cant);
end; 

procedure InformarNumerosSociosOrdenCreciente (a: arbol); 
{
Informe los números de socio en orden creciente. 
}
begin
	if (a <> nil) then begin 
		InformarNumerosSociosOrdenCreciente(a^.HI); 
		write(a^.dato.numero, ' '); 
		InformarNumerosSociosOrdenCreciente(a^.HD);
	end; 
end; 

procedure InformarNumerosSociosOrdenDeCreciente (a: arbol); 
{
Informe los números de socio en orden creciente. 
}
begin
	if (a <> nil) then begin 
		InformarNumerosSociosOrdenDeCreciente(a^.HD);
		write(a^.dato.numero, ' ');
		InformarNumerosSociosOrdenDeCreciente(a^.HI); 
	end; 
end; 

// PROGRAMA PRINCIPAL 

var a: arbol; 

Begin


  GenerarArbol (a);
 { InformarNumeroSocioMasGrande (a);
  InformarDatosSocioNumeroMasChico (a);

  InformarNumeroSocioConMasEdad (a);
  AumentarEdad (a);

  InformarExistenciaNumeroSocio (a);

	InformarExistenciaNombreSocio (a);
	InformarCantidadSocios(a);
	InformarPromedioDeEdad (a);
	InformarCantidadSociosEnRango (a);
	writeln('-----------------');
    
    
    InformarNumerosSociosOrdenCreciente (a);
    writeln('-----------------');
}
    InformarNumerosSociosOrdenDeCreciente (a);
 
End.
