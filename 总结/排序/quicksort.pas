program quicksort;
var
  a:array[1..100000] of longint;
  n,m,i:longint;
procedure qsort(l,r:longint);
  var
    x,y,i,j:longint;
  begin
    x := a[random(r-l+1)+l];
    i := l;
    j := r;
    repeat
      while a[i]<x do
        inc(i);
      while a[j]>x do
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
begin
  randomize;
  readln(n,m);
  for i:=1 to n do
    a[i] := random(m);
  qsort(1,n);
  for i:=1 to n do
    write(a[i],' ');
end.