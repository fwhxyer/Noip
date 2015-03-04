program p1290;
var
 i,n:longint;
 s:ansistring;
begin
 readln(n);
 readln(s);
 if n mod 2=0 then
 for i:=1 to (n div 2) do
 begin
  writeln(i);
  writeln(n-i+1);
 end else if n mod 2=1 then
 begin
  for i:=1 to (n div 2) do
  begin
   writeln(i);
   writeln(n-i+1);
  end;
  writeln(n div 2+1);
 end;
end.