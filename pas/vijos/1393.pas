program p1393;
var
 ans,m,n,r:real;
begin
 readln(m,n,r);
 if m<=n then
  writeln(r:0:3)
  else
   writeln(sqrt(sqr(m-n)+sqr(r)):0:3);
end.