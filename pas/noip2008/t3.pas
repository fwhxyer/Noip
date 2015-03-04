program t3;
var
 m,n:integer;
 f:array[1..100,0..50,0..50]of integer;
 i,j,k:integer;
 map:array[1..50,1..50]of integer;
function max(a,b:integer):integer;
begin
 if a>b then max:=a else max:=b;
end;
function min(a,b:integer):integer;
begin
 if a<b then min:=a else min:=b;
end;
begin
 readln(m,n);
 for i:=1 to m do
  for j:=1 to n do
   read(map[i,j]);
 for i:=1 to m+n do
  for j:=0 to min(i,n) do
   for k:=0 to min(i,n) do
    f[i,j,k]:=-maxint;
 for i:=2 to n+m do
  for j:=1 to min(i,n) do
   for k:=1 to min(i,n) do
    f[i,j,k]:=0;
 for i:=1 to m+n do
  for j:=1 to min(i,n) do
   f[i,j,j]:=-maxint;
 for k:=3 to m+n do
  for i:=1 to min(k-1,n) do
   for j:=1 to min(k-1,n) do
    if i<>j then
 f[k,i,j]:=map[k-i,i]+map[k-j,j]+
    max(max(f[k-1,i-1,j],f[k-1,i,j]),max(f[k-1,i-1,j-1],f[k-1,i,j-1]));
 f[m+n,n,n]:=f[m+n-1,n-1,n];
 writeln(f[m+n,n,n]);
end.
