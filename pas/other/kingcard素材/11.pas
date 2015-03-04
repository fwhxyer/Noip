program atmp;
var
i,j:integer;
a:string;
tmp:char;
zifu:array[1..500]of string;
begin
assign(input,'c:\b.txt');
reset(input);
i:=0;
assign(output,'c:\a.txt');
rewrite(output);
 readln(tmp);
 while not seekeof do
 begin
 inc(i);
 readln(zifu[i]);
 end;
 for j:=1 to i do
 writeln('(',tmp,zifu[j],tmp,'),');
 close(input);
 close(output);
end.
