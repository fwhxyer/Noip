program p1131;
var
 ans,a,b,i,j:longint;
function gongbs(a,b,c:longint):boolean;
var i,m,j:longint;
begin
 if a<b then m:=a else m:=b;
 for i:=m to c-1 do
  if ((i div a)=(i/a))and((i div b)=(i/b)) then exit(false);
 inc(i);
 if ((i div a)=(i/a))and((i div b)=(i/b)) then exit(true) else exit(false);
end;
begin
 readln(a,b);ans:=0;
 for i:=1 to (b div a) do
  for j:=i to (b div a) do
   if (j div i)<>(j/i) then
   begin
    if gongbs(i*a,j*a,b) then
     inc(ans);
   end;
 if a=b then writeln(2*ans-1) else
  writeln(2*ans);
end.