{
6.- Realizar un programa que lea números y que utilice un procedimiento recursivo 
		que escriba el equivalente en binario de un número decimal. 
El programa termina cuando el usuario ingresa el número 0 (cero). }

program ej6p2; 

procedure convertir (num: integer); 
var
	digB: integer; 
begin 
	if (num <> 0) then begin 
		digB:= num MOD 2; 
		num:= num DIV 2; 
		convertir(num); 
		write(digB); 
	end; 
end; 

 // PROGRAMA PRINCIPAL 
 
 var 
	num: integer; 
	
begin 
	write('Ingrese un numero para convertir: '); 
	readln(num);  
	convertir(num); 
end.
