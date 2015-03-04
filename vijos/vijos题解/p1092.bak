program p1092;
const
 jc:array[1..20]of int64=(1,
2,
6,
24,
120,
720,
5040,
40320,
362880,
3628800,
39916800,
479001600,
6227020800,
87178291200,
1307674368000,
20922789888000,
355687428096000,
6402373705728000,
121645100408832000,
2432902008176640000);
var
 n,i,j,k:integer;
 m:int64;
 a:array[1..20]of integer;
 b:array[0..20]of boolean;
begin
 readln(n,m);
 dec(m);
 for i:=1 to n-1 do
 begin
  a[i]:=m div jc[n-i];
  m:=m mod jc[n-i];
 end;
 for i:=1 to n do
  b[i]:=true;
 for i:=1 to n do
 begin
  j:=0;k:=-1;
  while k<a[i] do
  begin
   inc(j);
   if b[j] then inc(k);
  end;
  a[i]:=j;b[j]:=false;
 end;
 for i:=1 to n-1 do
  write(a[i],' ');
 writeln(a[n]);
end.
