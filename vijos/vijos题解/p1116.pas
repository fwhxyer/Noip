PROGram p1116;
var
 a,b,c,d,e:real;
 i:longint;
begin
 readln(a,b,c,d);
 for i:=-100000 to 100000 do
 begin
  e:=i/1000;
  if trunc((a*e*e*e+b*e*e+c*e+d)*10000)=0 then
   write(e:0:2,' ');
 end;
end.
