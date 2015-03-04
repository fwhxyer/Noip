program binarysearch;
var
  a:array[1..100000] of longint;
  key,i,n,m:longint;
function binarysearch(key:longint):longint;
  var
    l,r,mid:longint;
  begin
    l := 1;
    r := n;
    mid := (l+r) shr 1;
    while (l<=r) and (a[mid]<>key) do
      begin
        if a[mid]<key then
          l := mid+1
        else
          r := mid-1;
        mid := (l+r) shr 1;
      end;
    if l>r then exit(0);
    binarysearch := mid;
  end;
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
  readln(n,m);
  readln(key);
  randomize;
  for i:=1 to n do
    a[i] := random(m);
  qsort(1,n);
  writeln(binarysearch(key));
end.
