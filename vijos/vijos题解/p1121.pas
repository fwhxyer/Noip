program p1121;
var
 f:array[-1..40,-1..40]of longint;
 b:array[-2..40,-2..40]of boolean;
 a,bt,c,d,i,j:integer;
begin
 readln(a,bt,c,d);inc(a);inc(bt);inc(c);inc(d);
 fillchar(f,sizeof(f),0);f[1,1]:=1;
 fillchar(b,sizeof(b),0);b[1,1]:=true;b[c,d]:=true;
 b[c-1,d+2]:=true;b[c-1,d-2]:=true;
 b[c+1,d+2]:=true;b[c+1,d-2]:=true;
 b[c+2,d+1]:=true;b[c+2,d-1]:=true;
 b[c-2,d+1]:=true;b[c-2,d-1]:=true;
 for i:=1 to (a+bt-1) do
  for j:=1 to i do
   if not b[i-j+1,j] then f[i-j+1,j]:=f[i-j+1,j-1]+f[i-j,j];
 writeln(f[a,bt]);
end.
