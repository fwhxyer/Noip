program p1014;
var
i,j,n:integer;ans:real;
x,y:array[1..1000]of real;
f:array[1..1000,1..1000]of real;
function s(a,b:integer):real;
begin
 exit(sqrt(sqr(x[a]-x[b])+sqr(y[a]-y[b])));
end;
function min(a,b:real):real;
begin
 if a<b then min:=a else min:=b;
end;
procedure qsort(s,t:integer);
var
 i,j:integer;
 mid,temp:real;
begin
 i:=s;j:=t;mid:=x[(i+j)div 2];
 repeat
 while x[i]<mid do inc(i);
 while x[j]>mid do dec(j);
 if i<=j then
  begin
   temp:=x[i];
   x[i]:=x[j];
   x[j]:=temp;
   temp:=y[i];
   y[i]:=y[j];
   y[j]:=temp;
   inc(i);
   dec(j);
  end;
 until i>j;
 if s<j then qsort(s,j);
 if i<t then qsort(i,t);
end;
begin
 readln(n);
 for i:=1 to n do
  readln(x[i],y[i]);
 qsort(1,n);
 for i:=1 to n do
  for j:=1 to i do
   f[i,j]:=maxlongint shl 5;
 f[1,1]:=0;
 f[2,1]:=f[1,1]+s(2,1);
 for i:=2 to n do
  begin
   for j:=1 to i-2 do
    f[i,j]:=min(f[i,j],f[i-1,j]+s(i-1,i));
   for j:=1 to i-2 do
    f[i,i-1]:=min(f[i,i-1],f[i-1,j]+s(j,i));
  end;
 ans:=maxlongint shl 5;
 for i:=1 to n-1 do
 ans:=min(ans,f[n,i]+s(i,n));
 writeln(ans:0:2);
end.
