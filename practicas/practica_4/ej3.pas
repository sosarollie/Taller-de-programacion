{
    3. Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un programa que:
        a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
        b. Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad total vendida para cada código de producto.
}
program ej3;
const
	maxRango = 4;
type
	rango = 1..maxRango;
	
	venta = record
		dia: integer;
		mes: integer;
		codP: integer;
		codS: rango;
		cantVen: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;
	
	ventaAcumulada = record
		codP: integer;
		cantT: integer;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: ventaAcumulada;
		sig: lista2;
	end;
	
	vSucursal = array [rango] of lista;

procedure inicializarListas(var v:vSucursal);
var
	 i: integer;
begin
	for i:= 1 to maxRango do
		v[i]:= nil;
end;

procedure cargarVector (var v: vSucursal);

	procedure leer (var ve: venta);
	begin
		with ve do begin
			writeln('Ingrese el dia de la venta: ');
			readln(dia);
			writeln('Ingrese el mes de la venta: ');
			readln(mes);
			writeln('Ingrese el codigo de producto: ');
			readln(codP);
			if (codP <> -1) then begin
				writeln('Ingrese el codigo de sucursal: ');
				readln(codS);
				writeln('Ingrese la cantidad vendida: ');
				readln(cantVen);
			end;
		end;
	end;
	
	procedure insertar (var pI: lista; ve: venta);
	var
	nuevo,ant,act: lista;
	begin
	new(nuevo);
	nuevo^.dato:= ve;
	nuevo^.sig:= nil;
	if (pI = nil) then
		v[ve.codS]:= nuevo
	else begin
		act:= pI;
		ant:= pI;
		while (act <> nil) and (act^.dato.codP < nuevo^.dato.codP) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = pI) then begin
			nuevo^.sig:= pI;
			pI:= nuevo;
			end
		else begin
			ant^.sig:= nuevo;
			nuevo^.sig:= act;
			end;
		end;
	end;
var
	ve: venta;
begin
	leer(ve);
	while (ve.codP <> -1) do begin
		insertar(v[ve.codS],ve);
		leer(ve);
	end;
end;

procedure mergeAcumulador (v: vSucursal; var pI,pU: lista2);
	
	procedure minimo (var v: vSucursal; var codMin: integer; var cantVen: integer);
	var
	 indiceMin,i: integer;
	begin
		codMin:= 32000;
		for i:= 1 to maxRango do
			if (v[i] <> nil) then
				if (v[i]^.dato.codP <= codMin) then begin
					indiceMIn:= i;
					codMin:= v[i]^.dato.codP;
				end;
		if (codMin <> 32000) then begin
			codMin:= v[indiceMin]^.dato.codP;
			cantVen:= v[indiceMin]^.dato.cantVen;
			v[indiceMin]:= v[indiceMin]^.sig;
		end;
	end;
	
	procedure agregarAtras (var pI,pU: lista2; act,cantVen: integer);
	var
	 nuevo: lista2;
	begin
		new(nuevo);
		nuevo^.dato.codP:= act;
		nuevo^.dato.cantT:= cantVen;
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
	
	procedure informarLista (pI: lista2);
	begin
		if (pI <> nil) then begin
			writeln;
			write('Codigo de producto: ');
			writeln(pI^.dato.codP);
			writeln;
			write('Cantidad vendida: ');
			writeln(pI^.dato.cantT);
			informarLista(pI^.sig);
		end;
	end;
	
var
 codmin,cantVen,act,cant: integer;
begin
	pI:= nil;
	pU:= nil;
	cant:= 0;
	minimo(v, codMin, cant);
	while (codMin <> 32000) do begin
		act:= codMin;
		cantVen:= 0;
		while (codMin <> 32000) and (codMin = act) do begin
			cantVen:= cantVen + cant;
			minimo(v, act, cant);
		end;
		agregarAtras(pI,pU,codMin,cantVen);
	end;
	informarLista(pI);
end;

var
 v: vSucursal;
 pI: lista2;
 pU: lista2;
begin
	inicializarListas(v);
	cargarVector(v);
	mergeAcumulador(v,pI,pU);
end.
		
	





			 
	

	

		
