{
3.	Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso. 
* La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
}


program ej3p3; 

type 
	
	alumno = record 
		legajo: integer; 
		dni: integer; 
		anio: integer; 
	end; 

	arbol = ^nodo; 
	nodo = record 
		dato: alumno; 
		HI: arbol; 
		HD: arbol; 
	 end; 

procedure generarArbol (var a: arbol);
	
	procedure leer (var alu: alumno); 
	begin 
		with alu do begin 
			write('Introduzca anio de ingreso: '); 
			readln(anio); 
			if (alu.anio > 2010) then begin
				write('Introduzca legajo del alumno: ');
				readln(legajo); 
				write('Introduzca DNI del alumno: ');
				readln(dni);
			end;
			writeln; 
		end; 
	end; 
	
	procedure crear (var a: arbol; alu: alumno); 
	begin 
		if (a = nil) then begin 
			new(a); 
			a^.dato:= alu; a^.HI:= nil; a^.HD:= nil; 
		end else if (alu.legajo < a^.dato.legajo) then 
			crear(a^.HI, alu)
		else 
			crear(a^.HD, alu); 
	end; 
	
var 
	alu: alumno; 
begin 
	leer(alu); 
	while (alu.anio > 2010) do begin 
		crear(a, alu); 
		leer(alu);
	end; 
end; 


procedure informarLegajoInferior (a: arbol); 
	
	procedure cumple (a: arbol; num: integer);
	begin 
		if (a <> nil) then begin 
			cumple(a^.HI,num); 
			if (a^.dato.legajo < num) then 
				writeln('El alumno de DNI ',a^.dato.dni, ' ingreso en el anio ', a^.dato.anio);
			cumple(a^.HD,num); 
		end; 
	end; 

var
	num: integer;
	
begin 
	writeln('----- Impresion de todos los estudiantes con legajo menor al ingresado -----'); 
	writeln;
	write('Ingrese un legajo para la busqueda: '); 
	readln(num);
	writeln;
	cumple(a, num);
end; 

procedure informarRangoLegajo (a: arbol; n1, n2: integer); 
	
	procedure cumple (a: arbol; n1, n2: integer);
	begin 
		if (a <> nil) then begin 
			cumple(a^.HI,n1,n2); 
			if  (a^.dato.legajo > n1) and (a^.dato.legajo < n2) then 
				writeln('El alumno de DNI ',a^.dato.dni, ' ingreso en el anio ', a^.dato.anio);
			cumple(a^.HD,n1,n2); 
		end; 
	end; 

var
	n1, n2: integer; 
	
begin 
	writeln('----- Impresion de todos los estudiantes con legajo menor al ingresado -----'); 
	writeln;
	write('Ingrese un legajo para la busqueda: '); 
	readln(n1);
	writeln; 
	write('Ingrese otro legajo para la busqueda: '); 
	readln(n2); 
	writeln;
	cumple(a, n1, n2);
end; 



// PROGRAMA PRINCIPAL 

var
	a: arbol; 

begin 
	generarArbol(a); 
	informarLegajoInferior(a); 
	informarRangoLegajo(a); 
end. 
	













