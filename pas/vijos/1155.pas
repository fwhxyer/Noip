program dijstralprogram;
var
  last:array[1..200]of integer;
  cost:array[1..200,1..200] of real;
  mark:array[0..200] of boolean;
  dist:array[1..200] of real;
  x,y:array[1..200] of real;
  xtt,ytt,all,i,j,n,m:integer;
  tmp,min1,min2,outt:real;
  wawaa:boolean;
procedure init;
var
 i,j,xt,yt:integer;
begin
  readln(n,m);
  min1:=maxint;
  min2:=maxint;
  for i:=1 to n do last[i]:=1;
  for i:=1 to n do for j:=1 to n do cost[i,j]:=maxint;
  for i:=1 to n do
   for j:=1 to n do
    cost[i,j]:=maxint;
  for i:=1 to n do
   readln(x[i],y[i]);
  for i:=1 to m do
  begin
   readln(xt,yt);
   cost[xt,yt]:=sqrt(sqr(x[xt]-x[yt])+sqr(y[xt]-y[yt]));
   cost[yt,xt]:=cost[xt,yt];
  end;
end;
procedure dijstral(v1:integer);
  var
   minj,i,j:integer;
   min,temp,temp11:real;
  begin
   for i:=1 to n do
       begin
        mark[i]:=false;
        dist[i]:=maxint;
       end;
    dist[v1]:=0;
    for i:=1 to n-1 do
        begin
         min:=maxint;
         for j:=1 to n do
             if (not mark[j]) and (dist[j]<min) then
                begin
                  min:=dist[j];
                  minj:=j;
                end;
          mark[minj]:=true;
          for j:=1 to n do
              if (not mark[j]) and (cost[minj,j]>0) then
                 begin
                   temp:=dist[minj]+cost[minj,j];
                   if (temp<dist[j]) then
                   begin
                    dist[j]:=temp;
                    if not wawaa then last[j]:=minj;
                   end;
                 end;
        end;
    outt:=dist[n];
  end;
begin
  init; wawaa:=false;
  dijstral(1);
  min1:=outt; wawaa:=true;
  i:=n;
  while i<>1 do
  begin
   xtt:=i;ytt:=last[i];
   tmp:=cost[xtt,ytt];
   cost[xtt,ytt]:=maxint;
   cost[ytt,xtt]:=maxint;
   dijstral(1);
   if outt<min2 then min2:=outt;
   cost[xtt,ytt]:=tmp;
   cost[ytt,xtt]:=tmp;
   i:=last[i];
  end;
  if min2<>maxint then
  writeln(min2:0:2) else writeln(-1);
end.
