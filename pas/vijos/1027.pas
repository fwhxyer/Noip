program p1027;
var
 ans,i,j,c,y,x,n,m,min:longint;
 cost:array[1..100,1..100]of longint;
 lowcost,closest:array[1..100] of longint;
 mark:array[1..100]of boolean;
begin
 ans:=0;
 readln(n);inc(n);
 readln(m);
 for i:=1 to n do
  mark[i]:=false;
 for i:=1 to n do
  for j:=1 to n do
   if i<>j then cost[i,j]:=maxint else cost[i,j]:=0;
 for i:=1 to m do
 begin
  readln(x,y,c);
  cost[x,y]:=c;
 end;
 for i:=1 to n do
 begin
  lowcost[i]:=cost[1,i];
  closest[i]:=1;
 end;
 while true do
 begin
  min:=maxint;
  for i:=1 to n do
   if (lowcost[i]<min)and(lowcost[i]<>0) then
   begin
    min:=lowcost[i];
    j:=i;
   end;
  if min=maxint then break;
  inc(ans,lowcost[j]);
  mark[j]:=true;
  lowcost[j]:=0;
  for i:=1 to n do
  if cost[j,i]<>maxint then
   if lowcost[i]>lowcost[j]+cost[j,i] then
   begin
    lowcost[i]:=lowcost[j]+cost[j,i];
    closest[i]:=j;
   end;
 end;
 writeln(ans);
end.
