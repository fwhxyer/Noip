var
 j,i:integer;k:int64;
begin
assign(output,'c:\tmp.txt');
rewrite(output);
 for i:=1 to 20 do
 begin
  k:=1;
  for j:=1 to i do
   k:=j*k;
  writeln(k,',');
 end;
close(output);
end.