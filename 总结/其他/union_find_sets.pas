program union_find_sets;
var
  father:array[1..10000] of longint;
  n,i:longint;
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
begin
  readln(n);
  for i:=1 to n do
    father[i] := i;
end.