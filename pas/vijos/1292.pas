program p1292;
var
 l1,l2,l3,c1,c2,c3,n,s,t,i,j:longint;
 cost:array[1..10000]of qword;
 f:array[1..10000]of qword;
function min(a,b:qword):qword;
begin
 if a<b then min:=a else min:=b;
end;
function mc(a:qword):qword;
begin
 if a<=l1 then exit(c1);
 if a<=l2 then exit(c2);
 if a<=l3 then exit(c3);
end;
begin
 readln(l1,l2,l3,c1,c2,c3);
 readln(n);
 readln(s,t);
 cost[1]:=0;
 fillchar(f,sizeof(f),0);
 for i:=s+1 to t do f[i]:=10000000000001;
 for i:=2 to n do
  readln(cost[i]);
 for i:=s+1 to t do
  for j:=s to i-1 do
   if cost[i]-cost[j]<=l3 then
    f[i]:=min(f[i],f[j]+mc(cost[i]-cost[j]));
 writeln(f[t]);
end.
