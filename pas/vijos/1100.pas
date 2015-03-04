program jiaf;
var
 n,i,j:integer;ans:int64;
 aa:array[1..30]of integer;
 f:array[0..30,0..30]of int64;
 g:array[0..30,0..30]of integer;
function found(a,b:integer):int64;
var
 i,t:integer;ans:int64;
function max(a,b:int64;c:integer):int64;
begin
 if a<b then begin max:=b;t:=c; end else max:=a;
end;
begin
 if f[a,b]<>0 then
 begin
  found:=f[a,b];
  exit;
 end;
 if a>b then
 begin
  f[a,b]:=1;
  g[a,b]:=-1;
  exit(1);
 end;
 if a=b then
 begin
  f[a,b]:=aa[a];
  g[a,b]:=a;
  exit(aa[a]);
 end;
 ans:=0;
 t:=-1;
 for i:=a to b do
  ans:=max(ans,found(a,i-1)*found(i+1,b)+aa[i],i);
 f[a,b]:=ans;
 g[a,b]:=t;
 exit(ans);
end;
procedure writout(a,b:integer);
begin
 if a>b then exit;
 if (a=-1) or (b=-1) then exit;
 write(g[a,b],' ');
 writout(a,g[a,b]-1);
 writout(g[a,b]+1,b);
end;
begin
for i:=1 to 30 do
 for j:=1 to 30 do
  f[i,j]:=0;
 ans:=-maxlongint*maxint;
 readln(n);
 for i:=1 to n do
  read(aa[i]);
 writeln(found(1,n));
 writout(1,n);
end.
