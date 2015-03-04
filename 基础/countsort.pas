program countsortprogram;
const
 n=1000000;
var
 a,b,c:array[0..n]of longint;
 i:longint;
procedure count(t,n:longint);
var i,m:longint;
begin
 for i:=t to n do begin
  inc(c[a[i]]);
  if a[i]>m then m:=a[i];
 end;
 for i:=0 to m-1 do
  c[i+1]:=c[i]+c[i+1];
 for i:=n downto t do begin
  b[c[a[i]]]:=a[i];dec(c[a[i]]);
 end;
end;
begin
 assign(output,'c:\countsort.txt');
 rewrite(output);
 randomize;
 for i:=1 to n do
  a[i]:=random(n);
 count(1,n);
 for i:=1 to n do
  writeln(b[i]);
 close(output);
end.
