program p1385;
var
 n,s,tt:longint;
 t:real;
begin
 readln(n);tt:=0;
 while n>0 do
  begin
    tt:=n shr 1+1;
    inc(s,n-tt+1);
    n:=tt;
    t:=n/2;
    if t=trunc(t) then n:=trunc(t)-1
     else n:=trunc(t);
  end;
 writeln(s);
end.
