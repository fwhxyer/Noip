program p1133;
var
 j,i,t,n:integer;
 f,c,w:array[0..100000]of integer;
function max(a,b:integer):integer;
begin
 if a >b then exit(a)else exit(b);
end;
begin
 readln(t);
 readln(n);
 for i:=1 to n do
 begin  readln(c[i]);w[i]:=c[i];end;
 fillchar(f,sizeof(f),0);
 for i:=1 to n do
  for j:=t downto c[i] do
   f[j]:=max(f[j],f[j-c[i]]+w[i]);
 writeln(t-f[t]);
end.
