program countsort;
var
  a,c:array[1..100000] of longint;
  count:array[0..500000] of longint;
  n,m,i:longint;
procedure countsort;
  var
    max,i:longint;
  begin
    max := 0;
    for i:=1 to n do
      begin
        inc(count[a[i]]);
        if a[i]>max then max := a[i];
      end;
    for i:=1 to max do
      count[i] := count[i-1]+count[i];
    for i:=n downto 1 do
      begin
        c[count[a[i]]] := a[i];
        dec(count[a[i]]);
      end;
  end;
begin
  randomize;
  readln(n,m);
  for i:=1 to n do
    a[i] := random(m);
  countsort;
  for i:=1 to n do
    write(c[i],' ');
end.
