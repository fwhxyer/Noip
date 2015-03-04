program kruscal;
type
  node=record
    x,y,cost:longint;
  end;
var
  a:array[1..10000] of node;
  father:array[1..10000] of longint;
  n,m,i:longint;
procedure qsort(l,r:longint);
  var
    x,i,j:longint;
    y:node;
  begin
    x := a[random(r-l+1)+l].cost;
    i := l;
    j := r;
    repeat
      while a[i].cost<x do
        inc(i);
      while a[j].cost>x do
        dec(j);
      if not(i>j) then
        begin
          y := a[i];
          a[i] := a[j];
          a[j] := y;
          inc(i);
          dec(j);
        end;
    until i>j;
    if l<j then qsort(l,j);
    if i<r then qsort(i,r);
  end;
function getfather(x:longint):longint;
  begin
    if x=father[x] then exit(x);
    father[x] := getfather(father[x]);
    getfather := father[x];
  end;
procedure union(x,y:longint);
  var
    a,b:longint;
  begin
    a := getfather(x);
    b := getfather(y);
    father[a] := b;
  end;
procedure kruscal;
  var
    ans,i,j,count:longint;
  begin
    ans := 0;
    count := 0;
    qsort(1,m);
    for i:=1 to n do
      father[i] := i;
    for i:=1 to m do
      if getfather(a[i].x)<>getfather(a[i].y) then
        begin
          ans := ans+a[i].cost;
          inc(count);
          union(a[i].x,a[i].y);
          if count=n-1 then break;
        end;
    writeln(ans);
  end;
begin
  readln(n,m);
  for i:=1 to m do
    read(a[i].x,a[i].y,a[i].cost);
  kruscal;
end.
