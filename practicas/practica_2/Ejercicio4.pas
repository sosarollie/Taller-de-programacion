{
4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program ej4p2; 
const 

	dimF = 20; 
	
type 

	rango = 1..dimF; 
	
	vector = array [rango] of integer; 
	
	// INCISO A 
	
procedure cargarVector (var v: vector; i: integer); 
begin 
	if (i <= dimF) then begin 
		v[i]:= random(100); 
		writeln(v[i]);
		cargarVector(v, i+1); 
	end; 
end; 
	
	// INCISO B 
	
procedure maxValor (v: vector; i: integer; var max: integer);
begin 
	if (i <= dimF) then begin 
		if (v[i] > max) then 
			max:= v[i]; 
		maxValor(v, i+1, max); 
	end; 
end; 
	
	// INCISO C
	
procedure minValor (v: vector; i: integer; var min: integer);
begin 
	if (i <= dimF) then begin 
		if (v[i] < min) then 
			min:= v[i]; 
		minValor(v, i+1, min); 
	end; 
end; 

 // PROGRAMA PRINCIPAL 
 
 var 
	i, min, max: integer; 
	v: vector; 
	
begin
	min:= 32000; 
	max:= -1; 
	i:= 1; 
	cargarVector(v, i);
	maxValor(v, i, max); 
	minValor(v, i, min); 
	writeln('El minimo valor del vector es: ', min);
	writeln('El maximo valor del vector es: ', max); 
end. 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
