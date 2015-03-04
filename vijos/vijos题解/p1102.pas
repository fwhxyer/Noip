program p1102;
var
 i,s,n:integer;
 a:array[1..10]of integer;
begin
 for i:=1 to 10 do
  read(a[i]);
 readln(n);
 s:=0;
 for i:=1 to 10 do
  if a[i]<=n+30 then inc(s);
 writeln(s);
end.