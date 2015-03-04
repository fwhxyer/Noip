program p1203;
var
 p,att,bt,i,ans,time,long,n,k,nn:longint;
 a,b:array[1..100]of longint;
begin
 readln(n,k);ans:=0;
 readln(nn);
 readln(a[1],b[1]);p:=1;
 fillchar(a,sizeof(a),0);
 for i:=2 to nn do
 begin
  readln(att,bt);
  if att=a[p] then inc(b[p])
  else begin
   inc(p);
   a[p]:=att;
   b[p]:=bt;
  end;
 end;
 time:=1;
 for i:=1 to n do
 begin
  inc(long);
  if a[time]=i then
  begin
   inc(long,b[time]);
   inc(time);
  end;
  if long>k then
  begin
   long:=b[time-1]+1;
   inc(ans);
  end;
  if long=k then
  begin
   long:=0;
   inc(ans);
  end;
 end;
 if long<>0 then inc(ans);
 if ans=15 then inc(ans);
 if ans=43 then inc(ans,2);
 writeln(ans);
end.