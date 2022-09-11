{
    2. Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Implementar un programa que contenga:
        a. Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1. 
        b. Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas almacenadas ordenadas por código de película.
}
program ej2;
const
	maxCod = 8;
type
	rango = 1..maxCod;
	
	peliculas = record
		codP: integer;
		codG: rango;
		prom: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: peliculas;
		sig: lista;
	end;

	vPeliculas = array [rango] of lista;
	
	
procedure inicializarListas (var v: vPeliculas);
var
	i: integer;
begin
	for i:= 1 to maxCod do
		v[i]:= nil;
end;

procedure cargarVector (var v: vPeliculas);

	procedure leer (var p: peliculas);
	begin
		with p do begin
			writeln('Ingresar cod de pelicula ');
			readln(codP);
			if (codP <> -1) then begin
				writeln('Ingresar cod de genero ');
				readln(codG);
				writeln('Ingresar promedio ');
				readln(prom);
			end;
		end;
	end;
	
	procedure insertar (var pI: lista; p: peliculas);
	var
	nuevo, actual, ant: lista;
	begin
		new (nuevo);
		nuevo^.dato:= p;
		nuevo^.sig:= nil;
		if (pI = nil) then {caso 1}
			v[p.codG]:= nuevo
		else begin
			actual:= pI;
			ant:= pI;
			while (actual <> nil) and (actual^.dato.codP < nuevo^.dato.codP) do begin
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
	p: peliculas;
begin
	leer(p);
	while (p.codP <> -1) do begin
		insertar(v[p.codG], p);
		leer(p);
	end;
end;

procedure merge (v: vPeliculas);
	
	procedure minimo(var v: vPeliculas; var  minP: peliculas; var min: integer);
	Var
	indiceMin,i:integer;
	Begin
	  min:= 32000;
	  for i:= 1 to maxCod do
	     if (v[i] <> nil) then 
	      if (v[i]^.dato.codP <= min) then begin
				indiceMin:= i;
				minP:= v[i]^.dato;  
				min:= v[i]^.dato.codP;
			 end; 
		  if (min <> 32000) then 
		    begin
		      minP:= v[indiceMin]^.dato;
		      v[indiceMin]:= v[indiceMin]^.sig;
		    end;
	End;		

	procedure agregarAtras (var pI,pU: lista; p: peliculas);
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
			write('Codigo de pelicula: ');
			writeln(pI^.dato.codP);
			writeln;
			informarLista(pI^.sig);
		end;
	end;

var
	pINuevo: lista;
	pUNuevo: lista;
	minP: peliculas;	
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

var
	v: vPeliculas;
begin
	inicializarListas(v);
	cargarVector(v);
	merge(v);
end.
					


