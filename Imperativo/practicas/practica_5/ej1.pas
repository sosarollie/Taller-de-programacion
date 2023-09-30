{
1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
    a) Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.
    b) Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.
    c) Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
    d) Tenga un módulo recursivo que retorne el monto total de las expensas.}

program ej1;
const
	dimF = 300;
type
	rango = 1..dimF;

	oficinas = record
		codI: integer;
		dni: integer;
		valor: integer;
	end;

	vOficinas = array [rango] of oficinas;

procedure cargarVector (var v: vOficinas; var dimL: rango);

	procedure leer (var o: oficinas);
	begin
		with o do begin
			writeln('Ingrese codigo de identificacion: ');
			readln(codI);
			if (codI <> -1) then begin
				writeln('Ingrese DNI: ');
				readln(dni);
				writeln('Ingrese valor de la expensa: ');
				readln(valor);
				end;
			end;
	end;
	
var
 o: oficinas;
begin
	dimL:= 0;
	leer(o);
	while (o.codI <> -1) and (dimL < dimF) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		leer(o);
	end;
end;

procedure ordenarSeleccion (var v: vOficinas; dimL: rango);
var
i,j,pos: rango;
item: oficinas;
begin
for i:= 1 to dimL - 1 do
	pos:= i;
	for j:= i+1 to dimL do begin
		if (v[j].codI < v[pos].codI) then
			pos:= j;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
		end;
end;

procedure busquedaDicotomica (var v: vOficinas; dimL: rango);
	procedure busqueda (busCod: integer; var ok: boolean; var pos: integer);
	var
	 pri,ult,medio: integer;
	begin
		ok:= false;
		pri:= 1; ult:= dimL; medio:= (pri + ult) div 2;
		while (pri <= ult) and (busCod <> v[medio].codI) do
			begin
				if (busCod < v[medio].codI) then
					ult:= medio -1
				else
					pri:= medio + 1;
				medio:= (pri + ult) div 2;
			end;
		if (pri <= ult) and (busCod = v[medio].codI) then begin
			ok:= true;
			pos:= medio;
		end;
	end;
var
busCod: integer;
ok: boolean;
pos: integer;
begin
	writeln('Ingrese codigo a buscar ');
	readln(busCod);
	busqueda(busCod, ok, pos);
	if (ok = true) then
		writeln('Propietario encontrado, DNI: ', v[pos].dni)
	else
		writeln('El codigo buscado no existe');
end;

procedure expensasRecursivo (v: vOficinas; dimL: rango; var totalExp: integer; pos: integer);
begin
	if (pos <= dimL) then begin
		totalExp:= totalExp + v[pos].valor;
		expensasRecursivo(v, dimL, totalExp, pos + 1);
	end;
end;

var
v: vOficinas;
totalExp,pos: integer;
dimL: rango;
begin
	cargarVector(v, dimL);
	ordenarSeleccion(v, dimL);
	busquedaDicotomica(v,dimL);
	totalExp:= 0;
	pos:= 1;
	expensasRecursivo(v, dimL, totalExp, pos);
	writeln('EL valor total de las expensas es de: ',totalExp);
end.
		
		
		
	
	


	

	
	
				
				
