program primprogram;
var
 cost:array[1..1000,1..1000]of longint;
 i,j,n,fir:longint;ans:int64;
procedure prim(v0:longint);
var
 i,j,mj,min:longint;
 lowcost,closed:array[1..1000]of longint;
begin
 for i:=1 to n do begin
  lowcost[i]:=cost[v0,i];
  closed[i]:=v0;
 end;
 for i:=1 to n-1 do begin
  for j:=1 to n do
   if (lowcost[i]<>0)and(lowcost[i]>min) then begin
    min:=lowcost[i];mj:=j end;
  inc(ans,lowcost[mj]);lowcost[mj]:=0;
  for j:=1 to n do
   if lowcost[j]>cost[mj,j] then begin
    lowcost[j]:=cost[mj,j];closed[j]:=mj;
   end;
 end;
end;
begin//=============================================================================
 randomize;
 readln(n,fir);
 for i:=1 to n do
  for j:=1 to n do
   cost[i,j]:=random(maxlongint);
 prim(fir);
 writeln(ans);
end.