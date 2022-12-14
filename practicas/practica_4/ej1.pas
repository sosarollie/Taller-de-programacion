{
1.  Una biblioteca nos ha encargado procesar la información de los préstamos realizados durante cada el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día y mes del préstamo y cantidad de días prestados. Implementar un programa con: (vector de listas)
	a. Un módulo que lea préstamos y retorne en una estructura adecuada la información de los préstamos organizada por mes. Para cada mes, los préstamos deben quedar ordenados por ISBN. La lectura de los préstamos finaliza con ISBN -1.
	b. Un módulo recursivo que reciba la estructura generada en a. y muestre, para cada mes, ISBN y numero de socio.
	c. Un módulo que reciba la estructura generada en a. y retorne una nueva estructura con todos los préstamos ordenados por ISBN. (merge)
	d. Un módulo recursivo que reciba la estructura generada en c. y muestre todos los ISBN y número de socio correspondiente.
	e. Un módulo que reciba la estructura generada en a. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó durante el año 2021. (merge acumulador)
	f. Un módulo recursivo que reciba la estructura generada en e. y muestre su contenido.
}
program ej1;
const

	max = 12;

type
	rango = 1..max;

	prestamo = record
		isbn: integer;
		num: integer;
		dia: integer;
		mes: integer;
		cantD: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: prestamo;
		sig: lista;
	end;

	meses = array [rango] of lista;
		
	acumulador = record
		isbn: integer;
		diasT: integer;
	end;
	
	listaA = ^nodo2;
	nodo2 = record
		dato: acumulador;
		sig: listaA;
	end;



procedure inicialiarLista (var v: meses); 
var
	i: integer; 
begin 
	for i:= 1 to max do begin
		v[i]:= nil; 
	end; 
end; 

procedure cargarVector (var v:meses);

		procedure leer (var p: prestamo); 
		begin 
			with p do begin 
				writeln('Ingrese el ISBN: ');
				readln(isbn); 
				if (p.isbn <> -1) then begin 
				writeln('Ingrese el numero de socio: ');
				readln(num); 
				writeln('Ingrese el dia: ');
				readln(dia);
				writeln('Ingrese el mes: ');				
				readln(mes); 
				writeln('Ingrese la cantidad de dias prestados: ');				
				readln(cantD); 
				end;
			end;
		end;
		
		procedure insertar (var pI: lista; p: prestamo);
		var
		nuevo, actual, ant: lista;
		begin
			new (nuevo);
			nuevo^.dato:= p;
			nuevo^.sig:= nil;
			if (pI = nil) then {caso 1}
			v[p.mes]:= nuevo
			else begin
			actual:= pI;
			ant:= pI;
			while (actual <> nil) and (actual^.dato.isbn < nuevo^.dato.isbn) do begin
				ant:= actual; {busco la posicion}
				actual:= actual^.sig;
			end;
			if (actual = pI) then {caso 2}
			begin
				nuevo^.sig := pI;
				pI:= nuevo;
			end
			else  {caso 3 y 4 (actual <> nil)}
			begin
				ant^.sig:= nuevo;
				nuevo^.sig:= actual;
			end;
			end;
end;

var 
	p: prestamo; 
	
begin 
	leer(p); 
	while (p.isbn <> -1) do begin 
		insertar(v[p.mes], p); 
		leer(p);
	end; 
end;

procedure informarRecursivo (v: meses);


	procedure informarLista (pI: lista);
	begin
		if (pI <> nil) then begin
			writeln;
			write('ISBN: ');
			writeln(pI^.dato.isbn);
			write('Numero de socio: ');			
			writeln(pI^.dato.num);
			writeln;
			informarLista(pI^.sig);
		end;
	end;


var
	i: integer;
begin
	for i:= 1 to max do begin
		if (v[i] <> nil) then begin
			writeln('-----------');	
			writeln;	
			writeln('Para el mes ',i,': ');		
			informarLista(v[i]);
		end;
	end;
end;


