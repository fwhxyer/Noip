program heapsortprogram;
const
 n=1000000;
var
 i:longint;
 a:array[1..n]of longint;
procedure heap(n,i:longint);
var
 x,j:longint;
begin
 x:=a[i];j:=2*i;
 while j<=n do begin
  if (j<n)and(a[j+1]>a[j]) then inc(j);
  if a[j]>x then begin
   a[i]:=a[j];
   i:=j;j:=2*i;
   end else j:=n+1;
 end;
 a[i]:=x;
end;
procedure heapsort(m,t:longint);
var i,n:longint;
begin
 n:=t;
 for i:=n shr 1 downto m do
  heap(n-m+1,i);
 for i:=n downto m+1 do begin
  if a[i]<>a[m] then
  begin
   a[i]:=a[m] xor a[i];
   a[m]:=a[m] xor a[i];
   a[i]:=a[m] xor a[i];
   heap(i-m,m);
  end;
 end;
end;
begin
 assign(output,'c:\heapsort.txt');
 rewrite(output);
 randomize;
 for i:=1 to n do
  a[i]:=random(1000000);
 heapsort(1,n);
 for i:=1 to n do
  writeln(a[i]);
 close(output);
end.
