program gaojingjian;
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
procedure jian(a:num;var b:num);
var
 i,n:longint;
begin
 c[0]:=max(a[0],b[0]);
 for i:=1 to c[0] do
  c[i]:=a[i]-b[i];
 for i:=1 to c[0] do
  if c[i]<0 then
  begin
   dec(c[i+1]);
   c[i]:=c[i]+10;
  end;
 while (c[0]>1)and(c[c[0]]=0) do
  dec(c[0]);
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
 jian(a,b);
 for i:=c[0]downto 1 do
  write(c[i]);
 writeln;
end.