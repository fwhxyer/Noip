program combinationprogram;
var
 ans,n,r:longint;
procedure combination(n,r:longint);
var
 i,j:longint;
 a:array[1..50000]of longint;
 procedure print;
 var i:longint;
 begin
  for i:=1 to r do
   write(a[i]:5);
  writeln;
  inc(ans);
 end;
begin
 for i:=1 to r do
  a[i]:=i;
 print;
 while true do begin
  i:=r;
  while (i>0)and(a[i]=n-r+i) do dec(i);
  if i<=0 then break;
  inc(a[i]);
  for j:=i+1 to r do
   a[j]:=a[j-1]+1;
  print;
 end;
end;
begin
 readln(n,r);  ans:=0;
 if n<r then combination(r,n) else
 combination(n,r);
 writeln(ans);
end.
