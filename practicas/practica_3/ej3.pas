{
    3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
}

program ej3;
type

alumnos = record
	legajo: integer;
	dni: integer;
	anio: integer;
end;

arbol = ^nodoArbol;
nodoArbol = record
	dato: alumnos;
	HI: arbol;
	HD: arbol;
end;

procedure generarArbol (var a: arbol);


	procedure leerAlumno (var al: alumnos);
	begin
		write( 'Ingrese anio de ingreso: ');
		readln(al.anio);
		if (al.anio > 2010) then begin
			write('Ingrese numero de legajo ');
			readln(al.legajo);
			write('Ingrese numero de DNI ');
			readln(al.DNI);
		end;
	end;
	
	procedure crear (var a: arbol; elem: alumnos);
	begin
		if (a = nil)
		then begin
			new(a);
			a^.dato:= elem;
			a^.HI:= nil;
			a^.HD:= nil;
			end
		else if (elem.legajo < a^.dato.legajo) then
				crear(a^.HI, elem)
			else
				crear(a^.HD, elem);
	end;
var
alum: alumnos;
begin
	a:= nil;
	leerAlumno (alum);
	while (alum.anio > 2010) do begin
		crear(a,alum);
		writeln;
		leerAlumno(alum);
	end;
end;

procedure informarLegajoInferior (a: arbol);
{
b. Un módulo que reciba la estructura generada en a. e informe el DNI y 
año de ingreso de aquellos alumnos cuyo legajo sea inferior
 a un valor ingresado como parámetro.
}
	procedure inferior (a: arbol; valor: integer);
	begin
		if (a <> nil) then begin
			inferior(a^.HI, valor);
			if (a^.dato.legajo < valor) then begin
				writeln('Alumno con legajo: ',a^.dato.legajo);
				writeln('Su anio de ingreso es: ',a^.dato.anio);
				writeln('Su DNI es: ',a^.dato.dni);
			end;
			inferior(a^.HD, valor);
		end;
	end;
var
valor: integer;
begin
writeln('Ingrese valor para buscar inferiores:');
read(valor);
inferior(a, valor);


end;


{
c. Un módulo que reciba la estructura generada en a. e informe el DNI
 y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre
  dos valores que se reciben como parámetro. 
}
var
a: arbol;
begin
generarArbol(a);
informarLegajoInferior(a);
end.	
		


		
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

