program ej2;

procedure imprimir (num: integer);
var
dig: integer;
begin
	if (num <> 0) then begin	
		dig:= num MOD 10;
		num:= num DIV 10;
		imprimir(num);
		writeln(dig);
	end;
end;


var
num: integer;
begin
	readln(num);
	while (num <> 0) do begin
		 imprimir(num);readln(num);
	end;
end.

