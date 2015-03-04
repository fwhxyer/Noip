program p1013;
var
 cost:array[-1..80,-1..80]of real;
 mark:array[-1..80] of boolean;
 dist:array[-1..80] of real;
 x,y:array[-1..80]of real;
 i,j,k,n:integer;
 nu1,nu2,nu3,nu4,nu5,outt:real;
function bool(a,b:integer):boolean;
var
 i,j:integer;
begin
 for i:=(a div 4)+1 to (b div 4)-1 do
 begin
  if (y[b]-y[a])/(x[b]-x[a])>(y[i*4+3]-y[a])/(x[i*4+3]-x[a]) then exit(false);
  if ( (y[b]-y[a])/(x[b]-x[a])<(y[i*4+2]-y[a])/(x[i*4+2]-x[a]) ) and
 ( (y[b]-y[a])/(x[b]-x[a])>(y[i*4+1]-y[a])/(x[i*4+1]-x[a]) ) then exit(false);
  if (y[b]-y[a])/(x[b]-x[a])<(y[i*4]-y[a])/(x[i*4]-x[a]) then exit(false);
 end;
 if (a=-1)and(b div 4<>0) then
 for i:=(a div 4) to (b div 4)-1 do
 begin
  if (y[b]-y[a])/(x[b]-x[a])>(y[i*4+3]-y[a])/(x[i*4+3]-x[a]) then exit(false);
  if ( (y[b]-y[a])/(x[b]-x[a])<(y[i*4+2]-y[a])/(x[i*4+2]-x[a]) ) and
 ( (y[b]-y[a])/(x[b]-x[a])>(y[i*4+1]-y[a])/(x[i*4+1]-x[a]) ) then exit(false);
  if (y[b]-y[a])/(x[b]-x[a])<(y[i*4]-y[a])/(x[i*4]-x[a]) then exit(false);
 end;
 exit(true);
end;
procedure dijkstra(v1:integer);
  var
   minj,i,j:integer;
   min,temp,temp11:real;
  begin
   for i:=-1 to n*4 do
       begin
        mark[i]:=false;
        dist[i]:=maxint;
       end;
    dist[v1]:=0;
    while true do
        begin
         min:=maxint;
         for j:=-1 to n*4 do
             if (not mark[j]) and (dist[j]<min) then
                begin
                  min:=dist[j];
                  minj:=j;
                end;
         if min=maxint then break;
         mark[minj]:=true;
         for j:=-1 to n*4 do
             if (not mark[j]) and (cost[minj,j]>0)and(cost[minj,j]<maxint) then
                begin
                  temp:=dist[minj]+cost[minj,j];
                  if (temp<dist[j]) then
                  begin
                   dist[j]:=temp;
                  end;
                end;
        end;
    outt:=dist[n*4];
  end;
begin
 for i:=-1 to 80 do for j:=-1 to 80 do cost[i,j]:=maxint;x[-1]:=0;y[-1]:=5;
 readln(n);x[n*4]:=10;y[n*4]:=5;
 for i:=1 to n do
 begin
  readln(nu1,nu2,nu3,nu4,nu5);
  x[i*4-4]:=nu1;
  x[i*4-3]:=nu1;
  x[i*4-2]:=nu1;
  x[i*4-1]:=nu1;
  y[i*4-4]:=nu2;
  y[i*4-3]:=nu3;
  y[i*4-2]:=nu4;
  y[i*4-1]:=nu5;
  for j:=4 downto 1 do
   for k:=-1 to (i-1)*4-1 do
    if bool(k,i*4-j) then
     cost[k,i*4-j]:=sqrt(sqr(x[k]-x[i*4-j])+sqr(y[k]-y[i*4-j]));
 end;
 for k:=-1 to n*4-1 do
  if bool(k,n*4) then
   cost[k,n*4]:=sqrt(sqr(x[k]-x[n*4])+sqr(y[k]-y[n*4]));
 dijkstra(-1);
 writeln(outt:0:2);
end.
