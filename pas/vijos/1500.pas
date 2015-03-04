program p1500;
var
 b,n,i:integer;
 x:array[0..1000]of string;
function xiaoyu(a,b:string):boolean;
var
 i,t:integer;
begin
 if length(a)<length(b) then t:=length(a) else t:=length(b);
 i:=0;
 while i<t do
 begin
  inc(i);
  if pos(a[i],x[0])<pos(b[i],x[0]) then exit(true)
   else if pos(a[i],x[0])>pos(b[i],x[0]) then exit(false)
    else if i=t then inc(i);
 end;
 if i=t+1 then if a<b then exit(true)
  else exit(false);
end;
procedure qsorts(s,t:integer);
var
 i,j:integer;
 temp,mid:string;
begin
 i:=s;j:=t;mid:=x[(i+j)div 2];
 repeat
 while xiaoyu(x[i],mid) do inc(i);
 while xiaoyu(mid,x[j]) do dec(j);
 if i<=j then
 begin
  temp:=x[i];
  x[i]:=x[j];
  x[j]:=temp;
  inc(i);
  dec(j);
 end;
 until i>j;
 if s<j then qsorts(s,j);
 if i<t then qsorts(i,t);
end;
procedure qsortn(s,t:integer);
var
 i,j:integer;
 temp,mid:string;
begin
 i:=s;j:=t;mid:=x[(i+j)div 2];
 repeat
 while xiaoyu(mid,x[i]) do inc(i);
 while xiaoyu(x[j],mid) do dec(j);
 if i<=j then
 begin
  temp:=x[i];
  x[i]:=x[j];
  x[j]:=temp;
  inc(i);
  dec(j);
 end;
 until i>j;
 if s<j then qsortn(s,j);
 if i<t then qsortn(i,t);
end;
begin
 readln(x[0]);
 readln(n);
 for i:=1 to n do
  readln(x[i]);
 readln(b);
 if b=1 then qsorts(1,n) else if b=0 then qsortn(1,n);
 for i:=1 to n do
  writeln(x[i]);
 for j:=1 to 100 do
 begin
  writeln('big');
 end;
end.
