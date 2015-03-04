program p1060;
var
 n,a,b,i:integer;
 a1,a2:qword;
begin
 readln(n,a,b);
 a1:=1;a2:=1;
 for i:=1+n to a+n do
  a1:=trunc((a1*i)/(i-n));
 for i:=1+n to b+n do
  a2:=trunc((a2*i)/(i-n));
 writeln(a1*a2);

end.
