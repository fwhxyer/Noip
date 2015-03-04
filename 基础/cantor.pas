program cantorprogram;
var
 a:string;
function cantor(a:string):longint;
var ans,n,t,i,j:longint;
begin
 n:=length(a);ans:=0;
 for i:=1 to n-1 do begin
  t:=0;
  for j:=i+1 to n do
   if a[i]>a[j] then inc(t);
   ans:=(ans+t)*(n-i);
 end;
 exit(ans+1);
end;
begin
 readln(a);
 writeln(cantor(a));
end.