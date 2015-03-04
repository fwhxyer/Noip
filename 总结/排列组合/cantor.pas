program cantor;
type
  arr=array[1..100] of longint;
var
  n,i:longint;
  a:arr;
function cantor(a:arr):longint;
  var
    i,j,t:longint;
  begin
    cantor := 0;
    for i:=1 to n-1 do
      begin
        t := 0;
        for j:=i+1 to n do
          if a[j]<a[i] then
            inc(t);
        cantor := (cantor+t)*(n-i);
      end;
  end;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  writeln(cantor(a));
end.
