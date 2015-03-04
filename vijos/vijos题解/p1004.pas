program p1004t;
const
 ans:array[1..2]of string=('YES','NO');
 mx:integer=2006;
 my:integer=11;
 mz:integer=4;
var
 day:array[1..2050,1..12,1..31]of integer;
 x,y,z,rr:array[0..2050]of integer;
 i,j,k,n:longint;
 function try1(a,b,c:longint):integer;
  function run(a:integer):boolean;
   begin
    if rr[a]=2 then exit(false);if rr[a]=1 then exit(true);
    if a mod 400=0 then begin rr[a]:=1;exit(true); end
     else if (a mod 100<>0)and(a mod 4=0) then begin rr[a]:=1;exit(true); end;
    rr[a]:=2;
    exit(false);
   end;
 const
  m:array[1..2,1..12]of integer=((31,28,31,30,31,30,31,31,30,31,30,31),(31,29,31,30,31,30,31,31,30,31,30,31));
 var t1,t2,t:integer;
{  procedure chuli(var a,b,c:longint);
  var t:integer;
  begin
   if run(a) then t:=2 else t:=1;
   if b>12 then begin
    inc(a);b:=1;
   end else if c>m[t,b] then begin
    inc(b);c:=1;
    if b>12 then begin inc(a);b:=1; end;
   end;
   if run(a) then t:=2 else t:=1;
   if c>m[t,b] then begin a:=2006;b:=11;c:=5; end;
   if run(a) then t:=2 else t:=1;
   if b>12 then begin inc(a);b:=1; end;
   if run(a) then t:=2 else t:=1;
   if c>m[t,b] then begin inc(b);c:=1; end;
   if b>12 then begin inc(a);b:=1; end;
   if run(a) then t:=2 else t:=1;
   if c>m[t,b] then begin a:=2006;b:=11;c:=5; end;
  end;}
 begin
//  chuli(a,b,c);
  if day[a,b,c]<>0 then exit(day[a,b,c]);
  if run(a) then t:=2 else t:=1;
  if (b=12) then t2:=try1(a+1,1,c) else if (c>m[t,b+1])then t2:=1 else t2:=try1(a,b+1,c);
  if (b=12)and(c+1>m[t,b]) then t1:=try1(a+1,1,1) else if (c+1>m[t,b]) then t1:=try1(a,b+1,1) else t1:=try1(a,b,c+1);
  if (t1=1)and(t2=1) then begin day[a,b,c]:=2;exit(2) end else begin day[a,b,c]:=1;exit(1) end;
 end;
begin
 fillchar(day,sizeof(day),0);
 day[mx,my,mz]:=2;
 for i:=5 to 30 do day[mx,my,i]:=1;
 for i:=1 to 31 do day[mx,my+1,i]:=1;
 for i:=1 to 31 do day[mx+1,1,i]:=1;
 readln(n);
{assign(output,'c:\b.txt');
rewrite(output);        }
 for i:=1900 to n+1900-1 do
 begin
  readln(x[i],y[i],z[i]);
 end;
 for i:=1900 to n+1900-1 do
 begin
  for j:=mx downto x[i]+1 do
   k:=try1(x[i],1,1);
  writeln(ans[try1(x[i],y[i],z[i])]);
 end;
//close(output);
end.
