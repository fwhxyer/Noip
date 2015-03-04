program p1062;
var
 a:array[0..40000]of integer;
 s:array[1..40000]of longint;
 l:array[1..40000]of integer;
 n,t,i,j:longint;
begin
 readln(n);t:=0;
 for i:=1 to n do
 begin
  read(a[i]);
  for j:=1 to a[i]-a[i-1] do
   l[t+j]:=1;
  l[t+a[i]-a[i-1]+1]:=2;
  t:=t+a[i]-a[i-1]+1;
 end;
 t:=0;i:=1;j:=0;
 while j<n do
 begin
  if l[i]=1 then begin inc(t);s[t]:=i;end;
  if l[i]=2 then begin write(((i-s[t])+1) div 2,' ');dec(t);inc(j) end;
  inc(i);
 end;
end.
