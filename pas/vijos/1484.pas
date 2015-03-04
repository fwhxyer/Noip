program p1484;
var
 st,st1,st2:string;
 t,i,code:integer;
begin
 readln(st);
 st1:=copy(st,1,1)+copy(st,3,3)+copy(st,7,5);
 for i:=1 to 9 do
  inc(t,i*(ord(st1[i])-48));
 t:=t mod 11;
 st1:=copy(st,13,length(st)-12);
 if t=10 then
  st2:='X' else
  str(t,st2);
 if st2=st1 then writeln('Right') else
  writeln(copy(st,1,12)+st2);
end.