program son;
var
 x,i,j,n,a0,a1,b0,b1,ans:longint;
function gcd(a,b:longint):longint;
var t:longint;
begin
 if a=b then exit(a)
 else if a<b then begin
  a:=a xor b;
  b:=a xor b;
  a:=a xor b;
 end;
 while b<>0 do begin
  t:=a;
  a:=b;
  b:=t mod b;
 end;
 exit(a);
end;
begin
assign(input,'son1.in');
reset(input);
assign(output,'son.out');
rewrite(output);
 readln(n);
 for i:=1 to n do begin
  readln(a0,a1,b0,b1);ans:=0;
  for j:=1 to trunc(sqrt(b1)) do
  if (b1/j)=trunc(b1/j) then begin
   x:=trunc(b1/j);
   if (x*b0/gcd(x,b0)=b1)and(gcd(x,a0)=a1) then inc(ans);
   if (b1/j)=j then begin
   x:=j;
   if (x*b0/gcd(x,b0)=b1)and(gcd(x,a0)=a1) then inc(ans); end;
  end;
  writeln(ans);
 end;
close(input);
close(output);
end.
