program topological_sort;
var
  map:array[1..1000,1..1000] of boolean;
  into:array[1..1000] of longint;
  ans:array[1..1000] of longint;
  n,m,i,j,a,b:longint;
procedure topological_sort;
  var
    i,j,k,count:longint;
  begin
    count := 0;
    for i:=1 to n do
      for j:=1 to n do
        if map[i,j] then inc(into[j]);
    for i:=1 to n do
      begin
        j := 1;
        while into[j]<>0 do
          inc(j);
        if j>n then break;
        inc(count);
        into[j] := -1;
        ans[count] := j;
        for k:=1 to n do
          if map[j,k] then
            dec(into[k]);
      end;
    if count<n then
      write('failed')
    else
      for i:=1 to n do
        write(ans[i],' ');
  end;
begin
  readln(n,m);
  for i:=1 to m do
    begin
      readln(a,b);
      map[a,b] := true;
    end;
  topological_sort;
end.