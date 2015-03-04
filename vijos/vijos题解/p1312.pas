program p1312;
var
 a:array[1..500]of longint;
 i,j,k,n,ans:longint;
 f:array[1..500,1..500]of longint;
function max(a,b:longint):longint;
begin
 if a>b then max:=a else max:=b;
end;
function c(x,b,w:longint):longint;
var i:longint;
begin
 c:=a[x]*a[b]*a[w];
end;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 for i:=1 to n do
  a[i+n]:=a[i];
 for i:=1 to 2*n do
  for j:=1 to 2*n do
   f[i,j]:=0;
 for i:=1 to 2*n do
  f[i,1]:=0;
 for j:=1 to n do
  for i:=1 to 2*n do
   for k:=1 to j-1 do
    f[i,j]:=max(f[i,j],f[i,k]+f[i+k,j-k]+c(i,i+k,i+j));
 ans:=0;
 for i:=1 to n do
  if ans<f[i,n] then ans:=f[i,n];
 writeln(ans);
end.
