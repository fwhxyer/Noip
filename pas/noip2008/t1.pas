program t1;
var
st:string;
t,min,max,i,n:integer;
a:array[97..97+25]of integer;
begin
 readln(st);
 n:=length(st);
 for i:=1 to n do
  inc(a[ord(st[i])]);
 min:=101;max:=0;
 for i:=97 to 97+25 do
  begin
   if max<a[i] then max:=a[i];
   if (a[i]<>0)and(min>a[i]) then min:=a[i];
  end;
 t:=max-min;
 if t>=2 then
 begin
 for i:=2 to t-1 do
  if t/i=trunc(t/i) then
   begin
    writeln('No Answer');
    writeln(0);
    halt;
   end;
 writeln('Lucky Word');
 writeln(t);
 end
 else
  begin
    writeln('No Answer');
    writeln(0);
  end;
end.