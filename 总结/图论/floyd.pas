program floyd;
var
  map,f:array[1..200,1..200] of longint;
  n,m,i,j,a,b,t,ans:longint;
procedure floyd;
  var
    i,j,k:longint;
  begin
    for k:=1 to n do
      begin
        for i:=1 to k-1 do
          for j:=i+1 to k-1 do
            if f[i,j]+map[i,k]+map[k,j]<ans then
              ans := f[i,j]+map[i,k]+map[k,j];
        for i:=1 to n do
          for j:=1 to n do
            if f[i,k]+f[k,j]<f[i,j] then
              f[i,j] := f[i,k]+f[k,j];
      end;
  end;
begin
  readln(n,m);
  for i:=1 to n do
    for j:=1 to n do
      map[i,j] := maxlongint shr 2;
  for i:=1 to m do
    begin
      readln(a,b,t);
      map[a,b] := t;
      map[b,a] := t;
    end;
  f := map;
  ans := maxlongint shr 2;
  floyd;
  if ans<>maxlongint shr 2 then writeln(ans);
  for i:=1 to n do
    begin
      for j:=1 to n do
        write(f[i,j],' ');
      writeln;
    end;
end.