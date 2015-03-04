program p1103;
var
 a:array[0..12000]of boolean;
 ans,w,e,j,i,l,m:integer;
begin
 readln(l,m);
 for i:=0 to l do
  a[i]:=true;
 for i:=1 to m do
 begin
  readln(w,e);
  for j:=w to e do a[j]:=false;
 end;
 ans:=0;
 for i:=0 to l do
  if a[i] then inc(ans);
 writeln(ans);
end.