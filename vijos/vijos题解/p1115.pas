program p1115;
var
 i,j,n,m:integer;
 a:array[1..10000]of integer;
 procedure qsort(s,t:integer);
 var
  i,j,tmp,mid:integer;
 begin
  i:=s;j:=t;mid:=a[(i+j)shr 1];
  repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then begin
   tmp:=a[i];
   a[i]:=a[j];
   a[j]:=tmp;
   inc(i);dec(j);
  end;
  until i>j;
  if s<j then qsort(s,j);
  if i<t then qsort(i,t);
 end;
 procedure chul;
 var
  tmp,j,max,k:integer;
 begin
  max:=10005;
  for j:=i+1 to n do
  begin
   if (a[j]<max)and(a[i]<a[j]) then begin max:=a[j];k:=j;end;
  end;
  tmp:=a[i];
  a[i]:=a[k];
  a[k]:=tmp;
  qsort(i+1,n);
 end;
begin
 readln(n);
 readln(m);
 for i:=1 to n do
  read(a[i]);
 for j:=1 to m do
  for i:=n-1 downto 1 do
   if a[i]<a[i+1] then begin chul;break; end;
 for i:=1 to n-1 do
  write(a[i],' ');
 writeln(a[n]);
end.
