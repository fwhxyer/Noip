program primeprogram;
var
 n:longint;
function prime(n:longint):boolean;
var i:longint;
begin
 if n=1 then exit(false);
 for i:=2 to trunc(sqrt(n)) do
  if n mod i=0 then exit(false);
 exit(true);
end;
begin
 for n:=1 to 100 do
  if prime(n) then write(n:5);
end.