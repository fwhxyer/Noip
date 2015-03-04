program p1007;
var
 a0,b0,a1,b1,a,r,b,ans:real;n,i:longint;
begin
 read(n,r);
 read(a1,b1);a0:=a1;b0:=b1;
 ans:=0;
 for i:=2 to n do
 begin
  read(a,b);
  ans:=ans+sqrt(sqr(a-a1)+sqr(b-b1));
  a1:=a;b1:=b;
 end;
 writeln(ans+2*pi*r+sqrt(sqr(a0-a1)+sqr(b0-b1)):0:2);
end.
