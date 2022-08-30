program ej3;
const 
	max-genero = 8; 
	
type 

	rangoG = 1..max-genero; 
	 	
	pelicula = record 
		pri: lista;
		ult: lista;
	end; 
	
	lista = ^nodo; 
	nodo = record 
		dato: pelicula;
		sig: lista;
	end; 
	
	peliculas = array [rangoG] of lista; 
	
	generos = array [rangoG] of integer;
	

procedure leer (var p:pelicula);
begin
	Randomize;
	write ('Codigo de producto: ');
	readln(p.codP);
	write ('Codigo de genero: ');
	p.codG:= random(8);
	writeln:= p.codG
	write ('Puntaje Promedio: ');
	readln(p.puntaje);	
end;

procedure agregarAlFinal (var pri: lista; p: pelicula);
var
nuevo,aux: lista;
begin
new (nuevo);
nuevo^.elem:= p;
nuevo^.sig:= nil;
if (pI = nil) then
	pI:= nuevo {evaluo si la lista esta vacia}
else begin
	aux:= pI;                   {recorro y quedo parado en el ultimo elemento}
	while (aux^.sig <> nil) do
		aux:=  aux^.sig;
		
	aux^.sig:= nuevo; {le indico al ultimo que ahora su siguiente es nuevo}
	end;
end;

procedure inicializarLista (
begin
for i:= 1 to 8 do begin
	v[i].pri:= nil;
	v[i].ult:= nil;
