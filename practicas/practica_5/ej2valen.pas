{2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado.}


program ej2Adicionales; 
const 
    max = 2018; 
    
type 
    
    rango = 2010..max; 
    
    str = string[20];
    
    venta = record 
        patente: str; 
        anio: rango; 
        marca: str; 
        modelo: str; 
    end; 
    
    arbol = ^nodo; 
    nodo = record
        dato: venta; 
        HI: arbol; 
        HD: arbol; 
    end; 
    
    anios = array [rango] of venta; 
    

procedure generarArbol (var a: arbol);
    procedure leer (var v: venta); 
    begin 
        with v do begin 
            write('Ingrese anio de fabricacion: ');
            readln(anio); 
            if (anio > 2010) and (anio < 2018) then begin 
                write('Ingrese patente del auto: ');
                readln(patente); 
                write('Ingrese marca del auto: ');
                readln(marca); 
                write('Ingrese modelo del auto: ');
                readln(modelo); 
                writeln; 
            end; 
        end; 
    end; 
    
    procedure crear (var a: arbol; v: venta);
    begin 
        if (a = nil) then begin 
            new(a); 
            a^.dato:= v; 
            a^.HI:= nil; 
            a^.HD:= nil; 
        end else if (v.patente < a^.dato.patente) then 
            crear(a^.HI,v)
        else 
            crear(a^.HD,v);
    end; 
    
var 

    v: venta; 
    
begin 
    a:= nil; 
    leer(v); 
    while (v.anio > 2010) and (v.anio < 2018) do begin 
        crear(a,v); 
        writeln; 
        leer(v); 
    end; 
end; 

procedure contarMarca (a: arbol); 
    procedure buscarMarca(a: arbol; var total: integer);
    begin 
        if (a <> nil) then 
            if (a^.dato.marca = buscar) then begin
                total:= total + 1; 
                contar(a^.HI,total); 
                contar(a^.HD,total); 
            end; 
    end; 
     
var
    buscarMarca: str; 
    total: integer; 
begin   
    total:= 0; 
    write('Ingresar la marca de auto que desea contar su cantidad: ');
    readln(buscarMarca); 
    contar(a,total); 
    if (total <> 0) then 
        writeln('El total de autos de la marca ', buscarMarca, ' es de: ', total);
    else 
        writeln('No se encontraron autos pertenecientes a la marca ', buscarMarca)
end; 

// CUERPO PRINCIPAL DEL PROGRAMA 

var 
    a: arbol; 
    total: integer; 
            
begin 
    generarArbol(a); 
    contarMarca(a); 
end. 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
