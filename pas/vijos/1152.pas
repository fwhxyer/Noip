program p1152;
var
 a,b,c,n,i:longint;
begin
 readln(n);
 readln(a,b,c);
 for i:=2 to n-2 do
  readln;
 if n=4 then
 begin
  writeln('JMcat Win');
  halt;
 end;
 if ((a+b=2*c) and (abs(b-a)=2))
 or ((a+c=2*b) and (abs(a-c)=2))
 or ((b+c=2*a) and (abs(b-c)=2))
 then
 begin
  writeln('JMcat Win');
  halt;
 end;
 if b=0 then
 begin
  b:=a;
  a:=0;
 end;
 if c=0 then
 begin
  c:=a;
  a:=0;
 end;
 if a=0 then
  if ((b=1) and (c=2))
  or ((b=2) and (c=1))
  or ((b=1) and (c=n-1))
  or ((b=n-1) and (c=1))
  or ((b=n-1) and (c=n-2))
  or ((b=n-2) and (c=n-1))
 then
 begin
  writeln('JMcat Win');
  halt;
 end;
 if not odd(n) then
 begin
  writeln('JMcat Win');
  halt;
 end;
 writeln('PZ Win');
end.