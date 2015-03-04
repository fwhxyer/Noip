program p1035;
var
 nt:string;
 np,n,i,j,k,l:longint;
 ans,mon:array[1..100]of longint;
 named:array[1..100]of string;
begin
 readln(np);
 for i:=1 to np do
  readln(named[i]);
 for i:=1 to np do
 begin
  readln(nt);
  for l:=1 to np do
   if named[l]=nt then break;
  readln(mon[l],n);
  for j:=1 to n do
  begin
   readln(nt);
   for k:=1 to np do
    if named[k]=nt then begin inc(ans[k],mon[l]div n);break end;
  end;
  if n<>0 then dec(ans[l],n*(mon[l] div n));
 end;
 for i:=1 to np do
  writeln(named[i],' ',ans[i]);
end.
