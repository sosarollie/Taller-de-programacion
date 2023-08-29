{
2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
    a) Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
    b) Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
    c) Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
    d) Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. }
program ej2;
type
	
	auto = record
		pat: integer;
		anio: integer;
		marca: string;
		modelo: string;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;

procedure generarArbol (var a: arbol);
	
	procedure leerAuto (var au: auto);
	begin
		with au do begin
			writeln('Ingrese anio de fabricacion del auto: (Entre 2010 y 2018) ');readln(anio);
			if (anio > 2010) and (anio < 2018) then begin
				writeln('Ingrese patente: ');readln(pat);
				writeln('Ingrese marca: ');readln(marca);
				writeln('Ingrese modelo: ');readln(modelo);
				end;
			end;
	end;
	
	procedure ingresarElemento (var a: arbol; elem: auto);
	begin
		if (a <> nil) then begin
			new(a);
			a^.dato:= elem;
			a^.HI:=nil;
			a^.HD:= nil;
		end else if (elem.pat < a^.dato.pat) then
			ingresarElemento(a^.HI, elem)
		else
			ingresarElemento(a^.HD, elem);
	end;

var
 au: auto;
begin
	a:= nil;
	leerAuto(au);
	while (au.anio > 2010) and (au.anio < 2018) do begin
		ingresarElemento(a,au);
		leerAuto(au);
	end;
end;

procedure contarMarca (a: arbol);
	
	procedure contar (a:arbol; marca: string; var cantMarca: integer);
	begin
		if (a <> nil) then
			if (marca = a^.dato.marca) then
				cantMarca:= cantMarca + 1;
			contar(a^.HI, marca, cantMarca);
			contar(a^.HD, marca, cantMarca);
		end;

		
var
marca: string;
cantMarca: integer;
begin
	writeln('Ingrese marca a buscar: ');readln(marca);
	contar(a, marca, cantMarca);
	writeln('La cantidad de autos de la marca "',marca,'" es de', cantMarca);
end;

var
a: arbol;
begin
	generarArbol(a);
	contarMarca (a);
end.
			
				
