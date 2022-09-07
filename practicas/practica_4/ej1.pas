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


procedure inicialiarLista (var pI: lista); 
var
	i: integer; 
begin 
	for i:= 1 to max do begin
		pI:= nil; 
	end; 
end; 

procedure cargarVector (var v:meses; var pI: lista);

		procedure leer (var p: prestamo); 
		begin 
			with p do begin 
				writeln('Ingrese el ISBN: ');
				readln(isbn); 
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
		
		procedure insertar (var pI: lista; valor: integer);
		var
		nuevo, actual, ant: lista;
		begin
			new (nuevo);
			nuevo^.dato:= valor;
			nuevo^.sig:= nil;
			if (pI = nil) then {caso 1}
			pI:= nuevo
			else begin
			actual:= pI;
			ant:= pI;
			while (actual <> nil) and (actual^.dato < nuevo^.dato) do begin
				ant:= actual; {busco la posicion}
				actual:= actual^.sig
			end;
			if (actual = pI) then {caso 2}
			begin
				nuevo^.sig = pI;
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
		insertar(v[p.isbn].pI, p.isbn); 
		leer(p);
	end; 
end;

procedure informarRecursivo (v: meses);


	procedure informarLista (pI: lista);
	begin
		if (pI <> nil) then begin
			writeln(pI^.dato.isbn);
			writeln(pI^.dato.num);
			informarLista(pI^.sig);
		end;
	end;


var
	i: integer;
begin
	for i:= 1 to max do
		informarLista(v[i].pI);
end;

var
v: meses;
pI: lista;
i: integer;
begin
	for i:= 1 to max do
	inicialiarLista(v[i]);
	cargarVector(v,pI);
	informarRecursivo(v);
end.
		




	
	
	
	
	
	
