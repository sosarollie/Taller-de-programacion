program ej2;
const
	
	dimF = 5;

type
	rango1 = 0..dimF;
	
	oficina = record
		cod: rango1;
		dni: integer;
		valor: real;
	
	end;
	
	vOficinas = array [rango1] of oficina;
 

procedure cargarVector (var v: vOficinas; var dimL: rango1);

	procedure leer (var o:oficina);
	begin
		Randomize;
		write ('Codigo de producto: ');
		o.cod:= random(100);
		writeln (o.cod);
		write ('DNI: ');
		readln(o.dni);
		write ('Valor: ');
		readln(o.valor);
	
	end;
	
	
var o:oficina;
begin
	dimL:= 0;
	leer (o);
	while (o.cod <> -1) and (dimL < dimF) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		leer (o);
	end;
end;
	
procedure ordenarSeleccion 	(var v: vOficinas; dimL: rango1);
var
i,j,pos: rango1; item: oficina;
begin
for i:= 1 to (dimL - 1) do begin {avanza de a una posicion en el vector cambiando el valor de pos}
	pos:= i;
	for j:= i + 1 to dimL do {recorre el vector, busca un minimo y lo deposita en pos}
		if (v[j].cod < v[pos].cod) then
			pos:= j;
	{swap de valores}
	item:= v[pos];
	v[pos]:= v[i];
	v[i]:= item;
	end;
end;

procedure ordenarInsercion (var v: vOficinas; dimL: rango1);
var
i,j: rango1; act: oficina;
begin
	for i:= 2 to dimL do begin {toma los dos primeros valores, y por cada iteracion suma un campo a la comparacion}
		act:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].cod > act.cod) do begin {mientras que el valor en la primera posicion sea mayor que en la segunda}
			v[j+1] := v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;
	
procedure informar (v:vOficinas; dimL: rango1);
var
i: integer;
begin
for i:= 1 to dimL do 
	writeln('la oficina paga expensas por ',v[i].cod ,'|', v[i].dni,'|', v[i].valor:2:2);
	writeln('-----');
end;
	

var
v: vOficinas;
dimL: rango1;
BEGIN
cargarVector(v,dimL);
informar(v,dimL);
ordenarSeleccion(v,dimL);
informar(v,dimL);
	
END.

