program p1002;
var
i,j,l,temp:longint;
s,t,m,mint:integer;
store,pm:array[1..100]of longint;
way,pmt:array[-10..11000]of integer;
function min(a,b:longint):longint;
begin
 if a<b then min:=a else min:=b;
end;
begin
readln(l);
readln(s,t,m);
for i:=1 to m do
 read(store[i]);
for i:=m-1 downto 1 do
 for j:=1 to i do
  if store[j]>store[j+1] then
   begin
    temp:=store[j];
    store[j]:=store[j+1];
    store[j+1]:=temp;
   end;
if s<>t then
begin
pm[1]:=min(store[1],100);
for i:=2 to m do
 pm[i]:=pm[i-1]+min(100,store[i]-store[i-1]);
for i:=1 to m do
 pmt[pm[i]]:=1;
for i:=-10 to pm[m]+t+10 do
 way[i]:=maxint;
way[0]:=0;
for i:=1 to pm[m]+t+1 do
 for j:=i-t to i-s do
  way[i]:=min(way[j]+pmt[i],way[i]);
mint:=maxint;
for i:=pm[m]+t+1 downto pm[m] do
 if mint>way[i]then mint:=way[i];
end
 else if s=t then
  begin
   mint:=0;
   for i:=1 to m do
    if (store[i]/s)=trunc(store[i]/s) then inc(mint);
  end;
writeln(mint);
end.
