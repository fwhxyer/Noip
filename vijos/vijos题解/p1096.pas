program p1096;
const
 n=12;
var
 mon:array[1..12]of integer;
 shui,now,i,j:integer;
begin
 for i:=1 to n do
  readln(mon[i]);
 for i:=1 to n do begin
  inc(now,300);
  dec(now,mon[i]);
  if now<0 then begin
   writeln('-',i);
   halt;
  end;
  inc(shui,(now div 100)*100);
  dec(now,(now div 100)*100);
 end;
 writeln(shui*1.2+now:0:0);
end.
