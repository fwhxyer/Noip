program ptttttt1;
type
 lon=array[1..100000]of longint;       {chang100000000000}
var
 p1,p2,q1,q2,n,k,i,j:longint;ans:int64;
 a,b:lon;
 c,x:array[1..1000005]of longint;
begin{main==========================================}
 readln(n,k);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do read(b[i]);
 {}
  for i:=1 to n do
   inc(c[a[i]]);
  for i:=1 to 1000001 do c[i+1]:=c[i]+c[i+1];
  for i:=1 to n do
   x[c[a[i]]]:=a[i];
  for i:=1 to n do
   if x[i]=0 then
   begin
    j:=i;
    repeat
     inc(j);
    until x[j]<>0;
    x[i]:=x[j];
   end;
  for i:=1 to n do
   a[i]:=x[i];
  fillchar(c,sizeof(c),0);
  fillchar(x,sizeof(x),0);
  for i:=1 to n do
   inc(c[b[i]]);
  for i:=1 to 1000001 do c[i+1]:=c[i]+c[i+1];
  for i:=1 to n do
   x[c[b[i]]]:=b[i];
  for i:=1 to n do
   if x[i]=0 then
   begin
    j:=i;
    repeat
     inc(j);
    until x[j]<>0;
    x[i]:=x[j];
   end;
  for i:=1 to n do
   b[i]:=x[i];
  fillchar(c,sizeof(c),0);

{ for i:=1 to n do write(a[i],' ');writeln;
 for i:=1 to n do write(b[i],' ');}
 p1:=1;q1:=n;p2:=1;q2:=n;
 for i:=1 to k do
 begin
  if abs(a[p1]-b[q2])>abs(b[p2]-a[q1]) then
  begin
   c[i]:=abs(a[p1]-b[q2]);
   inc(p1);dec(q2);
  end else begin
   c[i]:=abs(b[p2]-a[q1]);
   inc(p2);dec(q1);
  end;
 end;
 for i:=1 to k do
  inc(ans,c[i]);
 writeln(ans);
end.
