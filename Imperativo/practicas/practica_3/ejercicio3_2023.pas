{a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program tp3ej3;
type

	materia = record
		cod: integer;
		nota: integer;
	end;

	lista = ^nodo;
	nodo = record
		dato: materia;
		sig: lista;
	end;
		
	alumno = record
		legajo: integer;
		dni: integer;
		anio: integer;
		listaMaterias: lista;
	end;

	arbol = ^nodoArbol;
	nodoArbol = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;

procedure cargarArbol (var a: arbol);
	
		
	procedure leerAlumno (var alum: alumno; var pri: lista);
	
		procedure leerMateria (var m: materia);
		begin
			with m do begin
				writeln('Ingrese codigo de materia: ');
				read(cod);
				if (cod <> -1) then begin
					writeln('Ingrese la nota: ');
					read(nota);
				end;
			end;
		end;
		
		procedure agregarAdelante (var pri: lista; m: materia);
		var
			nuevo: lista;
		begin
			new(nuevo);
			nuevo^.dato:= m;
			nuevo^.sig:= pri;
			pri:= nuevo;
		end;
		
		procedure cargarLista (var pri: lista);
		var
			m: materia;
		begin
			leerMateria(m);
			while (m.cod <> -1) do begin
				agregarAdelante(pri, m);
				leerMateria(m);
			end;
		end;
		
	begin
		with alum do begin
			writeln('Ingrese legajo: ');
			read(legajo);
			if (legajo <> 0) then begin
				writeln('Ingrese DNI: ');
				read(dni);
				writeln('Ingrese anio de ingreso: ');
				read(anio);
				cargarLista(pri);
			end;
		end;
	end;

	procedure insertarElemento (var a: arbol; alum: alumno);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= alum;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else if (alum.legajo < a^.dato.legajo) then
			insertarElemento(a^.HI, alum)
		else insertarElemento(a^.HD, alum);
	end;

var
	alum: alumno;
	pri: lista;
begin
	a:= nil;
	pri:= nil;
	leerAlumno (alum, pri);
	while (alum.legajo <> 0) do begin
		insertarElemento (a, alum);
		leerAlumno (alum, pri);
	end;
end;

procedure datosAlumnoInferior(a: arbol; leg: integer; var dni, anio: integer);
begin
	if (a <> nil) and (a^.dato.legajo >= leg) then
		datosAlumnoInferior(a^.HI, leg, dni, anio)
	else if (a <> nil) and (a^.dato.legajo < leg) then begin
		datosAlumnoInferior(a^.HD, leg, dni, anio);
		dni:= a^.dato.dni;
		anio:= a^.dato.anio;
		writeln('DNI: ', dni);
		writeln('Anio: ', anio);
		datosAlumnoInferior(a^.HI, leg, dni, anio);
	end;
end;

procedure informarMaxLegajo (a: arbol);

	function maxLegajo (a: arbol): integer;
	begin
		if (a = nil) then 
			maxLegajo:= -1
		else if (a^.HD = nil) then maxLegajo:= a^.dato.legajo
							   else maxLegajo:= maxLegajo(a^.HD);
		
	end;
var
	max: integer;
begin
	max:= maxLegajo(a);
	if (max = -1) then
		writeln('El arbol esta vacio')
	else writeln('El legajo mas grande es: ', max);
end;

procedure informarMaxDni (a: arbol);

	procedure actualizarMax (a: arbol; var maxDni: integer);
	begin
		if (a^.dato.dni > maxDni) then
			maxDni:= a^.dato.dni
	end;
	
	procedure recorrerArbol (a: arbol; var maxDni: integer);
	begin
		if (a <> nil) then begin
			actualizarMax(a, maxDni);
			recorrerArbol(a^.HI, maxDni);
			recorrerArbol(a^.HD, maxDni);
		end;
	end;

var 
	maxDni: integer;
begin
	maxDni:= -1;
	recorrerArbol(a, maxDni);
	if (maxDni = -1) then
		writeln('El arbol esta vacio')
	else writeln('El dni mas grande es: ', maxDni);
end;

procedure informarCantLegajoImpar (a: arbol);

	function esImpar (num: integer): boolean;
	begin
		esImpar:= false;
		if (num DIV 2 <> 0) then
			esImpar:= true;
	end;
	
	procedure recorrerArbol(a: arbol; var cant: integer);
	begin
		if (a <> nil) then begin
			if (esImpar(a^.dato.legajo)) then
				cant:= cant + 1;
			recorrerArbol(a^.HD, cant);
			recorrerArbol(a^.HI, cant);
		end;
	end;		
var
	cant: integer;
begin
	cant:= 0;
	recorrerArbol(a, cant);
	if (cant = 0) then
		writeln('El arbol esta vacio o no hay legajos impares')
	else writeln('La cantidad de legajos impares es: ', cant);
end;
	

var
	a: arbol;
	leg, dni, anio: integer;
	
begin
	cargarArbol(a);
	writeln('Ingrese legajo para buscar sus inferiores');
	read(leg);
	datosAlumnoInferior(a, leg, dni, anio);
	informarMaxLegajo(a);
	informarMaxDni(a);
	informarCantLegajoImpar(a);
end.


		
	
	
