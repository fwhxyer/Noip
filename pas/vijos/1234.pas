program p1234;
var
 i,n,m,k,ans:longint;
 x,y,c:array[1..10000]of longint;
 bo:array[1..10000]of boolean;
 setv:array[1..1000,1..1000]of boolean;
procedure qsort(s,t:longint);
var
 i,j,mid,t1:longint;
begin
 i:=s;j:=t;mid:=c[(i+j)shr 1];
 repeat
  while c[i]<mid do inc(i);
  while c[j]>mid do dec(j);
  if i<=j then
  begin
   t1:=c[i];
   c[i]:=c[j];
   c[j]:=t1;
   t1:=x[i];
   x[i]:=x[j];
   x[j]:=t1;
   t1:=y[i];
   y[i]:=y[j];
   y[j]:=t1;
   inc(i);
   dec(j);
  end;
 until i>j;
 if i<t then qsort(i,t);
 if s<j then qsort(s,j);
end;
 function find(a:longint):longint;
 var
  i:longint;
 begin
  for i:=1 to n do
   if setv[i,a] then exit(i);
  end;
procedure kruskal;
var
 i,j,f,t1,t2,ss:longint;
begin
 fillchar(setv,sizeof(setv),0);
 for i:=1 to n do
  setv[i,i]:=true;
 i:=1;j:=1;
 while (i<n-k+1)and(j<=m) do
 begin
  t1:=find(x[j]);t2:=find(y[j]);
  if t1<>t2 then
  begin
   inc(ans,c[j]);
   for f:=1 to n do
    if setv[t2,f] then setv[t1,f]:=true;
   for f:=1 to n do
    setv[t2,f]:=false;
   bo[j]:=true;
   inc(i);
  end;
  j:=j+1;
 end;
 if (i<n-k+1)and (j=m+1) then begin writeln('No Answer');halt; end;
{ss:=n-i+1;
 ss:=k-ss;
 if ss<0 then begin writeln('No Answer');halt; end;
 dec(j);
 while ss>0 do
 begin
  dec(ss);
  if j<1 then begin writeln('No Answer');halt; end;
  while not bo[j] do
  begin
   dec(j);
  end;
  if j<1 then begin writeln('No Answer');halt; end;
  dec(ans,c[j]);
  dec(j);
 end;           }
end;
begin
 ans:=0;
 fillchar(bo,sizeof(bo),0);
 readln(n,m,k);
 for i:=1 to m do
  readln(x[i],y[i],c[i]);
 qsort(1,m);
 kruskal;
 writeln(ans);
end.
