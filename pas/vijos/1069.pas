program p1069;
var i,j,k,n:integer;
  d,g,f:array[1..800,1..800] of real;
  x,y:array[1..800] of real;
function min(x,y:extended):real;
begin
 if x<y then min:=x else min:=y;
end;
begin
 readln(n);
 for i:=1 to n do
  readln(x[i],y[i]);
 for i:=1 to n do
 for j:=1 to n do
  d[i,j]:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
 for i:=1 to n do
 begin
  f[i,1]:=d[i,i mod n+1];
  g[i,1]:=f[i,1];
 end;
 for k:=2 to n-1 do
 for i:=1 to n do
 begin
  f[i,k]:=min(f[i mod n+1,k-1]+d[i,i mod n+1],g[i mod n+1,k-1]+d[i,(i+k-1) mod n+1]);
  g[i,k]:=min(g[i,k-1]+d[(i+k-1) mod n+1,(i+k-2) mod n+1],f[i,k-1]+d[i,(i+k-1) mod n+1]);
 end;
 for i:=2 to n do
 if f[i,n-1]<f[1,n-1] then
  f[1,n-1]:=f[i,n-1];
 write(f[1,n-1]:0:3);
end.
