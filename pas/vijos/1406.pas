program p1406;
var
 s:array[0..21]of string;
 ss:array[0..401]of char;
 tmp,min,i,j,m,n,na:integer;
 cost:array[0..401,0..401]of integer;
 mark:array[0..401]of boolean;
 dist:array[0..401]of integer;
begin
 readln(m,n);na:=m*n;
 for i:=0 to na+1 do
  for j:=0 to na+1 do
   if i=j then cost[i,j]:=-1 else cost[i,j]:=maxint;
 for i:=1 to m do
 begin
  readln(s[i]);
  for j:=1 to n do
   ss[j+(i-1)*n]:=s[i][j];
 end;
 for i:=1 to n do
  cost[0,i]:=1;
 for i:=1 to n do
  cost[na+1-i,na+1]:=1;
 for i:=1 to na do
 begin
  if(i mod n<>1)then
   if ss[i-1]=ss[i] then begin cost[i-1,i]:=0;cost[i,i-1]:=0; end else
     begin cost[i-1,i]:=1;cost[i,i-1]:=1; end;
  if i mod n<>0 then
   if ss[i+1]=ss[i] then begin cost[i+1,i]:=0;cost[i,i+1]:=0; end else
     begin cost[i+1,i]:=1;cost[i,i+1]:=1; end;
  if (i div n<>0)and(i<>n) then
   if ss[i-n]=ss[i] then begin cost[i-n,i]:=0;cost[i,i-n]:=0; end else
     begin cost[i-n,i]:=1;cost[i,i-n]:=1; end;
  if ((i div n<>m-1)and(i<>na))or(i=na-n) then
   if ss[i+n]=ss[i] then begin cost[i+n,i]:=0;cost[i,i+n]:=0; end else
     begin cost[i+n,i]:=1;cost[i,i+n]:=1; end;
 end;

 for i:=0 to na+1 do
 begin
  mark[i]:=false;
  dist[i]:=maxint;
 end;
 dist[0]:=-1;
 while true do
 begin
  min:=maxint;
  for i:=0 to na+1 do
   if (dist[i]<min)and not mark[i] then
   begin
    min:=dist[i];
    j:=i;
   end;
  if min=maxint then break;
  mark[j]:=true;
  for i:=0 to na+1 do
  begin
   if not mark[i] and (cost[j,i]<maxint) and (cost[j,i]>-1) then
   begin
    tmp:=dist[j]+cost[j,i];
    if tmp<dist[i] then dist[i]:=tmp;
   end;
  end;
 end;
 writeln(dist[na+1]);
end.