procedure merge (v: meses);
	
	procedure minimo(var v: meses; var  minP: prestamo; var min: integer);
	Var
	indiceMin,i:integer;
	Begin
	  min:= 32000;
	  for i:= 1 to max do
	     if (v[i] <> nil) then 
	      if (v[i]^.dato.isbn <= min) then begin
				indiceMin:= i;
				minp:= v[i]^.dato;  
				min:= v[i]^.dato.isbn;
			 end; 
		  if (min <> 32000) then 
		    begin
		      minP:= v[indiceMin]^.dato;
		      v[indiceMin]:= v[indiceMin]^.sig;
		    end;
	End;		

	procedure agregarAtras (var pI,pU: lista; p:prestamo);
	var
	nuevo: lista;
	begin
	new (nuevo);
	nuevo^.dato:= p;
	nuevo^.sig:= nil;
	if (pI = nil) then begin
		pI:= nuevo;
		pU:= nuevo;
	end
	else begin
		pU^.sig:= nuevo;
		pU:= nuevo;
	end;
	end;
	
	procedure informarLista (pI: lista);
	begin
		if (pI <> nil) then begin
			writeln;
			write('(merge)ISBN: ');
			writeln(pI^.dato.isbn);
			write('(merge)Numero de socio: ');			
			writeln(pI^.dato.num);
			writeln;
			informarLista(pI^.sig);
		end;
	end;

var
	pINuevo: lista;
	pUNuevo: lista;
	minP: prestamo;	
	min: integer;	
begin
	pUNuevo:= nil;
	pINuevo:= nil;
	minimo (v, minP,min);
	while (min <> 32000) do begin
		agregarAtras(pINuevo,pUNuevo, minP);
		minimo(v, minP, min);
	end;
	informarLista(pINuevo);
end;


procedure mergeAcumulador (v: meses);
	
	procedure minimo(var v: meses; var  isbnMin: integer; var min,dias: integer);
	Var
	indiceMin,i:integer;
	Begin
	  isbnMin:= 32000;
	  for i:= 1 to max do
	     if (v[i] <> nil) then 
	      if (v[i]^.dato.isbn <= isbnMin) then begin
				indiceMin:= i;
				isbnMin:= v[i]^.dato.isbn;  
			 end; 
		  if (isbnMin <> 32000) then 
		    begin
		      isbnMin:= v[indiceMin]^.dato.isbn;
		      dias:= v[indiceMin]^.dato.diasT;
		      v[indiceMin]:= v[indiceMin]^.sig;
		    end;
	End;		

	procedure agregarAtras (var pI,pU: lista; isbnMin, diasT: acumulador );
	var
	nuevo: lista;
	begin
	new (nuevo);
	nuevo^.dato.isbn:= isbnMin;
	nuevo^.dato.diasT:= diasT;
	nuevo^.sig:= nil;
	if (pI = nil) then begin
		pI:= nuevo;
		pU:= nuevo;
	end
	else begin
		pU^.sig:= nuevo;
		pU:= nuevo;
	end;
	end;
	
	procedure informarLista (pI: lista; diasT: integer);
	begin
		if (pI <> nil) then begin
			writeln;
			write('ISBN: ');
			writeln(pI^.dato.isbn);
			write('Cant total de dias prestados para este ISBN: ');
			writeln(diasT);
			write('Numero de socio: ');			
			writeln(pI^.dato.num);
			writeln;
			informarLista(pI^.sig, diasT);
		end;
	end;

var
	pINuevo: lista;
	pUNuevo: lista;
	isbnMin: acumulador;	
	min,actual,dias,diasT: integer;
begin
	pUNuevo:= nil;
	pINuevo:= nil;
	minimo (v, isbnMin,min,dias);
	while (min <> 32000) do begin
		actual:= isbnMin.isbn;
		diasT:= 0;
		while ((min <> 32000) and (isbnMin.isbn = actual)) do begin 
			minimo(v, isbnMin, min,dias);
			diasT:= diasT + dias;
		end;
		agregarAtras(pINuevo, pUNuevo, isbnMin, diasT);
		informarLista(pINuevo);
	end;
end;


var
v: meses;
begin
	inicialiarLista(v);
	cargarVector(v);
	informarRecursivo(v);
	merge(v);
	mergeAcumulador(v);
end.
		




	
	
	
	
	
	
