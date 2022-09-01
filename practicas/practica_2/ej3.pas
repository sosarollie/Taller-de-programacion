{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario.}

program ej3;
type
	lista = ^nodo;
	
	nodo = record
		elem: integer;
		sig: lista;
	end;

procedure agregarAdelante (var pI: lista; num: integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.elem:= num;
	nuevo^.sig:= nil; {creo espacio para el nuevo elemento}
	if (pI = nil) then 
		pI:= nuevo
	else begin
		nuevo^.sig:= pI;
		pI:= nuevo;
		end;
end;


procedure cargarListaRecursivo (var pI: lista);
var
num: integer;
begin
	num:= random(100);
	write(num);
	write(' ');
		if (num <> 0) then begin
			agregarAdelante(pI, num);
			cargarListaRecursivo(pI);
	end;
end;

procedure encontrarMinimo(pI: lista; var min: integer);
begin
	if (pI <> nil) then begin
		if (pI^.elem < min) then
			min:= pI^.elem;
		encontrarMinimo(pI^.sig, min);
	end;
end;

procedure encontrarMaximo (pI: lista; var max: integer);
begin
	if (pI <> nil) then begin
		if (pI^.elem > max) then
			max:= pI^.elem;
		encontrarMaximo(pI^.sig, max);
	end;
end;

function seEncuentra (pI: lista; valor: integer): boolean;
begin
	if (pI^.elem = valor) then
		seEncuentra:= true
	else
		seEncuentra(pI^.sig, valor);
end;
	

var
pI: lista;
min,max,valor: integer;
encontro: boolean;
begin
valor:= random(100);
max:= -1;
min:= 999;
cargarListaRecursivo(pI);
encontrarMinimo(pI, min);
encontrarMaximo(pI, max);
writeln(' ');
writeln();
writeln('el minimo es: ',min);
writeln('el maximo es: ',max);
encontro:= seEncuentra(pI,valor);
if (encontro) then
	writeln(valor,' se encuentra en la lista')
else
	writeln(valor,' no se encuentra en la lista');


end.

		

	





