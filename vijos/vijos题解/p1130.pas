program p1130;
var
 n:longint;
 p:array[0..1000]of longint;
function f(a:longint):longint;
var ans,i:longint;
begin
 if p[a]<>0 then exit(p[a]);
 ans:=0;
 for i:=0 to a div 2 do
  inc(ans,f(i));
 p[a]:=ans;
 exit(ans);
end;
begin
 fillchar(p,sizeof(p),0);
 readln(n);
 p[0]:=1;
 writeln(f(n));
end.
