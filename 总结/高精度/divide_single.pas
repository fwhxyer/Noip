program divide_single;
type
  node=array[0..200] of longint;
var
  a,c:node;
  st:string;
  i,j,t,b:longint;
function divide(a:node;b:longint):node;
  var
    i,l,x:longint;
  begin
    fillchar(divide,sizeof(divide),0);
    x := 0;
    for i:=a[0] downto 1 do
      begin
        x := x*10000+a[i];
        divide[i] := x div b;
        x := x mod b;
      end;
    l := 0;
    while divide[l+1]>0 do inc(l);
    divide[0] := l;
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
  c := divide(a,b);
  write(c[c[0]]);
  for i:=c[0]-1 downto 1 do
    write(c[i] div 1000,c[i] div 100 mod 10,c[i] div 10 mod 10,c[i] mod 10);
end.
