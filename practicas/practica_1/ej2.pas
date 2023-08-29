{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}
program p1ej2;
const

 dimF = 300;

type

 rangoV = 1..dimF;
 
 oficina = record
	cod: integer;
	dni: integer;
	valor: real;
 end;
 
 vOficinas = array [rangoV] of oficina;
 
procedure cargarVector (var v: vOficinas; var dimL: integer);

	procedure leerOficina(var o: oficina);
	begin
	 with o do begin
		writeln('Codigo: ');
		cod:= random(100);
		writeln(cod);
		writeln('DNI: ');
		dni:= random(3000);
		writeln(dni);
		writeln('Valor expensa: ');
		valor:= random(10000);
		writeln(valor:2:2);
	 end;
	end;

var
 o: oficina;
begin
 randomize;
 leerOficina(o);
 dimL:= 0;
 while (o.cod <> -1) and (dimL < dimF) do begin
	diml:= dimL + 1;
	v[dimL]:= o;
	leerOficina(o);
 end;
end;

procedure ordenarSeleccion (var v: vOficinas; dimL: integer);
var
 i,j, pos: rangov; item: oficina;
begin
 for i:= 1 to (dimL - 1) do begin // avanza de a una posicion en el vector cambiando el valor de pos, hasta la anteultima posicion
  pos:= i;
  for j:= i + 1 to dimL do // recorre el vector, busca un minimo, y lo deposita en pos
	if (v[j].cod < v[pos].cod) then
	 pos:= j;
  // realizo el corrimiento respectivo
  item:= v[pos];
  v[pos]:= v[i];
  v[i]:= item;
 end;
end;

procedure ordenarInsercion (var v: vOficinas; dimL: integer);
var
 i, j: rangov; act: oficina;
 begin
 for i:= 2 to dimL do begin // toma los dos primeros valores y por cada iteracion suma un campo a la comparacion;
  act:= v[i];
  j:= i - 1;
   while(j > 0) and (v[j].cod > act.cod) do begin // mientras que el valor en la posicion N sea mayor que en N + 1
    v[j+1]:= v[j];
    j:= j - 1;
   end;
  v[j+1]:= act;
 end;
end;

procedure informar (v:vOficinas; dimL: rangoV);
var
i: integer;
begin
for i:= 1 to dimL do 
	write('|',v[i].cod, '|');
writeln('----------');
end;
	

var
 v: vOficinas;
 dimL: rangoV;
BEGIN
 cargarVector(v, dimL);
 informar(v,dimL);
 ordenarSeleccion(v, dimL);
 informar(v,dimL);
 ordenarInsercion(v, dimL);
 informar(v,dimL);
END.
   
 
 
 
 

