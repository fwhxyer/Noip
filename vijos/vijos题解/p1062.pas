program p1062;
var
 a:array[0..15000]of integer;
 b:array[0..50000]of integer;
 ans,n,i,j,k:longint;
 bt:array[0..50000]of boolean;
begin
 readln(n);a[0]:=0;           fillchar(bt,sizeof(bt),0);
 for i:=1 to n do
  read(a[i]);
 for j:=1 to n do
 begin
  for i:=1 to a[j]-a[j-1] do
  begin
   inc(k);
   b[k]:=0;
  end;
  inc(k);b[k]:=1;
 end;
 for i:=1 to k+5 do
 begin
  ans:=1;
  if b[i]=1 then
   for j:=i-1 downto 1 do
    if (b[j]=0) and not bt[j] then
    begin
     write(ans,' ');bt[j]:=true;break;
    end else if b[j]=0 then inc(ans);
 end;
end.
