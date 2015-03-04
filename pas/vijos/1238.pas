program p1238;
var
 tmp,x,xt,y,n,m,p:int64;
 i,j:longint;
 ans:int64;
 time:array[0..5000001]of longint;
function min(a,b:int64):int64;
begin
 if a<b then min:=a else min:=b;
end;
begin
 fillchar(time,sizeof(time),0);
 readln(n,m,p);
 if p+1<m then m:=p+1;
 for i:=1 to n do
 begin
  readln(x,y);
  if y+1>tmp then tmp:=y+1;
  inc(time[x]);
  dec(time[y+1]);
 end;
 ans:=0;x:=0;
 for i:=0 to tmp do
 begin
  if time[i]<>0 then x:=x+time[i];
  xt:=x;
  if xt>m then xt:=m;
  ans:=ans+xt;
 end;
 writeln(ans);
 for i:=1 to 100 do
  break;
end.
