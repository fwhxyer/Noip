program kruscalprogram;
type
 node=record
  x,y,vex:longint;
  end;
var
 v0,n,m,i:longint;ans:int64;
 a:array[1..10000]of node;
procedure qsort(s,t:longint);
var
 i,j,mid:longint; tmp:node;
begin
 i:=s;j:=t;mid:=a[(i+j)shr 1].vex;
 repeat
  while a[i].vex<mid do inc(i);
  while a[j].vex>mid do dec(j);
  if (i<=j) then begin
   tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
   inc(i);dec(j);
  end;
 until i>j;
 if i<t then qsort(i,t);
 if s<j then qsort(s,j);
end;
procedure kruscal;
var
 k,i:longint;father:array[1..10000]of longint;
 function getf(i:longint):longint;
 begin
  if father[i]=i then exit(i);
  father[i]:=getf(father[i]);
  exit(father[i]);
 end;
begin
 k:=0;for i:=1 to n do father[i]:=i;
 for i:=1 to m do
  if getf(a[i].x)<>getf(a[i].y) then
  begin
   father[getf(a[i].x)]:=getf(father[a[i].y]);
   inc(ans,a[i].vex);
   inc(k);
   if k=n-1 then break;
  end;
end;
begin
 randomize;
 readln(n);m:=n;ans:=0;
 for i:=1 to m do begin
  a[i].x:=i;a[i].y:=random(n-1)+1;;
  a[i].vex:=random(maxlongint);
 end;
 qsort(1,n);
 kruscal;
 writeln(ans);
end.
