program p1398;
var i,j,n:longint;
  a,b,c,ab,aba:array[1..10000] of longint;
procedure jab;
var t:longint;
 begin
  t:=aba[i];aba[i]:=aba[j];aba[j]:=t;
  t:=ab[i];ab[i]:=ab[j];ab[j]:=t;
  t:=a[i];a[i]:=a[j];a[j]:=t;
  t:=b[i];b[i]:=b[j];b[j]:=t;
  t:=c[i];c[i]:=c[j];c[j]:=t;
 end;
begin
  read(n);
  for i:=1 to n do
   begin
     readln(a[i],b[i],c[i]);
     aba[i]:=a[i]+b[i]+c[i];
     ab[i]:=i;
   end;
  for i:=1 to n-1 do
   for j:=i+1 to n do
    if aba[j]>aba[i] then jab;
    for i:=1 to n-1 do
     for j:=i+1 to n do
     if (aba[j]=aba[i])and(a[j]>a[i]) then jab;
    for i:=1 to n-1 do
     for j:=i+1 to n do
      if  (aba[j]=aba[i])and(a[j]=a[i])and(ab[j]<ab[i]) then jab;
     for i:=1 to 5 do writeln(ab[i],' ',aba[i]);
end.
