program ej3;
const 
	maxGenero = 8;
	
type 

	rango = 1..maxGenero; 
	 	
	pelicula = record 
		codP: integer;
		codG: rango;
		puntaje: real;
	end; 
	
	lista = ^nodo; 
	nodo = record 
		dato: pelicula;
		sig: lista;
	end;
	
	punteros = record
		pI: lista;
		pU: lista;
	end;
	
	peliculas = array [rango] of punteros; 
	
	generos = array [rango] of integer;
	

procedure inicialiarLista (var v1: peliculas); 
var
	i: integer; 
begin 
	for i:= 1 to maxGenero do begin
		v1[i].pI:= nil; 
		v1[i].pU:= nil; 
	end; 
end; 

procedure leer (var p: pelicula); 
	begin 
		with p do begin 
			readln(codP); 
			readln(codG); 
			readln(puntaje); 
		end;
	end; 
	
procedure agregarAlFinal (var pI,pU: lista; p: pelicula);
var
   nuevo: lista;
begin
    new (nuevo);
    nuevo^.dato:= p;
    nuevo^.sig:= nil;
    if (pI = nil) then begin
        pI:= nuevo;
        pU:= nuevo;
    end else begin
        pU^.sig:= nuevo;
        pU:= nuevo;
    end;
end;

procedure cargarLista (var pI: lista; var v1: peliculas); 
var 
	pU: lista; 
	p: pelicula; 
begin
	leer(p);
	while (p.codP <> -1) do begin 
		agregarAlFinal(v1[p.codP].pI, v1[p.codP].pU, p); 
		leer(p);
	end; 
end; 

procedure inicializarV (var v2: generos);
var
	i: integer;
begin
	for i:= 1 to maxGenero do
		v2[i]:= 0;
end;

procedure cargarContador (v1: peliculas; var v2: generos);
var
	i: integer;
	max: real;
	maxCod: integer;
begin
	max:= -1;
	maxCod:= 0;
	for i:= 1 to maxGenero do begin
		while (v1[i].pI <> nil) do begin
			if (v1[i].pI^.dato.puntaje > max) then begin
				max:= v1[i].pI^.dato.puntaje;
				maxCod:= v1[i].pI^.dato.codP;
			end;
		end;
		v2[i]:= maxCod;
		maxCod:= 0;
		max:= -1;
	end;
end;

procedure ordenarVectorInsercion (var v2: generos);
var
i,j: rango; act: integer;
begin
	for i:= 2 to maxGenero do begin {toma los dos primeros valores, y por cada iteracion suma un campo a la comparacion}
		act:= v2[i];
		j:= i-1;
		while (j > 0) and (v2[j] > act) do begin {mientras que el valor en la primera posicion sea mayor que en la segunda}
			v2[j+1] := v2[j];
			j:= j-1;
		end;
		v2[j+1]:= act;
	end;
end;

procedure imprimir (v2: generos);
begin
	writeln('EL codigo de pelicula con mayor puntaje es: ',v2[1]);
	writeln('El codigo de oelicula con mayor puntaje es: ',v2[maxGenero]);
end;

// VARIABLES PROGRAMA PRINCIPAL

var
	v1: peliculas;
	v2: generos;
	pI: lista;
begin
	pI:= nil;
	inicialiarLista(v1);
	cargarLista(pI,v1);
	inicializarV(v2);
	cargarContador(v1,v2);
	ordenarVectorInsercion(v2);
	imprimir(v2);
end.
		
	
		


