program gaojingjia;
type
 num=array[0..5000]of longint;
var
 st1,st2:ansistring;
 i:longint;
 a,b,c:num;
function max(a,b:longint):longint;
begin
 if a>b then max:=a else max:=b;
end;
procedure jia(a:num;var b:num);
var
 i,j,n:longint;
begin
 c[0]:=a[0]+b[0]-1;
 for i:=1 to a[0] do
  for j:=1 to b[0] do
  inc(c[i+j-1],a[i]*b[j]);
 for i:=1 to c[0] do
  begin
   inc(c[i+1],c[i]div 10);
   c[i]:=c[i] mod 10;
  end;
 while c[c[0]+1]<>0 do
  begin
   inc(c[0]);
   inc(c[c[0]+1],c[c[0]]div 10);
   c[c[0]]:=c[c[0]]mod 10;
  end;
 for i:=0 to c[0] do
  b[i]:=c[i];
end;
begin
 readln(st1);
 a[0]:=length(st1);
 for i:=1 to a[0] do
  a[i]:=ord(st1[a[0]-i+1])-48;
 readln(st2);
 b[0]:=length(st2);
 for i:=1 to b[0] do
  b[i]:=ord(st2[b[0]-i+1])-48;
 jia(a,b);
 for i:=c[0]downto 1 do
  write(c[i]);
 writeln;
end.
