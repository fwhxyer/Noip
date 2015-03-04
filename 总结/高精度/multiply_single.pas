program multiply_single;
type
  node=array[0..200] of longint;
var
  a,c:node;
  st:string;
  i,j,t,b:longint;
function multiply(a:node;b:longint):node;
  var
    i,l:longint;
  begin
    fillchar(multiply,sizeof(multiply),0);
    l := a[0];
    for i:=1 to l do
      begin
        multiply[i] := multiply[i]+a[i]*b;
        multiply[i+1] := multiply[i] div 10000;
        multiply[i] := multiply[i] mod 10000;
      end;
    if multiply[i+1]>0 then inc(l);
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
  readln(b);
  c := multiply(a,b);
  write(c[c[0]]);
  for i:=c[0]-1 downto 1 do
    write(c[i] div 1000,c[i] div 100 mod 10,c[i] div 10 mod 10,c[i] mod 10);
end.
