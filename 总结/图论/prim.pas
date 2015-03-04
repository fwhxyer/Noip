program prim;
var
  map:array[1..1000,1..1000] of longint;
  n,m,i,j,a,b,t:longint;
procedure prim;
  var
    lowcost,closest:array[1..1000] of longint;
    i,j,min,t,ans:longint;
  begin
    ans := 0;
    for i:=1 to n do
      lowcost[i] := map[1,i];
    for i:=1 to n do
      if lowcost[i]<>maxlongint shr 1 then
        closest[i] := 1
      else
        closest[i] := 0;
    lowcost[1] := 0;
    for i:=1 to n-1 do
      begin
        min := maxlongint;
        t := 0;
        for j := 1 to n do
          if (lowcost[j]<min) and (lowcost[j]<>0) then
            begin
              min := lowcost[j];
              t := j;
            end;
        ans := ans+lowcost[t];
        lowcost[t] := 0;
        for j:=1 to n do
          if (lowcost[j]<>0) and (map[t,j]<lowcost[j]) then
            begin
              lowcost[j] := map[t,j];
              closest[j] := t;
            end;
      end;
    writeln(ans);
  end;
begin
  readln(n,m);
  for i:=1 to n do
    for j:=1 to n do
      map[i,j] := maxlongint shr 1;
  for i:=1 to m do
    begin
      read(a,b,t);
      map[a,b] := t;
      map[b,a] := t;
    end;
  prim;
end.
