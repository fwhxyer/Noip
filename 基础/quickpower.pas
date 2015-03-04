program qpowerprogram;
var
 a,b:longint;
function power(a,b:longint):longint;
var t:longint;
begin
 if b=0 then exit(1);
 t:=sqr(power(a,b shr 1));
 if b and 1=1 then t:=t*a;
 exit(t);
end;
begin
 readln(a,b);
 writeln(power(a,b));
end.