program heapsort;
var
  a:array[1..100000] of longint;
  n,m,i,h:longint;
procedure keepmaxheap(i:longint);
  var
    max:longint;
  begin
    max := i;
    if (i shl 1<=h) and (a[i shl 1]>a[max]) then max := i shl 1;
    if (i shl 1+1<=h) and (a[i shl 1+1]>a[max]) then max := i shl 1+1;
    if max<>i then
      begin
        a[i] := a[i] xor a[max];
        a[max] := a[i] xor a[max];
        a[i] := a[i] xor a[max];
        keepmaxheap(max);
      end;
  end;
procedure buildheap;
  var
    i:longint;
  begin
    for i:=n shr 1 downto 1 do
      keepmaxheap(i);
  end;
procedure heapsort;
  var
    i:longint;
  begin
    h := n;
    buildheap;
    for i:=1 to n-1 do
      begin
        a[1] := a[1] xor a[h];
        a[h] := a[1] xor a[h];
        a[1] := a[1] xor a[h];
        dec(h);
        keepmaxheap(1);
      end;
  end;
begin
  randomize;
  readln(n,m);
  for i:=1 to n do
    a[i] := random(m);
  heapsort;
  for i:=1 to n do
    write(a[i],' ');
end.
