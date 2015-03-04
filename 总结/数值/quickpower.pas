program quickpower;
var
  a,b,ans:longint;
function power(a,b:longint):longint;
  var
    t:longint;
  begin
    if b=0 then exit(1);
    t := power(a,b shr 1);
    t := sqr(t);
    if b and 1=1 then t := t*a;
    power := t;
  end;
begin
  readln(a,b);
  ans := power(a,b);
  writeln(ans);
end.
