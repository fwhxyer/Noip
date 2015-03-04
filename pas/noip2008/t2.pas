program t2;
var
 ans,i,j,n:integer;
function chuli(a:longint):longint;
var
 temp,chulit:longint;
const
 con:array[0..9]of integer=(6,2,5,5,4,5,6,3,7,6);
begin
 chulit:=0;
 while a<>0 do
  begin
   temp:=a mod 10;
   inc(chulit,con[temp]);
   a:=a div 10;
  end;
 if chulit=0 then inc(chulit,con[0]);
 chuli:=chulit;
end;
begin
 readln(n);
 dec(n,4);
 for i:=0 to 1000 do
  for j:=0 to 1000 do
   if chuli(i)+chuli(j)+chuli(i+j)=n then
    inc(ans);
 writeln(ans);
end.
