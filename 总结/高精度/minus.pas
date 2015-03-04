program minus;
type
  node=array[0..200] of longint;
var
  a,b,c,x:node;
  st:string;
  i,j,t:longint;
  bool:boolean;
function compare(a,b:node):integer;
  var
    i:longint;
  begin
    if a[0]>b[0] then exit(1);
    if a[0]<b[0] then exit(-1);
    for i:=a[0] downto 1 do
      begin
        if a[i]>b[i] then exit(1);
        if a[i]<b[i] then exit(-1);
      end;
    exit(0);
  end;
function minus(a,b:node):node;
  var
    i,l:longint;
  begin
    fillchar(minus,sizeof(minus),0);
    if a[0]>b[0] then l := a[0] else l := b[0];
    for i:=1 to l do
      begin
        minus[i] := a[i]-b[i];
        if minus[i]<0 then
          begin
            minus[i] := minus[i]+10000;
            dec(a[i+1]);
          end;
      end;
    if minus[l]=0 then dec(l);
    minus[0] := l;
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
  if compare(a,b)<0 then
    begin
      bool := true;
      x := a;
      a := b;
      b := x;
    end;
  c := minus(a,b);
  if bool then write('-');
  write(c[c[0]]);
  for i:=c[0]-1 downto 1 do
    write(c[i] div 1000,c[i] div 100 mod 10,c[i] div 10 mod 10,c[i] mod 10);
end.
