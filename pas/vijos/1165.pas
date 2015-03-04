program p1165;
var
 x,y:array[1..20000]of int64;
 n,i:integer;
 ans:int64;
procedure qsort(s,t:integer);
var
 i,j:integer;
 mid,temp:int64;
begin
 i:=s;j:=t;mid:=(x[i]+x[j])div 2;
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
 if i<t then qsort(i,t);
 if s<j then qsort(s,j);
end;
begin
 readln(n);ans:=0;
 for i:=1 to n do
  readln(x[i],y[i]);
 qsort(1,n);
 for i:=1 to n-1 do
  if y[i]>x[i+1] then
  begin x[i+1]:=y[i];
  if x[i+1]>y[i+1] then y[i+1]:=x[i+1] end;
 for i:=1 to n do
  inc(ans,y[i]-x[i]);
 writeln(ans);
end.