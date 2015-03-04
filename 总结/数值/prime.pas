program prime;
var
  n:longint;
function prime(n:longint):boolean;
  var
    i:longint;
  begin
    for i:=2 to trunc(sqrt(n)) do
      if n mod i=0 then exit(false);
    exit(true);
  end;
begin
  readln(n);
  writeln(prime(n));
end.