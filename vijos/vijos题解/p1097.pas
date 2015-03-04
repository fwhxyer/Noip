program p1097;
var
 n,i,tmp,ans:longint;
 a:array[1..10000]of longint;
procedure heap(n,i:longint);
var
 x,j:longint;
begin
 x:=a[i];
 j:=i*2;
 while j<=n do
 begin
  if (j<n) and (a[j]>a[j+1]) then inc(j);
  if a[j]<x then begin
    a[i]:=a[j];
    i:=j;j:=2*j;
  end else
    j:=n+1;
 end;
 a[i]:=x;
end;
procedure heapsort;
var
 i:longint;
begin
 for i:=n div 2 downto 1 do
  heap(n,i);
end;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 heapsort;
 tmp:=a[1];a[1]:=a[n];a[n]:=tmp;
 heap(n-1,1);ans:=0;
 for i:=n-1 downto 1 do
 begin
  tmp:=a[1];a[1]:=a[i];a[i]:=tmp;
  heap(i-1,1);
  a[i]:=a[i+1]+a[i];inc(ans,a[i]);
  tmp:=a[1];a[1]:=a[i];a[i]:=tmp;
  heap(i-1,1);
 end;
 writeln(ans);
end.