program gcdprogram;
var
 a,b:longint;
function gcd(a,b:longint):longint;
var t:longint;
begin
 if a=b then exit(a)
  else if a<b then begin a:=a xor b;b:=a xor b;a:=a xor b; end;
 while b<>0 do begin
  t:=a;a:=b;b:=t mod b;
 end;
 gcd:=a;
end;
begin
 readln(a,b);
 writeln(gcd(a,b));
 writeln(a*b/gcd(a,b):0:0);
end.
