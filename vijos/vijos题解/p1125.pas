program p1125;
const
 g=10;
var
 t,h,s1,s2,v,l,k,n:real;
function max(a,b:real):real;
begin
 if a>b then exit(a)else exit(b);
end;
function min(a,b:real):real;
begin
 if a<b then exit(a)else exit(b);
end;
begin
 readln(h,s1,v,l,k,n);
 t:=sqrt(max(2*(h-k-0.00001)/g,0));
 s2:=l+s1-v*t+0.00001;
 l:=l+v*(sqrt(max(0,2*(h)/g))-t)+0.00002;
 writeln(min(n-1,trunc(s2))-max(0,trunc(s2-l)):0:0);
end.