{program p1122;
type
 node=array[1..18]of integer;
var
 i,j,n,ans:longint;
 open,zhan,closed:node;
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
procedure try1(open,zhan,closed:node;p,q,t:integer);
begin
 if p<=n then
 begin
  inc(t);zhan[t]:=open[p];
  inc(p);
  try1(open,zhan,closed,p,q,t);
  dec(t);
  dec(p);
 end;
 if t>0 then
 begin
  inc(q);closed[q]:=zhan[t];
  dec(t);
  if q=n then begin inc(ans);{for i:=1 to n do write(closed[i]:5);writeln} end else
   try1(open,zhan,closed,p,q,t);
  dec(q);
  inc(t);
 end;
end;
//--------------------------------------------------------------------------------
begin
assign(output,'c:\tmp.txt');
rewrite(output);
for j:=1 to 18 do
begin
 n:=j;ans:=0;
 for i:=1 to n do open[i]:=i;
 try1(open,zhan,closed,1,0,0);
 writeln(ans,',');
end;
close(output);
end.}
program p1122;
const
ans:array[1..18]of longint=
(1,
2,
5,
14,
42,
132,
429,
1430,
4862,
16796,
58786,
208012,
742900,
2674440,
9694845,
35357670,
129644790,
477638700);
var
 n:integer;
begin
 readln(n);
 writeln(ans[n]);
end.
