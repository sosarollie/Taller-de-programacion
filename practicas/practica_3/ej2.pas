{2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
* 
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}

program tp3ej2;
type

	rangoDia = 1..31;
	rangoMes = 1..12;

	venta = record
		codP: integer;
		dia: rangoDia;
		mes: rangoMes;
		cant: integer;
	end;
	
	producto = record
		codP: integer;
		cant: integer;
	end;
	
	arbolV = ^nodo;
	nodo = record
		dato: venta;
		HI: arbolV;
		HD: arbolV;
	end;
	
	arbolP = ^nodo2;
	nodo2 = record
		dato: producto;
		HI: arbolP;
		HD: arbolP;
	end;
	
	
procedure cargarArbol (var a1: arbolV; var a2: arbolP);

	procedure leerVenta (var v: venta);
	begin
		with v do begin
			writeln('codigo: ');
			read(codP);
			if (codP <> 0) then begin
				writeln('dia: ');
				read(dia);
				writeln('mes: ');
				read(mes);
				writeln('cantidad vendida: ');
				read(cant);
			end;
		end;
	end;
	
	procedure insertarVenta (var a1: arbolV; v: venta);
	begin
	 if (a1 = nil) then begin
		new (a1);
		a1^.dato:= v;
		a1^.HI:= nil;
		a1^.HD:= nil;
	 end
	 else if (v.codP >= a1^.dato.codP) then
			insertarVenta(a1^.HD, v)
		  else
			insertarVenta(a1^.HI, v);
	end;
	
	procedure insertarProducto (var a2: arbolP; p: producto);
	begin
     if (a2 = nil) then begin
	 	 new (a2);
		 a2^.dato:= p;
		 a2^.HI:= nil;
		 a2^.HD:= nil;
	  end
	  else if (p.codP > a2^.dato.codP) then
			 insertarProducto(a2^.HD, p)
		   else if (p.codP < a2^.dato.codP) then
			 insertarProducto(a2^.HI, p)
		   else	if (p.codP = a2^.dato.codP) then
			 a2^.dato.cant:= a2^.dato.cant + p.cant;
	 end;

var
 v: venta;
 p: producto;
begin
 a1:= nil;
 a2:= nil;
 leerVenta(v);
 while (v.codP <> 0) do begin
	insertarVenta(a1, v);
	p.codP:= v.codP;
	p.cant:= v.cant;
	insertarProducto(a2, p);
	leerVenta(v);
 end;
end;

procedure imprimirVentas (a1: arbolV);
begin
	if (a1 <> nil) then begin
		imprimirVentas (a1^.HI);
		writeln(a1^.dato.codP);
		imprimirVentas(a1^.HD);
	end;
end;

procedure imprimirProductos (a2: arbolP);
begin
	if (a2 <> nil) then begin
		imprimirProductos (a2^.HI);
		writeln(a2^.dato.codP);
		writeln(a2^.dato.cant);
		imprimirProductos(a2^.HD);
	end;
end;

procedure cantidadArbolVentas (a1: arbolV; cod: integer; var total: integer);
begin
	if (a1 <> nil) then begin
		if (a1^.dato.codP = cod) then
			total:= total + a1^.dato.cant;
		cantidadArbolVentas(a1^.HI, cod, total);
		cantidadArbolVentas(a1^.HD, cod, total);
	end;
end;

procedure cantidadArbolProductos (a2: arbolP; cod:integer; var total: integer);
begin
	if (a2 <> nil) then begin
		if (a2^.dato.codP = cod) then
			total:= a2^.dato.cant;
		cantidadArbolProductos(a2^.HD, cod, total);
		cantidadArbolProductos(a2^.HI, cod, total);
	end;
end;				

var 	
 a1: arbolV;
 a2: arbolP;
 cod, total: integer;
begin
 cargarArbol(a1, a2);
 imprimirVentas(a1);
 imprimirProductos(a2);
 total:= 0;
 cod:= 5;
 cantidadArbolVentas(a1, cod, total);
 writeln(total);
 total:= 0;
 cantidadArbolProductos(a2, cod, total);
 writeln(total);
end.

		
	
