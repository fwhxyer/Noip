program checksort;
var
 a,b:longint;
begin
assign(input,'c:\qsort.txt');
reset(input);
 readln(a);
 while not eof do
 begin
  readln(b);
  if a>b then writeln('false')
   else a:=b;
 end;
close(input);
end.
