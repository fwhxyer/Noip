program p1302;
var
 i,j,n:longint;
begin
 readln(n);
 for i:=1 to n shr 1 do
  begin
   for j:=i+1 to n do
   if (i+j)*(j-i+1)=2*n then
    begin
     writeln(i,' ',j);
     break;
    end else
     if (i+j)*(j-i+1)>2*n then break;
  end;
end.
