program p1218;
var
 n,m,i,j,k,l,ans:longint;
 a:array[1..200]of longint;
 f:array[1..200,1..200,0..10]of longint;
function max(a,b:longint):longint;
begin
 if a>b then max:=a else max:=b;
end;
function min(a,b:longint):longint;
begin
 if a<b then min:=a else min:=b;
end;
function c(x,y:longint):longint;
var i:longint;
begin
 c:=0;
 for i:=1 to y do
  inc(c,a[x+i-1]);
 c:=c mod 10;
 while c<0 do inc(c,10);
end;
begin
 readln(n,m); for i:=1 to n do  readln(a[i]);
 for i:=1 to n do
  a[i+n]:=a[i];

 for i:=1 to 2*n do
  for j:=1 to 2*n do
   for k:=0 to m+1 do
    f[i,j,k]:=-maxlongint shr 1;
 for i:=1 to 2*n do
 begin
  f[i,1,0]:=a[i];
  while f[i,1,0]<0 do inc(f[i,1,0],10);
 end;
 for j:=1 to n do
  for k:=1 to min(j,m) do
   for i:=1 to n do
    for l:=1 to j-1 do
     if f[i,l,k-1]<>-1073741824 then
      f[i,j,k]:=max(f[i,j,k],f[i,l,k-1]*c(i+l,j-l));
 ans:=0;
 for i:=1 to n do
  if ans<f[i,n,m] then ans:=f[i,n,m];
 writeln(ans);

 for i:=1 to 2*n do
  for j:=1 to 2*n do
   for k:=0 to m+1 do
    f[i,j,k]:=maxlongint shr 1;
 for i:=1 to 2*n do
 begin
  f[i,1,0]:=a[i];
  while f[i,1,0]<0 do inc(f[i,1,0],10);
 end;
 for j:=1 to n do
  for k:=1 to min(j,m) do
   for i:=1 to n do
    for l:=1 to j-1 do
     if f[i,l,k-1]<>1073741823 then f[i,j,k]:=min(f[i,j,k],f[i,l,k-1]*c(i+l,j-l));

 ans:=maxlongint shr 1;
 for i:=1 to n do
  if ans>f[i,n,m] then ans:=f[i,n,m];
 writeln(ans);
end.
