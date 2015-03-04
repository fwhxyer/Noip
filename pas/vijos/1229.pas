program p1229;
var
 ans,k,i,j:integer;
begin
 readln(k);
 for i:=1 to 20000 do
 begin
  ans:=0;
  for j:=1 to trunc(sqrt(i)) do
   if i/j=trunc(i/j) then
    inc(ans,2);
  if sqrt(i)=trunc(sqrt(i)) then dec(ans);
  if ans=k then
  begin
   writeln(i);
   halt;
  end;
 end;
 writeln('NO SOLUTION');
end.