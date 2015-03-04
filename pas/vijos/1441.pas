program p1441;
var
 n,m,i,j,max:integer;
 time:array[1..10000]of longint;
 f,x,y:array[1..10000]of integer;
begin
 readln(n,m);
 for i:=1 to m do
  readln(time[i],x[i],y[i]);
 for i:=1 to m do
  f[i]:=1;
 for i:=1 to m do
  for j:=1 to i-1 do
   begin
   if time[i]-time[j]>=abs(x[i]-x[j])+abs(y[i]-y[j]) then
    if f[i]<f[j]+1 then f[i]:=f[j]+1;
    if f[i]>max then max:=f[i];
   end;
 writeln(max);
end.