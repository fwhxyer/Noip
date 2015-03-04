program multiply_double;
type
  node=array[0..200] of longint;
var
  a,b,c:node;
  st:string;
  i,j,t:longint;
function multiply(a,b:node):node;
  var
    i,j,l:longint;
  begin
    fillchar(multiply,sizeof(multiply),0);
    for i:=1 to a[0] do
      for j:=1 to b[0] do
        begin
          multiply[i+j-1] := multiply[i+j-1]+a[i]*b[j];
          multiply[i+j] := multiply[i+j]+multiply[i+j-1] div 10000;
          multiply[i+j-1] := multiply[i+j-1] mod 10000;
        end;
    l := a[0]+b[0];
    if multiply[l]=0 then dec(l);
    multiply[0] := l;
  end;
begin
  readln(st);
  for i:=1 to length(st) do
    begin
      t := (length(st)-i) div 4+1;
      a[t] := a[t]*10+ord(st[i])-48;
      if t>a[0] then a[0] := t;
    end;
  readln(st);
  for i:=1 to length(st) do
    begin
      t := (length(st)-i) div 4+1;
      b[t] := b[t]*10+ord(st[i])-48;
      if t>b[0] then b[0] := t;
    end;
  c := multiply(a,b);
  write(c[c[0]]);
  for i:=c[0]-1 downto 1 do
    write(c[i] div 1000,c[i] div 100 mod 10,c[i] div 10 mod 10,c[i] mod 10);
end.
