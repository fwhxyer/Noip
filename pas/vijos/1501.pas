program p1501;
const
 cf:array[0..15]of longint=(1,2,4,8,16,32,64,128,256,
                           512,1024,2048,4096,8192,16384,32768);
var
 s:ansistring;
 i,j,n,u,d:longint;
 map:array[0..15,1..32768]of integer;
 ans:int64;
function pand(a,b:integer):integer;
begin
 if (a=2)and(b=2) then exit(2)
 else if (a=5)and(b=5) then exit(5)
 else exit(1);
end;
begin
 readln(n);ans:=0;
 readln(u,d);
 if u>n then u:=n;
 if d>u then
 begin
  writeln(0);
  halt;
 end;
 readln(s);
 for i:=1 to cf[n] do
  if s[i]='1' then map[0,i]:=2 else map[0,i]:=5;
 for i:=1 to d do
  for j:=1 to cf[n-i] do
   map[i,j]:=pand(map[i-1,2*j-1],map[i-1,2*j]);
 for i:=d to u do
 begin
  for j:=1 to cf[n-i] do
   inc(ans,map[i,j]);
  if i<>u then
   for j:=1 to cf[n-i-1] do
    map[i+1,j]:=pand(map[i,2*j-1],map[i,2*j]);
 end;
 writeln(ans);
end.
