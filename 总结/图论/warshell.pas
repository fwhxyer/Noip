program warshell;
var
  map:array[1..200,1..200] of boolean;
  n,m,i,j,a,b:longint;
procedure warshell;
  var
    i,j,k:longint;
  begin
    for k:=1 to n do
      for i:=1 to n do
        for j:=1 to n do
          map[i,j] := map[i,j] or (map[i,k] and map[k,j]);
  end;
begin
  readln(n,m);
  for i:=1 to m do
    begin
      readln(a,b);
      map[a,b] := true;
    end;
  warshell;
  for i:=1 to n do
    begin
      for j:=1 to n do
        write(map[i,j],' ');
      writeln;
    end;
end.