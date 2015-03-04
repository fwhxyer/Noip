program p1041;
var
 n,p,q:real;n1,n2,a,i:longint;
begin
 read(p,q);
 for i:=1 to 10000000 do
 begin
  n1:=trunc(i*p/100)+1;
  n2:=trunc(i*q/100);
  n:=(i*q/100);
  if n=n2 then a:=n2-1 else a:=trunc(i*q/100);
  if (n1<=a)and(a>0) then 
  begin writeln(i);break; end;
 end;
end.
