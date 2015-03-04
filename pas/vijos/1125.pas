program p1125;
const
e:real=0.00001;
var
t1,t2,h,s1,s2,v,l,k,n:real;   ans:longint;
begin
readln(h,s1,v,l,k,n);
t1:=sqrt(h/5);
if h>k+e then t2:=sqrt((h-k-e)/5) else t2:=0;
s1:=s1-v*t1-e;
s2:=s1+l+(t1-t2)*v+e;
if s1<0 then s1:=0;if s1<>trunc(s1) then s1:=trunc(s1)+1;
s2:=trunc(s2);
if s2>n-1 then s2:=n-1;
ans:=trunc(s2-s1+1);
if ans<0 then ans:=0;
writeln(ans);
end.
