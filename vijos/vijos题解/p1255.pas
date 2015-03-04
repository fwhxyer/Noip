program p1255;
var
 map:array[0..500,0..500]of longint;
 ans,n,m,i,j,k:longint;
 t,f:array[0..500]of longint;
function max(a,b:longint):longint; begin if a>b then max:=a else max:=b; end;
begin
 readln(n,m);
 for i:=1 to n do
  for j:=1 to m do begin
   read(map[i,j]);
   if map[i,j]=0 then map[i,j]:=-5000000;
  end;
 f[0]:=0;
 for i:=1 to n do begin
  for j:=0 to m do
   t[j]:=0;
  for j:=i to n do
   for k:=1 to m do begin
    t[k]:=t[k]+map[k,j];
    f[k]:=max(t[k],f[k-1]+t[k]);
    if f[k]>ans then ans:=f[k];
   end;
 end;
 writeln(ans);
end.