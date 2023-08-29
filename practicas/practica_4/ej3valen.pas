{3.	Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. 
De cada venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida. 
El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un programa que:
a.	Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
b.	Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad total vendida para cada código de producto.}

program ej3p4; 
const 

    maxSucursal = 4; 
    
type

    rango = 0..maxSucursal;

    str = string[10];

    venta = record 
        fecha: str; 
        codP: integer; 
        codS: rango; 
        cant: integer; 
    end; 
    
    lista = ^nodo; 
    nodo = record 
        dato: venta; 
        sig: lista; 
    end;
    
    ventaTotal = record 
        cantT: integer;
        codP: integer; 
    end; 
    
    listaTotal = ^nodo2;
    nodo2 = record 
        dato: ventaTotal;
        sig: listaTotal; 
    end; 
    
    sucursales = array [rango] of lista; 
    
procedure inicializarListas (var vec: sucursales);
var
    i: integer; 
begin 
    for i:= 1 to maxSucursal do 
        vec[i]:= nil; 
end; 
    
procedure cargarVector (var vec: sucursales);
    procedure leer (var v: venta); 
    begin 
        with v do begin 
            write('Ingrese codigo de sucursal');
            readln(codS);
            if (codS <> 0) then begin 
                write('Ingrese la fecha en formato xx/xx/xxxx');
                readln(fecha);
                write('Ingrese codigo de producto');
                readln(codP);
                write('Ingrese cantidad vendida');
                readln(cant);
            end; 
        end; 
    end; 
    
    procedure insertar (var pI: lista; v: venta);
    var
        nuevo, ant, act: lista; 
    begin 
	    new(nuevo);
	    nuevo^.dato:= v;
	    nuevo^.sig:= nil;
	    if (pI = nil) then
		    pI:= nuevo
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
			end else begin
			    ant^.sig:= nuevo;
		        nuevo^.sig:= act;
			end;
		end;
    end; 
    
    // CUERPO DEL PROCEDIMIENTO 
    
var 
    v: venta; 
begin 
    leer(v);
    while (v.codS <> 0) do begin 
        insertar(vec[v.codS],v);
        leer(v);
    end; 
end; 

procedure mergeAcumulador (vec: sucursales);
    procedure minimo (vec: sucursales; var codMin, cantV: integer); 
    var
        indiceMin, i: integer; 
    begin 
        codMin:= 32000; indiceMin:= -1; 
        for i:= 1 to maxSucursal do  
            if (vec[i] <> nil) then 
                if (vec[i]^.dato.codP <= codMin) then begin 
                    indiceMin:= i; 
                    codMin:= vec[i]^.dato.codP; 
                end;
        if (indiceMin <> -1) then begin 
            codMin:= vec[indiceMin]^.dato.codP; 
            cantV:= vec[indiceMin]^.dato.cant; 
            vec[indiceMin]:= vec[indiceMin]^.sig; 
        end; 
    end; 
    
    procedure agregarAtras (var pI, pU: listaTotal; actual, totalV: integer);
	var
	 nuevo: listaTotal;
	begin
		new(nuevo);
		nuevo^.dato.codP:= actual;
		nuevo^.dato.cantT:= totalV;
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
	
    
// CUERPO PRINCIPAL DEL PROCEDIMIENTO 

var
    totalV, actual, codMin, cantV: integer; 
    pI,pU: listaTotal;
begin 
    pI:= nil; pU:= nil;  
    minimo(vec,codMin,cantV);
    while (codMin <> 32000) do begin 
        actual:= codMin; 
        totalV:= 0; 
        while (codMin <> 32000) and (codMin = actual) do begin 
            totalV:= totalV + cantV; 
            minimo(vec,codMin,cantV);
        end; 
        agregarAtras(pI,pU,actual,totalV);
    end; 
end; 
       
// PROGRAMA PRINCIPAL 

var 
    vec: sucursales;
begin 
    inicializarListas(vec);
    cargarVector(vec);
    mergeAcumulador(vec); 
end. 
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
