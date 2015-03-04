var
s:array [-5..50] of extended;
n,m,i:integer;
begin
readln(n,m);
s[-1]:=1;s[0]:=1;
for i:=1 to n do
 s[i]:=2*s[i-1]-s[i-m-1];
writeln(s[n]:0:0);
end.
