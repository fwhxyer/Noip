program p1066;
var
x,y,n:array[1..20000]of integer;
ans:array[0..20000]of integer;
i,n1:integer;
procedure found(a:integer);
var i:integer;
begin
 for i:=1 to a-1 do
  begin
   if (x[i]>=x[a])and(y[i]>=y[a])then inc(n[i]);
   if (x[i]<=x[a])and(y[i]<=y[a])then inc(n[a]);
  end;
end;
begin
 readln(n1);
 fillchar(n,sizeof(n),0);
 fillchar(ans,sizeof(ans),0);
 for i:=1 to n1 do
  begin
   readln(x[i],y[i]);
   found(i);
  end;
 for i:=1 to n1 do
  inc(ans[n[i]]);
 for i:=0 to n1-1 do
  writeln(ans[i]);
end.
