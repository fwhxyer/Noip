program p1127;
var
 i,k:longint;
 sn:real;
begin
 readln(k);
 for i:=1 to maxlongint do begin
  sn:=sn+1/i;
  if sn>k then break;
 end;
 writeln(i);
end.