program floyedprogram;
var
 i,j,n:longint;
 cost,a,p:array[1..2000,1..2000]of longint;
procedure floyed;
var i,j,k:longint;
begin
 for i:=1 to n do
  for j:=1 to n do begin
   a[i,j]:=cost[i,j];
   p[i,j]:=0;
  end;
 for k:=1 to n do
  for j:=1 to n do
  if k<>j then
   for i:=1 to n do
    if (j<>i)and(k<>i) then
     if a[i,k]+a[k,j]<a[i,j] then begin
      a[i,j]:=a[i,k]+a[k,j];
      p[i,j]:=k;
     end;
end;
procedure print(i,j:longint);
begin
 if p[i,j]<>0 then
 begin
  print(i,p[i,j]);
  write(p[i,j],' ');
  print(i,p[i,j]);
 end;
end;
begin
 randomize;
 readln(n);
 for i:=1 to n do
  for j:=1 to n do
   if i<>j then cost[i,j]:=random(maxint shl 4);
 floyed;
 for i:=1 to n do begin
  write(1,' ');print(1,i);write(i,'  The min cost is:');
  writeln(a[1,i]);
 end;
end.
