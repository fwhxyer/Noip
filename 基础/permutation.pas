program permutationprogram;
var
 n:longint;ans:int64;
 procedure permutation(n:longint);
  var i,p,q:longint;a:array[0..10000]of longint;
  procedure print;
  var i:longint;
  begin
   for i:=1 to n do
    write(a[i]:5);    writeln; inc(ans);
  end;
 begin
  for i:=0 to n do
   a[i]:=i;
  print;
  while true do begin
   p:=n;q:=n;
   while a[p-1]>a[p] do dec(p);
   dec(p);
   if p=0 then break;
   while a[p]>a[q] do dec(q);
   a[p]:=a[p] xor a[q];
   a[q]:=a[p] xor a[q];
   a[p]:=a[p] xor a[q];
   p:=p+1;q:=n;
   while p<q do begin
    a[p]:=a[p] xor a[q];
    a[q]:=a[p] xor a[q];
    a[p]:=a[p] xor a[q];
    inc(p);dec(q);
   end;
   print;
  end;
 end;
begin
 readln(n);ans:=0;
 permutation(n);
 writeln(ans);
end.
