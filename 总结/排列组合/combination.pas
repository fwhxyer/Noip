program combination;
var
  n,r:longint;
procedure combination(n,r:longint);
  var
    a:array[1..10000] of longint;
    i,j:longint;
  begin
    for i:=1 to r do
      a[i] := i;
    for i:=1 to r do
      write(a[i],' ');
    writeln;
    while (i>0) do
      begin
        i := r;
        while (i>0) and (a[i]=n-r+i) do
          dec(i);
        if i>0 then
          begin
            inc(a[i]);
            for j:=i+1 to r do
              a[j] := a[j-1]+1;
            for j:=1 to r do
              write(a[j],' ');
            writeln;
          end;
      end;
  end;
begin
  readln(n,r);
  combination(n,r);
end.