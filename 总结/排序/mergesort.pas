program mergesort;
var
  a,c:array[1..100000] of longint;
  n,m,i:longint;
procedure merge(l,m,r:longint);
  var
    p1,p2,p3,i:longint;
  begin
    p1 := l;
    p2 := m+1;
    p3 := l;
    while (p1<=m) and (p2<=r) do
      begin
        if a[p1]<=a[p2] then
          begin
            c[p3] := a[p1];
            inc(p1);
          end
        else
          begin
            c[p3] := a[p2];
            inc(p2);
          end;
        inc(p3);
      end;
    if p1>m then
      for i:=p2 to r do
        begin
          c[p3] := a[i];
          inc(p3);
        end;
    if p2>r then
      for i:=p1 to m do
        begin
          c[p3] := a[i];
          inc(p3);
        end;
    for i:=l to r do
      a[i] := c[i];
  end;
procedure mergesort(l,r:longint);
  var
    m:longint;
  begin
    if l=r then exit;
    m := (l+r) shr 1;
    mergesort(l,m);
    mergesort(m+1,r);
    merge(l,m,r);
  end;
begin
  randomize;
  readln(n,m);
  for i:=1 to n do
    a[i] := random(m);
  mergesort(1,n);
  for i:=1 to n do
    write(a[i],' ');
end.
