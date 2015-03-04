program plus;
type
  node=array[0..200] of longint;
var
  a,b,c:node;
  st:string;
  i,j,t:longint;
function plus(a,b:node):node;
  var
    i,l:longint;
  begin
    fillchar(plus,sizeof(plus),0);
    if a[0]>b[0] then l := a[0] else l := b[0];
    for i:=1 to l do
      begin
        plus[i] := plus[i]+a[i]+b[i];
        plus[i+1] := plus[i] div 10000;
        plus[i] := plus[i] mod 10000;
      end;
    if plus[l+1]>0 then inc(i);
    plus[0] := i;
  end;
begin
  readln(st);
  for i:=1 to length(st) do
    begin
      t := (length(st)-i)div 4+1;
      a[t] := a[t]*10+ord(st[i])-48;
      if t>a[0] then a[0] := t;
    end;
  readln(st);
  for i:=1 to length(st) do
    begin
      t := (length(st)-i)div 4+1;
      b[t] := b[t]*10+ord(st[i])-48;
      if t>b[0] then b[0] := t;
    end;
  c := plus(a,b);
  write(c[c[0]]);
  for i:=c[0]-1 downto 1 do
    write(c[i] div 1000,c[i] div 100 mod 10,c[i] div 10 mod 10,c[i] mod 10);
end.
