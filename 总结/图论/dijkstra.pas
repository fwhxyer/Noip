program dijkstra;
var
  map:array[1..1000,1..1000] of longint;
  n,m,i,j,a,b,t:longint;
procedure dijkstra(v:longint);
  var
    check:array[1..1000] of boolean;
    pre:array[1..1000] of longint;
    dis:array[1..1000] of longint;
    min,i,t:longint;
  begin
    fillchar(check,sizeof(check),false);
    for i:=1 to n do
      dis[i] := map[v,i];
    check[v] := true;
    for i:=1 to n do
      if not (dis[i]=maxlongint shr 1) then
        pre[i] := v
      else
        pre[i] := 0;
    repeat
      min := maxlongint;
      t := 0;
      for i:=1 to n do
        if not check[i] and (dis[i]<min) then
          begin
            t := i;
            min := dis[i];
          end;
      if t<>0 then
        begin
          check[t] := true;
          for i:=1 to n do
            if not check[i] and (dis[t]+map[t,i]<dis[i]) then
              begin
                dis[i] := dis[t]+map[t,i];
                pre[i] := t;
              end;
        end;
    until t=0;
    writeln(dis[n]);
    i := n;
    while i<>0 do
      begin
        write(i,' ');
        i := pre[i];
      end;
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
  dijkstra(1);
end.