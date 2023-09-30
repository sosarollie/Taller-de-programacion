{4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}
program ej4;
const
	
	maxRango = 8;
	
	dimF = 30;
	
type
	
	rangoR = 1..8;
	
	producto = record
		codP: integer;
		codR: rangoR;
		precio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
	vProductos = array [rangoR] of lista;
	
	vRubro3 = array [rangoR] of producto; 
	

procedure inicializarListas (var v1: vProductos);
var
	i: integer;
begin
	for i:= 1 to maxRango do
		v1[i]:= nil;
end;

procedure cargarListas (var v1: vProductos);
	
	procedure leerProducto (var p: producto);
	begin
		with p do begin
			writeln('Ingrese el precio');
			read(precio);
			if (precio <> 0) then begin
				writeln('Ingrese el codigo del producto');
				read(codP);
				writeln('Ingrese el codigo del rubro');
				read(codR);
			end;
		end;
	end;
	
	procedure insertarOrdenado (var pri: lista; p: producto);
	var
		nuevo, ant, act: lista;
	begin
		new(nuevo);
		nuevo^.dato:= p;
		nuevo^.sig:= nil;
		if (pri = nil) then
			pri:= nuevo
		else begin
			act:= pri;
			ant:= pri;
			while (act <> nil) and (act^.dato.codP < nuevo^.dato.codP) do begin
				ant:= act; //busco la pos
				act:= act^.sig;
			end;
			if (act = pri) then begin
				nuevo^.sig:= nil;
				act^.sig:= nuevo;
			end else begin
				ant^.sig:= nuevo;
				nuevo^.sig:= act;
			end;
		end;
	end;
var
	p: producto;
begin
	leerProducto(p);
	while (p.precio <> 0) do begin
		insertarOrdenado(v1[p.codR], p);
		leerProducto(p);
	end;
end;

procedure recorrerLista (pri: lista);
begin
	while (pri <> nil) do begin
		writeln(pri^.dato.codP);
		pri:= pri^.sig;
	end;
end;

procedure informarProductos (v1: vProductos);
var
	i: integer;
begin
	for i:= 1 to maxRango do begin
		writeln('Rubro n° ', i);
		writeln('--------------');
		recorrerLista(v1[i]);
		writeln('--------------');
		end;
	end;

procedure cargarVectorRubro (var v2: vRubro3; pri: lista; var dimL: integer);
begin
	dimL:= 1;
	while (pri <> nil) and (dimL < dimF) do begin
		v2[dimL]:= pri^.dato;
		dimL:= dimL + 1;
		pri:= pri^.sig;
	end;
end;

procedure ordenarSeleccion (var v2: vRubro3; dimL: integer);
var
	i, j, pos: integer;
	item: producto;
begin
	for i:= 1 to (dimL - 1) do begin // avanza de a una posicion en el vector cambiando el valor de pos, hasta la anteultima posicion
		pos:= i;
		for j:= i + 1 to dimL do
			if(v2[j].precio < v2[pos].precio) then // recorre el vector, busca un minimo, y lo deposita en pos
				pos:= j;
	item:= v2[pos]; // corrimiento
	v2[pos]:= v2[i];
	v2[i]:= item;
	end;
end;

procedure mostrarVector (v2: vRubro3; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln(v2[i].precio);
end;

procedure calcularPromedio (v2: vRubro3; var prom: real; dimL: integer);
var
	i: integer;
	sum: real;
begin
	sum:= 0;
	for i:= 1 to dimL do
		sum:= sum + v2[i].precio;
	prom:= (sum / dimL) * 100;
end;


var
	v1: vProductos;
	v2: vRubro3;
	dimL: integer;
	prom: real;
begin
	inicializarListas(v1);
	cargarListas(v1);
	informarProductos(v1);
	cargarVectorRubro(v2, v1[3], dimL);
	ordenarSeleccion(v2, dimL);
	calcularPromedio(v2, prom, dimL);
end.
	
	
		
	

			
			
	
